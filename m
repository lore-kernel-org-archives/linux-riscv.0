Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700C5C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=C1C4Ad/vP+C0e7KuCvWVhkl1VT8T3DjFO9noV3GzkcY=; b=xBfyGrlv0WaC8gtBQoybGhhnNZ
	+pjYZMpDckNaBpASYko634wyvphcNtnjT9+kN9GoZ1RMAZ2NTYpkaK2nhIirkIKwQuBp6iCWXonQE
	PdoIdlPIe2k1U+FFHsQ+u4ggboF4fmXvqv6+zq2uXve5dDGS1IfevENTWCIxjmuOs4DSzgTGTNOJx
	EIFZc+dBrJfXjE41Wfvi90gEQmrf8b9zUfq8Xi41f2TX0dog16gGIFpuB5NHdbMHu4FxN4e9x7ozL
	V+5vRzH6S7l5pGkiNJaMFog3MsH2/LrUrlYJqHrWl7GMxfh/+UPXSm6BXctTTRrRKhxDLoGLMEUrO
	LpI9ms3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptUsO-00GAf0-1k;
	Mon, 01 May 2023 14:51:40 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptUsL-00GAeK-0e
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 14:51:38 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-64115eef620so27223634b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 07:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682952695; x=1685544695;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSCPrqXOc+jiMcJ1awitEwssb+M8Ttbck4A1Ax5no44=;
        b=t2bjDBj4KJiM6x2KXcZBuAruNSl7Xtw1iMpAVO54lX++zGDR+FQgxtGM/9hPxjn3eC
         mmtX40XvoY0WoQUx3WOsYw4qJDxzex0ccJotUaDWylKbh9CFBRwniakOG3AO3kXXVswM
         Le+IXNnfAs8OnFGl6v657EmjA631f2YJV7qB41bv9eyKxYSZFlC2T9CT9jREc2MFB60I
         d58CMyTtBTFfo4d58UwRRUR4LE28j5KjKcdaRW5rNzYR8MG4STym7b+23Q9Vo32sjgJa
         bOfOWYGPm8OiWKUBthHQ2zUqQ9J7vd06Mb4ke++cPb6A1dOtcx9lECVJTNNZ4dx2Sxrz
         92Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682952695; x=1685544695;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSCPrqXOc+jiMcJ1awitEwssb+M8Ttbck4A1Ax5no44=;
        b=Y1CiSyywSmzd2cpOMAz72DV4nEuLESGxWKWTNC6S4HVjubPSYeixrUQPTVHvegK7UU
         PR1C1z4RNJRksOFoOyvugrAjGKcl0UHfjvCNRwWrrPAMNvvtP5ABFB0xdLUtVF/K60VL
         DvM8PITFyxbSpV7uOIZV3c05iFnraA014GPR8NE3hK1BrzNTfS8FVrQxjWJZ7057qZfk
         33tzqVYMOTDiGnJxwiTlTQjKO+8x2hXKjP6Xdom5KrceclK8C5ilhu22VradPdrjqatv
         EFK7P8zF4MWO+3J72fYA1TkH9ohGTWKl3R9a5ILeCCZiD6ES/AxKdzykK89/NuE/ED2E
         hMjA==
X-Gm-Message-State: AC+VfDwnqxA6E8yRiR50dJNm0DiQA4AgOyX7CCvJuPtpLQb3E5C5KM/k
	F35pnpkAA8w7bsVonihFbQrTmiSNHQiyY0zxdEU=
X-Google-Smtp-Source: ACHHUZ5aEFOivTZdix1xXoRRVIMgqofu0C4xXvvL7s7jLIzvzf4ndKucq5upDgWfeN6qK/SLr+DrpQ==
X-Received: by 2002:a17:90a:f3d5:b0:24d:e504:67b1 with SMTP id ha21-20020a17090af3d500b0024de50467b1mr7946089pjb.7.1682952694904;
        Mon, 01 May 2023 07:51:34 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b13-20020a17090a8c8d00b0024deb445265sm2976704pjo.47.2023.05.01.07.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 07:51:34 -0700 (PDT)
Date: Mon, 01 May 2023 07:51:34 -0700 (PDT)
X-Google-Original-Date: Mon, 01 May 2023 07:51:13 PDT (-0700)
Subject: Re: [PATCH 2/4] RISC-V: don't parse dt isa string to get rv32/rv64
In-Reply-To: <20230424194911.264850-3-heiko.stuebner@vrull.eu>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  heiko@sntech.de, kito.cheng@sifive.com, jrtc27@jrtc27.com,
  Conor Dooley <conor.dooley@microchip.com>, matthias.bgg@gmail.com, heinrich.schuchardt@canonical.com,
  greentime.hu@sifive.com, nick.knight@sifive.com, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
  Richard Henderson <richard.henderson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
  heiko.stuebner@vrull.eu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-5ab61a7c-cccb-45d9-8c0f-5fbd8dc5931d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_075137_461804_0AAD4485 
X-CRM114-Status: GOOD (  23.24  )
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

On Mon, 24 Apr 2023 12:49:09 PDT (-0700), heiko@sntech.de wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
> When filling hwcap the kernel already expects the isa string to start with
> rv32 if CONFIG_32BIT and rv64 if CONFIG_64BIT.
>
> So when recreating the runtime isa-string we can also just go the other way
> to get the correct starting point for it.
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/kernel/cpu.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index ebc478f0a16c..06c2f587a176 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -244,7 +244,7 @@ static void strcat_isa_ext(char *isa_str)
>   */
>  static const char base_riscv_exts[13] = "imafdqcbkjpvh";
>
> -static char *riscv_create_isa_string(const char *isa)
> +static char *riscv_create_isa_string(void)
>  {
>  	int maxlen = 4;
>  	char *isa_str;
> @@ -261,7 +261,11 @@ static char *riscv_create_isa_string(const char *isa)
>  		return ERR_PTR(-ENOMEM);
>
>  	/* Print the rv[64/32] part */
> -	strncat(isa_str, isa, 4);
> +#if IS_ENABLED(CONFIG_32BIT)
> +	strncat(isa_str, "rv32", 4);
> +#elif IS_ENABLED(CONFIG_64BIT)
> +	strncat(isa_str, "rv64", 4);
> +#endif
>
>  	for (i = 0; i < sizeof(base_riscv_exts); i++) {
>  		if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
> @@ -280,7 +284,7 @@ static void print_isa(struct seq_file *f, const char *isa)
>
>  	seq_puts(f, "isa\t\t: ");
>
> -	isa_str = riscv_create_isa_string(isa);
> +	isa_str = riscv_create_isa_string();
>  	if (!IS_ERR(isa_str)) {
>  		seq_write(f, isa_str, strlen(isa_str));
>  		kfree(isa_str);

Conor pointed out this one, I just looked at the cover letter and got 
distracted by uABI stuff.  It's not directly fixing anything so I'm 
going to leave it out of this merge window, particularly given that it's 
tied up with the rest.

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
