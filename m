Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5ADC87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 06:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0Ui2akRqRlozLq7fHxXwf0LoHn/WSpZMVjfRb2HCgI=; b=J8O3ATXiA5YyIi
	RE1u4Gno6k4GNE0u7T/c876cSHLaBa4JQ9A03rnoHu4R4IkmeCRDdHSe0TRY0H86v3h8u0j2FBjIE
	9JHnkPUO8k/FihiFXa3kkztfX/COdnV4rGVk3qdeHU7Bmss2yIdtPnPvMKupjrSjFCVIuyrkYQwoF
	E2oyD08GbFJhTVB9Kl8W3SkdUNB6NejngzZkVuoS6G0DMT4dmBuT04J28rIFtDt9SkfrX1H8nwCP0
	yavWlL6VC1cgGlPnSn2qvO7ohy9YSxTpiX/uPlvNm8Re3KHErlKQ0Mk2ywcaJm9e9GEyE9wzyHt3o
	quvTjQCHnmxpHg7qPEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBgb-000000098Sm-0cFN;
	Fri, 25 Jul 2025 06:13:41 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBgX-000000098SO-2KN5
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 06:13:39 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 87E303F45D
	for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 06:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753424013;
	bh=TzyPAUEa1ra9f+Fo595oVFYE4lltInSXTAdJNreFcWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=udnJZhBpxpDYrlvsjoKrIlUlnlOSrYLmKnyfTuRYEjeGcdE8l8H+LsRPXEj8czvm/
	 170y6V27Umlvfy+2O2fnOGGXW+AIYVlR3xVR7I5+yu8xVceauTgXOCaHEVZvEyXH2R
	 RX00dXdxYHqrz4bLOa/yLEWgI2jnJX0zi37mWU2F1vHmBIB5VEeCLERFWIaAYujofy
	 Kom+bdiGREwvMXBbgYQk7e5LbWc2x0xeyjNM9hFu/Wb5ae5FN/lZM8amAPRZ5CgFwf
	 5S1GiI3e00RO/rtKj+H/4EmkfDyLkuaLhnwhq8BAZ1pP16BA8rzNbHMqxLA/zDV4HO
	 XkFX8W3sD246w==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4563f15f226so4626795e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 23:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753424013; x=1754028813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TzyPAUEa1ra9f+Fo595oVFYE4lltInSXTAdJNreFcWM=;
        b=bSRPgksJ25rBil+/6W0a3OrYkOw+V8RbkJ8neHy2QV0giaQiCJIv3AGulbbVqkutVG
         NrzYiTs00blFtFyTplJh7LVa3+LiAZ4XTT2Le8rECGt04yEw1MRu2STdcJaT3UrjmTwQ
         +4cWhSO8BJT4po2XzU+8tzvsyhDIZBdvIu/qLnF4WeFpiD7euq4+taI2XDTqhIL3zLX9
         A5lb6p58HvID/iJH2fk1ZjzXL6Bm4f0itmoekQlJyx/xcakJzeBb2cGwyatC0gR1z5an
         TW4lobwHl2f+O+KtAGpvYEnWsQwZS9ItCbsU1ceDQTHfZR2qkYj12XxopH9342zdIRQl
         ODrg==
X-Gm-Message-State: AOJu0Yxb1dhpMExawnRaQ9Hcu8pYxd0KxbAcgH7Ae2k8Sj3LW/DjyBHW
	j9ISO/68InRZxW+3rv2JIWGOi186t3QgE3nszk9/nOx2loZqulNX5XmJFRqAcGX7+kc1Hcl7VQR
	/USOjZQ3lbsnf3aDxHACGuPEvjIUpH5WKLGUDmjJBHezoylWtzhkK/nJaWBHh6qPrWoNvbosUqt
	vpSt4Bv3O0tA==
X-Gm-Gg: ASbGnctrIl184ccvVSAkEvTiBNslaOSJ5GGDzO4QtfOg7HXrimxcFLOa1vjUUpE7A8i
	tTNRT3WPyVu3wE/CzB4Jb7adFTzYbDUqfk83rgazfdC3tO3k4JuaFEhc1Pql3Bnq7DWgNvpF3X6
	idv4nyfXes8vqKZ+Pzsol913gvvlXehTAtMAcAYoEv11AgwcOTh1EkfSdXdXHrRqp7C4i5K5psw
	u7ZIVC/54VDr0xuMJfSM8U1SHTge0nqPEIK83mnpCeAF75rNjkI5wKGptiM6xUP4+E3FhY6unuk
	0tA+fbSsOfxG8sxpmYl9nWmZncfhMXxKqMiq4MJM76uv1IveaKcPfmlCXAcWyJ60hF7TMjIpaC/
	5MHhNlgfQLKMTznAhEnwhkJpa2eD4JMHPVQZA
X-Received: by 2002:a05:600c:861a:b0:456:1bae:5470 with SMTP id 5b1f17b1804b1-45876b12ab6mr2569975e9.8.1753424013108;
        Thu, 24 Jul 2025 23:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnuDATio1q8lhm2BzVtYuo6oTtxWHR46flKXtmOHWUTwYg4EBDhbjT8wj0HyskkwGEINn1ow==
X-Received: by 2002:a05:600c:861a:b0:456:1bae:5470 with SMTP id 5b1f17b1804b1-45876b12ab6mr2569725e9.8.1753424012699;
        Thu, 24 Jul 2025 23:13:32 -0700 (PDT)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705bcb61sm41269355e9.20.2025.07.24.23.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 23:13:31 -0700 (PDT)
Message-ID: <2ba0c09d-2783-4dce-a889-06e16abbde61@canonical.com>
Date: Fri, 25 Jul 2025 08:13:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] riscv: add landing pad for asm routines.
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com,
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com,
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com,
 andrew@sifive.com, ved@rivosinc.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_231337_982345_00EE180C 
X-CRM114-Status: GOOD (  16.38  )
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

On 25.07.25 01:36, Deepak Gupta wrote:
> SYM_* macros are used to define assembly routines. In this patch series,
> re-define those macros in risc-v arch specific include file to include
> a landing pad instruction at the beginning. This is done only when the
> compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).
> 
> TODO: Update `lpad 0` with `lpad %lpad_hash(name)` after toolchain
> support.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>   arch/riscv/include/asm/linkage.h | 42 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/linkage.h b/arch/riscv/include/asm/linkage.h
> index 9e88ba23cd2b..162774b81158 100644
> --- a/arch/riscv/include/asm/linkage.h
> +++ b/arch/riscv/include/asm/linkage.h
> @@ -6,7 +6,49 @@
>   #ifndef _ASM_RISCV_LINKAGE_H
>   #define _ASM_RISCV_LINKAGE_H
>   
> +#ifdef __ASSEMBLY__
> +#include <asm/assembler.h>
> +#endif
> +
>   #define __ALIGN		.balign 4
>   #define __ALIGN_STR	".balign 4"
>   
> +#ifdef __riscv_zicfilp
> +/*
> + * A landing pad instruction is needed at start of asm routines
> + * re-define macros for asm routines to have a landing pad at
> + * the beginning of function. Currently use label value of 0x1.

Your code below uses label value 0 which disables tag checking. As long 
as we don't have tool support for calculating function hashes that is an 
appropriate approach.

%s/Currently use label value of 0x1./Label value 0x0 disables tag checking./

Best regards

Heinrich

> + * Eventually, label should be calculated as a hash over function
> + * signature.
> + */
> +#define SYM_FUNC_START(name)				\
> +	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
> +	lpad 0;
> +
> +#define SYM_FUNC_START_NOALIGN(name)			\
> +	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)	\
> +	lpad 0;
> +
> +#define SYM_FUNC_START_LOCAL(name)			\
> +	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN)	\
> +	lpad 0;
> +
> +#define SYM_FUNC_START_LOCAL_NOALIGN(name)		\
> +	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)	\
> +	lpad 0;
> +
> +#define SYM_FUNC_START_WEAK(name)			\
> +	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN)	\
> +	lpad 0;
> +
> +#define SYM_FUNC_START_WEAK_NOALIGN(name)		\
> +	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)		\
> +	lpad 0;
> +
> +#define SYM_TYPED_FUNC_START(name)				\
> +	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
> +	lpad 0;
> +
> +#endif
> +
>   #endif /* _ASM_RISCV_LINKAGE_H */
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
