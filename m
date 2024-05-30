Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F6FC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 08:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dRFAMvzeKR4PWRZN2QiHw8uwPpdNKEAQ4J6L1YQhCE=; b=izesCTxnx7IucC
	JXVxtr/OFBSSNGqxmcqqazuxup8a2IFDKhIj45aPhoFz3FBqslgNDJLA0xl2LTjjVixkrFYplrnWN
	PW6U6JOLZRDl3FC1KDQdYXVVG8ZZfOPej8ZYIJzdz+tZcz8iFenIPc9n0WpDNEac8G/mpXHYgI5mM
	rXWydbvAF4wgJ4cXjDqwP0mzvbpYztx08cStKYP9/68+mv7KafEDb7FXoQQpq/Srr3zchj7EWa/2F
	67qMaNUIY0LhRRe2yJZAXZdZq3bBo6OTnxg0z7maNAvUCauQdMRIs2mt3yGb4YUMVLuU3WcuFydtz
	3Xbg33UF/eKVWb8zrGkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCaoc-00000006a3V-0vF4;
	Thu, 30 May 2024 08:07:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCaoX-00000006a16-3zZN
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 08:07:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42108856c33so4152495e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 01:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717056427; x=1717661227; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=imJe00y9Y1CwcN7JN2PUg+7wMYdo2Jj6de/HwT6F9Uc=;
        b=RbgROkEDvpni0luN8zoPpsFFx9v5t13MmcBtf1V2uwzPkGXCmswMBRS8PdzDmFNTsH
         3kE6qxWShWr3n/PopS+nAkBpj+3Vu9bXdbBF2OVMWPBsnEUbZ94kVzNtN+S8d6E9X+IG
         CvQogOCxaQgvONNmF6wV2qH5ADw8GkvxIrkufk0Z6T4ijYSYrxAYjqEFz8G5QPiYjiTa
         hJz/3CYFS4ShU/jfsqoo3Ldy/Y+KcjmuY88ze2TeD3OlQ89yZI8efIa5ZBRe2JbdvfCQ
         bjHVNtm/qGBnPBKod3ogbLJCcHiQ15UiuO/blb5h5CHyadrDvALGtpFi2BjDFpCJ/2Ni
         t5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717056427; x=1717661227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imJe00y9Y1CwcN7JN2PUg+7wMYdo2Jj6de/HwT6F9Uc=;
        b=tcnUJvJteGVoJGwPFDr5mHTFJhnN2VJGsISrpn5CkGU7IDCeI0vIWz+IdQXfkwQ49h
         m+jzMpbLLBECXxiKizOQ3AxJ1Da5yxMpFoXl/9YYYCcMXME16Br27k4iEK1dJeNvFvAD
         7qCls5iICY8gHPrhALtXjkQvQIQmGHFP3sU26nW/zO0M4uEMKab3urWNHK2HsXupjSZO
         4SS8huwtVGboEg4ieSfJVBRte/wWNQ7bjHncmxDhW7LewUuz4mGVOnID8YYmnna/O/r5
         HW611v/A3gjluNF6vAzYd/bSN5MYurqLHz5a9DnCj4DRMsGUzsjEnrr9AJDpbFjrKsfK
         EfEA==
X-Forwarded-Encrypted: i=1; AJvYcCUk6rXTUeD8QvpMDzy49LVQ6YBE0DoNCw9YlW96Q4xVFJzHQKEyU9jHQb93xoHvN2vaA5uX46Gooaz4/K31DR9R5HlNOdbDGEUPyrozP+IG
X-Gm-Message-State: AOJu0YyYd4PFj3BLXII/7PBYkgDB7bdqcgmPk4rj5B83i+u4eTEL+Mb8
	h2y/VVzZNzJmBDWtYGHI3rbLSXT+gHlJJVUnNICqVu8q81xbe1WjFlk1le6LFHw=
X-Google-Smtp-Source: AGHT+IFz86hjWVwDP/dkomv8c6/5Rk3tvlfabY/M/AgBKzpkM/zbIEiVEW4Mio38VYNi7sJ39diFGA==
X-Received: by 2002:a05:600c:1c9b:b0:421:2985:559a with SMTP id 5b1f17b1804b1-4212985574cmr4252445e9.7.1717056426856;
        Thu, 30 May 2024 01:07:06 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42127059769sm17110705e9.5.2024.05.30.01.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 01:07:06 -0700 (PDT)
Date: Thu, 30 May 2024 10:07:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Costa Shulyupin <costa.shul@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: hwprobe: Add MISALIGNED_PERF key
Message-ID: <20240530-ae9f7725d4566a72e895f8fa@orel>
References: <20240529182649.2635123-1-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240529182649.2635123-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_010710_116367_1469085A 
X-CRM114-Status: GOOD (  31.82  )
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

On Wed, May 29, 2024 at 11:26:48AM GMT, Evan Green wrote:
> RISCV_HWPROBE_KEY_CPUPERF_0 was mistakenly flagged as a bitmask in
> hwprobe_key_is_bitmask(), when in reality it was an enum value. This
> causes problems when used in conjunction with RISCV_HWPROBE_WHICH_CPUS,
> since SLOW, FAST, and EMULATED have values whose bits overlap with
> each other. If the caller asked for the set of CPUs that was SLOW or
> EMULATED, the returned set would also include CPUs that were FAST.
> 
> Introduce a new hwprobe key, RISCV_HWPROBE_KEY_MISALIGNED_PERF, which
> returns the same values in response to a direct query (with no flags),
> but is properly handled as an enumerated value. As a result, SLOW,
> FAST, and EMULATED are all correctly treated as distinct values under
> the new key when queried with the WHICH_CPUS flag.
> 
> Leave the old key in place to avoid disturbing applications which may
> have already come to rely on the broken behavior.

I appreciate the paranoia, even if I think we could probably get away
with fixing CPUPERF_0.

> 
> Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
> Signed-off-by: Evan Green <evan@rivosinc.com>
> 
> ---
> 
> 
> Note: Yangyu also has a fix out for this issue at [1]. That fix is much
> tidier, but comes with the slight risk that some very broken userspace
> application may break now that FAST cpus are not included for the query
> of which cpus are SLOW or EMULATED. I wanted to get this fix out so that
> we have both as options, and can discuss. These fixes are mutually
> exclusive, don't take both.
> 
> [1] https://lore.kernel.org/linux-riscv/tencent_01F8E0050FB4B11CC170C3639E43F41A1709@qq.com/
> 
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 8 ++++++--
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  4 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 204cd4433af5..616ee372adaf 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -192,8 +192,12 @@ The following keys are defined:
>         supported as defined in the RISC-V ISA manual starting from commit
>         d8ab5c78c207 ("Zihintpause is ratified").
>  
> -* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
> -  information about the selected set of processors.
> +* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated. Returns similar values to
> +     :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`, but the key was mistakenly
> +     classified as a bitmask rather than a value.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`: An enum value describing the
> +  performance of misaligned scalar accesses on the selected set of processors.
>  
>    * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
>      accesses is unknown.
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 630507dff5ea..150a9877b0af 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>  
>  #include <uapi/asm/hwprobe.h>
>  
> -#define RISCV_HWPROBE_MAX_KEY 6
> +#define RISCV_HWPROBE_MAX_KEY 7
>  
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index dda76a05420b..bc34e33fef23 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -68,6 +68,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)

Can we also remove the unnecessary ( << 0) shifts for each of the
MISALIGNED_* values? The shifts imply bits of a bitmask (to me).

>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
> +#define RISCV_HWPROBE_KEY_MISALIGNED_PERF	7
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
>  /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 969ef3d59dbe..c8b7d57eb55e 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -208,6 +208,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  		break;
>  
>  	case RISCV_HWPROBE_KEY_CPUPERF_0:
> +	case RISCV_HWPROBE_KEY_MISALIGNED_PERF:
>  		pair->value = hwprobe_misaligned(cpus);
>  		break;
>  
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
