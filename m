Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA88D47CAD
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 01:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aCmt2Kur8T/ucTl1VPDAsL/HeGNb39ce7HQr4SRElg=; b=2qhBWuDCtHUEMq
	gfo/hh3S4M/8Gg6T4XAHCUByHqgwE8wIa1yvGmsne51ULPcHB3g/SY0wmJTXf+1PmT65b6MBxd3C6
	dNbCxjmu6KYu8I26PQT2MpNSI+zU9xP6Awh6NPlr6gr0Mep5E9hV6EaQR/QzavdUNHAU7x3SM4Ld4
	NwqXltnNgLvA/1MGp5+LVZMEL5qgg6hf6g4XVwDGhWVzKKjc7xgxwSzgf74PDtILgXKjsDmLqIJ3l
	1QUWVmnB7nK7f9GWtj1Hl25yX1ddJGFFvQSxG77zgVCf4fwuv7VKuaG8XJ4zvt0nj49Z6S4XYB5xx
	onUWoDfAXj5VABziaEWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYIU-0000000DOwI-0zuV;
	Fri, 16 Jan 2026 01:06:42 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYIR-0000000DOvy-2AJw
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 01:06:40 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7cfdf0c8908so286489a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 17:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525598; x=1769130398; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wFG3gVNxJD7Ap7fJ1CZDygWmut6qTFwFZjaDYw553m8=;
        b=LhFYYdoL1dB/WNPXmzLYYjXm930hSBvHU9tLrr1lBRi9PifQSadOvV0wB1M8OqGp68
         1FMZP1r1DWXSdMP6sPA1kV6EG+EQaBMl5udMjLZWBBsomhS8B80Ksx0f1+LrmzaUq5CS
         CiUGefCYJ4hkT+1P5kmLg5pZSvNHyvityk0HU6n1p6Bf7h81S337rwhibumXbPqJV2jD
         34AlqEpCLHFjGce+sH1eEz4+rmENIVC2aReBKO97AFGd/Krzm/vNVE/YbyE/f9c703s5
         yeQj4AP3e40QPW7oX7p1SIkP91qake8ShJQdgV/zlRKxVKXNhLhduwmRpF7Q21bj4+v7
         DgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525598; x=1769130398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFG3gVNxJD7Ap7fJ1CZDygWmut6qTFwFZjaDYw553m8=;
        b=l5DODJeBHmpEjqZl+7O5UFh68nbZBI1piZQHHcssRqmSbXGDyCm1RkvlNyqt3heG3G
         fFNkGVQOOHOlXaT/vBRMOa07bidjN8dmXpnMQL23yhs2rsS023BwdNHTNWtsWoCqP05I
         1MAOi9e2UAJ3YmEJVXBHVwl7Yv1zA1WQjJLBrKcFKhgjEti5G0vRzb1bL+Xc68/7fwTL
         OnXTFTXi7lrHbKBtrBFFQ78cY0ffJlD+9ytuJgtqOr//nn4eBEIWeuHdZeWGqyXIGNf/
         9sij/tfDCFxnWJePNYv6gAmwI7utiqKRTniJ1+t2+ID7IsnOYN90EUPrJp++mUO7sbKy
         4S/w==
X-Forwarded-Encrypted: i=1; AJvYcCUxhu/aHkw0eLvyhoWKrgkNRlnaJZJaZS+VYYZYK7n8cyI//f3vHekTrkIkn57INuZjYTMOXgrvtV7kEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiGPA3b/ZYIiqte9IfDdLWY7pqHiF7p/zqCPHkO+JctAUTLJCr
	9MjRKUh/pfR9xjdUY/qWV1/45aptDDz2qbLYIzvsH9c6B7feUXWrfP5aA/c+ojsjseI=
X-Gm-Gg: AY/fxX45sNKrPpBJB7H6sZZo8+x5j7oLyykezNlMInX0ifY7lrg65uCuCyr4jBc9uja
	Q1KiVfQhKTXYQk3d4az4CWMT+yvNHxq+mXrCQkBEcE8wNe3vMC3tVS4TlM9PlTNx9bPDAPDaUiz
	8La+6O3Rz8KB4K1mS1hQg2g7ZH35jjfYaAy8xRC73Zj+BPUT3buMoyP0inihL3MbTQu0V3NxV4M
	O1sBcxJqR9VRx3IO6ItlY53MBaw+chKJaYIkHJwitssQsypB+O0Ixr33BQeSppEWut0HBM707er
	/9pIDthJMTszNzgh/TDGpQoTQFDy/wdk4tIMaKrJGC1zULby3lNSt2yirdfV2CBEVfSw7fAsaFa
	Hr9a0uC8IMH7VdbrzeiPxBwG1dGnVfwfZ0pjqMmlId9dC1qUeasvdC0i/TH6PNTulqP6FB4l3lC
	ZdqITbpQHCEA==
X-Received: by 2002:a05:7300:6ca1:b0:2b0:5079:d3c8 with SMTP id 5a478bee46e88-2b6b3f139f5mr1020729eec.4.1768520046558;
        Thu, 15 Jan 2026 15:34:06 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3696f40sm696762eec.35.2026.01.15.15.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:34:06 -0800 (PST)
Date: Fri, 16 Jan 2026 07:34:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/8] ASoC: sophgo: add CV1800 AIAO mux and I2S support
Message-ID: <aWl4fvKsUZDg9dwj@inochi.infowork>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170639_624329_D2CEF755 
X-CRM114-Status: GOOD (  25.96  )
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

On Thu, Jan 15, 2026 at 11:17:37PM +0400, Anton D. Stavinskii wrote:
> This patch series adds basic audio support for Sophgo CV1800B, 
> as used on boards such as the Milk-V Duo. 
> The series introduces an AIAO audio mux driver, 
> an I2S controller driver, corresponding DT bindings, 
> and DTS updates to wire the components together.
> 

I haven't see your mux driver, is it missed?

> The implementation is based on vendor documentation 
> and testing on real hardware.  This series relies on 
> recent fixes in the DesignWare AXI DMA support; 
> in particular, correct operation depends on 
> the DMA changes discussed at:
> https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/ 
> The current driver implementation supports a fixed audio configuration 
> of 48 kHz sample rate.  The series has been tested on the 
> Milk-V Duo 256M board using the Sophgo SG2002 SoC. 
> The implementation is expected to also work on Milk-V Duo and Milk-V Module 
> boards based on the SG2000 SoC, as the audio 
> and DMA blocks are closely related.
> 
> Known hardware limitation:
> On CV1800B / SG2002, the I2S2 output pins cannot be enabled via pinctrl alone.
> Due to SoC design constraints, the output path becomes functional only after 
> additional vendor-specific register programming. 
> This series makes the limitation explicit and does not attempt to work around 
> it implicitly via pinctrl or undocumented behavior.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
> Anton D. Stavinskii (8):
>       dt-bindings: sound: sophgo: add CV1800B I2S/TDM controller binding
>       ASoC: sophgo: add CV1800B I2S/TDM controller driver
>       dt-bindings: sound: sophgo: add CV1800B internal ADC codec
>       ASoC: sophgo: add CV1800B internal ADC codec driver
>       dt-bindings: sound: sophgo: add CV1800B internal DAC codec
>       ASoC: sophgo: add CV1800B internal DAC codec driver
>       riscv: dts: sophgo: dts nodes for i2s tdm modules
>       riscv: dts: sophgo: add Milk-V Duo 256M board dts
> 
>  .../bindings/sound/sophgo,cv1800b-i2s.yaml         |  75 +++
>  .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   |  43 ++
>  .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   |  43 ++
>  arch/riscv/boot/dts/sophgo/Makefile                |   1 +
>  arch/riscv/boot/dts/sophgo/cv180x-dmamux.h         |  57 ++
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  49 ++
>  .../boot/dts/sophgo/sg2002-milkv-duo-256m.dts      | 231 +++++++
>  sound/soc/Kconfig                                  |   1 +
>  sound/soc/Makefile                                 |   1 +
>  sound/soc/sophgo/Kconfig                           |  41 ++
>  sound/soc/sophgo/Makefile                          |   5 +
>  sound/soc/sophgo/cv1800b-sound-adc.c               | 322 ++++++++++
>  sound/soc/sophgo/cv1800b-sound-dac.c               | 204 ++++++
>  sound/soc/sophgo/cv1800b-tdm.c                     | 714 +++++++++++++++++++++
>  14 files changed, 1787 insertions(+)
> ---
> base-commit: 7a52965b6976c936f413eebeee3f78c6faf09012
> change-id: 20260115-cv1800b-i2s-driver-4f17836dec56
> 
> Best regards,
> -- 
> Anton D. Stavinskii <stavinsky@gmail.com>
> 

Thanks for your patch, for all the patchs, I hope you write a
meaningful comment for the patch, at least for now I found it
is nothing in your comment.

Also, the patch 8 should not in this patch and should be a
separate patch.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
