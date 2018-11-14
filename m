Return-Path: <SRS0=rRaS=NZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA15C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 15:50:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21998214F1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 15:50:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TOsAkIuk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ezw0QAaF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6am2etp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21998214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJC4IdA/vpeC7PwmVFSkrnnmS/1aVau0fmYARF5j4Y8=; b=TOsAkIukcc7AiG
	SOh0TptoOhDjTP6z1TfMGHK6qKDAm8hZ0L3beJ7qOeFHNlLZ8dGyONQQU4So45dG52UOxd0LM7koa
	KwCzoi79AG6JwIExupudlmrmjIpXeNfaFz90RAfSc5gVzuurp5xqYad8VV5rpUMLzxQD+mWPJe2m0
	P+xCHntjMIE9a14UJBnsjsuN38YBeCWWn53gLQC549ZzFThNRcMuxrjP1x2WDdakzn3+uBuRj6kpP
	qS51ClIiPpz/ooYVM8ggFIQqFdf9aBywVOJ9oODzhoSKXiHHCXqA83JsUad6d8Wjn0xuwAoHYXDeR
	W83SE0Syf5T2Cdx47vpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMxQi-0002EP-PK; Wed, 14 Nov 2018 15:50:12 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMxQh-0002EH-HX
 for linux-riscv@bombadil.infradead.org; Wed, 14 Nov 2018 15:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bdVtQAknJ+5D+FkIkUL1SMbrqSw+rjwzZl2X3oB6qbE=; b=Ezw0QAaFlfPtOqHBKoBXgX+vV8
 GiYDPmnClG1gxc6CXe71LeC3ddK0ZxcxNFNJUUMt+5A0DXKrrJi5ajUproSkLGuuGFbAvNL+3ZDKu
 08ZjBj+B9kQQJ3xdAjO6BOmF6x7GPFyws+W84PkgkTX2LWwQZjiWK1N7u7o3h1oMvoYxoTYfb6Ma3
 Vq2LYHqrtY50Pa5g1NOte0WhexRqcPBO8NpN8xRcpSgim6RWvRKc5tKDaDBbRKAqTAr3uK4bo2fXA
 pooh70MujmVSabyRVQDtd4dsbolmSBIdjQAFgWKdik3934j0rgCzStSuHre83dAlzxAtE4xbvZh2z
 5v6RWXcw==;
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMxQZ-0008Fw-RB
 for linux-riscv@lists.infradead.org; Wed, 14 Nov 2018 15:50:09 +0000
Received: from devnote (unknown [64.114.255.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3D5A214F1;
 Wed, 14 Nov 2018 15:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1542210592;
 bh=D18OzsVre62OCCAyxjcygNQHmbI7ApSJ9PDtChqSB9w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A6am2etpp90qUteJ6dJ6NBAHnp+G5DSaXGjx0dzIYNfT0FIgeuMTAML4a/SFB0cv3
 yTP4GteG1Nj0lNi9Aza3P/qQx5oYKx89pOV924JEOf3nI8jnu6wj2l1NNzgY0ibS/M
 aBOhA/Gxme7UqJkM5b0CsjJgZTwIhTvdZ43j4otI=
Date: Wed, 14 Nov 2018 07:49:51 -0800
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [RFC/RFT 2/2] RISC-V: kprobes/kretprobe support
Message-Id: <20181114074951.0902699286fdf8652f2878a4@kernel.org>
In-Reply-To: <20181114003730.06f810517a270070734df4ce@kernel.org>
References: <20181113195804.22825-1-me@packi.ch>
 <20181113195804.22825-3-me@packi.ch>
 <20181114003730.06f810517a270070734df4ce@kernel.org>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181114_105004_019048_F86B8D62 
X-CRM114-Status: GOOD (  14.95  )
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
Cc: Patrick =?UTF-8?B?U3TDpGhsaW4=?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Anders Roxell <anders.roxell@linaro.org>,
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
Message-ID: <20181114154951.kNxX0Ag2FPeWuipiX83al49tHNgjvYBa03NedwH0qak@z>

On Wed, 14 Nov 2018 00:37:30 -0800
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> > +
> > +static int __kprobes patch_text(kprobe_opcode_t *addr, u32 opcode)
> > +{
> > +	if (is_compressed_insn(opcode))
> > +		*(u16 *)addr = cpu_to_le16(opcode);
> > +	else
> > +		*addr = cpu_to_le32(opcode);
> > +

BTW, don't RISC-V need any i-cache flush and per-core serialization
for patching the text area? (and no text_mutex protection?)

> > diff --git a/arch/riscv/kernel/probes/kprobes_trampoline.S b/arch/riscv/kernel/probes/kprobes_trampoline.S
> > new file mode 100644
> > index 000000000000..c7ceda9556a3
> > --- /dev/null
> > +++ b/arch/riscv/kernel/probes/kprobes_trampoline.S
> > @@ -0,0 +1,91 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +
> > +#include <linux/linkage.h>
> > +
> > +#include <asm/asm.h>
> > +#include <asm/asm-offsets.h>
> > +
> > +	.text
> > +	.altmacro
> > +
> > +	.macro save_all_base_regs
> > +	REG_S x1,  PT_RA(sp)
> > +	REG_S x3,  PT_GP(sp)
> > +	REG_S x4,  PT_TP(sp)
> > +	REG_S x5,  PT_T0(sp)
> > +	REG_S x6,  PT_T1(sp)
> > +	REG_S x7,  PT_T2(sp)
> > +	REG_S x8,  PT_S0(sp)
> > +	REG_S x9,  PT_S1(sp)
> > +	REG_S x10, PT_A0(sp)
> > +	REG_S x11, PT_A1(sp)
> > +	REG_S x12, PT_A2(sp)
> > +	REG_S x13, PT_A3(sp)
> > +	REG_S x14, PT_A4(sp)
> > +	REG_S x15, PT_A5(sp)
> > +	REG_S x16, PT_A6(sp)
> > +	REG_S x17, PT_A7(sp)
> > +	REG_S x18, PT_S2(sp)
> > +	REG_S x19, PT_S3(sp)
> > +	REG_S x20, PT_S4(sp)
> > +	REG_S x21, PT_S5(sp)
> > +	REG_S x22, PT_S6(sp)
> > +	REG_S x23, PT_S7(sp)
> > +	REG_S x24, PT_S8(sp)
> > +	REG_S x25, PT_S9(sp)
> > +	REG_S x26, PT_S10(sp)
> > +	REG_S x27, PT_S11(sp)
> > +	REG_S x28, PT_T3(sp)
> > +	REG_S x29, PT_T4(sp)
> > +	REG_S x30, PT_T5(sp)
> > +	REG_S x31, PT_T6(sp)
> > +	.endm
> > +
> > +	.macro restore_all_base_regs
> > +	REG_L x3,  PT_GP(sp)
> > +	REG_L x4,  PT_TP(sp)
> > +	REG_L x5,  PT_T0(sp)
> > +	REG_L x6,  PT_T1(sp)
> > +	REG_L x7,  PT_T2(sp)
> > +	REG_L x8,  PT_S0(sp)
> > +	REG_L x9,  PT_S1(sp)
> > +	REG_L x10, PT_A0(sp)
> > +	REG_L x11, PT_A1(sp)
> > +	REG_L x12, PT_A2(sp)
> > +	REG_L x13, PT_A3(sp)
> > +	REG_L x14, PT_A4(sp)
> > +	REG_L x15, PT_A5(sp)
> > +	REG_L x16, PT_A6(sp)
> > +	REG_L x17, PT_A7(sp)
> > +	REG_L x18, PT_S2(sp)
> > +	REG_L x19, PT_S3(sp)
> > +	REG_L x20, PT_S4(sp)
> > +	REG_L x21, PT_S5(sp)
> > +	REG_L x22, PT_S6(sp)
> > +	REG_L x23, PT_S7(sp)
> > +	REG_L x24, PT_S8(sp)
> > +	REG_L x25, PT_S9(sp)
> > +	REG_L x26, PT_S10(sp)
> > +	REG_L x27, PT_S11(sp)
> > +	REG_L x28, PT_T3(sp)
> > +	REG_L x29, PT_T4(sp)
> > +	REG_L x30, PT_T5(sp)
> > +	REG_L x31, PT_T6(sp)
> > +	.endm


It seems thses macros can be (partially?) shared with entry.S

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
