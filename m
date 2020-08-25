Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEF3C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 16:03:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A76F220782
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 16:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AhydbfDn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="okyPVVy7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A76F220782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=5KdLLiT027OxVEJTgMmzY9wJKQMkzoORWnU469VY3N4=; b=AhydbfDnYl9LIex9N5Pt/YAoA
	GqUk2UacgG+f6Y8XRmnKc7MJN9gAAYb4xczTL8zx1SICuFhvrsuA1//6/ME9yxkYTBhQepAr7V88n
	WerM7XvcWP4a/QY4xyJsOQh9u+JI2ufKGqiLLC/75UGxOX8b4V0pk7HPCXDvM463EdsDX7ie04yWz
	ITAfRF61SRzfcCWVyXY4RHDbX48+jJa6xvk65cqbL3Vk73rsmJKgfqHW4T6QQ6LlP201DwTZ/aAoc
	mr5B3bJpspsyGbFIewAqWvRKLxAaFDt1axF1AxXtYztD49aOAldF5i7VxQ4WHumTr/YqUBZXykV6m
	/c/OjPbTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAbPY-000492-Cy; Tue, 25 Aug 2020 16:03:00 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAbPV-000472-1t
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 16:02:58 +0000
Received: by mail-pj1-x1042.google.com with SMTP id 2so1477712pjx.5
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 09:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Ev7YebnrMJC5hGp27fNNwdoImL+JDFARELNBma0/uAA=;
 b=okyPVVy74yhlMZQCWF4kzfTd4X55KXDYOqzLJQnAIW0h1IFAYQXbSPLOVAMXMA3C3j
 tL/HLBWDHQzpJj4ci2GUYu5lisDQtceXxLtpRS3C1N6QiXc629q7MzAhIlKzsE/O6Jxp
 hxXjODLVSsA6omJuJUBYBjG3837I0mbscmwd9DDiSmJNrH7kgNiRNwtZuorFkk/LFb9S
 8UetkH/uOhJseG0AECV3EuEvJy1vGwu2TbWICNUOLQB0uPtfvydMA8RjobjPyJ5HGasI
 na6uzBxKd/6d/1odYvw97QotgbrYy+3q+PDbivrnLe7VTnK7Y1ItmndVIMa2H90PXS1/
 vWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Ev7YebnrMJC5hGp27fNNwdoImL+JDFARELNBma0/uAA=;
 b=GHqN8LS27998MSSNYXdAtXPNAU13U3LWac14t+eEuU8rLEmw8OGWsKik5Ox4NC0hcu
 sgaFSlJhHuXUW1lROp9Wp7AbWVqqhdSxlCxWU6nGP9Weash1rF+kFIja0QUg2AMT3Olf
 eKINl64WQerqeUfG4ZyhD39nsq4mFxqpOMf/IBiX0zqc/SbTiLdoXZG6STmD0U7BvXFh
 OEMIQu7/GHG76ksUos0XxWe3cwWiDiM8grrDTAcgxwi/3fCDl+BWxFqhbmaXSgD85SVx
 iizjLecAa68zD2n5Eo/niXBmu5OKCXjuzn3Rw7KzJRpUR5E+bFkY8kHD7DRDi4j2ohqw
 4aGQ==
X-Gm-Message-State: AOAM530jnX7eYcOH8st/eVpq3JhSSKJToQZuWXbmDmBA3JSaYnEmMW+M
 9kVHH2wg6Ny3DaF3fXmkFOB9yA==
X-Google-Smtp-Source: ABdhPJxVMLNNcoGNUamsRb6XNuw5Pw/vE4Xo0oCs/JaO+Bek+U4WRn0q62JXgjoWyYfGNhJmC9XG0Q==
X-Received: by 2002:a17:90a:f994:: with SMTP id
 cq20mr2218207pjb.229.1598371375255; 
 Tue, 25 Aug 2020 09:02:55 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t19sm15483792pfq.179.2020.08.25.09.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 09:02:54 -0700 (PDT)
Date: Tue, 25 Aug 2020 09:02:54 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Aug 2020 09:02:48 PDT (-0700)
Subject: Re: [PATCH 0/3] SiFive DDR controller and EDAC support
In-Reply-To: <1598357182-4226-1-git-send-email-yash.shah@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: yash.shah@sifive.com
Message-ID: <mhng-eeb15e05-0af6-42bd-8c35-0b7e9bbedba7@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_120257_143776_E3F48EAD 
X-CRM114-Status: GOOD (  20.78  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, tony.luck@intel.com,
 linux-kernel@vger.kernel.org, rrichter@marvell.com, sachin.ghadi@sifive.com,
 yash.shah@sifive.com, robh+dt@kernel.org, bp@alien8.de,
 Paul Walmsley <paul.walmsley@sifive.com>, james.morse@arm.com,
 linux-riscv@lists.infradead.org, mchehab@kernel.org, aou@eecs.berkeley.edu,
 linux-edac@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 25 Aug 2020 05:06:19 PDT (-0700), yash.shah@sifive.com wrote:
> The series add supports for SiFive DDR controller driver. This driver
> is use to manage the Cadence DDR controller present in SiFive SoCs.
> Currently it manages only the EDAC feature of the DDR controller.
> The series also adds Memory controller EDAC support for SiFive platform.
> It register for notifier event from SiFive DDR controller driver.
>
> The series is tested and based on Linux v5.8.
>
> For testing on Hifive Unleashed:
> 1. Enable the ECC bit of DDR controller during DDR initialization
> 2. Erase the entire DRAM in bootloader stage
> 3. Using FWC feature of DDR controller force ecc error to test
>
> Yash Shah (3):
>   dt-bindings: riscv: Add DT documentation for DDR Controller in SiFive
>     SoCs
>   soc: sifive: Add SiFive specific Cadence DDR controller driver
>   edac: sifive: Add EDAC support for Memory Controller in SiFive SoCs
>
>  .../devicetree/bindings/riscv/sifive-ddr.yaml      |  41 ++++
>  drivers/edac/Kconfig                               |   2 +-
>  drivers/edac/sifive_edac.c                         | 117 ++++++++++++
>  drivers/soc/sifive/Kconfig                         |   6 +
>  drivers/soc/sifive/Makefile                        |   3 +-
>  drivers/soc/sifive/sifive_ddr.c                    | 207 +++++++++++++++++++++
>  include/soc/sifive/sifive_ddr.h                    |  73 ++++++++
>  7 files changed, 447 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-ddr.yaml
>  create mode 100644 drivers/soc/sifive/sifive_ddr.c
>  create mode 100644 include/soc/sifive/sifive_ddr.h

Thanks.  These look good to me and I'm happy to take them through the RISC-V
tree, but I'm going to wait for a bit to see if there are any comments from the
maintainers of the various subsystems before doing so.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
