Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC9FE7719E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 09:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OiEEnnUnDukPcsfsu9GFCtw4VtqbsjW0GDxxt6pRnI=; b=wkHfjvbY5EP9fr
	L6u+s6Jdo40dMlub/5S0xgH5fnOfXWHuF/hmAVw4MJYvAIfTih0WfgzJHOsTKHpnQ9Ivc/zX4FA+u
	zoFGm6qON6ApKP0trjvlwJg1SyY80vynL/TtLQQbsFD4PBMmkh+FseE19vXljnjkujoCJUFuyXz7r
	IySaIF0P3V4qvGqoLDhbKUcPU6JeHmyDXVXVtviCHpj17mSRi+ECTa7ppsOS51iGXRnm0QqZiCaSV
	qSELJt/9oilnE6UlOMUIh2deB+4QV45Uqqk0Cb7YEpikpfZZTalQnyyw1S/qZKhUap/MhxDdM8ZZQ
	GuJn5CcAnYb9RbH7oYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGZu-00000004ZQc-2raF;
	Mon, 13 Jan 2025 09:17:46 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGQ1-00000004XiR-28vQ
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 09:07:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4361f664af5so46207505e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 01:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736759252; x=1737364052; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LPr/Cux6nSmjbpyf8eRLWCzO219lB+r54/sYhftR878=;
        b=jchsTFbMXOAOsuhfbpvEa0j07lhKXxkafjXz9lRNyaVgajugR9SRxmbtKi7zdI26BS
         SIKB3oFMI+HDQsHnsRdgAxkmlIaQ7cR1F14u7VO5qXktb6fPyD8k+A6/e25MwNmjas48
         ESM7gz4fbNyS1kbkviYMQI1hc9tlYE+dwA26q07k8XhTqqsh5ormHzNEe6L/hSOvQ4p4
         3MeeWPLOOV8Wjyt1znW4PC+ZIzDSBIPCAc/e7/7qCkeUImd1H5sGxRQ2j0jzuXx7uQ+R
         23+Xg0hC4+i9qF5Spxqu5HXT9qotlyNofqpzuv33+k04KsFDO5rONenHEWeKHres/CtK
         9vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736759252; x=1737364052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPr/Cux6nSmjbpyf8eRLWCzO219lB+r54/sYhftR878=;
        b=JQ7MFLfQMnETi+iDk0ePApVhw/hBgEbWV2oaLZP4Z3g57QEYZx6x5jZ+m1B9ou/9Ea
         +fefpOtptODsHRbS1BSt74cKO7xuxHeJNli3lUxxMROPJkM9gI5g/ZKy/M9I1Km8Guno
         AAiIQFWOJuwvLR/6kaZvnH7xUsXxEWiXj59aOA2ctPpsQy43+QpvXfO0y1ROHyqX36gM
         k8YcJXi7LslRB+5qUUP3RdYA6gFVBajQgy7sqD5/3DWGcPgq+nhgmj2RDUHKZv2i/Gcf
         Yw+qxpvPUCILSD/C0AlBEMQbwg8lEjaNYdIII3C3we61NzkZ0fg2yigjxhzD2ouaZOIW
         qGHA==
X-Forwarded-Encrypted: i=1; AJvYcCXVGJLHq7qBO6D1rCyRt/W+J+mXxHj/UmesOx3rCRyYPtISRCx+A59wMqao7vfNmqKIfuZpYGCm0+wVsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEhxV1wBATrID+7al/+ObjQZGo0qSWrc6Aw4FASUmJAj2CfT3A
	jzqWuFcdo1AfbZgv85RwrKeEFqHq/2f78kQeVOq2Kk5sqir9971Mh0NJ6n6kP0E=
X-Gm-Gg: ASbGnctmrTrjNlyYPG9l0+IxtzGt+fl8YCc4sXKXl0yNje514BsaJIkG6FR5veBbb+m
	4ZpaMifi/tuL2vsFxbBG9YLNzzaZPnQIx0DBWI6I+XwhWWuIiRR7U11bgJN6cxV6pd8FFGMzWQU
	I+ltkZF4c6C64dJFW9Esf/0sfn8gksWZCX7snlOg3K5KGWP9JyHbioATU54HKiR4qA82EOAqvN7
	jNQur8AL2ykgJq0VftyDl/+lfTbbGov1Nr7VNwb0FXZGdzO2FZzJvZ+6xYBsm//XzoRN40CHTmx
	8V+37XwCJprKZhFecqDGHZRIvs0vbX3vp9JcKgpaZA==
X-Google-Smtp-Source: AGHT+IGWhnKG6PDAHyN3fg3+EZGqPP/Y3MyVqJx3DpMCFMMoPVW/b/U+uXO14R6PTUpJ6lUOkTGrIg==
X-Received: by 2002:a05:600c:5491:b0:434:fddf:5bfa with SMTP id 5b1f17b1804b1-436e268626emr168383345e9.2.1736759251595;
        Mon, 13 Jan 2025 01:07:31 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fb99sm138522765e9.3.2025.01.13.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:07:31 -0800 (PST)
Date: Mon, 13 Jan 2025 10:07:30 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	samuel.holland@sifive.com, shuah@kernel.org
Subject: Re: [PATCH v3 2/3] RISC-V: hwprobe: Expose Zicbom extension and its
 block size
Message-ID: <20250113-65f27ad723c0f6585f86ae7f@orel>
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
 <20250113083635.73826-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250113083635.73826-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_010733_551244_F4BFEA1C 
X-CRM114-Status: GOOD (  22.03  )
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

On Mon, Jan 13, 2025 at 04:36:34PM +0800, Yunhui Cui wrote:
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
> index 955fbcd19ce9..7a47cbdbcf8e 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -94,6 +94,9 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_EXT_ZICBOZ`: The Zicboz extension is supported, as
>         ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
> +       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
> +

This should come after RISCV_HWPROBE_EXT_SUPM since this document has the
defines sorted in the order in which they are introduced (although I
personally wouldn't mind if we ordered them alphabetically instead)

>    * :c:macro:`RISCV_HWPROBE_EXT_ZBC` The Zbc extension is supported, as defined
>         in version 1.0 of the Bit-Manipulation ISA extensions.
>  
> @@ -273,6 +276,9 @@ The following keys are defined:
>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicboz block in bytes.
>  
> +* :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
> +  represents the size of the Zicbom block in bytes.
> +

Should be moved below RISCV_HWPROBE_KEY_TIME_CSR_FREQ

>  * :c:macro:`RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS`: An unsigned long which
>    represent the highest userspace virtual address usable.
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
> index 3af142b99f77..892dd71a3793 100644
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
> @@ -90,6 +91,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_MISALIGNED_SCALAR_FAST		3
>  #define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED	4
>  #define RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF	10
> +#define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	11

Move below the bit defines of RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF
(notice how its bit defines are indented, indicating they belong to it)

>  #define		RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN		0
>  #define		RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW		2
>  #define		RISCV_HWPROBE_MISALIGNED_VECTOR_FAST		3
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index cb93adfffc48..affcc3e58df9 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -107,6 +107,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		EXT_KEY(ZCB);
>  		EXT_KEY(ZCMOP);
>  		EXT_KEY(ZICBOZ);
> +		EXT_KEY(ZICBOM);

This list is in alphabetical order, which means ZICBOM should come before
ZICBOZ.

>  		EXT_KEY(ZICOND);
>  		EXT_KEY(ZIHINTNTL);
>  		EXT_KEY(ZIHINTPAUSE);
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
> -- 
> 2.39.2
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
