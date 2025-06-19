Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA31BC7115A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 01:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ay1UQRHrbCOlIIlJYAKgP1s8IuWu266v0pOvGZpYQ/E=; b=mI+KkrnID9w6h+
	ikCjeHdJqM8nRohLwOkGdHMsbIf0YW0KuEb4boAxfAi4iULnKePJiB1NpRC/E40Va9ElJm9R1/SjM
	l304foePfstcW9M6fLpYR8O2yxuHO5DUpIRccsCmThgM58RXNCN4akU2riggw5jAlrLoclka6LXDQ
	/sRAlXD+lYWNJxnSNj1lVAEwwI8DEApZlGEb3lbps75KLvR9WYEbY3HrwBO0xF1EEn3w+GS12hpfg
	ilP2QvGS5e70MUIgEGhKL5LuML/z5ErkFrqZWfedEdFW6TIXmlDdldej3eRaV1js8cBC3QLzGh6ZM
	PzjJfGhdVfaOJ652870Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4QY-0000000Bmfs-2Q31;
	Thu, 19 Jun 2025 01:50:54 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4QV-0000000Bmf2-2U10
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 01:50:52 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b170c99aa49so224776a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 18:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750297851; x=1750902651; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=77PKh9SalLpybL3AAe7PoOLwMgQqtz9KiJ/uaTkWDSw=;
        b=k3bp4bFPXyiC31cS76iIEw9PhFLTl/INJOKHUW7xy4sOUmVhmw4RwdwvNQ6HSvGwnQ
         Rrrfqgtt3QDGEe9v9jvdgyxkKcmEF4+ftrDHPu3M6GUBJJtkKlvI25oNBjiJBQyiGMrn
         du6JgnqeqsnE6IFSdFKrNMdOBsu0X4NZiEoziXuQzjdbLWr1A4s3B9iKHFoI24epZa+Z
         ZF8xYEFsARueGL2I4QPqgB8zUCqf1J79RkQbssl7tKTfLmKkomlPtt4N8jxU3/HvHPSG
         Q1+olTjpO66sXNgRZ7CwnzpxaQBN9uEzSZjbR+xnNZJ/2swo5K9dbEHu+aM3LzhcLMwc
         s2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750297851; x=1750902651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77PKh9SalLpybL3AAe7PoOLwMgQqtz9KiJ/uaTkWDSw=;
        b=WCrsuHObzhCwPa+OLUqVuUiYHcjXFJKqsk6scz6+1VYdjtZdogMScNT/oLJ5BRCRAD
         DwDF8GUAuKs8pOxtnJ4D3fR7gdWzY1+4jZiiy3gYLmxE3D3kozjISMtoE0icKkYzYQLq
         ma+tOIa9G5aGpZMKtOFWX/pD1t66Awi9Yg125IPBvtAJ751c3AkDBllHGELtpE3V0bP9
         ILzjg65S3GNqY0TsA1HJAlYpXZWgom2djYvOfkkzRuWwlK2D18NLCgYHcPsY2Zk8ZfYM
         X4sbw8d7rurnRIF4G0SdUtbRuelinJx0oc6egBZlg9UFXCy5gDog3oNc/Q4RBfqiQinZ
         iTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwwWfuntYv17e1mxWJhpj+ZTkY1rvNtcFD7Atvq3WwI8y5uJAx2KX3MI6LxctIBE0UVsevGyOelYwhLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiEuKB3na7d+pz49tNZumQsFOFMcLR2nxeEjkPTqvXO24GhPng
	jX14NICxPa/CYLqSbn8zDIZQYjTenu4xHaEV/V2mINDAAJplNQliku7bFHFb57j8kp4=
X-Gm-Gg: ASbGncutPLodUopMoeY4P/XkaAVd0nHd712zMwd0FSkE6tmsjvusWF6k+mwqkKvx25s
	Tn52OEbVijDX5f9rTDJNSjGT8527j6RbLcxK1Wxk+SqswwIUSvgPpYeRvMalNOWBUHejQXB5+Xk
	6btUZ7RJPRAuHjxmA6Y3C9d0jRSBFUKyVKoVM3uWuWwaVnsstwXR14pihCkl7EzqxK5feGwg4qz
	KHNZQU5ODI52KsffSH6hGhL0B0nyk4Yna9txt3or4SEnHE3AfIoXeNTQEcsaCdX9vWf66TTdHRx
	XS4it8z2VberAK3B7ajE4WM1rm2ujiE1PbynKvFBtpOoOSESsbrIgEdRjcdLq759QYNvJPg=
X-Google-Smtp-Source: AGHT+IEH8ENEIXXiapQFn7dY5pW85bznCSDAM8YeveXgruCVaip94nhm+ZCyfl9XM7JJOLVmNJsDyw==
X-Received: by 2002:a17:90b:586b:b0:312:39c1:c9cf with SMTP id 98e67ed59e1d1-313f1be1c89mr31855817a91.7.1750297850614;
        Wed, 18 Jun 2025 18:50:50 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a226f7asm811267a91.10.2025.06.18.18.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:50:50 -0700 (PDT)
Date: Wed, 18 Jun 2025 18:50:48 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 2/8] dt-bindings: firmware: thead,th1520: Add resets
 for GPU clkgen
Message-ID: <aFNs+PLgw1jqqiUm@x1>
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <CGME20250618102227eucas1p26e8968805092c3ce0ecbe84e9724a6e2@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-2-27ed33ea5c6f@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-2-27ed33ea5c6f@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_185051_630297_61AEB2C9 
X-CRM114-Status: GOOD (  18.64  )
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

On Wed, Jun 18, 2025 at 12:22:08PM +0200, Michal Wilczynski wrote:
> Extend the TH1520 AON to describe the GPU clkgen reset line, required
> for proper GPU clock and reset sequencing.
> 
> The T-HEAD TH1520 GPU requires coordinated management of two clocks
> (core and sys) and two resets (GPU core reset and GPU clkgen reset).
> Only the clkgen reset is exposed at the AON level, to support SoC
> specific initialization handled through a dedicated auxiliary power
> sequencing driver. The GPU core reset remains described in the GPU
> device node, as from the GPU driver's perspective, there is only a
> single reset line [1].
> 
> This follows upstream maintainers' recommendations [2] to abstract SoC
> specific details into the PM domain layer rather than exposing them to
> drivers directly.
> 
> Link: https://lore.kernel.org/all/816db99d-7088-4c1a-af03-b9a825ac09dc@imgtec.com/ - [1]
> Link: https://lore.kernel.org/all/38d9650fc11a674c8b689d6bab937acf@kernel.org/ - [2]
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> index bbc183200400de7aadbb21fea21911f6f4227b09..3365124c7fd4736922717bd31caa13272f4a4ea6 100644
> --- a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> +++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> @@ -32,6 +32,13 @@ properties:
>      items:
>        - const: aon
>  
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: gpu-clkgen
> +
>    "#power-domain-cells":
>      const: 1
>  
> 
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>

I'm wondering what tree this should go through. Ulf took the original
patch that created the binding.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
