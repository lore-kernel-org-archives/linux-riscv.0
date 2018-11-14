Return-Path: <SRS0=rRaS=NZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6173BC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 21:11:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 327D52175B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 21:11:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oNw1P4LV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 327D52175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=packi.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHbF0SLy5/dhQxGC1UZzbQb6zJZKIlG6tTy9WJ2pQIY=; b=oNw1P4LV4/JrPB
	OIlWRj32mvp8TxhT/0rfJJUyGx7KdpMPOn2cVC/9l0wzAKbnedy+dwh2SZFBrJ95XM87SJm2UvS53
	ry6nqhuLtVcnHKmYiev6wI5aWiHjVfu7oQ2GWMirQ8A6UbyHMxiQVrwz/nNuKa5ZVWPLj5D/qiN2m
	PC1Ie11FtZrX/Fv7gpALVxM6ojM4iceWtzfbJIEIj0sWoaYBrJzFy6cT7lKZpg7A44OeGQvYnKnLL
	NA8E1x3/TfyuWO6c9P1HJzJYhXjVeYGXFRR4RlKm2njVGrssFV/MCeExFEFAGaW39EESbHKjQ2TiU
	VK0yOZhdeGDBiezx+7wQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gN2RI-0002la-P0; Wed, 14 Nov 2018 21:11:08 +0000
Received: from mail.binarylogic.ch ([2a01:4f8:222:24c1::ff02])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gN2RF-0002kV-7J
 for linux-riscv@lists.infradead.org; Wed, 14 Nov 2018 21:11:06 +0000
Received: from [IPv6:2001:8e0:2002:7300:94d1:5a64:c83e:664b] (unknown
 [IPv6:2001:8e0:2002:7300:94d1:5a64:c83e:664b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.binarylogic.ch (Postfix) with ESMTPSA id 52079DF386;
 Wed, 14 Nov 2018 22:10:53 +0100 (CET)
Subject: Re: [RFC/RFT 2/2] RISC-V: kprobes/kretprobe support
To: Masami Hiramatsu <mhiramat@kernel.org>
References: <20181113195804.22825-1-me@packi.ch>
 <20181113195804.22825-3-me@packi.ch>
 <20181114003730.06f810517a270070734df4ce@kernel.org>
 <20181114074951.0902699286fdf8652f2878a4@kernel.org>
From: Patrick Staehlin <me@packi.ch>
Openpgp: preference=signencrypt
Autocrypt: addr=me@packi.ch; prefer-encrypt=mutual; keydata=
 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
Message-ID: <05082ba4-33d6-a95c-e049-78791dafc009@packi.ch>
Date: Wed, 14 Nov 2018 22:10:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181114074951.0902699286fdf8652f2878a4@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181114_131105_570337_190B19F5 
X-CRM114-Status: GOOD (  14.13  )
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
Message-ID: <20181114211052.2v4UuvlOTh2OkX6fa61SonCw9u5-0sxRzHyKA1LpzF8@z>

On 14.11.18 16:49, Masami Hiramatsu wrote:
> On Wed, 14 Nov 2018 00:37:30 -0800
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
> 
>>> +
>>> +static int __kprobes patch_text(kprobe_opcode_t *addr, u32 opcode)
>>> +{
>>> +	if (is_compressed_insn(opcode))
>>> +		*(u16 *)addr = cpu_to_le16(opcode);
>>> +	else
>>> +		*addr = cpu_to_le32(opcode);
>>> +
> 
> BTW, don't RISC-V need any i-cache flush and per-core serialization
> for patching the text area? (and no text_mutex protection?)

Yes, we should probably call flush_icache_all. This code works on
QEMU/virt but I guess on real hardware you may run into problems,
especially when disarming the kprobe. I'll have a look at the arm64 code
again to see what's missing.

> 
>>> diff --git a/arch/riscv/kernel/probes/kprobes_trampoline.S b/arch/riscv/kernel/probes/kprobes_trampoline.S
>>> new file mode 100644
>>> index 000000000000..c7ceda9556a3
>>> --- /dev/null
>>> +++ b/arch/riscv/kernel/probes/kprobes_trampoline.S
>>> @@ -0,0 +1,91 @@
>>> +/* SPDX-License-Identifier: GPL-2.0+ */
>>> +
>>> +#include <linux/linkage.h>
>>> +
>>> +#include <asm/asm.h>
>>> +#include <asm/asm-offsets.h>
>>> +
>>> +	.text
>>> +	.altmacro
>>> +
>>> +	.macro save_all_base_regs
>>> +	REG_S x1,  PT_RA(sp)
>>> +	REG_S x3,  PT_GP(sp)
>>> +	REG_S x4,  PT_TP(sp)
>>> +	REG_S x5,  PT_T0(sp)
>>> +	REG_S x6,  PT_T1(sp)
>>> +	REG_S x7,  PT_T2(sp)
>>> +	REG_S x8,  PT_S0(sp)
>>> +	REG_S x9,  PT_S1(sp)
>>> +	REG_S x10, PT_A0(sp)
>>> +	REG_S x11, PT_A1(sp)
>>> +	REG_S x12, PT_A2(sp)
>>> +	REG_S x13, PT_A3(sp)
>>> +	REG_S x14, PT_A4(sp)
>>> +	REG_S x15, PT_A5(sp)
>>> +	REG_S x16, PT_A6(sp)
>>> +	REG_S x17, PT_A7(sp)
>>> +	REG_S x18, PT_S2(sp)
>>> +	REG_S x19, PT_S3(sp)
>>> +	REG_S x20, PT_S4(sp)
>>> +	REG_S x21, PT_S5(sp)
>>> +	REG_S x22, PT_S6(sp)
>>> +	REG_S x23, PT_S7(sp)
>>> +	REG_S x24, PT_S8(sp)
>>> +	REG_S x25, PT_S9(sp)
>>> +	REG_S x26, PT_S10(sp)
>>> +	REG_S x27, PT_S11(sp)
>>> +	REG_S x28, PT_T3(sp)
>>> +	REG_S x29, PT_T4(sp)
>>> +	REG_S x30, PT_T5(sp)
>>> +	REG_S x31, PT_T6(sp)
>>> +	.endm
>>> +
>>> +	.macro restore_all_base_regs
>>> +	REG_L x3,  PT_GP(sp)
>>> +	REG_L x4,  PT_TP(sp)
>>> +	REG_L x5,  PT_T0(sp)
>>> +	REG_L x6,  PT_T1(sp)
>>> +	REG_L x7,  PT_T2(sp)
>>> +	REG_L x8,  PT_S0(sp)
>>> +	REG_L x9,  PT_S1(sp)
>>> +	REG_L x10, PT_A0(sp)
>>> +	REG_L x11, PT_A1(sp)
>>> +	REG_L x12, PT_A2(sp)
>>> +	REG_L x13, PT_A3(sp)
>>> +	REG_L x14, PT_A4(sp)
>>> +	REG_L x15, PT_A5(sp)
>>> +	REG_L x16, PT_A6(sp)
>>> +	REG_L x17, PT_A7(sp)
>>> +	REG_L x18, PT_S2(sp)
>>> +	REG_L x19, PT_S3(sp)
>>> +	REG_L x20, PT_S4(sp)
>>> +	REG_L x21, PT_S5(sp)
>>> +	REG_L x22, PT_S6(sp)
>>> +	REG_L x23, PT_S7(sp)
>>> +	REG_L x24, PT_S8(sp)
>>> +	REG_L x25, PT_S9(sp)
>>> +	REG_L x26, PT_S10(sp)
>>> +	REG_L x27, PT_S11(sp)
>>> +	REG_L x28, PT_T3(sp)
>>> +	REG_L x29, PT_T4(sp)
>>> +	REG_L x30, PT_T5(sp)
>>> +	REG_L x31, PT_T6(sp)
>>> +	.endm
> 
> 
> It seems thses macros can be (partially?) shared with entry.S

Yes, I wanted to avoid somebody changing the shared code and breaking
random things. But that's what reviews are for. I'll think of something
for v2.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
