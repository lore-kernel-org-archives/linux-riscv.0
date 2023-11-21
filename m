Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77763C61D97
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 22:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZgRWojcsSk8OcNmn/96keAQY0hkKa/ctLKl8QR2ke1Q=; b=MMMa+a1Z85N0pP
	m8pCOqsVS/QGR+kjvlZ0W2xQ2X/kcGhs37AQJGEUlwaQT/F7TgUEFYZwk+J6OFL+uebPuwhAYdptT
	l6qdrH4VEWzAIPkXJCxYvpvb88merKvRh2IbeG+0eL/y2KgcLSm/HduA/PaNMpODbECWi9xhy4CrA
	yO1PgJoAq/OVOlZfkJ81QWJP05Cogtc5lX6wG23NyjPWfyLNjuIGC9IQ2RN8w1XeNQ6nBWU8ayCmG
	OyCZNEXzqIDBENxZ0hk8+gAcrbZVu5EjXUxu2gTGH56anvZZGRsAoovi9capjWwfL6qB65BBpbYlV
	I5W0C8PCMdItsToB34Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ZM6-000Bqg-2B;
	Tue, 21 Nov 2023 22:36:30 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ZM4-000BqM-1l
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 22:36:29 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7b34ddcc625so6685939f.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 14:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700606187; x=1701210987; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Czx5VSw2pBO1b75rdOa8rP1Tn4/X67nT2FHShLEAAdk=;
        b=ifB6XRbYJE66ck6S5RiSTRpWlQSyg9PhMezKmZGrnDqmuxoE9FdtHdkwxHvH4HmfYR
         H68WvDU/mIHF0sstbRhvho49rimkKcW5B6kdZttvuZJGs/3Alq/tg04H9drLEXav0+Cq
         Hsj+0/4D2WRHxKVJhvSLV7NCiEaloMSS6hE68zFYD18ALQLRG6uhNj+4RREKw3RKQrgb
         0kfXcMCU5eiCfQ0tY3Mi8HiHsH54rJ9LBIYzNi5BCdX13OWWf+5NUaIqI66di5bi4vtu
         bapslxHj7z9RPBwkmxpXXTkwz3yvY4w1P+NcfoRfgr7Z3SsJOCgAVn3ViLP1PkBObTS5
         8SvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700606187; x=1701210987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Czx5VSw2pBO1b75rdOa8rP1Tn4/X67nT2FHShLEAAdk=;
        b=bAsdO3tfs8HMEZuM3I5sekZ8FfjaQDpZ4Qf9t6zqPM3d2SpKhYwGEMLxWhJ/tm1StH
         WKJ1hUyRwWLzNmNxiwsVz2RKdNUT22ZRxltTQruodav0o7cYYi/56Ki3+5bJswxk+DGn
         Jj92vKgKN1W3Xz7J8HdVLqHOK2px05oub71vkz4OpDKJ0dB2btmvGitPQTIfwH3JKJ0j
         qTMrS1vHqZ8hSbCbHmLekGVvYYR0EgwsvnwsbhfqZWxMTwLbBJOBpTXYSOsuEOjv0uPB
         HsR/uo6Uit3lUKQDga2grKdXjFeOR8cMUbwFm2/Qzxex+mBfgQDAqwv5o4eR9TCDST6k
         jlLQ==
X-Gm-Message-State: AOJu0YxhBl1kvWUyKkMRn1w8u9imR9rNOxON+7saY3inP3OydZ0G5vnR
	2IUBSkbKl9yvagJhSOJTkmohexKw73hbM+qoIJQ=
X-Google-Smtp-Source: AGHT+IGfRVAH/8cvT9hmm4Ha5Eu0JN6NTmiZ2ExPb4m6TDcyvIXswopr0JkqwntNsAW38gNPKGfKow==
X-Received: by 2002:a92:cac2:0:b0:357:f72d:ad06 with SMTP id m2-20020a92cac2000000b00357f72dad06mr285038ilq.2.1700606186826;
        Tue, 21 Nov 2023 14:36:26 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:3d43:c8e2:1496:e620? ([2605:a601:adae:4500:3d43:c8e2:1496:e620])
        by smtp.gmail.com with ESMTPSA id 8-20020a056e020ca800b0034aa175c9c3sm3434455ilg.87.2023.11.21.14.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 14:36:26 -0800 (PST)
Message-ID: <70ff59ea-378c-4d53-899a-eafffcad22fd@sifive.com>
Date: Tue, 21 Nov 2023 16:36:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] RISC-V: Add stubs for
 sbi_console_putchar/getchar()
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-2-apatel@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231118033859.726692-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_143628_591466_C014176E 
X-CRM114-Status: GOOD (  14.59  )
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

Hi Anup,

On 2023-11-17 9:38 PM, Anup Patel wrote:
> The functions sbi_console_putchar() and sbi_console_getchar() are
> not defined when CONFIG_RISCV_SBI_V01 is disabled so let us add
> stub of these functions to avoid "#ifdef" on user side.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 0892f4421bc4..66f3933c14f6 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -271,8 +271,13 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg3, unsigned long arg4,
>  			unsigned long arg5);
>  
> +#ifdef CONFIG_RISCV_SBI_V01
>  void sbi_console_putchar(int ch);
>  int sbi_console_getchar(void);
> +#else
> +static inline void sbi_console_putchar(int ch) { }
> +static inline int sbi_console_getchar(void) { return -ENOENT; }

"The SBI call returns the byte on success, or -1 for failure."

So -ENOENT is not really an appropriate value to return here.

Regards,
Samuel

> +#endif
>  long sbi_get_mvendorid(void);
>  long sbi_get_marchid(void);
>  long sbi_get_mimpid(void);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
