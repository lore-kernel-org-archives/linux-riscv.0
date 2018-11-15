Return-Path: <SRS0=n0wm=N2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D54CC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 07:50:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3AB8223DD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 07:50:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FYq1CkJD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="endZulJC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jS60Gwj9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3AB8223DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSwvxYVtyav1KuuZa3fdjzWCyhfCTHz1kilizca8F38=; b=FYq1CkJDitSoCG
	pv1Jzp5yV3Q2w4cj6kmOwdzbRT2XW8k8jbb3TcTzabnEGSaKYZ70Md9mpSDvJ7d52Y6KS3Cx21vW8
	RxRmLZpdG3OV0LKl0yF7gwdvawq2BPLOr5woLLBd925D6OWFJbA3jYOn10Uir/wtNoLEfhCZiFMJx
	KP23vsrPMrvW2HwWkwiUpgxnyMuli6r25chy7j2ngmVI71w4b4IBABD9xEGjY5TC8XIjV53J47O+0
	PFA/FB90/ZFjLFPnY26eVUkeziIQkwjFdC4LyFPj5phE3TwvVondZ/ZVgapGNwS/Yip0vOhlBGdFF
	JIcF6fakMTVbLL1zIOgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNCPs-0000Fq-PC; Thu, 15 Nov 2018 07:50:20 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNCPr-0000Fh-DQ
 for linux-riscv@bombadil.infradead.org; Thu, 15 Nov 2018 07:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oYC/7J7gGNYb8UkNj3SVw8ivp88hbhEsohKFYwXtOQM=; b=endZulJCT55FSAfiuKHL9dqZJG
 ojXH0F9hvT8xcvjdsZbkz0rLIERsQLl8zXJQFgW5BIK3yTJZrqB/xx4VbBgw2fruzeW6o+asTEp+A
 qoilImJul/+zjgzRF+6p6YmZTr0K0ZrLwuJyxYylQekFV01s16JmH0Az+c0ixgzXSgbtUHyg9xNRX
 /28BOuyIH1yx3Z8RDLEX+Qz240pKq281DY8qfnmDORl79j/LizWp02e/gz1D5yV+1ZLosGwX0hf0P
 roNie0oTH4pT5YoFWsYq+nXFmUqIVTUbgHQHW2wxUaaOPGsQiNgt+Thf5SDsOJ8JD0lZ8SNuLgm15
 G2ixlPbQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNCPo-0008Id-LI
 for linux-riscv@lists.infradead.org; Thu, 15 Nov 2018 07:50:17 +0000
Received: from devnote (unknown [64.114.255.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B65B921582;
 Thu, 15 Nov 2018 07:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1542268205;
 bh=7XF1fezt0O4sBhR1B3rFJZPqT8zuYrpGPjBU7AFtfVk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jS60Gwj9r2E30VJAwmTJLaRMKpOngFEOs3p1uRfYwwZIyd2Z47qkL2fDbQ7rR9Vpm
 Hqnhc7GtrDkcAi7uKIP/aMXogmy09sKrUXuf/cjgZv/tRSkUJ3xnkFXYIjo2zWnahO
 UfKliDkgZDf7emclSTPg8fclyO+fzKXrDlVpyO74=
Date: Wed, 14 Nov 2018 23:50:04 -0800
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Patrick Staehlin <me@packi.ch>
Subject: Re: [RFC/RFT 2/2] RISC-V: kprobes/kretprobe support
Message-Id: <20181114235004.1d57d911e15efaa8f18fa75e@kernel.org>
In-Reply-To: <05082ba4-33d6-a95c-e049-78791dafc009@packi.ch>
References: <20181113195804.22825-1-me@packi.ch>
 <20181113195804.22825-3-me@packi.ch>
 <20181114003730.06f810517a270070734df4ce@kernel.org>
 <20181114074951.0902699286fdf8652f2878a4@kernel.org>
 <05082ba4-33d6-a95c-e049-78791dafc009@packi.ch>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181115_025016_847508_6A877229 
X-CRM114-Status: GOOD (  20.19  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anders Roxell <anders.roxell@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Alan Kao <alankao@andestech.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Souptick Joarder <jrdr.linux@gmail.com>,
 Zong Li <zong@andestech.com>, Thomas Gleixner <tglx@linutronix.de>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-riscv@lists.infradead.org,
 zhong jiang <zhongjiang@huawei.com>, Ingo Molnar <mingo@kernel.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181115075004.H4nqx6ml9mPkFSCqKy4YaTlgz2gz-21xusQ1VcZfNCk@z>

On Wed, 14 Nov 2018 22:10:52 +0100
Patrick Staehlin <me@packi.ch> wrote:

> On 14.11.18 16:49, Masami Hiramatsu wrote:
> > On Wed, 14 Nov 2018 00:37:30 -0800
> > Masami Hiramatsu <mhiramat@kernel.org> wrote:
> > 
> >>> +
> >>> +static int __kprobes patch_text(kprobe_opcode_t *addr, u32 opcode)
> >>> +{
> >>> +	if (is_compressed_insn(opcode))
> >>> +		*(u16 *)addr = cpu_to_le16(opcode);
> >>> +	else
> >>> +		*addr = cpu_to_le32(opcode);
> >>> +
> > 
> > BTW, don't RISC-V need any i-cache flush and per-core serialization
> > for patching the text area? (and no text_mutex protection?)
> 
> Yes, we should probably call flush_icache_all. This code works on
> QEMU/virt but I guess on real hardware you may run into problems,
> especially when disarming the kprobe. I'll have a look at the arm64 code
> again to see what's missing.

Note that self code-modifying is a special case for any processors, especially
if that is multi-processor. In general, this may depend on the circuit desgin,
not ISA.
Some processor implementation will do in-order and no i-cache, no SMP, that will
be simple, but if it is out-of-order, deep pipeline, huge i-cache, and many-core,
you might have to care many things. We have to talk with someone who is designing
real hardware, and maybe better to make the patch_text pluggable for variants.
(or choose the safest way)

> >>> diff --git a/arch/riscv/kernel/probes/kprobes_trampoline.S b/arch/riscv/kernel/probes/kprobes_trampoline.S
> >>> new file mode 100644
> >>> index 000000000000..c7ceda9556a3
> >>> --- /dev/null
> >>> +++ b/arch/riscv/kernel/probes/kprobes_trampoline.S
> >>> @@ -0,0 +1,91 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0+ */
> >>> +
> >>> +#include <linux/linkage.h>
> >>> +
> >>> +#include <asm/asm.h>
> >>> +#include <asm/asm-offsets.h>
> >>> +
> >>> +	.text
> >>> +	.altmacro
> >>> +
> >>> +	.macro save_all_base_regs
> >>> +	REG_S x1,  PT_RA(sp)
> >>> +	REG_S x3,  PT_GP(sp)
> >>> +	REG_S x4,  PT_TP(sp)
> >>> +	REG_S x5,  PT_T0(sp)
> >>> +	REG_S x6,  PT_T1(sp)
> >>> +	REG_S x7,  PT_T2(sp)
> >>> +	REG_S x8,  PT_S0(sp)
> >>> +	REG_S x9,  PT_S1(sp)
> >>> +	REG_S x10, PT_A0(sp)
> >>> +	REG_S x11, PT_A1(sp)
> >>> +	REG_S x12, PT_A2(sp)
> >>> +	REG_S x13, PT_A3(sp)
> >>> +	REG_S x14, PT_A4(sp)
> >>> +	REG_S x15, PT_A5(sp)
> >>> +	REG_S x16, PT_A6(sp)
> >>> +	REG_S x17, PT_A7(sp)
> >>> +	REG_S x18, PT_S2(sp)
> >>> +	REG_S x19, PT_S3(sp)
> >>> +	REG_S x20, PT_S4(sp)
> >>> +	REG_S x21, PT_S5(sp)
> >>> +	REG_S x22, PT_S6(sp)
> >>> +	REG_S x23, PT_S7(sp)
> >>> +	REG_S x24, PT_S8(sp)
> >>> +	REG_S x25, PT_S9(sp)
> >>> +	REG_S x26, PT_S10(sp)
> >>> +	REG_S x27, PT_S11(sp)
> >>> +	REG_S x28, PT_T3(sp)
> >>> +	REG_S x29, PT_T4(sp)
> >>> +	REG_S x30, PT_T5(sp)
> >>> +	REG_S x31, PT_T6(sp)
> >>> +	.endm
> >>> +
> >>> +	.macro restore_all_base_regs
> >>> +	REG_L x3,  PT_GP(sp)
> >>> +	REG_L x4,  PT_TP(sp)
> >>> +	REG_L x5,  PT_T0(sp)
> >>> +	REG_L x6,  PT_T1(sp)
> >>> +	REG_L x7,  PT_T2(sp)
> >>> +	REG_L x8,  PT_S0(sp)
> >>> +	REG_L x9,  PT_S1(sp)
> >>> +	REG_L x10, PT_A0(sp)
> >>> +	REG_L x11, PT_A1(sp)
> >>> +	REG_L x12, PT_A2(sp)
> >>> +	REG_L x13, PT_A3(sp)
> >>> +	REG_L x14, PT_A4(sp)
> >>> +	REG_L x15, PT_A5(sp)
> >>> +	REG_L x16, PT_A6(sp)
> >>> +	REG_L x17, PT_A7(sp)
> >>> +	REG_L x18, PT_S2(sp)
> >>> +	REG_L x19, PT_S3(sp)
> >>> +	REG_L x20, PT_S4(sp)
> >>> +	REG_L x21, PT_S5(sp)
> >>> +	REG_L x22, PT_S6(sp)
> >>> +	REG_L x23, PT_S7(sp)
> >>> +	REG_L x24, PT_S8(sp)
> >>> +	REG_L x25, PT_S9(sp)
> >>> +	REG_L x26, PT_S10(sp)
> >>> +	REG_L x27, PT_S11(sp)
> >>> +	REG_L x28, PT_T3(sp)
> >>> +	REG_L x29, PT_T4(sp)
> >>> +	REG_L x30, PT_T5(sp)
> >>> +	REG_L x31, PT_T6(sp)
> >>> +	.endm
> > 
> > 
> > It seems thses macros can be (partially?) shared with entry.S
> 
> Yes, I wanted to avoid somebody changing the shared code and breaking
> random things. But that's what reviews are for. I'll think of something
> for v2.

Ah, OK. So for the first version, we introduce this separated code until
someone complains it.


Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
