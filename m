Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C5EEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JIsRXmYGtIBoLG3FM200l4P+qPE2w4ipbfAJFS3F2+0=; b=MsJbyuvwXOXm1T
	auimA2kKkmesghVhVyO0vZ21nKahg/Cae+xECbee4jpqsWk9HocnnR6+c09iYUR4uEgxtSwz4saBU
	yU10n6YG6eu1kdDKbE7n7TK4zn3Quxlx0UFU/eAadbREmSP7MVaJo3srFB3r30E73jbdkIOrzTGRQ
	cX1fBBBvsDVrIpUME1XqMQ9n0rvYzZ9kgQ/jwABtjiAFExkEk2+oB1fZ2gQ95xQCqFnSdKP6kjT2k
	qh8vN/JfIyV0DqQhWjNdromeslSAMc35FQ/1d0pBkHfxoUMOj0vqaD6WXobKztNQM8KhvS5mxML+h
	VIXUSbEezszAd+466USA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTDQ8-001diF-0W;
	Tue, 08 Aug 2023 03:30:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTDQ5-001dhO-2z
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 03:30:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3DC662081;
	Tue,  8 Aug 2023 03:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3696FC433C8;
	Tue,  8 Aug 2023 03:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691465404;
	bh=zSDhmwKgIhKelnYTgRVV9zIIN7PXUWMhiTRCcrb4LGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DsbIqFVPmu413TZ0gFOuGI65PMKM/G5VoBo06r5nhYADaPrk8LnN1YWlHnOCfIEIw
	 MersF64VL7CRGcpZys1EnToQ8ofF1J+mDF28YaZpAWjGtGZuL7jT55qJqOXc7XAJrL
	 CLI8feqKbuWFMWrQsbOsr5PfUloQeP3MFkCj+R4Bw5jSnjKw0wd5Nt8qTWCdwT1sfJ
	 my9VFS0jYb7n4ceMRRm1PA6qjvBUCVhFUuqaxNHq7CwEVhKOek7lrEa3O58TL/rupl
	 7om4yNqQtS9jkPEzfLxWpqfvfRSz8W59g5121I3eJY2y5WDkE/FsiKSv+qNaG5tKQN
	 qE9KUGs5lip1w==
Date: Mon, 7 Aug 2023 23:29:56 -0400
From: Guo Ren <guoren@kernel.org>
To: Mateusz Guzik <mjguzik@gmail.com>, will@kernel.org
Cc: David.Laight@aculab.com, guoren@kernel.org, peterz@infradead.org,
	mingo@redhat.com, longman@redhat.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2] asm-generic: ticket-lock: Optimize
 arch_spin_value_unlocked
Message-ID: <ZNG2tHFOABSXGCVi@gmail.com>
References: <20230731023308.3748432-1-guoren@kernel.org>
 <20230807183655.kbnjtvbi4jfrcrce@f>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807183655.kbnjtvbi4jfrcrce@f>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_203006_054549_26B13211 
X-CRM114-Status: GOOD (  26.64  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 07, 2023 at 08:36:55PM +0200, Mateusz Guzik wrote:
> On Sun, Jul 30, 2023 at 10:33:08PM -0400, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> > 
> > The arch_spin_value_unlocked would cause an unnecessary memory
> > access to the contended value. Although it won't cause a significant
> > performance gap in most architectures, the arch_spin_value_unlocked
> > argument contains enough information. Thus, remove unnecessary
> > atomic_read in arch_spin_value_unlocked().
> > 
> > The caller of arch_spin_value_unlocked() could benefit from this
> > change. Currently, the only caller is lockref.
> > 
> 
> Have you verified you are getting an extra memory access from this in
> lockref? What architecture is it?
For riscv, this patch could optimize the lock_ref on the same compiling
condition:
 - After lifting data dependencies, the compiler optimizes the prologue
   behavior, thus the callee-register-saved path becomes optional. This
   is a significant improvement on the lock_ref() self.
 - Compare the "98: & 9c:" lines before the patch and the "88:" line
   after the patch. We saved two memory accesses not only one load.

========================================================================
Before the patch:
void lockref_get(struct lockref *lockref)
{
  78:   fd010113                add     sp,sp,-48
  7c:   02813023                sd      s0,32(sp)
  80:   02113423                sd      ra,40(sp)
  84:   03010413                add     s0,sp,48

0000000000000088 <.LBB296>:
        CMPXCHG_LOOP(
  88:   00053783                ld      a5,0(a0)

000000000000008c <.LBB265>:
}

static __always_inline int ticket_spin_is_locked(arch_spinlock_t *lock)
{
        u32 val = atomic_read(&lock->val);
        return ((val >> 16) != (val & 0xffff));
  8c:   00010637                lui     a2,0x10

0000000000000090 <.LBE265>:
  90:   06400593                li      a1,100

0000000000000094 <.LBB274>:
  94:   fff60613                add     a2,a2,-1 # ffff <.LLST8+0xf49a>

0000000000000098 <.L8>:
  98:   fef42423                sw      a5,-24(s0)

000000000000009c <.LBB269>:
  9c:   fe842703                lw      a4,-24(s0)

00000000000000a0 <.LBE269>:
  a0:   0107569b                srlw    a3,a4,0x10
  a4:   00c77733                and     a4,a4,a2
  a8:   04e69063                bne     a3,a4,e8 <.L12>

00000000000000ac <.LBB282>:
  ac:   4207d693                sra     a3,a5,0x20
  b0:   02079713                sll     a4,a5,0x20
  b4:   0016869b                addw    a3,a3,1
  b8:   02069693                sll     a3,a3,0x20
  bc:   02075713                srl     a4,a4,0x20
  c0:   00d76733                or      a4,a4,a3

00000000000000c4 <.L0^B1>:
  c4:   100536af                lr.d    a3,(a0)
  c8:   00f69863                bne     a3,a5,d8 <.L1^B1>
  cc:   1ae5382f                sc.d.rl a6,a4,(a0)
  d0:   fe081ae3                bnez    a6,c4 <.L0^B1>
  d4:   0330000f                fence   rw,rw

00000000000000d8 <.L1^B1>:
  d8:   02d78a63                beq     a5,a3,10c <.L7>

00000000000000dc <.LBE292>:
  dc:   fff5859b                addw    a1,a1,-1

00000000000000e0 <.LBB293>:
  e0:   00068793                mv      a5,a3

00000000000000e4 <.LBE293>:
  e4:   fa059ae3                bnez    a1,98 <.L8>

00000000000000e8 <.L12>:

========================================================================
After the patch:
void lockref_get(struct lockref *lockref)
{
        CMPXCHG_LOOP(
  78:   00053783                ld      a5,0(a0)

000000000000007c <.LBB212>:

static __always_inline int ticket_spin_value_unlocked(arch_spinlock_t
lock)
{
        u32 val = lock.val.counter;

        return ((val >> 16) == (val & 0xffff));
  7c:   00010637                lui     a2,0x10

0000000000000080 <.LBE212>:
  80:   06400593                li      a1,100

0000000000000084 <.LBB216>:
  84:   fff60613                add     a2,a2,-1 # ffff <.LLST8+0xf4aa>

0000000000000088 <.L8>:
  88:   0007871b                sext.w  a4,a5

000000000000008c <.LBB217>:
  8c:   0107d69b                srlw    a3,a5,0x10
  90:   00c77733                and     a4,a4,a2
  94:   04e69063                bne     a3,a4,d4 <.L12>

0000000000000098 <.LBB218>:
  98:   4207d693                sra     a3,a5,0x20
  9c:   02079713                sll     a4,a5,0x20
  a0:   0016869b                addw    a3,a3,1
  a4:   02069693                sll     a3,a3,0x20
  a8:   02075713                srl     a4,a4,0x20
  ac:   00d76733                or      a4,a4,a3

00000000000000b0 <.L0^B1>:
  b0:   100536af                lr.d    a3,(a0)
  b4:   00f69863                bne     a3,a5,c4 <.L1^B1>
  b8:   1ae5382f                sc.d.rl a6,a4,(a0)
  bc:   fe081ae3                bnez    a6,b0 <.L0^B1>
  c0:   0330000f                fence   rw,rw

00000000000000c4 <.L1^B1>:
  c4:   04d78a63                beq     a5,a3,118 <.L18>

00000000000000c8 <.LBE228>:
  c8:   fff5859b                addw    a1,a1,-1

00000000000000cc <.LBB229>:
  cc:   00068793                mv      a5,a3

00000000000000d0 <.LBE229>:
  d0:   fa059ce3                bnez    a1,88 <.L8>

00000000000000d4 <.L12>:
{
  d4:   fe010113                add     sp,sp,-32
  d8:   00113c23                sd      ra,24(sp)
  dc:   00813823                sd      s0,16(sp)
  e0:   02010413                add     s0,sp,32
========================================================================

> 
> I have no opinion about the patch itself, I will note though that the
> argument to the routine is *not* the actual memory-shared lockref,
> instead it's something from the local copy obtained with READ_ONCE
> from the real thing. So I would be surprised if the stock routine was
> generating accesses to that sucker.
> 
> Nonetheless, if the patched routine adds nasty asm, that would be nice
> to sort out.
> 
> FWIW on x86-64 qspinlock is used (i.e. not the stuff you are patching)
> and I verified there are only 2 memory accesses -- the initial READ_ONCE
> and later cmpxchg. I don't know which archs *don't* use qspinlock.
> 
> It also turns out generated asm is quite atrocious and cleaning it up
> may yield a small win under more traffic. Maybe I'll see about it later
> this week.
> 
> For example, disassembling lockref_put_return:
> <+0>:     mov    (%rdi),%rax            <-- initial load, expected
> <+3>:     mov    $0x64,%r8d
> <+9>:     mov    %rax,%rdx
> <+12>:    test   %eax,%eax              <-- retries loop back here
> 					<-- this is also the unlocked
> 					    check
> <+14>:    jne    0xffffffff8157aba3 <lockref_put_return+67>
> <+16>:    mov    %rdx,%rsi
> <+19>:    mov    %edx,%edx
> <+21>:    sar    $0x20,%rsi
> <+25>:    lea    -0x1(%rsi),%ecx        <-- new.count--;
> <+28>:    shl    $0x20,%rcx
> <+32>:    or     %rcx,%rdx
> <+35>:    test   %esi,%esi
> <+37>:    jle    0xffffffff8157aba3 <lockref_put_return+67>
> <+39>:    lock cmpxchg %rdx,(%rdi)      <-- the attempt to change
> <+44>:    jne    0xffffffff8157ab9a <lockref_put_return+58>
> <+46>:    shr    $0x20,%rdx
> <+50>:    mov    %rdx,%rax
> <+53>:    jmp    0xffffffff81af8540 <__x86_return_thunk>
> <+58>:    mov    %rax,%rdx
> <+61>:    sub    $0x1,%r8d              <-- retry count check
> <+65>:    jne    0xffffffff8157ab6c <lockref_put_return+12> <-- go back
> <+67>:    mov    $0xffffffff,%eax
> <+72>:    jmp    0xffffffff81af8540 <__x86_return_thunk>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
