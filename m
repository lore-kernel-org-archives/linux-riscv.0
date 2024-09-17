Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00FCC35FFF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Ixz199tI08nnwhfTt/hHMk2KOYuaLsrVeyxicfDjgsQ=; b=L73obY/p+MPsUwmzExid5/VAKJ
	T2xSyujGTosWWTy7y7rBmmMqUHQtOVx3yw9N6jK7dUNPzpKcxEXPX/hLRYw3KDcKV0CVR7TXg6DVh
	73FWOiWfynq199DLd6axHuO94T5zK+P1A+E7m/KKkCEembGjsxyc/W//Wz5n3SXGDxntFSD63+fOV
	K0c9o23QadbYzL/IWsjx9wp9uZIs0VUst5i4/fKNpgwFiFWgZZLrfNg7pnIkS49mESzpWcC1hbOxX
	vrR3MWn4XOMr4qZNjB9CzdrR/xmA87Gk9ngVCiQsIh+EV5a7tUusTUAK1WbzPV7LlIpWGUhR+BqL+
	X90d7U5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYFy-00000006EBz-3qM7;
	Tue, 17 Sep 2024 13:28:38 +0000
Received: from mail-pf1-f177.google.com ([209.85.210.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYFv-00000006EBY-2JmD
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:28:36 +0000
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7197970e2aeso359034b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726579714; x=1727184514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSjVIhSmfJ0CyaIM/a3SSB+ZCJQA5N7E16cyTDPSeoc=;
        b=F2GwDwZER7Az2EvkQlrLblgrS/Cs3YFT0809abrk1V07nd4extqn7TDr4YglaypM8Q
         jD7BrfomuSBCnH5z4kwZ7traZfbtt1xHtPk6EGDN9OwvjVUsyVRJ54yJRNN/k6cbvq2J
         81F1IbnTqN/ElSI8+x8Gm13fwRFQWYF7eiZtTL2iXmfHj8CsNatmWfILwTAHQgh+OtLZ
         hp2Y8BFhqFvAm8o6piLDJnp6Farlh54y10OvY6P1NNvC27HL+pS0QfzqFfqGD3OcO0Du
         HcoYcGZH8UnDZdVWXHG7JMXi5QMh0ec9FM1c1rLXcEn0CfdHdcD2RF4UwZlq6DI78DiM
         YZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726579714; x=1727184514;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSjVIhSmfJ0CyaIM/a3SSB+ZCJQA5N7E16cyTDPSeoc=;
        b=mALKiWFr3i6bQ8JSAI1IwwTROin/uEdGYxNxuqqXRZYmfeCgZPEHE98bpnXGXftDr9
         b/Cml5zYSYty1DDcKPjSP7goIOHmUwHdHXo35k8OJ3Rmbz+nues6x6laa/1eQEbs6Noc
         5c8QXae5WAfXCin9Ess6J0W4GbIlUxnKQzh8plIgNwSqwJeGJSxVW4xLB59ZNGywTsK1
         rnmqpvRVVrZ5TaV2hhqoAoucmRqhCmm3FWWRkhOwhwehIbVZE43iw4yk79EBddukeSs9
         OeqeKkQHo2NRZbuyb+L2u5uUoLsuExE7drxnwO+ZLkMD8/ray7U2l+uJVLvNXd6eY3ZN
         tFSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8/6zQJrDbtyuyayM6USi7k6TrJLFbuulwvh65+QXEb01XIpDuXshNxengQux00sW3IoaB+nelmaRSEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQiuILG7n8DqB9eqL1esQNOWdx4yXj6WPTrr178FZgT2C2eaeg
	d7YrMntBvKVCzi5PHsKgY3V9DQ/vcm801ntWTHbAfDilE2p9ShkOpIgti1yKZt4=
X-Google-Smtp-Source: AGHT+IEDqJbKpA6LAn7lxbzNxohHyNQyKe4VpZi839U/YbK8TEHIC3wtGjjJt3DVKNnGqc0aqDaaDA==
X-Received: by 2002:a05:6a00:854:b0:718:d94b:4b with SMTP id d2e1a72fcca58-71936a2f634mr25905784b3a.6.1726579713896;
        Tue, 17 Sep 2024 06:28:33 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a9809esm5146960b3a.39.2024.09.17.06.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 06:28:33 -0700 (PDT)
Date: Tue, 17 Sep 2024 06:28:33 -0700 (PDT)
X-Google-Original-Date: Tue, 17 Sep 2024 06:28:26 PDT (-0700)
Subject: Re: [PATCH v2 5/7] RISC-V: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
In-Reply-To: <20240903142506.3444628-6-heikki.krogerus@linux.intel.com>
CC: andi.shyti@kernel.org, jarkko.nikula@linux.intel.com,
  andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com, jsd@semihalf.com, linux-i2c@vger.kernel.org,
  linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heikki.krogerus@linux.intel.com
Message-ID: <mhng-c9a63485-1f83-48c6-8840-accd5f97d237@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_062835_616577_AC4E4042 
X-CRM114-Status: GOOD (  16.79  )
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

On Tue, 03 Sep 2024 07:25:04 PDT (-0700), heikki.krogerus@linux.intel.com wrote:
> The dependency handling of the Synopsys DesignWare I2C
> adapter drivers is going to be changed so that the glue
> drivers for the PCI and platform buses depend on
> I2C_DESIGNWARE_CORE.
>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  arch/riscv/configs/defconfig                   | 1 +
>  arch/riscv/configs/nommu_k210_defconfig        | 1 +
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 0d678325444f..a644a798f602 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -157,6 +157,7 @@ CONFIG_HW_RANDOM_VIRTIO=y
>  CONFIG_HW_RANDOM_JH7110=m
>  CONFIG_I2C=y
>  CONFIG_I2C_CHARDEV=m
> +CONFIG_I2C_DESIGNWARE_CORE=y
>  CONFIG_I2C_DESIGNWARE_PLATFORM=y
>  CONFIG_I2C_MV64XXX=m
>  CONFIG_I2C_RIIC=y
> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
> index af9601da4643..87ff5a1233af 100644
> --- a/arch/riscv/configs/nommu_k210_defconfig
> +++ b/arch/riscv/configs/nommu_k210_defconfig
> @@ -58,6 +58,7 @@ CONFIG_I2C=y
>  # CONFIG_I2C_COMPAT is not set
>  CONFIG_I2C_CHARDEV=y
>  # CONFIG_I2C_HELPER_AUTO is not set
> +CONFIG_I2C_DESIGNWARE_CORE=y
>  CONFIG_I2C_DESIGNWARE_PLATFORM=y
>  CONFIG_SPI=y
>  # CONFIG_SPI_MEM is not set
> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> index dd460c649152..95cbd574f291 100644
> --- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> @@ -50,6 +50,7 @@ CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_I2C=y
>  CONFIG_I2C_CHARDEV=y
>  # CONFIG_I2C_HELPER_AUTO is not set
> +CONFIG_I2C_DESIGNWARE_CORE=y
>  CONFIG_I2C_DESIGNWARE_PLATFORM=y
>  CONFIG_SPI=y
>  # CONFIG_SPI_MEM is not set

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

(based on the rest of the thread I'm assuming you're taking these all 
together, which seems saner to me)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
