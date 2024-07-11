Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DCAC3DA41
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 12:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTMP0n8QW+DP3+R2iusFkTE17Jm7QA7fsN9KDn65cEw=; b=1zhc8KpLaVf2Dt
	uikelO6fT2iFEw1E2ImcD/dHCUH0BYH4VOGIvBHKlmQdUZfmrSWv20CWyt6WfMRaTPPtK/MjayR60
	oQ2+YE1AYoNFNFNkEH1qvuJ6Jxem7UlOKDeo8mawafzq7LfJSIA3UId73jwNNhd5fl0GxiDI0XMfb
	cMszk6Z5csFg51lhOf2f2EITnv0q7PcvbTo5Cy+CQjBmxeA7UcqJNJ93jA4Bldh/B45aEyhaWZwuB
	NnU4nTyLWCPHTWwPea7fK7tH1ALjwmeN0Nqepu6Wk1jB3S0sVGCq2qCQLMdTFbKmwBv1iTIVfUPh0
	qOFEYUXjeWKtDUINhTVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtIu-0000000E0La-0JUt;
	Thu, 11 Jul 2024 12:53:44 +0000
Received: from bee.tesarici.cz ([2a03:3b40:fe:2d4::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtIq-0000000E0KZ-0ape;
	Thu, 11 Jul 2024 12:53:41 +0000
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id 4F7721E53BD;
	Thu, 11 Jul 2024 14:53:35 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1720702415; bh=P0PSLu8WPQEzhXJpUAj3fWhxFWbRpRvdGMV58iTV82k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hYfq4Al9Dd1KJwLPJILIFL4GAOgwsTSArV1x1DIi6erZKeMa1BzwA/0b9zga2qO6Q
	 wsaCGmoLVAuYR97Uslvcm02osX2iJx7//agx0lqsV69Y9rW2SpMqUGG92+SNbg1/bj
	 H0wV3naa1QnEDWKuasT6RCmYqZiwtYfU+Y12kcBTfTaPEAjV5tb9AoEeNrcZsDZTb5
	 55FKB7QKZTMn8nPxCDJbVxW/+NiZkMkpKzmI8fL+o96k1ni926vheIVV94rhYeyGcx
	 YRKWWDQc7DTRUN/kxxYPDu9E59NIMBoDkH8MPcpo70QS9LGFIkVhq3mSePcDZiCS3F
	 Q/It4+1AzykFg==
Date: Thu, 11 Jul 2024 14:53:30 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: sunying@isrc.iscas.ac.cn
Cc: ebiederm@xmission.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, kexec@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 zhuhengbo@iscas.ac.cn
Subject: Re: [PATCH v1] riscv/kexec_file: Fix relocation type R_RISCV_ADD16
 and R_RISCV_SUB16 unknown
Message-ID: <20240711145330.6625c200@mordecai.tesarici.cz>
In-Reply-To: <20240711083236.2859632-1-sunying@isrc.iscas.ac.cn>
References: <20240711083236.2859632-1-sunying@isrc.iscas.ac.cn>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_055340_364403_4A3AECCB 
X-CRM114-Status: GOOD (  14.70  )
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

On Thu, 11 Jul 2024 08:32:36 +0000
sunying@isrc.iscas.ac.cn wrote:

> From: Ying Sun <sunying@isrc.iscas.ac.cn>
> 
> Runs on the kernel with CONFIG_RISCV_ALTERNATIVE enabled:
>   kexec -sl vmlinux
> 
> Error:
>   kexec_image: Unknown rela relocation: 34
>   kexec_image: Error loading purgatory ret=-8
> and
>   kexec_image: Unknown rela relocation: 38
>   kexec_image: Error loading purgatory ret=-8
> 
> The purgatory code uses the 16-bit addition and subtraction relocation
> type, but not handled, resulting in kexec_file_load failure.
> So add handle to arch_kexec_apply_relocations_add().
> 
> Tested on RISC-V64 Qemu-virt, issue fixed.
> 
> Co-developed-by: Petr Tesarik <petr@tesarici.cz>
> Signed-off-by: Petr Tesarik <petr@tesarici.cz>

Let me confirm I have seen this, and it is correct.

Petr T

> Signed-off-by: Ying Sun <sunying@isrc.iscas.ac.cn>
> ---
>  arch/riscv/kernel/elf_kexec.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> index 11c0d2e0becf..3c37661801f9 100644
> --- a/arch/riscv/kernel/elf_kexec.c
> +++ b/arch/riscv/kernel/elf_kexec.c
> @@ -451,6 +451,12 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
>  			*(u32 *)loc = CLEAN_IMM(CJTYPE, *(u32 *)loc) |
>  				 ENCODE_CJTYPE_IMM(val - addr);
>  			break;
> +		case R_RISCV_ADD16:
> +			*(u16 *)loc += val;
> +			break;
> +		case R_RISCV_SUB16:
> +			*(u16 *)loc -= val;
> +			break;
>  		case R_RISCV_ADD32:
>  			*(u32 *)loc += val;
>  			break;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
