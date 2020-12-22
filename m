Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4525DC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 03:19:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE22D22B2D
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 03:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE22D22B2D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=GbqXmDVoBamnFm4HadraBGJknNINF5fySyfHSqColm0=; b=FBda1g32XLVmWn+ICmvfI2Grr
	8emWL4FuHKelzKfY4DZKDelRN5kQi/qdezN4S/ulhkz9BrnsW+Gv5LpBTth5thpuard8FTEQAMcY3
	ypRlroL2AzNzQhnam+DEdQ8PZSsbyrDT6xqxJAMZrSN2vVctyWdo9BbfP5iijPSxydt3ZlM1RykaW
	LZvMizl3F76JKrUipUqnsZ4jdSHWsEda/5kg7FTDhpwi4hpxDTyKnOnc5JMpSd+2CRjbfUx9/JEPV
	NTZnn2YrVJNGYiV+4sk7T+E5v+orfTJ1/t5Pi56dQjwdnwDYrD734T4fsucKqWsFN/K8GNgAqrTIt
	FNb8y4q4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krYD0-00022E-Lf; Tue, 22 Dec 2020 03:19:34 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krYCx-00021c-J3
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 03:19:33 +0000
Received: by mail-pg1-x535.google.com with SMTP id 15so7507476pgx.7
 for <linux-riscv@lists.infradead.org>; Mon, 21 Dec 2020 19:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=UrETX7+k+oMxj1ADA1makxBY/fYwC199e2h31jHKq8Y=;
 b=KzasxadSxuqu/PLzZSZMPjy96lKqpfxlIHGEgXKjyvGOEm+d1vBR8jgf8hcG9rNYbG
 plpPQiiRh0x3aapu4u2TeYrHNsIhCv8e+WQ11hOIllsbmiuNIxqy6jx4zqpA2MXgmZUy
 qLJwXzkxuxGTdqr2UGktmW+g9GPK/Ja4keSCMbEt+u5HWUKf6GBlAWwP+tYBDJoqRm7V
 rcNU0jRSOzx1qjx2sl6LjFdUyREtXuPMYrHb6EUIBr8tBFKhWoc+3ukKcusoljLn1qvr
 0+ZSzVEd+V1GjSyWuYKdagoDv7BTbeDJw02ZiMhfUDdsRf3S1JJkR25HKIejDt1SjOZe
 6jMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=UrETX7+k+oMxj1ADA1makxBY/fYwC199e2h31jHKq8Y=;
 b=T0j7ss11CNcsNujW+rEsAcMVNSIWPA9a9ka8lb/GS5MNHidlYWfDQhWlWJ6HYH+rkX
 oiRfnszDfEILanm6oC1uvwE0de8As4IFyv7Khtv2C5IpFFnpXUgotJ6UOc1WSEA/P3Kg
 gby7g4BYVYcI5XWSVDsA73G6afUVbifuVp8R56VgR4azGnxrrN/SvSUv9/wyEwj9LssD
 3+a+VPcDOnYg9EXOKnqbQD6lUarcurffMG11OPSzkSwRPGtlF5/SwrJo4jVpw5KUYNMQ
 c7JKMZvrjWPZ8IEccsJLDMxqDagz+jFcM57U85PGwoqjEpyS49ROdeE/LX31JDyzeHQ5
 1sXA==
X-Gm-Message-State: AOAM533ZjjK/CkBqqZ1baqAOmGEB8opIoaP7iU6kqpmjFEj5cvUbmD5l
 +14pUpvuI4Akzo+/up1zY8ipYg==
X-Google-Smtp-Source: ABdhPJwKQozmbfZzu49I4FjagYuGJagnadN4PuqSMjW6Oa9r48r5iDvLi0AtL8lPQAXBh7WqDR6TlQ==
X-Received: by 2002:a63:445a:: with SMTP id t26mr17871098pgk.402.1608607168059; 
 Mon, 21 Dec 2020 19:19:28 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a29sm18424156pfr.73.2020.12.21.19.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 19:19:27 -0800 (PST)
Date: Mon, 21 Dec 2020 19:19:27 -0800 (PST)
X-Google-Original-Date: Mon, 21 Dec 2020 19:19:25 PST (-0800)
Subject: Re: [PATCH v3 0/5] Add Microchip PolarFire Soc Support 
In-Reply-To: <20201204085835.2406541-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-2a16d74b-c896-4ad0-9d02-87b3b09ee3be@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_221931_930337_205C472D 
X-CRM114-Status: GOOD (  29.59  )
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
Cc: devicetree@vger.kernel.org, Conor.Dooley@microchip.com,
 Anup Patel <Anup.Patel@wdc.com>, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, bin.meng@windriver.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Ivan.Griffin@microchip.com,
 aou@eecs.berkeley.edu, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 04 Dec 2020 00:58:30 PST (-0800), Atish Patra wrote:
> This series adds minimal support for Microchip Polar Fire Soc Icicle kit.
> It is rebased on v5.10-rc6 and depends on clock support.
> Only MMC and ethernet drivers are enabled via this series.
> The idea here is to add the foundational patches so that other drivers
> can be added to on top of this. The device tree may change based on
> feedback on bindings of individual driver support patches.
>
> This series has been tested on Qemu and Polar Fire Soc Icicle kit.
> The following qemu series is necessary to test it on Qemu.
>
> The series can also be found at.
> https://github.com/atishp04/linux/tree/polarfire_support_upstream_v3
>
> I noticed the latest version of mmc driver[2] hangs on the board with
> the latest clock driver. That's why, I have tested with the old clock
> driver available in the above github repo.

IIRC the previous version was an RFC, but this is a PATCH.  I'd be generally
happy to take it on for-next, but I don't want to merge something that doesn't
boot and that I don't have any way to fix (I don't have one of the boards yet).

> [1] https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg08582.html
> [2] https://www.spinics.net/lists/devicetree/msg383626.html
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
> .../devicetree/bindings/riscv/microchip.yaml  |  28 ++
> MAINTAINERS                                   |   8 +
> arch/riscv/Kconfig.socs                       |   7 +
> arch/riscv/boot/dts/Makefile                  |   1 +
> arch/riscv/boot/dts/microchip/Makefile        |   2 +
> .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
> .../boot/dts/microchip/microchip-mpfs.dtsi    | 331 ++++++++++++++++++
> arch/riscv/configs/defconfig                  |   4 +
> 8 files changed, 453 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/riscv/microchip.yaml
> create mode 100644 arch/riscv/boot/dts/microchip/Makefile
> create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
