Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF644C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 18:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GdXX4PDS0qfpM2j9Cmznal73qNg7pWmGxDyF24R8NPU=; b=GeRW672wO1w1eZ
	xQd9qgYF0QGUAqAH9bcF3QwL1vt/qRZJQCrujwh06m3PmwyTwsP/CHN7DwNR5bsLSGMZi+Pi30R0/
	cE4IcOEmsU+FfzTJt4YjGyFxabYx64nUL3iMMIWXyV1BhgNXk0vKqkwq/oG0YIegbo56IV30T6zaV
	uubzZNIkmh9AVSQFlseytbofIip/37QzPVvIUN8Fx8Z2aNhalVVNVwD/0eDs0l1uksK1rJQQQ4Z6F
	nBNYKKuBkIxUhBPT3VCphwijhYAuwEaau7Mg846idJBpUffpPazhsCkh1Zt83y0WdK+OhB2unrICA
	9BmZGLCwHPKnc3If7QfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scUgf-0000000CFuy-1bAQ;
	Fri, 09 Aug 2024 18:50:05 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scUgc-0000000CFuF-1a2y
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 18:50:04 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fc566ac769so21773245ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Aug 2024 11:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723229401; x=1723834201; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pTR80LART49AwfTCZhDaQ9X3675Tbg/ziI9l0jgP2i4=;
        b=wPVYfLHe8YTUxINvjutJLIMob5P6C9yG6+Gr14X9nSSfyaPB/TAzGYC4JOSlMjaCsS
         /9XMv0XmvUepKCTufcuFRlMwaiBPynYqWLyQBwgVnYK8TEMDOp2hFwFsrGXMoYGwdAyZ
         V47f4OZgIa5r/md/MFSUq3oCYHjcMjH/0zSq6BllDxBaDslzA+WREZISZwsnJ+psFcUI
         ZLSlItfljAMXDZYa6lOJDtXi0r0P64SCMnMm2YR89pET+29oS0PzxCq2e4DX9no/Jecd
         1p5cOoLfVbeBNXYLmAnEU3LJ6oIVEcFWZ7xrkHb++c46e+XOL/3bYvYbKMrYn+lhmQHH
         xPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723229401; x=1723834201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTR80LART49AwfTCZhDaQ9X3675Tbg/ziI9l0jgP2i4=;
        b=tBAK9XKQF34SgPeyVKGEr10tLNsMQzgWn0Nww5m/IxfzLYK2lUs0FjuJil2OMLRHfj
         Pvm4h7vbYUxeA3TsIDfSo7/2mmrXhRKzKG+EWj0Ml/l1Utf3v+S1T3QMepcZHm/sDnEy
         T5IfqlDy22sHHJiLRjK1rstZETZ72dHs7AG85tArE6q/jOiiulIpA5+GuR2l1qo/46F0
         kOxZ9fwYQpkDh0WqhtWcpilhv2P54HY6diJ/v1XFcqW2o5b0/GR57oKAqXbxJ+kntXf1
         elObMIoSzrvFjJkp6sWTcwE7IqIEOywOQBaGWDJW5pflA8rNbR8lHws8tqXJoDDjT5oK
         6mgw==
X-Gm-Message-State: AOJu0YxIEW+Rt9ul3efm9uLmcAprWUd4xL80KcdfmgXGJkjftnrEhIGb
	mHgN29Zi3srhQw1c7MURqGafRP6mP1n2AE/wSAMEXN/iPefgkNgMB2+HOwbb7M0=
X-Google-Smtp-Source: AGHT+IGn2lIs6m4F9PqnQxrCoDxM9ibXdCJFJLnZ4eHgEWlgh5F8ljLu/bemuIJyW9+rcge+TfIiJQ==
X-Received: by 2002:a17:902:f707:b0:1fd:70f7:220d with SMTP id d9443c01a7336-200ae59eef4mr25979215ad.40.1723229400814;
        Fri, 09 Aug 2024 11:50:00 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:c486:937c:35d4:b6a2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb8f8b08sm864425ad.64.2024.08.09.11.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 11:49:59 -0700 (PDT)
Date: Fri, 9 Aug 2024 11:49:56 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 1/2] RISC-V: Add Zicclsm to cpufeature and hwprobe
Message-ID: <ZrZk1EACQoo1+9jm@ghost>
References: <20240809162240.1842373-1-jesse@rivosinc.com>
 <20240809162240.1842373-2-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240809162240.1842373-2-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_115002_682267_8F15108A 
X-CRM114-Status: GOOD (  27.16  )
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

On Fri, Aug 09, 2024 at 12:22:39PM -0400, Jesse Taube wrote:
> > Zicclsm Misaligned loads and stores to main memory regions with both
> > the cacheability and coherence PMAs must be supported.
> > Note:
> > This introduces a new extension name for this feature.
> > This requires misaligned support for all regular load and store
> > instructions (including scalar and vector) but not AMOs or other
> > specialized forms of memory access. Even though mandated, misaligned
> > loads and stores might execute extremely slowly. Standard software
> > distributions should assume their existence only for correctness,
> > not for performance.

You left in the > characters.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> V1 -> V2:
>  - Add documentation for Zicclsm
>  - Move Zicclsm to correct location
> V2 -> V3:
>  - No changes
> V3 -> V4:
>  - Add definitions to hwprobe.rst
> V4 -> V5:
>  - No changes
> V5 -> V6:
>  - No changes
> V6 -> V7:
>  - No changes
> V7 -> V8:
>  - Rebase onto 2d1f51d8a4b0 (palmer/for-next)
>  - Change commit description
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 5 +++++
>  arch/riscv/include/asm/hwcap.h        | 1 +
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/cpufeature.c        | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  5 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 3db60a0911df..22c118df520b 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -239,6 +239,11 @@ The following keys are defined:
>         ratified in commit 98918c844281 ("Merge pull request #1217 from
>         riscv/zawrs") of riscv-isa-manual.
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`:  The Zicclsm extension is supported as
> +        defined in the RISC-V RVA Profiles Specification. Misaligned support for
> +        all regular load and store instructions (including scalar and vector) but
> +        not AMOs or other specialized forms of memory access.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>    information about the selected set of processors.
>  
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 5a0bd27fd11a..c93d957458f0 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -92,6 +92,7 @@
>  #define RISCV_ISA_EXT_ZCF		83
>  #define RISCV_ISA_EXT_ZCMOP		84
>  #define RISCV_ISA_EXT_ZAWRS		85
> +#define RISCV_ISA_EXT_ZICCLSM		86
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index b706c8e47b02..a9370968fc9f 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -72,6 +72,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
>  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
>  #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
> +#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 49)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 8f20607adb40..2f54d811a9b8 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -314,6 +314,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  					  riscv_ext_zicbom_validate),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts,
>  					  riscv_ext_zicboz_validate),
> +	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>  	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
>  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 8d1b5c35d2a7..01eea29a56cd 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -107,6 +107,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		EXT_KEY(ZCB);
>  		EXT_KEY(ZCMOP);
>  		EXT_KEY(ZICBOZ);
> +		EXT_KEY(ZICCLSM);
>  		EXT_KEY(ZICOND);
>  		EXT_KEY(ZIHINTNTL);
>  		EXT_KEY(ZIHINTPAUSE);
> -- 
> 2.45.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
