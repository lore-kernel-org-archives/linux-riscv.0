Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E2EC87FD1
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 18:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzOfItrlVqWWX1CwqzmJT1rEEhgVdcJk68GbxLyNc8s=; b=LaOPpguNKins/5
	xjGIe6lRrCeDEWQNc+/2MD54VK6McQzV0JeO6Nm7v9FE1f7FwqRMgCWszXYxVB/dSKZULol4f6M3/
	/kxqftOeDsLZI14Dk+9uxNQBh26Ts6YQgICUTm+Fpgg45q+6xhzBE/XP5sK3H0p4effpqSRw6DMtd
	EV92I4mXF3wrNvi2tMHpXpoGRm8Bmcdo/ij4CXbedQCD7ExXyuQs0blrJqYIcOQiRGYJ4mZEjAXU0
	MHGin1ACtFTOLrkuIyZ6X+isLzTi84qf0AKZxT6UMzhbcNIivVcVNbXwpGec0kpTPQExV8owJAdoO
	cgcqPt0UkNis1L0Lxf4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujMkt-0000000DbH7-41Mp;
	Tue, 05 Aug 2025 18:51:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujMks-0000000DbGO-1Wp2;
	Tue, 05 Aug 2025 18:51:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAEEB4587E;
	Tue,  5 Aug 2025 18:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658C0C4CEF0;
	Tue,  5 Aug 2025 18:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754419880;
	bh=YGDoEPsUQuYfYTJDut+2PTWcm8Eh1MfbLsHsxoJoXvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6jXfk9gohIp3margX7YaCB5yYVY7+j1OM/qAAYsvgsV4u5pnMHDYOFGQs3pHZWld
	 GA+sAbgna+bxDsYuZFFj3HkBdXHg+tig8MnRZeAOxhshtVIIM9FDpT0Gic1S/DT9DM
	 EeQwFKnBQUBOaww70XWxdAyE7b6DDXKmkWdPFpkcnf567wqrWVvOV37v0U+V8NgfKO
	 b/y/zGvIsrAJlNOqe009GjMkeeEE02Jy6bZS5DYKwQJj8YKZHkpRGRBycJixweBL0g
	 n9uAOed9uHxAsciMpeF9+hEMmnSfpZ5LxqErPtYm9ypxcJu2w0yW37CCDBeHRZshEs
	 TmH0dYuYKmZbA==
Date: Tue, 5 Aug 2025 11:51:18 -0700
From: Drew Fustini <fustini@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: rkrcmar@ventanamicro.com, Bjorn Topel <bjorn@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>, samuel.holland@sifive.com,
	dfustini@tenstorrent.com, andybnac@gmail.com,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv-bounces@lists.infradead.org
Subject: Re: [PATCH] riscv: Add sysctl to control discard of vstate during
 syscall
Message-ID: <aJJSpia1clSebQpy@x1>
References: <DBHTIDY0HRM0.2B8L1WG7IBCXM@ventanamicro.com>
 <mhng-E49DDC7D-A330-4626-A122-4146AADDBB33@Palmers-Mini.rwc.dabbelt.com>
 <aI00nzzma4gXrmh/@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aI00nzzma4gXrmh/@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_115122_458719_09EDE2A1 
X-CRM114-Status: GOOD (  33.85  )
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

On Fri, Aug 01, 2025 at 02:41:51PM -0700, Drew Fustini wrote:
> On Wed, Jul 30, 2025 at 06:05:59PM -0700, Palmer Dabbelt wrote:
> > My first guess here would be that trashing the V register state is still
> > faster on the machines that triggered this patch, it's just that the way
> > we're trashing it is slow.  We're doing some wacky things in there (VILL,
> > LMUL, clearing to -1), so it's not surprising that some implementations are
> > slow on these routines.
> > 
> > This came up during the original patch and we decided to just go with this
> > way (which is recommended by the ISA) until someone could demonstrate it's
> > slow, so sounds like it's time to go revisit those.
> > 
> > So I'd start with something like
> > 
> >    diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> >    index b61786d43c20..1fba33e62d2b 100644
> >    --- a/arch/riscv/include/asm/vector.h
> >    +++ b/arch/riscv/include/asm/vector.h
> >    @@ -287,7 +287,6 @@ static inline void __riscv_v_vstate_discard(void)
> >                    "vmv.v.i        v8, -1\n\t"
> >                    "vmv.v.i        v16, -1\n\t"
> >                    "vmv.v.i        v24, -1\n\t"
> >    -               "vsetvl         %0, x0, %1\n\t"
> >                    ".option pop\n\t"
> >                    : "=&r" (vl) : "r" (vtype_inval));
> > 
> > to try and see if we're tripping over bad implementation behavior, in which
> > case we can just hide this all in the kernel.  Then we can split out these
> > performance issues from other things like lazy save/restore and a
> > V-preserving uABI, as it stands this is all sort of getting mixed up.
> 
> Thank you for your insights and the suggestion of removing vsetvl.
> 
> Using our v6.16-rc1 branch [1], the avg duration of getppid() is 198 ns
> with the existing upstream behavior in __riscv_v_vstate_discard():
> 
> debian@tt-blackhole:~$ ./null_syscall --vsetvli
> vsetvli complete
>  iterations: 1000000000
>    duration: 198 seconds
> avg latency: 198.10 ns
> 
> I removed 'vsetvl' as you suggested but the average duration only
> decreased a very small amount to 197.5 ns, so it seems that the other
> instructions are what is taking a lot of time on the X280 cores:
> 
> debian@tt-blackhole:~$ ./null_syscall --vsetvli
> vsetvli complete
>  iterations: 1000000000
>    duration: 197 seconds
> avg latency: 197.53 ns
> 
> This is compared to a duration of 150 ns when using this patch with
> abi.riscv_v_vstate_discard=0 which skips all the clobbering assembly.
> 
> Do you have any other suggestions for the __riscv_v_vstate_discard()
> inline assembly that might be worth me testing on the X280 cores?

I have tried leaving vsetvl but removing vmv.v.i instructions instead.
This made a difference on the X280 and reduced duration from 198 ns to
161 ns. This compared to an average duration of 148 ns when doing no
clobbering at all.

However, removing the vmv.v.i from the discard assembly doesn't help
much on our own out-of-order core due to still having to update the
vector state in status. Thus I'm still keen to have some way to entirely
opt out of __riscv_v_vstate_discard() on the do_trap_ecall_u() path.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
