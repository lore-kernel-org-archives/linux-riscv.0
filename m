Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D043CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 18:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=c2jz/HwJk0xkki3xnAUk2hLJX31ofAw7l549+LeQILI=; b=eE6veCF6L4L5SGRojsxxZKpQlh
	OTkOrX+OfdlCuU0X3sg1XlS2yLS0sL7bw+aXaKzUGdsBK1w33OcAaPbB0hJcqr0S59q9rzvR8GraO
	k93Xxxn0i53WIdjQfPbGFFkQUWHWVtpeovhXngdOfKAx4a+N0ExhjWZ5HNB1yLWj1Btnb8Ns07Ohk
	R2FgvSZ0pv/2i7wpvXoEvTX/Y/WdleIaeAmqXC7Z0QVFgL89p68ZfQJJ+aTN98pozrDDXizOsIZS6
	rdWmfgdBnTlO3Vo05nITIqi73rTRq5hkQg9/x64OlZpNheQoYNBhUJ0X6Q30vKVtxXEqel6ek5ZX2
	wQhTxi7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5EW-0000000HMXQ-3jl4;
	Wed, 03 Apr 2024 18:21:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5ET-0000000HMVl-0Omc
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 18:21:11 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e0411c0a52so896805ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 11:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1712168467; x=1712773267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKl4U6NBsi2KnUX54Y7mlBTwzfcZrYAxy8ckRRZLkHc=;
        b=LHdRvKbPGOE6xBKvLNF4O+KN4cU7pATgLDhRs7SglsOfrOOygh+QSyuBnwsIR2e15F
         7mdfmvIlV9Uxebzb76jfFDtMDopzP/aue2gcvKwavqiZJABN2eL8gC7Il+C0tDI/Phpf
         XBGxfhl7XuolxaGP9UhhfOZKUoVoL/I7JlUVu7oWHolkhyFpsBpa3RrcF9WjRAcdhHCE
         ZQ6vbtIvCyg5sEul8k5H+jweVpzJ3wHUzk3orlTeohFst6C63NIkhJWa7Xh1fGAmWep2
         ZpBXTXuPWBCB7SYXXOn6TXjWdmP/iIuxwz7TE/6JDmLIRrEyi/NfWUmgkVPVDon9hgNM
         IfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712168467; x=1712773267;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKl4U6NBsi2KnUX54Y7mlBTwzfcZrYAxy8ckRRZLkHc=;
        b=vAKEpOUtElJP41RYJG2ytiwzqwiyqhwvBWiatgww6AVQ1E/CkY0g9Fjy+kqt4ULiJW
         0MXdnQ6obfStK8HGEf2SCP+CRz5m2giShCVPaFSxGwcRcfzzBCQZ/l/SJf+mDVw8hhvQ
         7FOqdmUExldB8o5Q3HxgGOWdMnKPxuwfCICDZvVS0k+zTMNKcyOG2/vcoExJnBPWsdPa
         GAlcpB7Ni1juanK2T/5y7HG/mCx6Lqw1WPa+HC+zH/LbATafqFAYloKUaAKZmRVGcda1
         /Pr3v+t+Q9xNG9s2pwksbiXYpPqFTshNyI3O+EGFlil4PxN26/mCo/t38InrMS0KGoo4
         iMJQ==
X-Gm-Message-State: AOJu0YxKvBbuCDxNdEGdz54JHZvqi0cHu+YAaP7M8n2T8heP/HiuHn7A
	PNRqAP2opxzcdpYyuFFo5LUmrOh0jF1kMRWT0x+EuLySRPwVo7+vKUGUQTislm77/iBeZbpg9Yv
	y
X-Google-Smtp-Source: AGHT+IF1amNlKsXA4UsiOm3Pm9N06JwvhPoGILbiVOUKanoifUuBTANbidXHCNAJl2a/D/xQ/xwEJg==
X-Received: by 2002:a17:903:2656:b0:1e1:1d5:f857 with SMTP id je22-20020a170903265600b001e101d5f857mr60041plb.34.1712168466575;
        Wed, 03 Apr 2024 11:21:06 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id cp12-20020a170902e78c00b001e245c5afbfsm7210608plb.155.2024.04.03.11.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:21:06 -0700 (PDT)
Date: Wed, 03 Apr 2024 11:21:06 -0700 (PDT)
X-Google-Original-Date: Wed, 03 Apr 2024 11:21:01 PDT (-0700)
Subject: Re: [PATCH v1] RISC-V: drop SOC_MICROCHIP_POLARFIRE for ARCH_MICROCHIP
In-Reply-To: <20240305-fled-undrilled-41dc0c46bb29@spud>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-27198c01-d322-42d2-90f6-7ad7330b30b9@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_112109_283938_4E4789E6 
X-CRM114-Status: GOOD (  19.81  )
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

On Tue, 05 Mar 2024 11:20:28 PST (-0800), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> SOC_MICROCHIP_POLARFIRE doesn't have any remaining in-kernel users, so
> time has come to remove it. Foolish auld me left the "POLARFIRE" in the
> new, hidden, config option when I renamed it and changed all of the
> users however. As HPSC has been announced, and is not a PolarFire,
> drop mention of that specific FPGA family from the new user-visible
> config option.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/Kconfig.socs      | 8 ++++----
>  arch/riscv/configs/defconfig | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index e08e91c49abe..5fd2e9f425d1 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -1,12 +1,12 @@
>  menu "SoC selection"
>
>  config ARCH_MICROCHIP_POLARFIRE
> -	def_bool SOC_MICROCHIP_POLARFIRE
> +	def_bool ARCH_MICROCHIP
>
> -config SOC_MICROCHIP_POLARFIRE
> -	bool "Microchip PolarFire SoCs"
> +config ARCH_MICROCHIP
> +	bool "Microchip SoCs"
>  	help
> -	  This enables support for Microchip PolarFire SoC platforms.
> +	  This enables support for Microchip SoC platforms.
>
>  config ARCH_RENESAS
>  	bool "Renesas RISC-V SoCs"
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 89a009a580fe..5cfc0338ad5c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -25,7 +25,7 @@ CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
>  # CONFIG_SYSFS_SYSCALL is not set
>  CONFIG_PROFILING=y
> -CONFIG_SOC_MICROCHIP_POLARFIRE=y
> +CONFIG_ARCH_MICROCHIP=y
>  CONFIG_ARCH_RENESAS=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_ARCH_SOPHGO=y

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
