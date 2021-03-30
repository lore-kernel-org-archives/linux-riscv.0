Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E834C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 04:17:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2060B61928
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 04:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2060B61928
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=eo6iSPnLHcEY/dDBBpzCYQ0Iq3btyRJro9LnvxyxLkQ=; b=LbRJiPXhC7/JKzXKuOq5nvjaZ
	kOo5yVMG5UuuxwisLovqdYEAEaIsOa6uerhG73BTUQTKYtbOS0nHei3CRRZpbAA3VqOF96xkdZbvW
	YgNYCTNJlJSEMOZs8mOlRFkjzQUBoifJIB4VgMH0szUN2/dBaTsHCC3d0DLCARwZXDofG0EKF/qi/
	T6yNrDNo0GOHwgbcutW7kJLBIbtFwQe2ibjbhJeJexoU6BikVIwJArfjb6GriPkmVws0cio8SG0mZ
	3VNCPUKO8ffQwHPnivaFue1KM5Id4Y/uSCeUF6KXikFc7lOqc9VD6Xygkyzp+k1QX1Sz1ADd1AXat
	NPWqfJcnA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR5od-002fHx-Er; Tue, 30 Mar 2021 04:17:19 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR5oV-002fGp-3c
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 04:17:14 +0000
Received: by mail-pj1-x1030.google.com with SMTP id s21so7080824pjq.1
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 21:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=OcWd55xebTB24sreroD1qZpawyCTv8UZHAXK2ERvy9s=;
 b=p0/I8NtbVXDYOy0fZXab6O6OcOeyt+XL9Tiexg8Xl9B7lZsk+TS25ANjTmI3whnBoO
 R+H3Nai5/XFBJqm/2aeGprfAWQFvqG7SEZmplaOuvLT/8+jLT5NOd0JRfYJ/GR82qRjt
 RGyghFpbcvu5ww73BMBf2epVAuPPWuahAjzVrdmsYzy5v7YzjYQDF8Trj8a/fnVqAA+M
 ncqYQZWA1431ey+T8xOZbByurfUzeGd5E/L2S+98JHO91zaT5w9yaLbCqLibCFk2P9AR
 055yixsDsO5M2JXengGxYICdP9t4yZfO3S7/Mes5DLmNU6MzOLbBKcseXFGvYUv8dPqC
 1HQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=OcWd55xebTB24sreroD1qZpawyCTv8UZHAXK2ERvy9s=;
 b=FsKgIfLkSdT2MqrWKLngbpYpJvh+s4MUlrKu5qEcEFRiH5NvM0kWBG9rle64rQjixO
 SpouUOMHBOgBZIobUFfatltiF4ku1OCyfTnkDwFqtGOiw7jXMuH7D7/bvKxdAmdgujwO
 aQhc5FyxUlkAhtSgjIQcL7iZOzAJVuedAEOdXNxx/hs0cMPlMg9bnK0kCyf34GR9pQrU
 2og4yaZL+I1MEZwYe5YDlPkWyvoIzVQM4qytwPqHUxlZf3xBPb3bdgmBkD/buS2B/wUs
 nqRjNwpzJZhnJFuyVDCGysQlZCv7aox5aCm9X4eGqbWd+mEN47tTHH2VD9kHdktgLMBP
 MMpQ==
X-Gm-Message-State: AOAM531bmjLLSwZ3iNyQzbHz66y4Wri6rA+LzHlfu2tY5dXed9/BAWbQ
 c9JknZxjwkHz2H/q+TBv+jsoDw==
X-Google-Smtp-Source: ABdhPJxmk3iyeQ0iOX8LuERJI5v+BjpnllIEh9WKU7NBJNZpSN1zGZybLDSjIkeDTwi8UHkaYqo+Cg==
X-Received: by 2002:a17:90a:fe93:: with SMTP id
 co19mr2395712pjb.142.1617077828352; 
 Mon, 29 Mar 2021 21:17:08 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 143sm19281326pfx.144.2021.03.29.21.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 21:17:07 -0700 (PDT)
Date: Mon, 29 Mar 2021 21:17:07 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Mar 2021 21:07:16 PDT (-0700)
Subject: Re: [PATCH v4 0/5] Add Microchip PolarFire Soc Support 
In-Reply-To: <20210303200253.1827553-1-atish.patra@wdc.com>
CC: linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 aou@eecs.berkeley.edu, Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <Anup.Patel@wdc.com>, 
 bjorn@kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org,
 Conor.Dooley@microchip.com, daire.mcnamara@microchip.com, 
 Ivan.Griffin@microchip.com, Lewis.Hanly@microchip.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-13c067eb-0011-408d-83f4-2950c1e791fa@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_051712_443037_0D698D0F 
X-CRM114-Status: GOOD (  26.91  )
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

On Wed, 03 Mar 2021 12:02:48 PST (-0800), Atish Patra wrote:
> This series adds minimal support for Microchip Polar Fire Soc Icicle kit.
> It is rebased on v5.12-rc1 and depends on clock support.
> Only MMC and ethernet drivers are enabled via this series.
> The idea here is to add the foundational patches so that other drivers
> can be added to on top of this. The device tree may change based on
> feedback on bindings of individual driver support patches.
>
> This series has been tested on Qemu and Polar Fire Soc Icicle kit.
> It depends on the updated clock-series[2] and macb fix[3].
> The series is also tested by Lewis from Microchip.
>
> The series can also be found at.
> https://github.com/atishp04/linux/tree/polarfire_support_upstream_v4
>
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg08582.html
> [2] https://www.spinics.net/lists/linux-clk/msg54579.html
>
> Changes from v3->v4:
> 1. Fixed few DT specific issues.
> 2. Rebased on top of new clock driver.
> 3. SD card functionality is verified.
>
> Changes from v2->v3:
> 1. Fixed a typo in dt binding.
> 2. Included MAINTAINERS entry for PolarFire SoC.
> 3. Improved the dts file by using lowercase clock names and keeping phy
>    details in board specific dts file.
>
> Changes from v1->v2:
> 1. Modified the DT to match the device tree in U-Boot.
> 2. Added both eMMC & SDcard entries in DT. However, SD card is only enabled
>    as it allows larger storage option for linux distros.
>
> Atish Patra (4):
> RISC-V: Add Microchip PolarFire SoC kconfig option
> dt-bindings: riscv: microchip: Add YAML documentation for the
> PolarFire SoC
> RISC-V: Initial DTS for Microchip ICICLE board
> RISC-V: Enable Microchip PolarFire ICICLE SoC
>
> Conor Dooley (1):
> MAINTAINERS: add microchip polarfire soc support
>
> .../devicetree/bindings/riscv/microchip.yaml  |  27 ++
> MAINTAINERS                                   |   8 +
> arch/riscv/Kconfig.socs                       |   7 +
> arch/riscv/boot/dts/Makefile                  |   1 +
> arch/riscv/boot/dts/microchip/Makefile        |   2 +
> .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
> .../boot/dts/microchip/microchip-mpfs.dtsi    | 329 ++++++++++++++++++
> arch/riscv/configs/defconfig                  |   4 +
> 8 files changed, 450 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/riscv/microchip.yaml
> create mode 100644 arch/riscv/boot/dts/microchip/Makefile
> create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi

I had this left in my inbox waiting for either some reviews to come in or a v2,
but I don't see any.  Did I miss something?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
