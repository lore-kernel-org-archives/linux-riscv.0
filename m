Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB0FCD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 18:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=kiz+/jbqN4mKP7vAb37gA4jO5fRLfUm/8HEzPEzvLdc=; b=Bd6aZOC8kD2vsDpfwPJV8SFVrD
	KjXmarKHsz0EFpDasrMqKxM5ME6CvMF1L3N/+fBZt59t/F/Z9m4KoHxQq2jIccoNGBbgu0jLSEohp
	JU/yPNsdOV/yet0OMrPE30GS+8ob1RMkjlPaCBOemlmOkxlj5yGI9d6xYYV/FkWt3FmrIYqtJWq13
	jiUUwuI2VF9a3wYx2h78aSHxzFJTKRdTBlmcmiExFjmOfWOWIARu4CAGNR2x1ObGIzgz12ydM60Lb
	xhqJlP1dw1dtWYKBrQglfrvx59H00Y1H0jFLW2Ag9NOpQGipCfYKu+YU3fAvWNH1uMJdiU2udLX4K
	3fSNfJ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5FV-0000000HMlS-2dYO;
	Wed, 03 Apr 2024 18:22:13 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5FQ-0000000HMie-0AAG
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 18:22:11 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ea7f2d093aso78459b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 11:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1712168524; x=1712773324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+Kf1VtrPbxx/AIfqj2WJbrl2k9+u/D2i3gfwNLRUnA=;
        b=Kx7/NZhv4dO99UrS93Z6XTT7IsTzeVbmSAn0yqCtPf2jh+hxBvRjQzxFFPFdB0MHhK
         4R2jq4hgdyfotu6gcPUNL1SSh3u+nBdcOVURKtV3TBd0toJvNtUQCbGItNF6b/fZ+00W
         ENNwpozUNHyqFISWMg7R7JA6RLCdpU9tZIewVJP1TZjRuuTGpwwzXqloSwa+EUdiawk/
         Ki44rLt9yCFEIdqnDirY5ciCR75rV8ZWl+Y7TWBfqnG46xGFK5eR8HGoS5vMI1WcBMze
         eMuSKhqczwXi7wUv2ygIw+TnOMgO4WUPG/P7LI8b4b2sqmBU11bP7Mc3Ucanfffg+Exb
         VTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712168524; x=1712773324;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+Kf1VtrPbxx/AIfqj2WJbrl2k9+u/D2i3gfwNLRUnA=;
        b=A4FQfusRN2oiM5E8GEN8GQNe3R3yqnrvbAJ4zMrh3L5ZLHx0hLcEgH+zxYyl7KUvRW
         AY+6WBVtAfAFGqi24cNOTj1vvRgNUOt8BLQWaHrvUG7QEGVhgn7cprDUQLrAikgr5zaS
         14m/DTagCWVQ1PStLHEjGUPLZ6cittFDKlUNQbV2WQUQpOdOoheHqsTb4rSxdkqtNgpD
         rPVPV6KyDe5O4DLnMYbIcfNHy/mu7RSJyncwyoYGepud9VjWG50rLKVh6oe8q1UUdgiW
         JrExIqtrGv8Q051YRvW7chdAVFdSxFfcI+0+nmUQQOSxUOeygZP1jKyH4qibEsAlT1oS
         O9Iw==
X-Gm-Message-State: AOJu0Yz6ptd67NwmFLtwgO7c/O50D7VRN7+CdTqUAfhQ2jywjyOXQHaV
	g258MbgiP4kqyiPyEWI/a81fGCyh3++0ji6g+3UBX3CbDho1Gd8+zNYkc1XxGqoJ5BGZ7HIacOg
	2
X-Google-Smtp-Source: AGHT+IGty08VcqdEljCIJkfJOB8iEizvRWz0FfAsjUhmWizntDOrlClCKtIX4KMfuzGZun6DYHreSw==
X-Received: by 2002:a05:6a20:7d88:b0:1a3:af38:31de with SMTP id v8-20020a056a207d8800b001a3af3831demr579540pzj.4.1712168524117;
        Wed, 03 Apr 2024 11:22:04 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id y2-20020a170902864200b001e2602fd756sm4966719plt.95.2024.04.03.11.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:22:03 -0700 (PDT)
Date: Wed, 03 Apr 2024 11:22:03 -0700 (PDT)
X-Google-Original-Date: Wed, 03 Apr 2024 11:21:32 PDT (-0700)
Subject: Re: [PATCH v1 1/2] RISC-V: drop SOC_SIFIVE for ARCH_SIFIVE
In-Reply-To: <20240305-praying-clad-c4fbcaa7ed0a@spud>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-44dd5bcd-50fe-4f09-bf3e-d2ba2e6cfc74@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_112208_271553_2EA1BE89 
X-CRM114-Status: GOOD (  16.64  )
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

On Tue, 05 Mar 2024 10:37:05 PST (-0800), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> All the users in the kernel are gone and generated .config files from
> previous LTS kernels will contain ARCH_SIFIVE. Drop SOC_SIFIVE and
> update the defconfig.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Albert Ou <aou@eecs.berkeley.edu>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/Kconfig.socs      | 3 ---
>  arch/riscv/configs/defconfig | 2 +-
>  2 files changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index e08e91c49abe..e85ffb63c48d 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -14,9 +14,6 @@ config ARCH_RENESAS
>  	  This enables support for the RISC-V based Renesas SoCs.
>
>  config ARCH_SIFIVE
> -	def_bool SOC_SIFIVE
> -
> -config SOC_SIFIVE
>  	bool "SiFive SoCs"
>  	select ERRATA_SIFIVE if !XIP_KERNEL
>  	help
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 89a009a580fe..ab3bab313d56 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -27,7 +27,7 @@ CONFIG_EXPERT=y
>  CONFIG_PROFILING=y
>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_ARCH_RENESAS=y
> -CONFIG_SOC_SIFIVE=y
> +CONFIG_ARCH_SIFIVE=y
>  CONFIG_ARCH_SOPHGO=y
>  CONFIG_SOC_STARFIVE=y
>  CONFIG_ARCH_SUNXI=y

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
