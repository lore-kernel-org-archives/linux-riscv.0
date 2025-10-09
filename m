Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2597CCD183
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 17:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TSTHfBayF+06dFW8HRSGMxxIdqx9s/00rYBmGVN4vc=; b=n6rSC9ZyTDeyjs
	tvuXL7Lag1mkC9JxyK4Wx0118/gCyKXRI1yrRasx4atQPmKPpByu1L1YRKYp1jdE6oCCYw7uE+hid
	1w/9vhhsovnI59lKBdPLk5XwraZv2eKAxRHwv6atOCO2/4QBgscSozTsQ1Bx32tta/cZKSMzU3WDT
	Ns02U4R/373CbXVapJBJWpeTizD7CuNnP38M5ehL0pd7aB3xW65iEmZ126bWvnNXMHNGPpC7m19Fd
	M31IAImtT4djXvHdWPlMUsob4X6/avT5Df28V8mxjFB1JVU8m0CjyzPdMzXqCTQ3JM7BqYjwmjyul
	XzsGE73ZycMdMfR9BwXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6u8F-00000006mpx-0GM8;
	Thu, 09 Oct 2025 17:08:47 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6u8D-00000006mpb-0mfO
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 17:08:46 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-42d7ef9a402so8663315ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 10:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760029724; x=1760634524; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jmQS8Iz7W21RMhGArp3InWF9uo5uNulwnzG/3ZoVxUQ=;
        b=eJ7Hl6AYzgiubvuJRkLU68BHn+OJJnh1agPzqnqymK7RQjoIF+xF+JRFjLOOMCOTZT
         jd8FtoJq1Cgh7Q6nR2HDfH4YNIrKVqMdHKi3NzJ9TG/0cKPOhAcpFDS/d5CeqozY5vnF
         QQnkGeCjRLLZAsoHW2AI8kmwcw8ySWmU0GMpdr5QZ8/7GFKS0qmfBzlzAP40pMvO7iX2
         amUpfvferR9xfW770MzWoPpT2cxrJBcnulvlQ+kPDj0E36Unm2YHU8wcvgJTcZAU4qC7
         S96exGE2FGDV/PmJwSk2R1sPJFy9dhHmThC8CfqpLIgf3P4zrbkuTaeI1R6f+3EB/BX/
         fSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760029724; x=1760634524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmQS8Iz7W21RMhGArp3InWF9uo5uNulwnzG/3ZoVxUQ=;
        b=WbQ8n6i/PM1me2Tso4v59gueMAuk6z1BK9ekJsp4/mAQg7oqxjGlFJtsiz+CqSZkkx
         V6s2HTyPzpQREBnCvUxjkEpnB4/6yoL7g1kXtmZ0n2qIcnLHyeoxencDtmiiXzxTffYK
         8LQC0wHur27fmTzIfmlnNnVphTlVZcfVA15yGTC97iqJgGHWSqBaDhiDlHoa2zKIRCQf
         xvUGyZ6X9LjgBgNWY8iv17G0w+3KIDQlxLv7/RjD74dKQwXDOpgxrR1UApSGH/2BzAsR
         4XlM6S7BxqSSCRy/GRCQ8zcDRKJkXamxFuB50Wsj/DFVyqKZ/M96EU9xGCC05T2e0O04
         SJxQ==
X-Gm-Message-State: AOJu0Yy7yEwAl+Ih/doHSpOE44wieSXcgMnpkiV8BDCnoJAx/Gsh0q/I
	Y4EOghngNuuuI3K/BITTX8WOYTHgfI0UVjkco4YRoYrMQsZGieT/PXskkjorcxZ3wBo=
X-Gm-Gg: ASbGncuj4RYIeuf4f7VKGj/IbScbgcKq1+5Djjw4Snumjnn4qz5UT5lFWxSR9GOBg27
	TVz9YB5OTO3nItKA5uhVyDkbHGMGtpKIQhuZxHf2fA8mXq02NQwvK5K6x9Vljrmy5KR7r9e1HPm
	gDzY/HHim7QAwAh/c0bhyaqr+kSdWBWS3JrdNSLhonXYEhNP8VEvhrOR2rwd5CgGvyANPYA/Ozr
	I4X3BMry+nlSIhK7CZa8qJKwzSRa/TwOl6qsLWT4JPRZatJ9ke24FUTeBw5JQzIpK9+Q/Czn7qS
	E42O0ACjkE5P7lS/xWteQTgXriuXUVyUohFLFG9IAOYaki+ff5cMGbpsDQgQz+eO11zEQ0jFb6k
	SPu1MDAP1imTmfyaFUgNp0eKuTWmZ8VETbkxKUGB0nF3O0BI9
X-Google-Smtp-Source: AGHT+IE9RiX0BHPrkOFXb9sFvQpft+J/Jdlyf2+rREXxjwowAkoIYFM2VcvYkhOtjlgnBzw8lgQmzg==
X-Received: by 2002:a05:6e02:164f:b0:425:94f5:5e3 with SMTP id e9e14a558f8ab-42f87472b21mr80940885ab.10.1760029724047;
        Thu, 09 Oct 2025 10:08:44 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f90278721sm11974895ab.9.2025.10.09.10.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 10:08:43 -0700 (PDT)
Date: Thu, 9 Oct 2025 12:08:42 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	alexghiti@rivosinc.com, shuah@kernel.org, samuel.holland@sifive.com, evan@rivosinc.com, 
	cleger@rivosinc.com, zihongyao@outlook.com, zhangyin2018@iscas.ac.cn, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Charlie Jenkins <charlie@rivosinc.com>, Cyan Yang <cyan.yang@sifive.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
	Jesse Taube <jesse@rivosinc.com>, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v2 1/4] uapi: riscv: hwprobe: Add Zicbop extension bit
 and block-size key
Message-ID: <20251009-368359384e19820a18cea601@orel>
References: <20251009134318.23040-1-zihong.plct@isrc.iscas.ac.cn>
 <20251009134318.23040-2-zihong.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251009134318.23040-2-zihong.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_100845_247711_DAD016A9 
X-CRM114-Status: GOOD (  17.31  )
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

On Thu, Oct 09, 2025 at 09:41:51PM +0800, Yao Zihong wrote:
> Introduce RISCV_HWPROBE_EXT_ZICBOP to report presence of the Zicbop
> extension through hwprobe, and add RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE
> to expose the block size (in bytes) when Zicbop is supported.
> 
> Signed-off-by: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
> ---
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 948d2b34e94e..2f278c395af9 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>  
>  #include <uapi/asm/hwprobe.h>
>  
> -#define RISCV_HWPROBE_MAX_KEY 14
> +#define RISCV_HWPROBE_MAX_KEY 15
>  
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 5d30a4fae37a..9cc508be54c5 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -82,6 +82,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
>  #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
>  #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
> +#define		RISCV_HWPROBE_EXT_ZICBOP	(1ULL << 59)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> @@ -107,6 +108,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	12
>  #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0	13
>  #define RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0	14
> +#define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
>  /* Flags */
> -- 
> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
