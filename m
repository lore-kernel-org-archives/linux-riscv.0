Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E701E7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 16:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZL+U3/RaWAVvGLHmAr8tDpqYIxMEVGoEewVP7Dq1ss=; b=1Re4JcejSst0hP
	LXke3FMk25UXlVTmZ2+4vb8lPdwsI/H8zXobIVhsfqWvxX9nOmpbAOWeINSI99SPnsUERMXOl+y1F
	UCEGX78XKfesN4yspFcUOo4HJ6j5B3GZnV9kfiSzkqz9b3nI87pUUwkzarppy8sP+kEiOgtEiIylX
	KaZQ+MVesUyDrks2ivxCeqmygpzceJ9LihVq84IaBIy+whweZEgzJ7b8arn7KBzaLdY2s7yG6PLBs
	oLxhumCsw4hxa3a8Sanf6UtpaxJiYRzQaaFTzdX7y6580HNEj+abc8ybqrZpGzyHI6rqkmKEV+jv3
	3bd0rkUl4K++Ax4Gw5Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNE3k-0000000AcJ7-1eoI;
	Mon, 16 Dec 2024 16:35:04 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNE1U-0000000Abkh-0F6A
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 16:32:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B21F0C0009;
	Mon, 16 Dec 2024 16:32:39 +0000 (UTC)
Message-ID: <82e27b16-a2e5-44aa-9f48-dfc93d7ed172@ghiti.fr>
Date: Mon, 16 Dec 2024 17:32:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: kprobes: fix placement in arch_prepare_ss_slot
Content-Language: en-US
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-riscv@lists.infradead.org
Cc: bjorn@rivosinc.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, Samuel Holland <samuel.holland@sifive.com>
References: <20241216130544.706110-1-ben.dooks@codethink.co.uk>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241216130544.706110-1-ben.dooks@codethink.co.uk>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_083244_244758_EFF696BD 
X-CRM114-Status: GOOD (  15.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Ben,

On 16/12/2024 14:05, Ben Dooks wrote:
> The second patch_text_nosync() in arch_prepare_ss_slot should be pointing
> after the first instruction, however p->ainsn.api.insn is a pointer to a
> probe_opcode_t which is 4 bytes... this means an instruction of length 2
> moves the pointer by 8 bytes.
>
> This means a kprobe may fail to work and recurse into the bad instruction
> handler (which then itself fails as the original lock still seems to be
> held?)
>
> Fixes: b1756750a397f36ddc857 ("riscv: kprobes: Use patch_text_nosync() for insn slots")
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> Cc: Samuel Holland <samuel.holland@sifive.com>
> ---
>   arch/riscv/kernel/probes/kprobes.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index 380a0e8cecc0..c0738d6c6498 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -30,7 +30,7 @@ static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
>   	p->ainsn.api.restore = (unsigned long)p->addr + len;
>   
>   	patch_text_nosync(p->ainsn.api.insn, &p->opcode, len);
> -	patch_text_nosync(p->ainsn.api.insn + len, &insn, GET_INSN_LENGTH(insn));
> +	patch_text_nosync((void *)p->ainsn.api.insn + len, &insn, GET_INSN_LENGTH(insn));
>   }
>   
>   static void __kprobes arch_prepare_simulate(struct kprobe *p)


Nam already came up with the same fix a few weeks ago: 
https://lore.kernel.org/linux-riscv/20241119111056.2554419-1-namcao@linutronix.de/

Thanks anyway!

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
