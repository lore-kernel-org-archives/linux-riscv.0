Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E21C001DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 08:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERtKUT6a7tdxQGkLc9QWx5P1GF0PvZWFGcoiH/Booy0=; b=Gas7A4U4cxKHj8M0wlqlAGmifi
	Hki0RcvRW05jKjgHL7+XBU5mnRacuHpmu6hFoIVTnh/9OPIqw89KCDljkfiewKsGTzFtRr0hcq7yY
	Sps4NfodpXAMGkl83q9dP+MoWavWPKr5WylgqxRyv/pBIjbCHTwB3DKaiUzsv9QWuzcsxtDhY0X1x
	WhKuj9x1uZiKlmLIkNnTXqXhZeel++MOE9zqa2U8MZ0VZB537lJd5AkYJfZm7ulL4Ely0XyOt84wI
	jAqI1dT5S2Kf1KQqMehbGyIVNe7FQz1HeyYv+i6oT4Bn3cfqBqGu8eyT2/b1OITiXfwPWEe2v9nzp
	3TzC/cPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCzI-006gSW-2T;
	Tue, 25 Jul 2023 08:01:44 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCzG-006gRZ-11
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 08:01:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B749E0008;
	Tue, 25 Jul 2023 08:01:34 +0000 (UTC)
Message-ID: <68b2b7d8-a826-cd4d-d083-1f1819eb5d76@ghiti.fr>
Date: Tue, 25 Jul 2023 10:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] riscv: remove redundant mv instructions
Content-Language: en-US
To: Nam Cao <namcaov@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230725053835.138910-1-namcaov@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230725053835.138910-1-namcaov@gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_010142_500138_301F387D 
X-CRM114-Status: GOOD (  12.61  )
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

Hi Nam,


On 25/07/2023 07:38, Nam Cao wrote:
> Some mv instructions were useful when first introduced to preserve a0 and
> a1 before function calls. However the code has changed and they are now
> redundant. Remove them.
>
> Signed-off-by: Nam Cao <namcaov@gmail.com>
> ---
>   arch/riscv/kernel/head.S | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 11c3b94c4534..3710ea5d160f 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -289,10 +289,6 @@ clear_bss:
>   	blt a3, a4, clear_bss
>   clear_bss_done:
>   #endif
> -	/* Save hart ID and DTB physical address */
> -	mv s0, a0
> -	mv s1, a1
> -
>   	la a2, boot_cpu_hartid
>   	XIP_FIXUP_OFFSET a2
>   	REG_S a0, (a2)
> @@ -306,7 +302,7 @@ clear_bss_done:
>   	la a0, __dtb_start
>   	XIP_FIXUP_OFFSET a0
>   #else
> -	mv a0, s1
> +	mv a0, a1
>   #endif /* CONFIG_BUILTIN_DTB */
>   	call setup_vm
>   #ifdef CONFIG_MMU


You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
