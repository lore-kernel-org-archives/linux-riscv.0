Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE06C7EE29
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 00:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=I81p/R/bX/axlgjTdT3Q7yXCeJbmGFN2cLbVrnkEsig=; b=EI31sRXUEW7zME9oiQFhX+SGZy
	yuZfW9kevABd0V87o4qpFHWpkHT7sFkLTY1DrdnYi6q9evy4w49HMAIfNXUBlXRLDMLmBg3w5igpU
	JoZesKr7ZfzwDnkPZvyIm2a8qYxhG8lGEG2abJEzWkPdsHWG2/G+PQ9+o2F3btpKbIGQgGqI/jViP
	NFDROiAeHJyjFAauHFaSZSfIv3o49NptZtq21fJLEhWUzazwDTfjfAUL1R6hjiwqD+fVQgr8skYJT
	YQWyMeD7Im88HX92t8TLypmblVk1ODVdNfxlTDAdxwe5ti9A/m5eLIi+N8gfd7inP4DPpGRTmxhXP
	tVv2An/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1cga-00BwcX-1y;
	Wed, 24 May 2023 00:49:04 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1cgX-00BwaS-1C
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 00:49:02 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d2f99c8c3so147808b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 May 2023 17:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1684889339; x=1687481339;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dp6b6qpXLo/rFQA8s6ahM6DqwTPLqjamQPaZIhADAjA=;
        b=URl8uA+bSGSybCrhjFclHgZOt6EC/1LxDU/Rk7ox81s+nh0+YhJOdKZ5ZbQL2aDInL
         5QJdQHlk6F43CcdF6+8CglkmZTVfZ0M+lSKRP6Nux4AUbkRa1UzaoTfagFbt+W2QN2NT
         OOnImte4yGViztPe4v/WB9cMHwGUaMdb1MfxqCroVVcwrWE8HVlxF0Gzx1Spa7HwqjOZ
         ddP45WQ2wKiSRVSSbX3FXAP9i/AUubXtI2PeP656MkqLbacnCAExyFz35GMWY8uJEVBi
         Hi8EGSIBcFX+cLoxC4oO1dhbEaIdKTdJQVqwpuYdMk9XdbMhAKbYwiZPmkDTNOaXIJnB
         UDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684889339; x=1687481339;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dp6b6qpXLo/rFQA8s6ahM6DqwTPLqjamQPaZIhADAjA=;
        b=C1K4a4S+ML/5iG8l4t+R4p3WHcgMbTU624ts4AfbC2uvTXbOLjeex3U82VZzAe3jvB
         AGoVkD04lyCXEflmD/h44PL/cC4tQbBI9QPmsZDhqpVevEGnY2qVC853qMAZlOUBflYn
         KptLE9+Lt/TZCu6fCMC7QPnj7XDHgctGv6+ct6/9wbnFrlaf3SSdb9RMJI4Jo5QegyvA
         xRvvWsRyTYdiDFVj9gBFHBzT4wAfIFghBb15zMQZnsDlxTqjNMOb9wkk4BlLSUhu90UZ
         M7TDaS6yCEbyzQOfB3c4x2s+0WQcyPUP7bB6t50qQVpQ9DiYLeeQs0se6P+Funo28Okv
         sC7w==
X-Gm-Message-State: AC+VfDzkbTN6mf7vTQCUP2ATj6ELOdsQucU2iZDhrrxh8PRG+eDY8nLk
	BXC7Q/cEl2Hjvae5PZkVvquoEMvgMHqNo7mZ364=
X-Google-Smtp-Source: ACHHUZ4lorfrMhpgOfVECnAIZqBlitQ4EC4P7SnjzcWdlV4otb5oENm9aUBrEzeFWzAAKtm03sRgKQ==
X-Received: by 2002:a05:6a00:14cb:b0:64c:ecf7:f492 with SMTP id w11-20020a056a0014cb00b0064cecf7f492mr1215212pfu.4.1684889339259;
        Tue, 23 May 2023 17:48:59 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u21-20020aa78395000000b0064f39c6474fsm1910643pfm.56.2023.05.23.17.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 17:48:58 -0700 (PDT)
Date: Tue, 23 May 2023 17:48:58 -0700 (PDT)
X-Google-Original-Date: Tue, 23 May 2023 17:26:06 PDT (-0700)
Subject: Re: [PATCH -next v20 03/26] riscv: hwprobe: Add support for probing V in RISCV_HWPROBE_KEY_IMA_EXT_0
In-Reply-To: <20230518161949.11203-4-andy.chiu@sifive.com>
CC: linux-riscv@lists.infradead.org, anup@brainfault.org, atishp@atishpatra.org,
  kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, Vineet Gupta <vineetg@rivosinc.com>,
  greentime.hu@sifive.com, guoren@linux.alibaba.com, andy.chiu@sifive.com, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, heiko.stuebner@vrull.eu,
  Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, ajones@ventanamicro.com, abrestic@rivosinc.com,
  coelacanthus@outlook.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-3514bc07-d24f-474b-994f-b2b03253e103@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_174901_410390_FC4A96A3 
X-CRM114-Status: GOOD (  20.31  )
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

On Thu, 18 May 2023 09:19:26 PDT (-0700), andy.chiu@sifive.com wrote:
> Probing kernel support for Vector extension is available now. This only
> add detection for V only. Extenions like Zvfh, Zk are not in this scope.
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v20:
>  - Fix a typo in document, and remove duplicated probes (Heiko)
>  - probe V extension in RISCV_HWPROBE_KEY_IMA_EXT_0 key only (Palmer,
>    Evan)
> ---
>  Documentation/riscv/hwprobe.rst       | 3 +++
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_riscv.c         | 4 ++++
>  3 files changed, 8 insertions(+)
>
> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
> index 9f0dd62dcb5d..7431d9d01c73 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -64,6 +64,9 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
>      by version 2.2 of the RISC-V ISA manual.
>
> +  * :c:macro:`RISCV_HWPROBE_IMA_V`: The V extension is supported, as defined by
> +    version 1.0 of the RISC-V Vector extension manual.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>    information about the selected set of processors.
>
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 8d745a4ad8a2..7c6fdcf7ced5 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -25,6 +25,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
>  #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
>  #define		RISCV_HWPROBE_IMA_C		(1 << 1)
> +#define		RISCV_HWPROBE_IMA_V		(1 << 2)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 5db29683ebee..88357a848797 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -10,6 +10,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/hwprobe.h>
>  #include <asm/sbi.h>
> +#include <asm/vector.h>
>  #include <asm/switch_to.h>
>  #include <asm/uaccess.h>
>  #include <asm/unistd.h>
> @@ -171,6 +172,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  		if (riscv_isa_extension_available(NULL, c))
>  			pair->value |= RISCV_HWPROBE_IMA_C;
>
> +		if (has_vector())
> +			pair->value |= RISCV_HWPROBE_IMA_V;
> +
>  		break;
>
>  	case RISCV_HWPROBE_KEY_CPUPERF_0:

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
