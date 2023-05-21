Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997EDC77B7C
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 12:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urofdzbSq+j7R3qJgTz9+3tRRfqvOoOmt1mYex0C1kA=; b=AIINcOlHgZIOXX
	YcyLCs2FQcVCVXXIVOKIa4cI4dg4R/Sus/5jqrUwSSho/+uJsRgqckLCrqTms7GP1USDwsxSVYcqU
	9v4wioHWYKaCeBHHmAy3dxxRRy9AqQb1RhfB7LUaDyMbAX1lAxGPxtLz7vPnf+Wiw+K5DuPkI3LQt
	XJk2aQ0HQJ+aimYWryWIPnUpUFxJtgPI241pI4QKjDfF+Td775mf/zhZQWpLmkylHEQmBjAo81ygO
	a8JRkZbLO7ScCMSAOUEF6zznu1iLuL08TCecgxo+0T9xVv4+ba8G78gtLH8J1IioSeJlD777Bnot/
	uEfBKIJ04hz8yB65fTWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0iO5-003s3v-2v;
	Sun, 21 May 2023 12:42:13 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0iO1-003s2z-2H
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 12:42:12 +0000
X-QQ-mid: bizesmtp87t1684672900tvu170d8
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 21 May 2023 20:41:38 +0800 (CST)
X-QQ-SSF: 01200000000000D0U000000A0000000
X-QQ-FEAT: vLOCICHxEeDW76lr763tFePngT9GJJ0rcL19p0Do9KIvc2vsyWsAZchTyI8gm
	x2gbBq+6lyG/ZkEF/t6M/mUr7nTJnEdYAGRbcjUo2AXJHPsDQSXWqXe39q9DvsKpb+7+npb
	edzHz96cU9eNWNRBFg0TDqKgFsnQBU43t0zsX1NW6qSAnsHWZ7Li/wrUPlhS5ubtAR4gbUW
	LFvbqmpnsx1laxo62h6X8XwumuqTfwcB0Srsk44y6xNzE6Cvz8jr3nsbBQx9IkLuiZEgJOR
	BkRKCdhHqRNRrNgQv2mxS4C2cS1MGFo3WmeIoUSMDsdaWvq3K/Gr4+uZjqbRl3vyYCZA9/g
	gVtp2n/yIieQhQKmNrGsFiAL8Wk2R4ICaX0NYGnysOhTO1e+1GsH0jhXUiYyhEO987Tn/Ec
	aC5rjRoSrBo=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10607103245115285949
From: Zhangjin Wu <falcon@tinylab.org>
To: jszhang@kernel.org
Cc: conor@kernel.org,
	falcon@tinylab.org,
	guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	npiggin@gmail.com,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	tim.bird@sony.com,
	bmeng@tinylab.org
Subject: Re: [PATCH v3] RISC-V: Enable dead code elimination
Date: Sun, 21 May 2023 20:41:34 +0800
Message-Id: <20230521124134.55162-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZGna6sWmRZbMf3OH@xhacker>
References: <ZGna6sWmRZbMf3OH@xhacker>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_054210_060077_262C30A2 
X-CRM114-Status: GOOD (  36.28  )
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

Hi, Jisheng

> On Wed, May 17, 2023 at 04:29:36PM +0800, Zhangjin Wu wrote:
> > Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
> > the user to enable dead code elimination. In order for this to work,
> > ensure that we keep the alternative table by annotating them with KEEP.
> > 
> > This boots well on qemu with both rv32_defconfig & rv64 defconfig, but
> > it only shrinks their builds by ~1%, a smaller config is thereforce
> > customized to test this feature:
> 
> OOPS, I didn't noticed that you have sent out the patch and you are now
> in v3. I may read your patch sevral months ago, but I forget it.

Yeah, I have sent this patch several times, but beside the suggestion from
conor, I have gotten no more responses (before v3), I even thought RISC-V
people are not interested in or not require size shrinking ;-)

As I can see from the mailing list, Guoren just sent out a new series of
patchset [0] about size shrink (-16%), and include the one [1] from you, so,
I'm not alone, the left patchsets I'm working on and upstreaming include dead
syscall elimination [2], vdso configuration [3], nolibc for rv32 [4] and even
the self-decompress vmlinuz support (RFC v1 will be sent out next week), all of
these patchsets are result of my tinylinux [5] porting to RISC-V (got 334k
non-MMU rv64 vmlinuz+nolibc hello).

Is it ok to add you to my future CC list of the coming tinylinux
patchsets for RISC-V? welcome your review suggestions ;-)

From Guoren:
[0]: https://lore.kernel.org/linux-riscv/mhng-24855381-7da8-4c77-bcaf-a3a53c8cb38b@palmer-ri-x1c9/T/

From Jisheng:
[1]: https://lore.kernel.org/linux-riscv/20230511141211.2418-1-jszhang@kernel.org/

From Zhangjin:
[2]: https://lore.kernel.org/linux-riscv/cover.1676594211.git.falcon@tinylab.org/
[3]: https://lore.kernel.org/linux-riscv/cover.1684430522.git.falcon@tinylab.org/T/#t
[4]: https://lore.kernel.org/linux-riscv/cover.1684425792.git.falcon@tinylab.org/T/#t
[5]: http://elinux.org/Work_on_Tiny_Linux_Kernel

> But your version missed an important preparation patch which is
> to fix the typo in commom vmlinux.lds.h in asm-generic, thus LD_ORPHAN_WARN
> will warn loudly. See[1] for more details.
> 

ok, it is a great fix, .init.data.* are really critical sections, so, do we
need to select LD_ORPHAN_WARN by default for HAVE_LD_DEAD_CODE_DATA_ELIMINATION
to dig out such potential issues?

> Another missing point is we need to keep the .init.pi* and .init.bss*
> sections. See[1] for more details.
>

sorry, my v3 has forgotten re-checking the new changes of vmlinux.lds.S, just
checked it again, .init.bss* about efi was added from v6.2 and the .init.pi*
was really a new rv kernel feature from v6.3-rc1, just to mention, this may be
an important review part of the future vmlinux.lds.S changes: the sections
required but not explicitly used by any function or data must be KEEP'ed
manually, for more details, my old paper about kernel gc-sections [6] is a good
reference.

[6]: https://lwn.net/images/conf/rtlws-2011/proc/Yong.pdf

Another work I'm trying to do in toolchain side (in progress) is let the kernel
auto keep part of current KEEP'ed sections, this may eliminate more
functions/data and also reduce the maintain cost of manual KEEPing. This idea
derives from the coming RFC v2 of system call elimination patchset, some of the
unused syscalls can not be eliminated automatically because of the "rough"
exception table KEEPing.

> Since you are the first person to send out the patch of
> HAVE_LD_DEAD_CODE_DATA_ELIMINATION for riscv, do you mind if I update
> my series and take your patch in my series v2, make you as the commmit
> author, use your commit msg, and add my co-developped tag etc?
>

I have found that you have fixed up some other issues, It is better to
merge mine in your series, please don't forget the Tested-by line from
Bin Meng [7] and the Reviewed-by line from Guoren [8].

[7]: https://lore.kernel.org/linux-riscv/20230521040949.1411220-1-bmeng@tinylab.org/#t
[8]: https://lore.kernel.org/linux-riscv/20230521022313.3758709-1-guoren@kernel.org/

Thanks very much,
Zhangjin

> Thanks
> 
> > 
> >           | rv32                   | rv64
> >   --------|------------------------|---------------------
> >    No DCE | 4460684                | 4893488
> >       DCE | 3986716                | 4376400
> >    Shrink |  473968 (~10.6%)       |  517088 (~10.5%)
> > 
> > The config used above only reserves necessary options to boot on qemu
> > with serial console, more like the size-critical embedded scenes:
> > 
> >   - rv64 config: https://pastebin.com/crz82T0s
> >   - rv32 config: rv64 config + 32-bit.config
> > 
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  arch/riscv/Kconfig              | 1 +
> >  arch/riscv/kernel/vmlinux.lds.S | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 348c0fa1fc8c..d2eb1a862ea8 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -111,6 +111,7 @@ config RISCV
> >  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> >  	select HAVE_KRETPROBES if !XIP_KERNEL
> >  	select HAVE_RETHOOK if !XIP_KERNEL
> > +	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
> >  	select HAVE_MOVE_PMD
> >  	select HAVE_MOVE_PUD
> >  	select HAVE_PCI
> > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> > index e5f9f4677bbf..0f5dfbc113d4 100644
> > --- a/arch/riscv/kernel/vmlinux.lds.S
> > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > @@ -112,7 +112,7 @@ SECTIONS
> >  	. = ALIGN(8);
> >  	.alternative : {
> >  		__alt_start = .;
> > -		*(.alternative)
> > +		KEEP(*(.alternative))
> >  		__alt_end = .;
> >  	}
> >  	__init_end = .;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
