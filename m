Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1295FC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 20:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AeXdTrDyYuJd7lIIimoKITFmVPBF5TnjleR0DDnjR+0=; b=tsVdU5umjqhgK+
	XuVEZo1LirqlaSA3JQr25nOWPE+K0AXgn39xWx9tkttGD2sMXEf5DbQ4SYCzRVAiUbN2JE0cxwtO2
	u9c37WiHhRHHtaPlDCft3U7RInJtg0UewcP0E1Y2640Eg9HEBfh/f7Zeg70sut4WqhVtOtKK31kcs
	cqfXkQKRFw06axA5X4cQ7AzJOjV7/nDOMGIs0z5p4yNKDs++ZXNUzzQHsoWbbTqZrwv4r+iR2tOoF
	POhRSMJM27Wgt1PVhlvqiXBafNJ+kWAPLnFfpvp3Ltsoi3QPuGkWBBdojc4uw9xkSWeKxGqWN/PPn
	NtoAKAz7jCFM+EC4Rvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJha1-00GmFg-SS; Mon, 14 Feb 2022 20:04:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJhZz-00GmEu-8A
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 20:04:12 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nJhZv-0002js-Qr; Mon, 14 Feb 2022 21:04:07 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@rivosinc.com>, Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: Re: [PATCH v3 1/3] RISC-V: Correctly print supported extensions
Date: Mon, 14 Feb 2022 21:04:07 +0100
Message-ID: <1722531.ZnnOanGknH@diego>
In-Reply-To: <d4d5a22e24d477ab4d8284d0140e17c6c5ff5464.1644647398.git.research_trasio@irq.a4lg.com>
References: <ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com>
 <d4d5a22e24d477ab4d8284d0140e17c6c5ff5464.1644647398.git.research_trasio@irq.a4lg.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_120411_331249_0AA7E3AA 
X-CRM114-Status: GOOD (  20.11  )
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

Am Samstag, 12. Februar 2022, 07:29:59 CET schrieb Tsukasa OI:
> This commit replaces BITS_PER_LONG with number of alphabet letters.
> 
> Current ISA pretty-printing code expects extension 'a' (bit 0) through
> 'z' (bit 25).  Although bit 26 and higher is not currently used (thus never
> cause an issue in practice), it will be an annoying problem if we start to
> use those in the future.
> 
> This commit disables printing high bits for now.
> 
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Tested-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  arch/riscv/kernel/cpufeature.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index d959d207a40d..dd3d57eb4eea 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -13,6 +13,8 @@
>  #include <asm/smp.h>
>  #include <asm/switch_to.h>
>  
> +#define NUM_ALPHA_EXTS ('z' - 'a' + 1)
> +
>  unsigned long elf_hwcap __read_mostly;
>  
>  /* Host ISA bitmap */
> @@ -63,7 +65,7 @@ void __init riscv_fill_hwcap(void)
>  {
>  	struct device_node *node;
>  	const char *isa;
> -	char print_str[BITS_PER_LONG + 1];
> +	char print_str[NUM_ALPHA_EXTS + 1];
>  	size_t i, j, isa_len;
>  	static unsigned long isa2hwcap[256] = {0};
>  
> @@ -133,13 +135,13 @@ void __init riscv_fill_hwcap(void)
>  	}
>  
>  	memset(print_str, 0, sizeof(print_str));
> -	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
> +	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
>  		if (riscv_isa[0] & BIT_MASK(i))
>  			print_str[j++] = (char)('a' + i);
>  	pr_info("riscv: ISA extensions %s\n", print_str);
>  
>  	memset(print_str, 0, sizeof(print_str));
> -	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
> +	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
>  		if (elf_hwcap & BIT_MASK(i))
>  			print_str[j++] = (char)('a' + i);
>  	pr_info("riscv: ELF capabilities %s\n", print_str);
> 
> base-commit: 7aed1489bdf879da403e8ee9d6d77b0be26bb84d
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
