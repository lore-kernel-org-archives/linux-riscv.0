Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF02C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 18:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZfVA75VVhDM96z//8RFWSAInPKHx4vKKreaLq7vXcA=; b=hQvb4nQuWXQyln
	6k0WZkdWjlgTEbyNOAgtuQXPw/sUJYZWurFLQ6vC90b9b1F/9OJBzBSw6r7uZ0BUH9m6rmEaehGFT
	JN+TX2OUs9zpgaad4xYhqiSeCBtf1BlLp6D4iruD96dmQSMISnynmdyvk3+5bwYMhVHQcE0hPJb28
	cJC1H3ebsBX+VujFbCDb10NWrfwei3yarOwzM/B83GBzEkLgvC/f1RLaW2dFy9Y+NqDNHdBet/zUA
	oZpCEAS+5ibuYPbFPVrMEwbkgEGi/mz65Wj5XeOGWtdD4nlC/hOZ/sAVF8af35pY2Dim6ej1VnCqi
	Ot1+H7GIShnyQFreGYIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2aYl-00000008EUv-3vrN;
	Wed, 09 Apr 2025 18:54:03 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2aYi-00000008EUB-3STf
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 18:54:02 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso27718f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 11:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744224839; x=1744829639; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OLxDcef/gKFj6jpgfhC8SbBxJlwQndkI5ymOb6usHAQ=;
        b=bdDMLu7Vb14zNFbzpARl9o9+rm/jj4cJs1Y3yDhuIq4w1b1fJEMidP788ZNzUqbmLv
         WDMR2Zq/MvyLiOea6kPz7fwiutPZmw1S5/5vUejzmoSYkox7ggD5VSscz/VbLxlf60V2
         M74JhSUyTj62GNgBg75NQz0y6oQf4xipqi9KW6wmpArYTAyWUYIgwbQQtmdwzWh7Id5X
         /uV0UI4Jr02oRz7/tWuVOIeW/SICMweEA2yB6S9lIwbfBxU11XjJh6/CW6eGV7tbPWBz
         9aNfizWZH5VA/CZtJy8CiyBxB0K0hqeiAP6tB1Mzyr46o4t4k7rsZUlR3ZGLO8ixSR+U
         8gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224839; x=1744829639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLxDcef/gKFj6jpgfhC8SbBxJlwQndkI5ymOb6usHAQ=;
        b=D25w1K/C5lkRimACo8jmHOB8Jr+oZB7G6WY3PfQwzSCrj5yjxz80Nb3/+1CQF3hhEx
         oSlb7SglkSItlwlLsDzSZ22xcGvad4vzrV275LD4LxDkaSCk9z00PhLrtbLr3/NWoC3A
         392bBARP7MRNlswIWSteED/vAKHUBB4jFZS/FKDnrdVHxqqfmPQimzlpvyFFCubLSm1h
         nj5f7aLG7wjd6J0iZUJmYQ6T87TJbUUd5HXxmYaWF07A66pF0sg94rmYUID3uhJLHj2Z
         4aJqJeCDdIupS3dt8ofn8AvJ0OJCzP8n/J3LbbSRnj8hpMcksEjfGmsUTMy1hNfn8+jw
         RYFg==
X-Forwarded-Encrypted: i=1; AJvYcCVvzXZa8mAgpqiFAWRTnVH84ZhdOy1xJaXfwLVDbezYSdUsM3YMd1ASbwipMD036IiiXdYh8UANjJK0HQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDF6Vd+C4ZVv/1PgOY6ck6lh34cQnsc1dWxGie0m+pSUB53cBx
	gIeIe0KK+0AfgUpTlpX7XFtFg3n+rwzoEtq69dQA7FYEeRpyYEcghVqTqUw2Rgs=
X-Gm-Gg: ASbGnctCNF9URLRlElanUL4OdSAzthXjDINnvaV7EFvNaL8ghL5VXvW9teCgCuq9v/v
	wnSw+dT8bcOsoPe8ZlEdzsyzkcrs9vsAWkUJFBKFbhqub//kPX027yrtd/bxUb+RhXGLc0/uAwL
	AuQjQ+nfknY3sNCilOe3G2UJI9dFz9J7jDiKLd7WVKGUX/5TFHEQzdt405j26DH8eK1Ws0fXvPN
	eSvqUZXq5PpXeyQ7DfA50m51GMwdsTCa8DvUj0QRFshiqAZ8kIquseTZQsPD7z1fQFsi6iKQGMH
	YIVpplhj4Xl1xxcTKx18j54c1H796pRaBho+WIVxIJ385jCDRgBatsokIT00gBbgs5qchw==
X-Google-Smtp-Source: AGHT+IFomURG1YZ6MaU3eQzhvE9DCFtZWTCQi1bNYeooIn598e5QS01eOCe8n8ZhHftKe9tnJoa+TQ==
X-Received: by 2002:a05:6000:2585:b0:390:f0ff:2c10 with SMTP id ffacd0b85a97d-39d8e32c615mr411689f8f.19.1744224839182;
        Wed, 09 Apr 2025 11:53:59 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5d31sm24520595e9.35.2025.04.09.11.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:53:58 -0700 (PDT)
Date: Wed, 9 Apr 2025 20:53:57 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
	Pritesh Patel <pritesh.patel@einfochips.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] riscv: module: Allocate PLT entries for
 R_RISCV_PLT32
Message-ID: <20250409-cf4fead4fda7b1b11bf4107d@orel>
References: <20250409171526.862481-1-samuel.holland@sifive.com>
 <20250409171526.862481-2-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409171526.862481-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_115400_864596_63E48099 
X-CRM114-Status: GOOD (  21.11  )
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

On Wed, Apr 09, 2025 at 10:14:50AM -0700, Samuel Holland wrote:
> apply_r_riscv_plt32_rela() may need to emit a PLT entry for the
> referenced symbol, so there must be space allocated in the PLT.
> 
> Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> Changes in v2:
>  - New patch for v2
> 
>  arch/riscv/kernel/module-sections.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
> index e264e59e596e..91d0b355ceef 100644
> --- a/arch/riscv/kernel/module-sections.c
> +++ b/arch/riscv/kernel/module-sections.c
> @@ -73,16 +73,17 @@ static bool duplicate_rela(const Elf_Rela *rela, int idx)
>  static void count_max_entries(Elf_Rela *relas, int num,
>  			      unsigned int *plts, unsigned int *gots)
>  {
> -	unsigned int type, i;
> -
> -	for (i = 0; i < num; i++) {
> -		type = ELF_RISCV_R_TYPE(relas[i].r_info);
> -		if (type == R_RISCV_CALL_PLT) {
> +	for (int i = 0; i < num; i++) {
> +		switch (ELF_R_TYPE(relas[i].r_info)) {

I see ELF_R_TYPE() is equivalent to ELF_RISCV_R_TYPE(). So OK.

> +		case R_RISCV_CALL_PLT:
> +		case R_RISCV_PLT32:
>  			if (!duplicate_rela(relas, i))
>  				(*plts)++;
> -		} else if (type == R_RISCV_GOT_HI20) {
> +			break;
> +		case R_RISCV_GOT_HI20:
>  			if (!duplicate_rela(relas, i))
>  				(*gots)++;
> +			break;
>  		}
>  	}
>  }
> -- 
> 2.47.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
