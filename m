Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C727C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 22:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOFktdQ4bHZXcNZayprKxpWKdtNp/fvLkD3F7gjVRvg=; b=oai6zIlYhjBxGR
	+fUcG/tgT/BAnLfxxXIzZ6RkqsGZOVZmFKOFtL0geB4cr587cfp33kRWzNgX3oiGX2OdvjDkemRYv
	JiaM9sxepAy/jnWwbTJMjQP0fPqCHa8afA7jJKIvh7eZoxfxiPqnaY2WtIJxQfVatBVVR46wZadVI
	qWNBha9palKEu9f6GJ4Bu2qXmfG6Z1o3+vrCpW7zNYiIlrtOl1xJIdSeHNHtt5QOjlCriLXKLdu9e
	gn/ksYEyMvByBNylwMsbOsqvWHrqoChvdia72cdj8isjKG7BOjFZTR3P62GxeIduuhJ5gYpKIhxPR
	USA7taEY42TV/YhoLh1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL9um-00CJC7-2D;
	Wed, 03 Jan 2024 22:40:44 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL9uh-00CJBU-2Z
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 22:40:43 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d45f182fa2so57281815ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 14:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1704321638; x=1704926438; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0h7PgAKHLBBL550JFcFthbjqC6UsTh1CLzAgFeU19vM=;
        b=o9mXvouPZ75VdDK96vRN3O5kpBCD3B8PnNVNdGBzSeFBoq/SUoa0LgssYuJSF9eNy9
         CEE8flpyrXGJu4DW8hwmKO0zfC5uAURPPLRuL0GTWWniXvUCJIE7EgqlME+F3Y5wZxOT
         ptYHxclPdedfnfeCaJdqeYlxN1lWFrLz0a9njy3ovoBVUihtQkteYGjj/THGX8CZDYRJ
         wB+pG2Z7eJI9ztOL9MZfuTr1CFpB/w2umx8L+CMYerVU1FuRwoxupSlpF6y99XLJCyVP
         GS9TqoXcDyDWLdmHWY7mv6KK/CtBzQVvhdoWuhJWnKdzrfzPT9ki8BJOOv654Aq37rAB
         SVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704321638; x=1704926438;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0h7PgAKHLBBL550JFcFthbjqC6UsTh1CLzAgFeU19vM=;
        b=cSF6KcrpQzQpobkftZuVubBdtJuUMBSndQpbkHpi/7nnoCSPpEy/HZZPOCjyZfNxlD
         FXYpbKpgQK2WLtlpeSDpOZ9TJxBks0bGBVsrxq9AWjdxkGPtjK/xnnkzdhAPKDu0/8mW
         LFKwHxPCx6Kf3nyuW99sbv8w9r7vprOFKQkK2TwU5jfyyNfRYNLtEgLMUhwzujeVIQYE
         Hog5xsx3MjLmPVjGUGPuvLtUF9FnZUHSD2Vi48XaHDcDKA5GTj/lMeLfcwLXHumdTEBa
         tmzI2DfVKM5hLtaDJPuGSxZR+aO3l1f0eMpk1Pv832OMVNMQ0b9C31iKrTJylGYdR7VC
         2etQ==
X-Gm-Message-State: AOJu0YwV3wt6g3zTmLMyMArfYti3CYXhIZO8+nkRpcl26kQW3TKMDYNW
	tjtsFhXQnBg0F0+b/A8qHDukOlQICSY3mQ==
X-Google-Smtp-Source: AGHT+IGZCHN9Av1WNlNPUdB6KQ1jk2qnXWzZ7w5vQl8+w8WwvKce7rZQQlWFz/cP/YGLrakvB1D3SA==
X-Received: by 2002:a17:902:d50b:b0:1d4:32d8:ea78 with SMTP id b11-20020a170902d50b00b001d432d8ea78mr22084129plg.79.1704321638123;
        Wed, 03 Jan 2024 14:40:38 -0800 (PST)
Received: from localhost (75-172-121-199.tukw.qwest.net. [75.172.121.199])
        by smtp.gmail.com with ESMTPSA id u17-20020a170903125100b001cfa0c04553sm24071484plh.116.2024.01.03.14.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 14:40:37 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Minda Chen <minda.chen@starfivetech.com>, Conor Dooley
 <conor@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring
 <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Daire
 McNamara <daire.mcnamara@microchip.com>, Emil Renner Berthing
 <emil.renner.berthing@canonical.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
 <mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Kevin Xie <kevin.xie@starfivetech.com>, Minda Chen
 <minda.chen@starfivetech.com>
Subject: Re: [PATCH v13 0/21] Refactoring Microchip PCIe driver and add
 StarFive PCIe
In-Reply-To: <20231214072839.2367-1-minda.chen@starfivetech.com>
References: <20231214072839.2367-1-minda.chen@starfivetech.com>
Date: Wed, 03 Jan 2024 14:40:36 -0800
Message-ID: <7hfrzeavmj.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_144040_169095_AF6A955A 
X-CRM114-Status: UNSURE (   7.07  )
X-CRM114-Notice: Please train this message.
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

Minda Chen <minda.chen@starfivetech.com> writes:

> This patchset final purpose is add PCIe driver for StarFive JH7110 SoC.
> JH7110 using PLDA XpressRICH PCIe IP. Microchip PolarFire Using the
> same IP and have commit their codes, which are mixed with PLDA
> controller codes and Microchip platform codes.

Thank you for this series.

I tested this on a VisionFive v2 board, and it seems to probe and find my
M.2 NVMe SSD, but then gets timeouts when trying to use the NVMe
(e.g. 'blkid' command)

Kernel logs below.

Kevin

[   15.131094] pcie-starfive 9c0000000.pcie: host bridge /soc/pcie@9c0000000 ranges:
[   15.138637] pcie-starfive 9c0000000.pcie:      MEM 0x0038000000..0x003fffffff -> 0x0038000000
[   15.147180] pcie-starfive 9c0000000.pcie:      MEM 0x0980000000..0x09bfffffff -> 0x0980000000
[   15.368040] pcie-starfive 9c0000000.pcie: port link up
[   15.374219] pcie-starfive 9c0000000.pcie: PCI host bridge to bus 0001:00
[   15.380944] pci_bus 0001:00: root bus resource [bus 00-ff]
[   15.386443] pci_bus 0001:00: root bus resource [mem 0x38000000-0x3fffffff]
[   15.393330] pci_bus 0001:00: root bus resource [mem 0x980000000-0x9bfffffff pref]
[   15.400882] pci 0001:00:00.0: [1556:1111] type 01 class 0x060400
[   15.407165] pci 0001:00:00.0: supports D1 D2
[   15.411447] pci 0001:00:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   15.419964] pci 0001:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[   15.428245] pci 0001:01:00.0: [126f:2263] type 00 class 0x010802
[   15.434331] pci 0001:01:00.0: reg 0x10: [mem 0x00000000-0x00003fff 64bit]
[   15.441578] pci 0001:01:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at 0001:00:00.0 (capable of 31.504 Gb/s with 8
.0 GT/s PCIe x4 link)
[   15.456910] pci_bus 0001:01: busn_res: [bus 01-ff] end is updated to 01
[   15.463553] pci 0001:00:00.0: BAR 8: assigned [mem 0x38000000-0x380fffff]
[   15.470352] pci 0001:01:00.0: BAR 0: assigned [mem 0x38000000-0x38003fff 64bit]
[   15.477699] pci 0001:00:00.0: PCI bridge to [bus 01]
[   15.482686] pci 0001:00:00.0:   bridge window [mem 0x38000000-0x380fffff]
[   15.489632] pcieport 0001:00:00.0: enabling device (0000 -> 0002)
[   15.496038] pcieport 0001:00:00.0: PME: Signaling with IRQ 56
[   15.502472] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[   15.509755] usb usb2-port2: over-current condition
[   15.515883] nvme nvme0: pci function 0001:01:00.0
[   15.520615] nvme 0001:01:00.0: enabling device (0000 -> 0002)
[   15.532685] nvme nvme0: allocated 64 MiB host memory buffer.
[   15.550070] nvme nvme0: 4/0/0 default/read/poll queues
[   15.562992] nvme nvme0: Ignoring bogus Namespace Identifiers
[   15.663327] hub 1-1:1.0: USB hub found
[   15.667320] hub 1-1:1.0: 4 ports detected

[   46.064052] nvme nvme0: I/O 424 QID 3 timeout, completion polled

[   76.784046] nvme nvme0: I/O 425 (I/O Cmd) QID 3 timeout, aborting
[   76.790179] nvme nvme0: I/O 426 (I/O Cmd) QID 3 timeout, aborting
[   76.796294] nvme nvme0: I/O 427 (I/O Cmd) QID 3 timeout, aborting
[   76.802411] nvme nvme0: I/O 428 (I/O Cmd) QID 3 timeout, aborting
[   76.808525] nvme nvme0: I/O 429 (I/O Cmd) QID 3 timeout, aborting


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
