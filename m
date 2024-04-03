Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CD6CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 18:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=F2xXh01PfYqWmaWTLmd3Z0LbDFRGXSzFOHLfUxP2H4g=; b=U/VCxeI3OG9IdNJ6dGJ0Wi6nTm
	r5/ixmo8RJY7Vwbql86r/mhG+nOQputoJdpE/mEEDZHcMJWroTAwJr9Gus+MsR4kZ+ezBYVV4Xxx1
	ic9j4+QvK6qzlFMgSp4j3RYcyw+O6Alwb5z5uMC+SnYHt7nkmQnVa6il/tlqxs+ltKn2RyTmebH9B
	ixXS/20JEOP2wT1mHC/7Rd9zcLXcgkcmYx+UkLjfzbj2Jfa+rbFcUnpFCh010zOKo/VojEH+9/z8Q
	CXFA4/FvG2TgFpJN4sYz20rUYDvO0qYlJIEd8V6qXOo0Lyb42gs7rkSTf3CYNijEIOqBZwvoz1ykL
	DZQbJzNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5FY-0000000HMnf-41Xb;
	Wed, 03 Apr 2024 18:22:17 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5FR-0000000HMig-1R9b
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 18:22:13 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1e2987e9d06so794205ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 11:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1712168526; x=1712773326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+6ScChiC8zS3o9tbiOgcc1DiBxz6xvmMgS5MbEqCVk=;
        b=uEnmAYS4TWLA+kuemFjoILfAOMdv+ZTuyNkSayji/JfskD9ONeAmU6MzTGllNZQtK3
         mzAxf7lUz50S8g95HELlsaCFalPDZF8frxtr4YOVdCyFBngP9u2F26QwEE8qnMO8GI7s
         KfLtmO2U13xBQIn3971qw2pJ4w3qB+PvJ7CaB/KGwHlfaOq9dz8u0AlN7NfoBEuUvJIm
         BnWpwAPhARrsN8GHoBWovuJYpe6lIecNecN0PtxnYh2v6pOTy+jh0TLu4usey6IQVTOn
         GAafSRent7D8ubpJir1+wZHTtoqF9OkNIt5V9dxQsw2DJNy2JhBjnF4LOqjqddgmfbtf
         zwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712168526; x=1712773326;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+6ScChiC8zS3o9tbiOgcc1DiBxz6xvmMgS5MbEqCVk=;
        b=GKZW0xhc4klH7IiPiJvKtE+rVfIexlWM+yrn6J38QanThu9gC6oX/SclrZGObMTgPO
         eA/S0ICiPi9zno+XPFWOki0CkaJv/jaZnBHAX84kSyHM1fWEqFXq7lLEFSkqpjrVDeqw
         7TQOzLyhOytryb4KMqj9qMviGQXNtAmtvZRZZTFG7F74DZkGMd9Ykw9MFp9I1fyFV0V+
         SlmOWi+1eLeWJZsYFQjnCTv7u9l0PvUijeTfALuhsfY0Iqu7Dr2uAZAoTJcOJPsUAsab
         8tBJEtCTXTxxjYV/GV9RzGU8OBaEmh0iMRGLV+0L9oiBZdVJJa/fNgTGsoqrdxacDvh3
         tSDg==
X-Gm-Message-State: AOJu0YyelEcnbQFhJTSssjy/3fvFMvVH2Zjdtg+pG4mlAGcB+8nOeBfJ
	f6gEzRh4m/MsEWG0gIYhKV0W9kRqd0uP1dPd3+KSe6hoHbNvPUt3HzmP52vALFfX4T8soqkmQZF
	/
X-Google-Smtp-Source: AGHT+IFlUXGV4chig6oJvZqV4vGOgLfE+s5gAYd5D5SfvJ7gnZEYS1RqOGC2YxcHgRm7Hvepr5Q2zg==
X-Received: by 2002:a17:902:c14b:b0:1e0:a7c5:b5a5 with SMTP id 11-20020a170902c14b00b001e0a7c5b5a5mr67760plj.37.1712168525743;
        Wed, 03 Apr 2024 11:22:05 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id c2-20020a170902d48200b001dd652ef8d6sm13572476plg.152.2024.04.03.11.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:22:04 -0700 (PDT)
Date: Wed, 03 Apr 2024 11:22:04 -0700 (PDT)
X-Google-Original-Date: Wed, 03 Apr 2024 11:21:38 PDT (-0700)
Subject: Re: [PATCH v1 2/2] RISC-V: drop SOC_VIRT for ARCH_VIRT
In-Reply-To: <20240305-stress-earflap-d7ddb8655a4d@spud>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-kernel@vger.kernel.org, brendan.higgins@linux.dev, davidgow@google.com, rmoar@google.com,
  Jason@zx2c4.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
  wireguard@lists.zx2c4.com, netdev@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-170f61cd-c3b7-413b-8279-9d50d55dbebe@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_112209_405564_91342FBA 
X-CRM114-Status: GOOD (  22.15  )
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

On Tue, 05 Mar 2024 10:37:06 PST (-0800), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The ARCH_ and SOC_ versions of this symbol have persisted for quite a
> while now in parallel. Generated .config files from previous LTS kernels
> should have both. Finally remove SOC_VIRT and update all config files
> using it.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I had a 1.5 year old ack from Jason that I dropped due to the passage of
> time.
>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Albert Ou <aou@eecs.berkeley.edu>
> CC: Brendan Higgins <brendan.higgins@linux.dev>
> CC: David Gow <davidgow@google.com>
> CC: Rae Moar <rmoar@google.com>
> CC: "Jason A. Donenfeld" <Jason@zx2c4.com>
> CC: Shuah Khan <shuah@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> CC: linux-kselftest@vger.kernel.org
> CC: kunit-dev@googlegroups.com
> CC: wireguard@lists.zx2c4.com
> CC: netdev@vger.kernel.org
> ---
>  arch/riscv/Kconfig.socs                                    | 3 ---
>  arch/riscv/configs/defconfig                               | 2 +-
>  arch/riscv/configs/nommu_virt_defconfig                    | 2 +-
>  tools/testing/kunit/qemu_configs/riscv.py                  | 2 +-
>  tools/testing/selftests/wireguard/qemu/arch/riscv32.config | 2 +-
>  tools/testing/selftests/wireguard/qemu/arch/riscv64.config | 2 +-
>  6 files changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index e85ffb63c48d..dcbfb659839c 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -52,9 +52,6 @@ config ARCH_THEAD
>  	  This enables support for the RISC-V based T-HEAD SoCs.
>
>  config ARCH_VIRT
> -	def_bool SOC_VIRT
> -
> -config SOC_VIRT
>  	bool "QEMU Virt Machine"
>  	select CLINT_TIMER if RISCV_M_MODE
>  	select POWER_RESET
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index ab3bab313d56..8d46a9137b1e 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -32,7 +32,7 @@ CONFIG_ARCH_SOPHGO=y
>  CONFIG_SOC_STARFIVE=y
>  CONFIG_ARCH_SUNXI=y
>  CONFIG_ARCH_THEAD=y
> -CONFIG_SOC_VIRT=y
> +CONFIG_ARCH_VIRT=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
>  CONFIG_PM=y
> diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
> index b794e2f8144e..de8143d1f738 100644
> --- a/arch/riscv/configs/nommu_virt_defconfig
> +++ b/arch/riscv/configs/nommu_virt_defconfig
> @@ -24,7 +24,7 @@ CONFIG_EXPERT=y
>  CONFIG_SLUB=y
>  CONFIG_SLUB_TINY=y
>  # CONFIG_MMU is not set
> -CONFIG_SOC_VIRT=y
> +CONFIG_ARCH_VIRT=y
>  CONFIG_NONPORTABLE=y
>  CONFIG_SMP=y
>  CONFIG_CMDLINE="root=/dev/vda rw earlycon=uart8250,mmio,0x10000000,115200n8 console=ttyS0"
> diff --git a/tools/testing/kunit/qemu_configs/riscv.py b/tools/testing/kunit/qemu_configs/riscv.py
> index 12a1d525978a..c87758030ff7 100644
> --- a/tools/testing/kunit/qemu_configs/riscv.py
> +++ b/tools/testing/kunit/qemu_configs/riscv.py
> @@ -13,7 +13,7 @@ if not os.path.isfile(OPENSBI_PATH):
>
>  QEMU_ARCH = QemuArchParams(linux_arch='riscv',
>  			   kconfig='''
> -CONFIG_SOC_VIRT=y
> +CONFIG_ARCH_VIRT=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y
> diff --git a/tools/testing/selftests/wireguard/qemu/arch/riscv32.config b/tools/testing/selftests/wireguard/qemu/arch/riscv32.config
> index 2fc36efb166d..2500eaa9b469 100644
> --- a/tools/testing/selftests/wireguard/qemu/arch/riscv32.config
> +++ b/tools/testing/selftests/wireguard/qemu/arch/riscv32.config
> @@ -2,7 +2,7 @@ CONFIG_NONPORTABLE=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_MMU=y
>  CONFIG_FPU=y
> -CONFIG_SOC_VIRT=y
> +CONFIG_ARCH_VIRT=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y
> diff --git a/tools/testing/selftests/wireguard/qemu/arch/riscv64.config b/tools/testing/selftests/wireguard/qemu/arch/riscv64.config
> index dc266f3b1915..29a67ac67766 100644
> --- a/tools/testing/selftests/wireguard/qemu/arch/riscv64.config
> +++ b/tools/testing/selftests/wireguard/qemu/arch/riscv64.config
> @@ -1,7 +1,7 @@
>  CONFIG_ARCH_RV64I=y
>  CONFIG_MMU=y
>  CONFIG_FPU=y
> -CONFIG_SOC_VIRT=y
> +CONFIG_ARCH_VIRT=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
