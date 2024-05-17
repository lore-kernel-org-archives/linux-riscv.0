Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922A3C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 11:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hThIWHP7qV0PEJLSFbgHljjoQVNiWCVfJp7xSPPdzg8=; b=Hjr4ya7lIZjsra
	S/MRq0Oj7aXf9mf6JuXvs3p85s3836xyPu6cXU99bd9FRpLneGDyGi6wE90jnn6T5zr7sd6mStAce
	S3Dr0NLWZgLv5+k4OUxWgDe7k7aTsOiDEt6XKxVoXW9quuRWO4+5vGPseBq/qzECpse+qmAXQ3FDB
	Gb+8O1EsNA1wkueA+Ghdp78I43x/NcWI6tOrJkanUTCeu8FPNPfQ1IDd2kk4nhGICYWaTwjuCjPSu
	BkQoMoqFiEgqroCppGaB+I2l4HgAZ4uB4Kp2DH1y/KDyeqMyYzlXUYUhotLhkyK7s2vW5e0blT3AJ
	2nsZs6aOCinljA9d9VLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7vZg-00000007cOG-1X9G;
	Fri, 17 May 2024 11:16:32 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7vZd-00000007cNm-0CRb
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 11:16:30 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ee7963db64so5015325ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 04:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715944588; x=1716549388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uM5/EWorMlMeij6RhB6j/f4ZuioOE/OA53wAKnmrl34=;
        b=t2JQd5icL2NmZoLFrr3MVvwsNcjHrm87kQ54fGd3wZuy62S5s4GLP5P2tElK8gV6z6
         8TI8uj17nMO/3C9dfaiwT1D1lVHOs0UddPR+uccklh6ZlQ5OEIF+BWr+tuUHczfUCRqn
         3SHFYKU/sopUZqWadlI0lw4WOtNi3SNsru7msKFF0WxUNPzhsTzjbk1CcJbO6PQQd3fZ
         sosIpLXf6BdLMcqmT6DyL6hBryQqFHK3VzgX/hL+Gqwi2foO1LFkIsfFuEC1+d3xGNc8
         unUn9qafL0V2mLzeyWRKCcDdwJUIomWaXbv0lgYFXXXL17VuYmTuBqXeFtlsAx9aHqAw
         ie+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkHqAZ4PXRm/WvNaMtSg+QW5eSAynJIFqSdLWSuLKhO65LmooCE46mDwSOZJ4YmqKdFqKfzuN3fiWmpj6rMak/kmjW1CYsD079PD7yIesH
X-Gm-Message-State: AOJu0Yxd0bt3EYg3lunbC+N+TB5tT+d4D+Bf9PswqOSz8qfeYOKiy3m9
	qN0OFe6KuWOvzrYUX4HjCjocu8WwBR16DrObx/qGjXnUkMBjagL5
X-Google-Smtp-Source: AGHT+IE/H8dabmSgLuU/yv52WzguCq/CXaLL9ZLastuGGvuASE6dILZc3r3z312dhBfjhGMP+ogM0g==
X-Received: by 2002:a05:6a00:4fcb:b0:6ed:4a97:5dec with SMTP id d2e1a72fcca58-6f4e02981demr26839016b3a.20.1715944588012;
        Fri, 17 May 2024 04:16:28 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2a98sm14463913b3a.169.2024.05.17.04.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 04:16:27 -0700 (PDT)
Date: Fri, 17 May 2024 20:16:26 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v16 00/22] Refactoring Microchip PCIe driver and add
 StarFive PCIe
Message-ID: <20240517111626.GP202520@rocinante>
References: <20240328091835.14797-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328091835.14797-1-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_041629_213533_B52B8CB1 
X-CRM114-Status: UNSURE (   8.27  )
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

Hello,

> This patchset final purpose is add PCIe driver for StarFive JH7110 SoC.
> JH7110 using PLDA XpressRICH PCIe IP. Microchip PolarFire Using the
> same IP and have commit their codes, which are mixed with PLDA
> controller codes and Microchip platform codes.
> 
> For re-use the PLDA controller codes, I request refactoring microchip
> codes, move PLDA common codes to PLDA files.
> Desigware and Cadence is good example for refactoring codes.

Applied to controller/microchip, thank you!

[01/21] dt-bindings: PCI: Add PLDA XpressRICH PCIe host common properties
        https://git.kernel.org/pci/pci/c/0ce827c82eea
[02/21] dt-bindings: PCI: Add StarFive JH7110 PCIe controller
        https://git.kernel.org/pci/pci/c/91b4524c9135
[03/21] PCI: Add PCIE_RESET_CONFIG_DEVICE_WAIT_MS waiting time value
        https://git.kernel.org/pci/pci/c/4b83a1379e8c
[04/21] PCI: microchip: Move pcie-microchip-host.c to PLDA directory
        https://git.kernel.org/pci/pci/c/ced442bf0124
[05/21] PCI: microchip: Move PLDA IP register macros to pcie-plda.h
        https://git.kernel.org/pci/pci/c/571f57cc281c
[06/21] PCI: microchip: Add bridge_addr field to struct mc_pcie
        https://git.kernel.org/pci/pci/c/73c9dcd35dd8
[07/21] PCI: microchip: Rename two PCIe data structures
        https://git.kernel.org/pci/pci/c/e92d66e0aa1e
[08/08] PCI: microchip: Move PCIe host data structures to plda-pcie.h
        https://git.kernel.org/pci/pci/c/79c0d7d53a51
[09/21] PCI: microchip: Rename two setup functions
        https://git.kernel.org/pci/pci/c/082bda75f7b0
[10/21] PCI: microchip: Change the argument of plda_pcie_setup_iomems()
        https://git.kernel.org/pci/pci/c/9251a0b72188
[11/21] PCI: microchip: Move setup functions to pcie-plda-host.c
        https://git.kernel.org/pci/pci/c/047cc7da3a25
[12/21] PCI: microchip: Rename interrupt related functions
        https://git.kernel.org/pci/pci/c/ddac0618211f
[13/21] PCI: microchip: Add num_events field to struct plda_pcie_rp
        https://git.kernel.org/pci/pci/c/cb90f7f6145b
[14/21] PCI: microchip: Add request_event_irq() callback function
        https://git.kernel.org/pci/pci/c/0ffbe1c70551
[15/21] PCI: microchip: Add INTx and MSI event num to struct plda_event
        https://git.kernel.org/pci/pci/c/9932c5d45e5a
[16/21] PCI: microchip: Add get_events() callback and add PLDA get_event()
        https://git.kernel.org/pci/pci/c/170407afbcc4
[17/21] PCI: microchip: Add event irqchip field to host port and add PLDA irqchip
        https://git.kernel.org/pci/pci/c/5e33af45dbcb
[18/21] PCI: microchip: Move IRQ functions to pcie-plda-host.c
        https://git.kernel.org/pci/pci/c/4e47aaf7afed
[19/21] PCI: plda: Add event bitmap field to struct plda_pcie_rp
        https://git.kernel.org/pci/pci/c/008d2bc41e3c
[20/21] PCI: plda: Add host init/deinit and map bus functions
        https://git.kernel.org/pci/pci/c/d86b148a401c
[21/21] PCI: starfive: Add JH7110 PCIe controller
        https://git.kernel.org/pci/pci/c/e6e7b974e425

	Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
