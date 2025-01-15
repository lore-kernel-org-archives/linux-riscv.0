Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706F6C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 19:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIk6Tm/3A4/3hGf7DKkbGUgMVBKgCjrzXNBd80HxZr8=; b=WerbXEPBg2rjSH
	XZyWoDpG7n1JjzwxJqQuezgD7ByS8dwg0Bfxil6si6dBcN2wrO5N/l1vT9dO8tlb9KgdUE3D9n6bz
	cSdIOtlRmAxcmmP+9W6pStFHfELYrcfvykoeuBqQyF15ACZvSFHNUmyL2YPbtTpDCFUBBO+ZSJLAV
	apm8V5QrDtx3sIoMoOf5i1LlYvrmsBwOAbkmj2oMAPsmCKz2J5wksoscIJ4F56JheNUwY8GizQ/kE
	vBm+38hvsAgENcsiqYykj4BdK++xebbI2bnXJ+n9eh3XItUBpY8RA2Z+UFiQXNzlp9lXN2luxEkHX
	aMLDo/xEYsBHERy2KMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8wH-0000000CtDk-3u7M;
	Wed, 15 Jan 2025 19:20:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8wF-0000000CtCk-24md
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 19:20:29 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21649a7bcdcso602165ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 11:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736968827; x=1737573627; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1PfuB3vRfPVBICpHqZhZTqmTegPN7rFSn8G0geS43CU=;
        b=j1Vp6AAsMZL5IzVn4Vf9hQ/HJuwo4mg0SBazHZg03WQ1CFGeh+zB5Nt4g4EB86wStg
         FaDTsXY/q1vmkBnhu08B1T6tcIuTbV7G3KO8JaUMGf5+OjEqwzAS2N7ns7qOXC2Q54Ne
         eBlgVFHUV/EBHiOqK/FWmj/4ACzM7VGupfyju97p5IIMnaNgKfDvSmrorzXFeUxakCtn
         DgeBH6Jx1uvGYhGX1wWSqGWBqgrnsU5ayjgREzcRzbit9mRy4WDfUOWj/SlotsI1DFZ4
         /1NudDzxTioEPTioKkGOf8tF7VXqczplXKBBoiHbOv00DwOJogPGBy/RYDb+lc2V8Cgc
         OF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736968827; x=1737573627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PfuB3vRfPVBICpHqZhZTqmTegPN7rFSn8G0geS43CU=;
        b=dO+1SMSwoH9NjroyIWmBqzGDGDiTmKwQMp3SKVDEfZ30tpYadAX8jU3pa90vzxmuaT
         CzHQaNYl8Amnc6vyxPaSCz8fHlZYO+/jig4RR9qo2uHY1/tAecaolcTlc3HO1SVbo4v6
         YxZmJURaUCUeBnb2GjHRSNdpan8Kv1GPug330jZxPKLJf2Q3urquLAAamyH0MuVJEWgn
         ZthuKtxWZA4wmJWi5q90oVIjcjQI7Yjivaj19PWOSDCqRw8xsYPXCzuAwqfue1UA4eCm
         JcXuGLAus8oCdgcapbYUg0GZe8DL5G9wVvEvhCpT2TzaHp8o3qhm4u77yT7EmNzqmKCS
         GCHQ==
X-Gm-Message-State: AOJu0YzaEpfWW9i/gP+3YLEhNTHQiKbJD9RBkstYonTHGYgM2BUTf5GK
	J3o/CB0r80jgjIHYwJNo0AWsVj+6eRVvo5CHoMdf+DIlzC1zMwXETxvcIVXFQti2l3Sm45XjspQ
	K
X-Gm-Gg: ASbGncuxsVzBs1DbKjTNtgg+N6g8inVzOe+8PI8BJIYLQAd9m6Bx2PGulRFthnlxL2r
	/zcLijgpaURrH+YMgqWFbz4egsDJZY2lmeZ5s/8qUCI6c6D61h80MW7LrkSFBih5muZ8lQHJ5cC
	RrU3GlgDt9oHj2Aurfq8JgYtpLpI0coOp+0gUcgZUMIKmffILZW3UoBRtJIzaP/F+0vU8TGhPDq
	QlebTKoqC6+KyHgeRW7IqRNv1Gct5A6+XJqSCwvzSk8Vu5QwH6V
X-Google-Smtp-Source: AGHT+IHSDm6tRDGGlav4LSgtZXxFS3rS94Qdt+anyG4mU1v2bcB31JUk8nQYmiIrKOr7+cjYGvcbNA==
X-Received: by 2002:a05:6a20:8413:b0:1e1:9fef:e974 with SMTP id adf61e73a8af0-1e88d10e94dmr53771001637.24.1736968826823;
        Wed, 15 Jan 2025 11:20:26 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:4be4:f35b:eb2a:bdff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d406a980esm9527905b3a.180.2025.01.15.11.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 11:20:26 -0800 (PST)
Date: Wed, 15 Jan 2025 11:20:24 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Mark riscv_v_init() as __init
Message-ID: <Z4gKeLnO7nWyYM3a@ghost>
References: <20250115180251.31444-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250115180251.31444-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_112027_781509_72D58ECF 
X-CRM114-Status: GOOD (  17.37  )
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

On Wed, Jan 15, 2025 at 10:02:51AM -0800, Palmer Dabbelt wrote:
> This trips up with Xtheadvector enabled, but as far as I can tell it's
> just been an issue since the original patchset.
> 
> Fixes: 7ca7a7b9b635 ("riscv: Add sysctl to set the default vector rule for new processes")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/kernel/vector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 61ded78fcaec..aba5805119c3 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -319,7 +319,7 @@ static int __init riscv_v_sysctl_init(void)
>  static int __init riscv_v_sysctl_init(void) { return 0; }
>  #endif /* ! CONFIG_SYSCTL */
>  
> -static int riscv_v_init(void)
> +static int __init riscv_v_init(void)
>  {
>  	return riscv_v_sysctl_init();
>  }
> -- 
> 2.45.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
