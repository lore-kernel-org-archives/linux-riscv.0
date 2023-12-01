Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EA2C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 15:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70M13DZkcOCv6rLLqYsJ3uv/JdttDzF9lFYwPL16l6w=; b=Q90bwkVkOjhC1G
	1G3GwixAPyLT4W7x7z4jE85ePv0B5fb9CYjzJo+t4hOQ/Wa/Ib/ytxl/x2dPZJSAEI3UAa+ws24Xu
	dd+A4JBflc6sQ21IsU/ye3ZE3EHPhAic3OAi3wwTBgggDZrggOk3P5CzqLoc/4lwceQ3w83lhiA1e
	d5SSyFZHExfnNjOck8qNZsaSIAX8rQck9QJ+X2MvLm6qGLsJK9t4QMnK8aopCg0U2S0H8OLzX/r2o
	eZvmkIqlJzPJAFaUtAfdg8jTGCvgl8wLGtJIAJXKFX0uRqLqypRa16863ya2ef2A7SgptCITHEXVn
	9os4xBFHI+VTETSE5FFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r95V6-00E3ED-0s;
	Fri, 01 Dec 2023 15:32:20 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r95V2-00E3Cn-2Q
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 15:32:18 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a1975fe7befso176317466b.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Dec 2023 07:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscv-rocks.de; s=google; t=1701444732; x=1702049532; darn=lists.infradead.org;
        h=organization:user-agent:in-reply-to:content-disposition
         :mime-version:references:mail-followup-to:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q3KsEv2cVoEftyN++WY2K2fr8jr0i0yk0+SwSXCnFyU=;
        b=SZP8AwyVNfJeC3BZPgpAwn7cU5cQHDOvKY+EzOX9eUdXW2Vj0Inc2oQxPAKb1Vj9oB
         v2hVVJ+r7bZAc1/dF+UNFFvf/BIdh3UuqgUd3tfWkDeOGjn3Q6a5br7+bqU/NtbuIPWw
         pjCA/RIsTeMgA78rl0MMyEmY5RauVqukPF2fy5ZyDu3kvAM4u5Ha2vsHSkyByGCudvuh
         0X9GiCv94kF1la01DALj3VOPGJ9HWpelEGPLrnyGs14fqEsCKg77qYOlVzNovVa2kBNq
         mtK57JbtOzCuJ428PInziuWcgSupKf7gOwFfQc5R5iRNO+XrH2Sc/cTreZqV4EPiMmIJ
         WAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701444732; x=1702049532;
        h=organization:user-agent:in-reply-to:content-disposition
         :mime-version:references:mail-followup-to:reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3KsEv2cVoEftyN++WY2K2fr8jr0i0yk0+SwSXCnFyU=;
        b=mtvTpiNXGlpJoV/quV17SMLfjMzfcBy0Iy4lj2mVQ4+v4fi9XA3lp2KJk7h9dSdvd9
         ECFwvXS0SuYon7JIZCSp3wWsq9V7TYsGhQq31Jj+sd6coxGifjozGOVvAZwQxXZWCmBZ
         OnF6DVltTeUc7YOiRbOmvoxE8/4eh8ZLs//B9YxO0eUrTlnwKwQGgEjtKz94YRqP6uI9
         xK1OHRioMgZxxleinSvTi1sXfStBVLbg9DPtFemjkyTaglp2Lka+Hdu0czL5l1tReOuy
         rqBXi3/4pJ3PE849LHqcRQzeDw2SfGZb3jF/k3fMRrrNbXjJKXFipaNR7P57eF4aUZ7h
         RkJQ==
X-Gm-Message-State: AOJu0YyBdfoyKMh/OMMc+TU1uyXP6TWw70NGEKbq9mDnkQZbwhM4mesf
	glN3pg08Bn+DVmvkycdXNP5djg==
X-Google-Smtp-Source: AGHT+IEkD8H9uGPedmNIcnnA4/Oz3WPKsm6sEWcGUC1DOB+7eeNzBcMEwwwUbPJ0qHsofNULbwqs9Q==
X-Received: by 2002:a17:906:74ca:b0:a18:48ec:a6bf with SMTP id z10-20020a17090674ca00b00a1848eca6bfmr1004857ejl.56.1701444732258;
        Fri, 01 Dec 2023 07:32:12 -0800 (PST)
Received: from fedora.fritz.box (p549451cc.dip0.t-ipconnect.de. [84.148.81.204])
        by smtp.gmail.com with ESMTPSA id h18-20020a170906111200b00a0d02cfa48bsm2002367eja.213.2023.12.01.07.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:32:11 -0800 (PST)
Date: Fri, 1 Dec 2023 16:32:09 +0100
From: Damian Tometzki <damian@riscv-rocks.de>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
Subject: Re: [PATCH v11 0/20] Refactoring Microchip PCIe driver and add
 StarFive PCIe
Message-ID: <ZWn8ebtIDrGF9P5i@fedora.fritz.box>
Mail-Followup-To: Minda Chen <minda.chen@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
References: <20231115114912.71448-1-minda.chen@starfivetech.com>
 <ZWbcjKiSfvp-74CL@fedora.fritz.box>
 <ZWchVSO6iQbCFwkp@fedora.fritz.box>
 <1168e373-b049-4c17-9cbd-c588bf913bbb@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1168e373-b049-4c17-9cbd-c588bf913bbb@starfivetech.com>
User-Agent: Mutt
X-Operating-System: Linux Fedora release 39 (Thirty Nine) (Kernel
 6.6.2-201.fc39.x86_64)
Organization: Linux hacker
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_073216_823179_C1E2A813 
X-CRM114-Status: GOOD (  39.67  )
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
Reply-To: Damian Tometzki <damian@riscv-rocks.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 01. Dec 15:15, Minda Chen wrote:
> 
> 
> On 2023/11/29 19:32, Damian Tometzki wrote:
> > On Wed, 29. Nov 07:39, Damian Tometzki wrote:
> >> Hello Minda,
> >> 
> >> i tried this Patchset on Linux-6.6.3 but boot with nvme doesnt work. Linux doesnt find
> >> /root partition /dev/nvme0n1p4. 
> >> I dont know if it has anything to do with this patchset ?
> >> Best regards
> >> Damian
> > Hi,
> > some additional information: 
> > Begin: Running /scripts/local-block ... done.
> > Begin: Running /scripts/local-block ... done.
> > [   11.097653] /soc/pcie@940000000: Failed to get clk index: 1 ret: -517
> > [   11.104147] pcie-starfive 940000000.pcie: error -ENODEV: failed to get pcie clocks
> > [   11.111981] /soc/pcie@9c0000000: Failed to get clk index: 1 ret: -517
> > [   11.118451] pcie-starfive 9c0000000.pcie: error -ENODEV: failed to get pcie clocks
> > [   11.126371] platform 17020000.pinctrl: deferred probe pending
> > [   11.132145] platform 16010000.mmc: deferred probe pending
> > Begin: Running /scripts/local-block ... done.
> > Begin: Running /scripts/local-block ... done.
> > 
> > Damian
> > 
> It is get stg clk failed. Did you enable CONFIG_CLK_STARFIVE_JH7110_STG=y?
Hi,

it is now a little bit better now i get: 
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
Begin: Running /scripts/local-premount ... done.
Begin: Waiting for root file system ... Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
[   13.916056] platform 940000000.pcie: deferred probe pending
[   13.921668] platform 9c0000000.pcie: deferred probe pending
[   13.927259] platform 16010000.mmc: deferred probe pending
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.
Begin: Running /scripts/local-block ... done.

Damian

> >> 
> >> On Wed, 15. Nov 19:48, Minda Chen wrote:
> >> > This patchset final purpose is add PCIe driver for StarFive JH7110 SoC.
> >> > JH7110 using PLDA XpressRICH PCIe IP. Microchip PolarFire Using the
> >> > same IP and have commit their codes, which are mixed with PLDA
> >> > controller codes and Microchip platform codes.
> >> > 
> >> > For re-use the PLDA controller codes, I request refactoring microchip
> >> > codes, move PLDA common codes to PLDA files.
> >> > Desigware and Cadence is good example for refactoring codes.
> >> > 
> >> > ----------------------------------------------------------
> >> > The refactoring patches total number is 16,(patch 1-16)
> >> > which do NOT contain changing logic of codes.
> >> > 
> >> > These patches just contain three type basic operations.
> >> > (rename, modify codes to support starfive platform, and moving to common file)
> >> > If these patched are all be reviewed. They can be accepted first.
> >> > 
> >> > Refactoring patches can be devided to different groups
> >> > 1. (patch 1- 3 is the prepare work of refactoring)
> >> > patch1 is move PLDA XpressRICH PCIe host common properties dt-binding
> >> >        docs from microchip,pcie-host.yaml
> >> > patch2 is move PolarFire codes to PLDA directory.
> >> > patch3 is move PLDA IP register macros to plda-pcie.h
> >> > 
> >> > 2. (patch4 - 6 is processing and re-use PCIe host instance)
> >> > patch4 is add bridge_addr field to PCIe host instance.
> >> > patch5 is rename data structure in microchip codes.
> >> > patch6 is moving two data structures to head file
> >> > 
> >> > 3. (patch 7 - 9 are for re-use two PCIe setup function)
> >> > patch7 is rename two setup functions in microchip codes, prepare to move
> >> > to common file.
> >> > patch8 is change the arguments of plda_pcie_setup_iomems()
> >> > patch9 is move the two setup functions to common file pcie-plda-host.c
> >> > 
> >> > 4.(patch 10 - 16 are for re-use interupt processing codes)
> >> > patch10 is rename the IRQ related functions, prepare to move to
> >> > pcie-plda-host.c
> >> > patch 11 - 15 is modify the interrupt event codes, preparing for support starfive
> >> > and microchip two platforms.
> >> > patch16 is move IRQ related functions to pcie-plda-host.c
> >> > 
> >> > ------------------------------------------------------------
> >> > The remainder patches (patch 17 -20) are not refactoring patch.
> >> > They are for adding StarFive codes and dont modify the microchip's
> >> > codes.
> >> > 
> >> > patch17 is Add PLDA event interrupt codes and host init/deinit functions.
> >> > patch18 is add StarFive JH7110 PCIe dt-binding doc.
> >> > patch19 is add StarFive JH7110 Soc PCIe codes.
> >> > patch20 is Starfive dts config
> >> > 
> >> > This patchset is base on v6.7-rc1
> >> > 
> >> > previous version:
> >> > v6:https://patchwork.kernel.org/project/linux-pci/cover/20230915102243.59775-1-minda.chen@starfivetech.com/
> >> > v7:https://patchwork.kernel.org/project/linux-pci/cover/20230927100802.46620-1-minda.chen@starfivetech.com/
> >> > v8:https://patchwork.kernel.org/project/linux-pci/cover/20231011110514.107528-1-minda.chen@starfivetech.com/
> >> > v9:https://patchwork.kernel.org/project/linux-pci/cover/20231020104341.63157-1-minda.chen@starfivetech.com/
> >> > v10:https://patchwork.kernel.org/project/linux-pci/cover/20231031115430.113586-1-minda.chen@starfivetech.com/
> >> > 
> >> > change:
> >> >   v11:
> >> >      check and modify some commit messages again.
> >> >      All the codes are the same with v10.   
> >> > 
> >> >   v10:
> >> >    All the commit message set to fit in 75 columns.
> >> >    All the codes fit in less than 80 colunms.
> >> >    patch 14: 
> >> > 	Commit message changes suggested by Conor.
> >> >    patch 19:
> >> >         Add 100 ms delay macro to pci.h
> >> > 	generic phy pointer related codes moving to pcie-starfive.c
> >> > 	This patch Change pcie-starfive only, bus_ops move to patch 16.
> >> > 	Some Codes changes suggested by Bjorn.
> >> > 
> >> >   v9:
> >> >    v8 patch 10 squash to v9 patch 12, v8 patch 18 squash to v9 patch 16.
> >> >    patch 4 - 16: Add new review tags and add more accurate commit messages.
> >> >    patch 17: move the plda_pcie_host_init/deinit from patch 19. Make
> >> >              plda driver become to whole driver.
> >> > 
> >> >   v8:
> >> >     The patch description in cover-letter has been changed.
> >> > 
> >> >     v7 patch 4 split to v8 patch 4 - 6.
> >> >         (It is patches about re-use pcie host data structure, new patches just contain one
> >> > 	function modification. It is more reguluar and easier to review).
> >> > 
> >> >     patch 7- 9: modify the commit messages and add reason of
> >> > 		modifcation.
> >> >     patch10- 16 :
> >> >              Add review tag and add more commit messages to declear the
> >> > 	     reason of modifying the codes.
> >> >     patch17: plda_handle_events() using bit mask macro. The function are
> >> > 	     easier to read.
> >> > 
> >> >   v7:
> >> >     patch17: fix the build warning.
> >> >     patch19: Some format changes (Emil's comment)
> >> >     patch20: change the pcie node sequences by alphabetical
> >> >              delete the "interupt-parent" in pcie node.
> >> > 
> >> >   v6:
> >> >     v5 patch 4 split to patch 4 -9. New patches just contain one function modification. It is more reguluar.
> >> > 
> >> >     patch 9: Just move the two setup functions only
> >> >     patch 19 : draw a graph of PLDA local register, make it easier to
> >> >                review the codes.
> >> >     v5 patch 7 split to patch 10- 16. Each patch just contain one
> >> >                 function modification. It is more regular.
> >> >     patch 10: rename IRQ related functions.
> >> >     patch 11 - 15 : modify the events codes, total five patch.
> >> >     patch 16: move IRQ related functions to pcie-plda-host.c
> >> >     patch 19- 20 using "linux,pci-domain" dts setting.
> >> > 
> >> > Minda Chen (20):
> >> >   dt-bindings: PCI: Add PLDA XpressRICH PCIe host common properties
> >> >   PCI: microchip: Move pcie-microchip-host.c to plda directory
> >> >   PCI: microchip: Move PLDA IP register macros to pcie-plda.h
> >> >   PCI: microchip: Add bridge_addr field to struct mc_pcie
> >> >   PCI: microchip: Rename two PCIe data structures
> >> >   PCI: microchip: Move PCIe host data structures to plda-pcie.h
> >> >   PCI: microchip: Rename two setup functions
> >> >   PCI: microchip: Change the argument of plda_pcie_setup_iomems()
> >> >   PCI: microchip: Move setup functions to pcie-plda-host.c
> >> >   PCI: microchip: Rename interrupt related functions
> >> >   PCI: microchip: Add num_events field to struct plda_pcie_rp
> >> >   PCI: microchip: Add request_event_irq() callback function
> >> >   PCI: microchip: Add INTx and MSI event num to struct plda_event
> >> >   PCI: microchip: Add get_events() callback function
> >> >   PCI: microchip: Add event IRQ domain ops to struct plda_event
> >> >   PCI: microchip: Move IRQ functions to pcie-plda-host.c
> >> >   PCI: plda: Add event interrupt codes and host init/deinit functions
> >> >   dt-bindings: PCI: Add StarFive JH7110 PCIe controller
> >> >   PCI: starfive: Add JH7110 PCIe controller
> >> >   riscv: dts: starfive: add PCIe dts configuration for JH7110
> >> > 
> >> >  .../bindings/pci/microchip,pcie-host.yaml     |  55 +-
> >> >  .../pci/plda,xpressrich3-axi-common.yaml      |  75 ++
> >> >  .../bindings/pci/starfive,jh7110-pcie.yaml    | 120 ++++
> >> >  MAINTAINERS                                   |  19 +-
> >> >  .../jh7110-starfive-visionfive-2.dtsi         |  64 ++
> >> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  86 +++
> >> >  drivers/pci/controller/Kconfig                |   9 +-
> >> >  drivers/pci/controller/Makefile               |   2 +-
> >> >  drivers/pci/controller/plda/Kconfig           |  29 +
> >> >  drivers/pci/controller/plda/Makefile          |   4 +
> >> >  .../{ => plda}/pcie-microchip-host.c          | 602 ++--------------
> >> >  drivers/pci/controller/plda/pcie-plda-host.c  | 657 ++++++++++++++++++
> >> >  drivers/pci/controller/plda/pcie-plda.h       | 266 +++++++
> >> >  drivers/pci/controller/plda/pcie-starfive.c   | 460 ++++++++++++
> >> >  drivers/pci/pci.h                             |   7 +
> >> >  15 files changed, 1851 insertions(+), 604 deletions(-)
> >> >  create mode 100644 Documentation/devicetree/bindings/pci/plda,xpressrich3-axi-common.yaml
> >> >  create mode 100644 Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> >> >  create mode 100644 drivers/pci/controller/plda/Kconfig
> >> >  create mode 100644 drivers/pci/controller/plda/Makefile
> >> >  rename drivers/pci/controller/{ => plda}/pcie-microchip-host.c (54%)
> >> >  create mode 100644 drivers/pci/controller/plda/pcie-plda-host.c
> >> >  create mode 100644 drivers/pci/controller/plda/pcie-plda.h
> >> >  create mode 100644 drivers/pci/controller/plda/pcie-starfive.c
> >> > 
> >> > 
> >> > base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
> >> > -- 
> >> > 2.17.1
> >> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
