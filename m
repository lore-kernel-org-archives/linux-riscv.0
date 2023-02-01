Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0606C38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 09:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbPAcHdg051r+qSyq2+zq2xWEUfBYixmON5W5VPBXRU=; b=XJEPkhlpnR4q8o
	AlJxm7l3s9LoP+WF/Bvs5Tx2qYZxRFnHgEx+7Ij2FVAHn9z5JKjzkbrrh3XwnSi6+W0rRCgCpqKLx
	o7W4ARo9w1PZBd6skd36HvFBW8/rQw0E2RbGIFbS3B1qzjeGSaqIl+6RIyCPprE/SHP/XGxMO5dHw
	zdB+PIL4zFof9CY56hHAS1f5ejcwUTky3Muvt4NByLcrJIzG6UHo5sH2+TzaXZc6pH0OtSDfZRAtP
	3VahOc9cosoWvp+Nmqk2SWeB4WsU1c5HlQXptmdJC9B3amQSwmKktoOoxZqXMYkEbsDZ3gxYCImgJ
	7Em0YBgsPVdHmfGGcdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9bH-00B3tJ-V4; Wed, 01 Feb 2023 09:40:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9bE-00B3sk-Km
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 09:40:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2ED876172A;
	Wed,  1 Feb 2023 09:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284C8C433D2;
	Wed,  1 Feb 2023 09:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675244415;
	bh=dDiMrAuD2jJiEu0GSefWpr5gCrPFP3YeIHhIbx9yqds=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Gp2hNSeXdQwtWvUuUQtDMTLm/xCZU2ZeKwg7AIgvq0k0stTayd9xseyrv2+Mpg6XA
	 lobPEboO/QnN1rhCPuP9k645XKww+OhqE09vshEzIIsCRYRxRCASpD57Ktl/6pweK5
	 WDGErxfp8fbwLF8hX+8fa4EVemXG5qU3ZK2x/MsowvM/Af49sUQsv7FunLHEfJKqor
	 +N5/q47YWoCQKQP2kDh1JP0F1D9EMIxlWCaAaC52Tvf/zly9YPh7wAutoCeXr7FKbj
	 6oBp7CYU8QomarEoSs/q2ltxY5ZpUH4+tDdthM5kKY9wxyqsbBaJp2ovyH6zs8wn2I
	 FOXtFl+PJ1/fg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, guoren@kernel.org, palmer@rivosinc.com,
 conor.dooley@microchip.com, liaochang1@huawei.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, Bjorn
 Topel <bjorn.topel@gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Fixup misaligned load text
In-Reply-To: <20230201064608.3486136-1-guoren@kernel.org>
References: <20230201064608.3486136-1-guoren@kernel.org>
Date: Wed, 01 Feb 2023 10:40:12 +0100
Message-ID: <87tu05pvur.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_014016_741422_78067B83 
X-CRM114-Status: GOOD (  14.29  )
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

guoren@kernel.org writes:

> From: Guo Ren <guoren@linux.alibaba.com>
>
> The current kprobe would cause a misaligned load for the probe point.
> This patch fixup it with two half-word loads instead.
>
> Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/878rhig9zj.fsf@all.your.base.are.belong.to.us/
> Reported-by: Bjorn Topel <bjorn.topel@gmail.com>
> ---
>  arch/riscv/kernel/probes/kprobes.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index 41c7481afde3..c1160629cef4 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -74,7 +74,9 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
>  		return -EILSEQ;
>  
>  	/* copy instruction */
> -	p->opcode = *p->addr;
> +	p->opcode = (kprobe_opcode_t)(*(u16 *)probe_addr);
> +	if (GET_INSN_LENGTH(p->opcode) == 4)
> +		p->opcode |= (kprobe_opcode_t)(*(u16 *)(probe_addr + 2))
>  	<< 16;

Ugh, those casts. :-( What about the memcpy variant you had in the other
thread?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
