Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9B7C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 00:08:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30E67613D0
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 00:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30E67613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=shKFFOSCfToLdKAHEBERchDG1MXJ1rzk/Y70xxWokw0=; b=nrk
	jCBfzYJSOiAQ/xOYQB4jr17J7bxqEUekTHvrxWTN3ImT+rxoQl09e4yV4mj1XtoTFLbs9NopwRDJu
	ySwXEqKRZq/KC9/nyDSPDntWcit6NzN5+DnzyLAOeJrZf8Wo57o+zjZwRb78/vrtpnmy5RpFzBinq
	kYhNFRyM1F72e3t5dX3+2Vexl9bVsMWxCEQKgOTkG2IophnsL8PTJj7UGxiZi/PuVkNBy5Hloh6Kf
	rHgAAevWtV+rODfLRZ3WXHBr5ZmAt06EiimLSXDKDfu3O1mlBDrStziQNTxOaGiDsCnP46MwmKAxU
	aG810RavZud+2i5/5SM855gBSIu51bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVN8U-009RxF-MG; Wed, 29 Sep 2021 00:07:46 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVN8P-009Rtk-01
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 00:07:42 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id
 r18-20020ad454b2000000b00380e8260f8eso2453728qvy.20
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 17:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=7bhHNrTbsYTqBLjHn1hrc5X3bZzxwJdrljl1/EisLbY=;
 b=SFhQ44BEJvgZXM6Y3b8tJZsJVKICkrX+cWoxn4bjqC2mJRMaLw4+CVQZwT428ZQVKj
 vo8dtohZv8E8JOCNJC1+VtMvhM9rM4fzGcrEZwFVOjZGBQszHQfDrWEx4r3m7AB8kT4P
 VtCwFEUlgOGc3GFKkdJA/FIh1CpYSCTl7U3hzUk8EUVoPFZ+/UXjzr4ryIUkYbE4ERvX
 7FlwQoXubV/0ubzcWcwpUNs4t61aWfq2FGaFVr15uLaavAEiZio8P4X7LcCzXyz63Dmf
 +CmAYkmlBNJTqdfIcNTM4vFZ6GyoHas+dKz3n+r769jAFgbjqcWYOvewAX7WZUdQ+h9A
 QGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=7bhHNrTbsYTqBLjHn1hrc5X3bZzxwJdrljl1/EisLbY=;
 b=w774TpBD/iRe3STseaqnYwAisUeHia0/m3EbNjP+1r9Qx1azXohZbfQmB4ZB6OWxic
 wKQj+NXRJclqwU7Mmtc53xW9MH36uIRddzVBrgIcoWSQITcNuok5hZY1VFezHlCpVBcB
 K9C3RnRhgeRe12Ww/I0LuPzVKjX5Pg8Mi2LerZOykLmB0YbdEs/cSAuCNXX5qkbxD+Qv
 mLIGoFXQTkakjupoTqFg96lYzdcCTJ/56rEF9LroTtmfzOaCxiL7S24hDWwrMiVRLjzd
 9ZT7i6rScDqCz6Vu3V640p9RWwVVKoPhi0XuLTV/WDNQ7065kG/73YEC2K3IRDxGRrEt
 0n4w==
X-Gm-Message-State: AOAM531rni8VQCF7r8gFQRO2s/PLky7G6fCCTVWLHlnnnC/C3Orzk42t
 oBJ0nvtZzvfdqcfOIXT7FNRM+88j5vJqeMU=
X-Google-Smtp-Source: ABdhPJye4QI1NEVEPWMBOPRbcvbdZVtnBhd3yJ370PIHC8VFWHXatkZn+kG3+hbWIbfGsm/EDJi2ogilCFhtxyw=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:5241:a7e9:90c9:9c91])
 (user=saravanak job=sendgmr) by 2002:ad4:4652:: with SMTP id
 y18mr8331213qvv.31.1632874058881; Tue, 28 Sep 2021 17:07:38 -0700 (PDT)
Date: Tue, 28 Sep 2021 17:07:32 -0700
Message-Id: <20210929000735.585237-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v4 0/2] Fix simple-bus issues with fw_devlink
From: Saravana Kannan <saravanak@google.com>
To: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_170741_087123_042AF7F7 
X-CRM114-Status: GOOD (  14.34  )
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

Ulf reported an issue[1] with fw_devlink. This series tries to fix that
issue.

I replicated a similar set up on my end and I confirmed:
- A simple-bus only device is probed.
- Another device listing simple-bus as a 2nd compatible string isn't
  probed.

v1->v2:
- Switched to probing the simple-bus device instead of marking it as
  NEVER_PROBES.

v2->v3:
- Moved all the code into the simple-pm-bus driver
- Addressed Ulf's comment about the remove() code missing a check.

v3->v4:
- Added support for driver_override to accommodate the case where new
  transparent bus compatible strings are added to DT, but the kernel hasn't
  been updated yet.
- Added/updated comments to give more details.
- Adding Ulf's Tested-by that he have for v3 (v4 didn't change by much).

Thanks,
Saravana
[1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh+dt@kernel.org>

Saravana Kannan (2):
  drivers: bus: simple-pm-bus: Add support for probing simple bus only
    devices
  drivers: bus: Delete CONFIG_SIMPLE_PM_BUS

 arch/arm/configs/multi_v7_defconfig |  1 -
 arch/arm/configs/oxnas_v6_defconfig |  1 -
 arch/arm/configs/shmobile_defconfig |  1 -
 arch/arm/mach-omap2/Kconfig         |  1 -
 arch/arm64/configs/defconfig        |  1 -
 drivers/bus/Kconfig                 | 12 ---------
 drivers/bus/Makefile                |  2 +-
 drivers/bus/simple-pm-bus.c         | 42 ++++++++++++++++++++++++++---
 drivers/soc/canaan/Kconfig          |  1 -
 9 files changed, 40 insertions(+), 22 deletions(-)

-- 
2.33.0.685.g46640cef36-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
