Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC73C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeUN2eRX3/+5YVpztPbVSFPt+bI/3MnsV/4PBUFb7b8=; b=JxK22cZ5eL+bhF
	LphUfPloWtiIc2I1uVy/eeazuIPPw2TIb0i2Wf0fMxaG+1jg8BhfH/7/l6STzFnyvryCee+qt6ZjG
	iQNkyUNZuOarvs49u8LVQIW6nuWHmURKzQ08GbOsCWsQGUsLRI8Yz1rk/imGxr47iSA8e/qMyR3Zu
	iJrPWZV2Ly7KrTavqGa+qv8wQx0pI2c5Q8Jc55G5Mecli1otJ7nmJNkxJoq4tZn3jy3vPzlowhjX2
	/TtDvNSv4uGb9vcleVnBvwyc/WuZeJjsCqd/5zHaMgPGXJFrrG8XTSvOnL70PGcbqlZjE3nyn4cFT
	vmD/xMHaVg0PsK+zerKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKlku-0000000AcGL-0AIB;
	Fri, 21 Jun 2024 21:25:12 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKlkp-0000000AcFh-0WAk
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 21:25:09 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1f44b45d6abso20012045ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719005105; x=1719609905; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OAWqcpZjfMBBVTGOxE0cKfoKLh5aEjtUNj7HbAVkgME=;
        b=Aax4JBNlfC78n7/789ReKSVnGA1mtaYu3hdGHTWTInBUXzOsLYnp0jCSXB3+Coimsv
         DKCPgpGOvVSCQdujhFDOLHtuj97r6KbfaaeylecbSnwoQvyNzuqwnTCH0YWRX1VdGQf4
         701weQuzQG8RPrsyKOHZZ+LcYx7wUQk4PHJsj14dC+q9YtDrhVtYtZtRSXZ47DjOI6Nf
         WZBxUUFmrHyhKCeMyiwelzi+tov1HAGS419+R9n8kDJLowDvQ2vMaMotFBYHFYyOJZGA
         xC6+LHDZoS5lKF7gwkSzRoNTktN+wG2nEmGdJAZPQd7vl2ACU9cddVPq26yTXS043xFr
         AggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719005105; x=1719609905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OAWqcpZjfMBBVTGOxE0cKfoKLh5aEjtUNj7HbAVkgME=;
        b=APVZehCO0JTTAswQOCOtMXphGqeUVym9LyJ805fs4iEFh4DefYHUKVYJDL5G1gySZJ
         qaGZ+7tGmzsq1t3QycnfHL2clWfH9ioDaPXDwT5gIUlm5Aeb2KZoGyKoDqQsjGsgtLit
         b0Vn8k41lGmBB1A+WfEgqlpv+5DIZ3Q4z8+ZFldspHw66ISpOn6rPgjl7vRZqV+RUq95
         2KzwTMpImB//YxbmCKUmRPSXf0mgko9W/2LfHBkr+I1MiP0ZLDsM88yrOcadU3ixcVR5
         JdyFWUJCYWb9vqBTV5FvXxvOhj0e0o+WWGT7V+8I5jYe7T0y1AQ++CIwph2tt+zfkh7g
         bx3w==
X-Forwarded-Encrypted: i=1; AJvYcCV8AlqLBFQOibCRPw/2pHu9CKzxvYYGHDLdik7HZYzZ5oU6RP4jzu28LCFlDnVnn+qidzp1yI1nUngl3WbW9fZM0b7EkUak9yWI2ECFVDQx
X-Gm-Message-State: AOJu0YxCzYP1QyI/xWAZHOGpMA/FR4btURoUkxnX3RbbMmDMGLVR9VY3
	erY2Jcj4WZnnzrXIP2mDkeI9FwUZdz8Bmf9uGnBrlT9SP6dSa438jS3DQAG986g=
X-Google-Smtp-Source: AGHT+IH9Bs+ipsTsXt16f5uX8i2k/D5I8yP/X5dwYRWVxkQ1SJHtSfQOrN/UNKQAa1hTtdxOZgQiyg==
X-Received: by 2002:a17:902:ce85:b0:1f9:f1e1:da93 with SMTP id d9443c01a7336-1f9f1e1e25bmr33558015ad.4.1719005104784;
        Fri, 21 Jun 2024 14:25:04 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb2f03c8sm18709365ad.16.2024.06.21.14.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 14:25:04 -0700 (PDT)
Message-ID: <94e8a430-7a2c-49a7-b1d3-74e7e924c2a3@rivosinc.com>
Date: Fri, 21 Jun 2024 17:24:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: Provide the frequency of time CSR via hwprobe
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Yunhui Cui
 <cuiyunhui@bytedance.com>, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, cleger@rivosinc.com,
 evan@rivosinc.com, conor.dooley@microchip.com, costa.shul@redhat.com,
 andy.chiu@sifive.com, samitolvanen@google.com, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240621113143.35827-1-cuiyunhui@bytedance.com>
Content-Language: en-US
From: Jesse Taube <jesse@rivosinc.com>
In-Reply-To: <20240621113143.35827-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_142507_420371_5699C2DD 
X-CRM114-Status: GOOD (  18.21  )
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



On 6/21/24 07:31, Yunhui Cui wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> A handful of user-visible behavior is based on the frequency of the
> time CSR.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   Documentation/arch/riscv/hwprobe.rst  | 2 ++
>   arch/riscv/include/asm/hwprobe.h      | 2 +-
>   arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>   arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
>   4 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index fc015b452ebf..c07f159d8906 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -229,3 +229,5 @@ The following keys are defined:
>   
>   * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>     represents the size of the Zicboz block in bytes.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `mtime`.
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 630507dff5ea..150a9877b0af 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>   
>   #include <uapi/asm/hwprobe.h>
>   
> -#define RISCV_HWPROBE_MAX_KEY 6
> +#define RISCV_HWPROBE_MAX_KEY 7

Please rebase onto palmers branch as MAX_KEY is already 7.

https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=for-next

Thanks,
Jesse Taube

>   
>   static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>   {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 7b95fadbea2a..18754341ff14 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -73,6 +73,7 @@ struct riscv_hwprobe {
>   #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
>   #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
>   #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
> +#define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	7
>   /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>   
>   /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 83fcc939df67..fc3b40fb9def 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -8,6 +8,7 @@
>   #include <asm/cacheflush.h>
>   #include <asm/cpufeature.h>
>   #include <asm/hwprobe.h>
> +#include <asm/delay.h>
>   #include <asm/sbi.h>
>   #include <asm/switch_to.h>
>   #include <asm/uaccess.h>
> @@ -226,6 +227,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>   			pair->value = riscv_cboz_block_size;
>   		break;
>   
> +	case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
> +		pair->value = riscv_timebase;
> +		break;
> +
>   	/*
>   	 * For forward compatibility, unknown keys don't fail the whole
>   	 * call, but get their element key set to -1 and value set to 0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
