Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70450D6DDD8
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipGoBsnsPFh7iMN2eRjfaFSwXXrC7dOu3OvHAmkU2QY=; b=UGLkDm1NjwZ8PQ
	MNhZUNBTnGB+0p+Ov1FXvLMcWmAtJSKD4DjG4gnzjOqQ9yekaoKJ/Z3ox58o5rclTYywZIkyAERJu
	RRrmu5qtK1I4iTa6MwFJbUr3c13WX4RtlNpTHtX0nSDlK8g4U8/QG1i4vfmZIPORyUJPX1JI6WzMM
	9r1JFkAE3xXbcnPqIiolT9ocki5CWgfO8JfpMdxCBe1IRkZzc4WsVBTuYav3EqeQWXpVrxJ8uPi9q
	bTFp/scb3GM0kZmjzMKUvR3hFbZvW7KuxWwbNxvLxznnTVb8aq2YZz53t0l/Eif1dmQ59NcKDFzCW
	fWa71fOuCSGh4pd6mTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBw14-00000002kOY-1hbg;
	Fri, 15 Nov 2024 13:05:38 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBw11-00000002kNU-1PWG
	for linux-riscv@lists.infradead.org;
	Fri, 15 Nov 2024 13:05:36 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so5490075e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Nov 2024 05:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731675933; x=1732280733; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2iRJDtsWqL/piKJhgDPwUvSiSVRYQD6fYDgRKmvQlho=;
        b=mN2S7wTXzt352It5Ai4zTgo2rk+Ia5aRVh8Y/BpZbp1W7PcbjCWMoYsA+Fw8CRUv8I
         ZqWM99JeqqWyxNiqW4WGZ7EY0GbR9QZJ6HiNgaHGpE05z3BroneBt5kRKXKobzuHUDZO
         f/rIaHFG0prolRPA/t+f/FKwrq9Rz0IfCOB6qVJiOUNHS47Wv05gPzS9lLGlOPozZ8BH
         ic5FN+3YzV5rJdzLEQuT0/RQS4XlElZeNjYovCH8NEwE1T/LUiMdOcIyBklzt1KUZ+Ja
         jj7QW8IxOiIg/ahE58nJ7HDiTnWkviA3TYrLMMvGf86wAfsAvpUR1QZn3WcNFFwCAH38
         hgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731675933; x=1732280733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iRJDtsWqL/piKJhgDPwUvSiSVRYQD6fYDgRKmvQlho=;
        b=oUXMimgSFFkWZnSgUlnxCsDuwdw5cRf3yBYmczszetZBGdd58h4SrPMif9nenXayXA
         84il092jJU6/ZlhE3MBQVjJu077QZivY3YOJ63eXUX0CJCguSnTlUVDtZ12pqAm9B5zF
         cNqRnWtKv6kiGpwamB7z0hAufxQ98O0ZnISbNxzijMHi011rzNcAgwiOsxZSRpKNG4hl
         BzM9qVgVxec4LDN1gjhxynwy3thLg9dZRWZ2nro0CYuM7uT/8cwCIL8BZ8An5phyUHVC
         CiLq65jyE0HIZezfJG3IBIBTUJVRtzwWhQii6Pqv7Ok+3siK/Jw6eNuJsjpSzlivrBO8
         bACw==
X-Forwarded-Encrypted: i=1; AJvYcCWTF5rnP/Al4QS6Nvp+Z81trSmeAbZBd3Q9bk1bheMAjw361RDVuMvekcoI5+vSxBILyYcn5wf9+GrxFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWV/xb7asP79zL/jBYazgsxLf9L+QMku0apFuzcfnjf3loSurD
	hx/Y1bPsvUBxnl90EGNYR2vaTLd+GLzZuF0lAbqFqXmhlhvornX7aQNlsq0N7z8=
X-Google-Smtp-Source: AGHT+IFDp8PKpaQGVUAOAXQCxAUj6XSIILVhyKbCpLBYq5g/YknCPV3knkGIUqTxSWKWzG3K7rZY6Q==
X-Received: by 2002:a05:600c:46c8:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-432df790731mr21679875e9.31.1731675933284;
        Fri, 15 Nov 2024 05:05:33 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab80a28sm53496875e9.24.2024.11.15.05.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 05:05:32 -0800 (PST)
Date: Fri, 15 Nov 2024 14:05:32 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 08/11] riscv: alternative: Add an ALTERNATIVE_3 macro
Message-ID: <20241115-1c2467159f117132dc94db26@orel>
References: <20241102000843.1301099-1-samuel.holland@sifive.com>
 <20241102000843.1301099-9-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241102000843.1301099-9-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_050535_374114_AEC35373 
X-CRM114-Status: GOOD (  20.09  )
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

On Fri, Nov 01, 2024 at 05:08:02PM -0700, Samuel Holland wrote:
> ALT_FIXUP_PMA() is already using ALTERNATIVE_2(), but needs to be
> extended to handle a fourth case. Add ALTERNATIVE_3(), which extends
> ALTERNATIVE_2() with another block of new content.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/riscv/include/asm/alternative-macros.h | 45 ++++++++++++++++++---
>  1 file changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index 721ec275ce57..b6027a8b6b50 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -50,8 +50,17 @@
>  	ALT_NEW_CONTENT \vendor_id_2, \patch_id_2, \enable_2, "\new_c_2"
>  .endm
>  
> +.macro ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, patch_id_1, enable_1,	\
> +				new_c_2, vendor_id_2, patch_id_2, enable_2,	\
> +				new_c_3, vendor_id_3, patch_id_3, enable_3
> +	ALTERNATIVE_CFG_2 "\old_c", "\new_c_1", \vendor_id_1, \patch_id_1, \enable_1 \
> +				    "\new_c_2", \vendor_id_2, \patch_id_2, \enable_2 \

We don't want the '\' on the end of the above line.

> +	ALT_NEW_CONTENT \vendor_id_3, \patch_id_3, \enable_3, "\new_c_3"
> +.endm
> +
>  #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
>  #define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
> +#define __ALTERNATIVE_CFG_3(...)	ALTERNATIVE_CFG_3 __VA_ARGS__
>  
>  #else /* !__ASSEMBLY__ */
>  
> @@ -98,6 +107,13 @@
>  	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)	\
>  	ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
>  
> +#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1,	\
> +				   new_c_2, vendor_id_2, patch_id_2, enable_2,	\
> +				   new_c_3, vendor_id_3, patch_id_3, enable_3)	\
> +	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1,	\
> +				   new_c_2, vendor_id_2, patch_id_2, enable_2)	\
> +	ALT_NEW_CONTENT(vendor_id_3, patch_id_3, enable_3, new_c_3)
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, CONFIG_k)	\
> @@ -108,6 +124,13 @@
>  	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),	\
>  				   new_c_2, vendor_id_2, patch_id_2, IS_ENABLED(CONFIG_k_2))
>  
> +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, patch_id_1, CONFIG_k_1,		\
> +				  new_c_2, vendor_id_2, patch_id_2, CONFIG_k_2,		\
> +				  new_c_3, vendor_id_3, patch_id_3, CONFIG_k_3)		\
> +	__ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),	\
> +				   new_c_2, vendor_id_2, patch_id_2, IS_ENABLED(CONFIG_k_2),	\
> +				   new_c_3, vendor_id_3, patch_id_3, IS_ENABLED(CONFIG_k_3))
> +
>  #else /* CONFIG_RISCV_ALTERNATIVE */
>  #ifdef __ASSEMBLY__
>  
> @@ -121,6 +144,9 @@
>  #define _ALTERNATIVE_CFG_2(old_c, ...)	\
>  	ALTERNATIVE_CFG old_c
>  
> +#define _ALTERNATIVE_CFG_3(old_c, ...)	\
> +	ALTERNATIVE_CFG old_c
> +
>  #else /* !__ASSEMBLY__ */
>  
>  #define __ALTERNATIVE_CFG(old_c)	\
> @@ -132,6 +158,9 @@
>  #define _ALTERNATIVE_CFG_2(old_c, ...)	\
>  	__ALTERNATIVE_CFG(old_c)
>  
> +#define _ALTERNATIVE_CFG_3(old_c, ...)	\
> +	__ALTERNATIVE_CFG(old_c)
> +
>  #endif /* __ASSEMBLY__ */
>  #endif /* CONFIG_RISCV_ALTERNATIVE */
>  
> @@ -152,15 +181,21 @@
>  	_ALTERNATIVE_CFG(old_content, new_content, vendor_id, patch_id, CONFIG_k)
>  
>  /*
> - * A vendor wants to replace an old_content, but another vendor has used
> - * ALTERNATIVE() to patch its customized content at the same location. In
> - * this case, this vendor can create a new macro ALTERNATIVE_2() based
> - * on the following sample code and then replace ALTERNATIVE() with
> - * ALTERNATIVE_2() to append its customized content.
> + * Variant of ALTERNATIVE() that supports two sets of replacement content.
>   */
>  #define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,		\
>  				   new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2)		\
>  	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,	\
>  					new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2)
>  
> +/*
> + * Variant of ALTERNATIVE() that supports three sets of replacement content.
> + */
> +#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,		\
> +				   new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2,		\
> +				   new_content_3, vendor_id_3, patch_id_3, CONFIG_k_3)		\
> +	_ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,	\
> +					new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2,	\
> +					new_content_3, vendor_id_3, patch_id_3, CONFIG_k_3)
> +
>  #endif
> -- 
> 2.45.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
