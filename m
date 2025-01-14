Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3561EC02183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 05:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8yr3nIahqFvL6XVUIyYAL/llDrRsFD8ZDJobETNbs0=; b=EA3JGCIc+o8RfB
	tji7zrtQ2i02H5S+RSGSj3343uE3gXCO88uJgsqjW6Sm5Z0d9QQkmHYZj8iR4DsCbCNsI5pnCdCQS
	MkpFGvTBCS0F6wZdKJCrybHVF4YhTiArM27c/UWpNvSnkAFFPiUmEzLelhK8FLYhFMQzBfgqZh2Ps
	rScCcGi2qSbQGnyRTEJEhWAFm6nbj648LNIWH1N1PosGRahWHMYzJl7y8Bw8GNXro9ex8S/P/dXKA
	YcWuzVQ1Vz0yLXVB4H3nnvgf5v0yAmNKMkkjS4VAjESNCqKcf720y2EbU6RFCyzBMyxH8/pcw0/UF
	yxeycdz3ZDliJwP1RNpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXZTX-00000007UYL-3ZVP;
	Tue, 14 Jan 2025 05:28:27 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXZTU-00000007UXi-3myQ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 05:28:26 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3a9cee9d741so36672045ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 21:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736832503; x=1737437303; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/hyRwhy9eFQaQwT5Y554E2+vSBUsIfx45e4KpeScOPg=;
        b=M1Xzj2Uuv1vo/OQ9VVCzavuOUagyq1ZWwgUaKTMF5Zqgyw9sj9Gh3AVfEBkGRTOl12
         7MQje/SwFB5o8Wwd2a0moEsn1d6IUmJP5GhKU8yfww2TY99s/+Z/wJvNqHHqUIHGVoBo
         Cm3qq3WvBJT96bYJ7JsZeMzzzhpGA3686FEFlSc+UaQDy7w4Qzfxq/iq8Gn3M91MWFml
         +Q6zsi1+DRm4UGHreuFG+uxFrxUR1xaQa4Mtlaryyc+qudu4fr5S/tJmSrfR4ZjvJf9C
         rpSG3CJzXyw/MPnQQQH9Z88sC/BAeUdnecZBawGs2oaSBxOUwHVCiVZTxyN6OgbVAHg7
         mBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736832503; x=1737437303;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/hyRwhy9eFQaQwT5Y554E2+vSBUsIfx45e4KpeScOPg=;
        b=TUjfUlemg+NWlQWjZ2Wagw75798GzgoEIY8PP0y/YLSBdk9ExkWk/2EMjE//zJffeF
         9q1uzfbzjuWxuDm97184stTras5JcRO8vkA5Eew4F4/va2YqD07s4A21qRM3eJdZKb7s
         egpjdY+Us2tZL59GImv5y+vgfqV3AEqKR/iCr/mrqU1oabDrWlrs5iSsIXNyDPTfIr31
         Y6mSxGaH6VP6hEhaFmsjF9ISqn4NuJt4gaoI9VCn5O9ioRZTwDL+Atp9Xnh4H7g79V1v
         YOIRL6EWPXgtYDFiZNoVwtPA+0tVYHoj/cfynsqRa4q/LQ8QJm+LZN1NP1HT/aUqnFJr
         3h8w==
X-Forwarded-Encrypted: i=1; AJvYcCVi7ZQvGHP6ckJBqReljazUVEGLePtS1Sms4uiHQSpYAu5k4wuFqyqTgqL8k62lthNT6ghusOQ/dqn64g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRvMYbKJhjPBFH9nhbWf7RR96T2ofjViOFlmbb2wPIoR8W4RLQ
	6+i5JqR2/te60LfPWpERF1lq0w1KzWqm8zB/OFKpBp5PrKSyxsH5xDahAiOagdU=
X-Gm-Gg: ASbGncuNkAQuXOIB4BZGwIz4uqfBPZcmAdsE9ExzgRZzhut6UJn+sjSTj4u1kJoV4we
	XF52LPmyB4Q0LNuKmeKlP4LjK63Pi4lq4H4C2bJNzxiUTp7NT7Ju+4x1zXnL5ujoVPkauW1wWDh
	WtSK3Ei8Wl6VnQeQyLCAJvVujSzyrcVN3AkV7trEgIH2dRTKWRLg5DJfK6V+oJ+vu857cI491MM
	hubBd6zEeUxn9TKDxiOHFayl9fxcQSW54ETHx7yQxF68iwmhTLhsjpRQFRhsneCYqUHbX7Ty3ua
	abQX
X-Google-Smtp-Source: AGHT+IFFGVHpfUG8VTfLaLNGH63wxU+Nwu7BqgDd/pRCCnZpwPE2D3wlvuT3cfxMO0fJl4clFa4nnQ==
X-Received: by 2002:a05:6e02:1a82:b0:3a7:d7dd:e70f with SMTP id e9e14a558f8ab-3ce3a88a4a1mr214560075ab.12.1736832503331;
        Mon, 13 Jan 2025 21:28:23 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ce4afc39d6sm31893185ab.69.2025.01.13.21.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 21:28:22 -0800 (PST)
Message-ID: <7c181d03-b0d0-4b81-bbd0-06943a58a287@sifive.com>
Date: Mon, 13 Jan 2025 23:28:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] RISC-V: hwprobe: Expose Zicbom extension and its
 block size
To: Yunhui Cui <cuiyunhui@bytedance.com>
References: <20250114021936.17234-1-cuiyunhui@bytedance.com>
 <20250114021936.17234-3-cuiyunhui@bytedance.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
Cc: ajones@ventanamicro.com, alexghiti@rivosinc.com, andybnac@gmail.com,
 aou@eecs.berkeley.edu, charlie@rivosinc.com, cleger@rivosinc.com,
 conor.dooley@microchip.com, conor@kernel.org, corbet@lwn.net,
 evan@rivosinc.com, jesse@rivosinc.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, shuah@kernel.org
In-Reply-To: <20250114021936.17234-3-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_212824_998723_F17E5FD0 
X-CRM114-Status: GOOD (  20.35  )
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

Hi Yunhui,

On 2025-01-13 8:19 PM, Yunhui Cui wrote:
> Expose Zicbom through hwprobe and also provide a key to extract its
> respective block size.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
>  4 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 955fbcd19ce9..0ea7754b2049 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -242,6 +242,9 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_EXT_SUPM`: The Supm extension is supported as
>         defined in version 1.0 of the RISC-V Pointer Masking extensions.
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
> +       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
>       :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
>       mistakenly classified as a bitmask rather than a value.
> @@ -281,6 +284,9 @@ The following keys are defined:
>  * :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF`: An enum value describing the
>       performance of misaligned vector accesses on the selected set of processors.
>  
> +* :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
> +  represents the size of the Zicbom block in bytes.
> +
>    * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN`: The performance of misaligned
>      vector accesses is unknown.

The new key needs to go further down, below this list of possible values for the
previous key.

Regards,
Samuel

>  
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 1ce1df6d0ff3..89379f9a2e6e 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>  
>  #include <uapi/asm/hwprobe.h>
>  
> -#define RISCV_HWPROBE_MAX_KEY 10
> +#define RISCV_HWPROBE_MAX_KEY 11
>  
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 3af142b99f77..b15c0bd83ef2 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -73,6 +73,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
>  #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
>  #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
> +#define		RISCV_HWPROBE_EXT_ZICBOM	(1ULL << 50)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> @@ -94,6 +95,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW		2
>  #define		RISCV_HWPROBE_MISALIGNED_VECTOR_FAST		3
>  #define		RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED	4
> +#define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	11
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
>  /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index cb93adfffc48..04150e62f998 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -106,6 +106,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		EXT_KEY(ZCA);
>  		EXT_KEY(ZCB);
>  		EXT_KEY(ZCMOP);
> +		EXT_KEY(ZICBOM);
>  		EXT_KEY(ZICBOZ);
>  		EXT_KEY(ZICOND);
>  		EXT_KEY(ZIHINTNTL);
> @@ -278,6 +279,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
>  			pair->value = riscv_cboz_block_size;
>  		break;
> +	case RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE:
> +		pair->value = 0;
> +		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOM))
> +			pair->value = riscv_cbom_block_size;
> +		break;
>  	case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
>  		pair->value = user_max_virt_addr();
>  		break;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
