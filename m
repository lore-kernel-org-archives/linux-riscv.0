Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27873C3DA61
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 00:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2At2+bWF+mKnLa7lu+0pymw+JEDAnLTnw4pNMlcKSKs=; b=PQJ4JMQnCJzIFe
	BwOCw2qhZR0SfVhQC0ZZgSOcyr7Cqn3OpVJ+baVbOZgCUDbcA/IDzwVFzQ6cEToMiw8/WqcdRWq5T
	1nrxtskTzuyCJHAXONihLg8Ubh59zY1AruRKpbqsbObbgaToQHiRREV5tcWbdlsG6+ynwR0cMX01P
	ijYFhYo6fCAqtyZKTSMF5IukBA4B6cMcjyE08ZNZB5zz1E8/e7jNkDP3ZVpZ6cY7NBlnuu67+3JZd
	fSmaGjvZddRyLxP+vl5AEwXkf4jYcBL2ZrLQrdmH7VNE22HvcdQNdoUR0/IqJG9zrgFDtHD+Y1uTC
	jClyyNrr3uk80gnc195A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUbs8-000000018fS-0Sxu;
	Fri, 19 Jul 2024 00:53:20 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUbs3-000000018eb-3B3B
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 00:53:18 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-38abd30a1c9so5795925ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 17:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721350394; x=1721955194; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CNAPVnBxs50FSqQ39oQ/X0NdsaUWEkhbtljgwA0dK+M=;
        b=LtbJBo4SGKX2/ZRdqwsmpkRGQDC+stU/ctg8Gos2AKElhKnefnxyihOczeUi/LFdkb
         v0SVO9JnbgLZMKgiqQSSOKfdNdd1xIXXD3Isqt08wxF5M61wDyxiyDkLUoJGqPE8f0Dt
         w+iokrONZ2V/3qd2MqcnkTAisYHtO8QFvaE78wprEywNsB3kqGvPxeAWQdH3WQIhWTD0
         v/Z2HCbXrdfI1D9Zta1MIq9ZVEsIa9RP/x2SOAx4Euh9zmb1iwXpljM+4vIjh8Aj9Kdn
         v0DuswdLtAHsDhiUvnnGXw9SzqZFPbvddSyuFV2NI2eQcdKuG2mLcFI+MevodZefNAMF
         dtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721350394; x=1721955194;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNAPVnBxs50FSqQ39oQ/X0NdsaUWEkhbtljgwA0dK+M=;
        b=AKvvmsx3dTDysgLssePXSec2W6NMWp/g5o2NBxIMyrl8Gpsea0JuCRFy/MZAPl+034
         zqrWCjOPfKE/jHOkD7PpKRESmqXqi4dSgzwK1LpgpceWvqtcPbuWeBQwWxlwPOOnlkS7
         f1QsVhQbSSKsM/lxHkuKtBwvfhZGAgdvNEv9chXDj4nqHW4apH73sdxxGGEUTjWkVFip
         5G5si2AZFpOSP9UVgyBKMyegGBCyJ8BR9ZKh2TFdNqDDRkJ1TB1HqmXlDnefOjb7a1r0
         XAFwVrHnO1qVT3oZld2SgWWYU/e2GlRUu65x8FiK0CX0GSnQYxT7pxlcMrqC4vUxOqnG
         5pig==
X-Forwarded-Encrypted: i=1; AJvYcCVsk4REFsYqDP+tRK3J77nv5Ob+2hJ3Ewbg5qPvB971lVAH0VyFus2gT/K7PiZw5y/93j0L2u34OKw4gn920O/nAMdoCZxDVYAt2D0mCbVl
X-Gm-Message-State: AOJu0YwyrWge7xq9xe7epJu01lhGtua4YyY294w+kXr4nrv16OEEh9uS
	HPe3a02IkW6Zimk8uACh9JAJwh4KYTaogQ5zv4TsigcH41IIBdMefXByNjvh2LE=
X-Google-Smtp-Source: AGHT+IF5soNWoBfxIJAzPM7ulE2ztXx3R64HiLhLbDOWs9lCmTj3XqnA7S+bNE2jbslzIWMskkLVPA==
X-Received: by 2002:a05:6e02:b2d:b0:396:4314:2bcf with SMTP id e9e14a558f8ab-39643142de5mr67747935ab.19.1721350394158;
        Thu, 18 Jul 2024 17:53:14 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-397f60fc088sm897415ab.50.2024.07.18.17.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 17:53:13 -0700 (PDT)
Message-ID: <da5ba38a-8848-439e-b80a-3d6584111a78@sifive.com>
Date: Thu, 18 Jul 2024 19:53:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/11] riscv: Add ISA extension parsing for Ziccrse
To: Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-10-alexghiti@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrea Parri <parri.andrea@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
 Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org
In-Reply-To: <20240717061957.140712-10-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_175315_831792_C0B73E65 
X-CRM114-Status: GOOD (  14.83  )
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

Hi Alex,

On 2024-07-17 1:19 AM, Alexandre Ghiti wrote:
> Add support to parse the Ziccrse string in the riscv,isa string.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index f71ddd2ca163..863b9b7d4a4f 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -82,6 +82,7 @@
>  #define RISCV_ISA_EXT_ZACAS		73
>  #define RISCV_ISA_EXT_XANDESPMU		74
>  #define RISCV_ISA_EXT_ZABHA		75
> +#define RISCV_ISA_EXT_ZICCRSE		76
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c125d82c894b..93d8cc7e232c 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -306,6 +306,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>  	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
> +	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),

Please sort this entry per the comment at the beginning of the array.

Regards,
Samuel

>  };
>  
>  const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
