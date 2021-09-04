Return-Path: <SRS0=w10S=N2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08853C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Sep 2021 00:06:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1FE3600CD
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Sep 2021 00:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1FE3600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=i2JYRuJz8jwMrPl8belboHZ9GJqQRYVukPLJ2Ogh/GE=; b=tkH
	EZWJMVXTL3wEYp0FdPfSIOrBjStyEZcJN4ZgpRhECRmg53i6YUvyl5KEz/RMoWA5RF3jVPKncAzg1
	KuZ6qU3wUTF7cpmi0Aw70AjsX4dMDpzPK5TmtBWsH870vFUikHGwJK+o/0ckC2NJKWgp7MhScqWTG
	LgrSrX8iUWrZ6KuB4hZrty0PggIVoCVAPFP7AZ3zqdTpKsWuEuZ/FT+CCzOw9A33VYS55ditfiieA
	DTlpgDfT3tGEl7IvdYrW42kNa3LFnHwSAnAh8mo3ACraGQ4xWGwnsM/IRHrGNiMf8b9ggXeN04Chg
	cHOGY73WVxJY+qcCYWstTULdN6xs/LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMJBv-00DDD9-UI; Sat, 04 Sep 2021 00:05:51 +0000
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMJBt-00DDCH-I4
 for linux-riscv@lists.infradead.org; Sat, 04 Sep 2021 00:05:50 +0000
Received: by mail-qv1-xf49.google.com with SMTP id
 r3-20020a0cc403000000b00377a3318261so2673095qvi.11
 for <linux-riscv@lists.infradead.org>; Fri, 03 Sep 2021 17:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=mjzKqamzQmvzyqlVvUVvv6P1c+/kEZztjTn7I8qHctk=;
 b=VZ4p+EFnl9EXauvJ8dhmEDRVt8YHYnMZhZvV6h6nXYpS8v+LDxHvFjqrQR9eLsDsYy
 RHTaYj0wnWluvQm7nCyFHpVTY4X8aSkLuiIkTyUOtezLSN/w1eSH1tjAyXzk6Y6V+daF
 nD4NShWbq6Z7Q6wGJuPFkSLi3XRYi3l8fI7h5O9yxld6cQp6X5zUN7AIWAQFMwtKXCyM
 HXp04mNEFZ5P1u4dqby0/DAT3CrpF/59RTQZHoVwcvbSNnALUImixWgqC+Qcatbmm+Bl
 8cGxwkxOX9xAhBKt/slNqZhBiHfmq1ksDBxjPaOWBySvhq6EsQwZdcMREHamx96DGzud
 O5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=mjzKqamzQmvzyqlVvUVvv6P1c+/kEZztjTn7I8qHctk=;
 b=pIAM5TdnvVXCAKTs0iyYENYTbIVoKUYCs+22LmCyFk/dZGWmfQ0rRefHYNQ6Il3/eE
 58lUChp3oWdLekyMzscF5q8Gg8Db0k93C/FQM5ODNLLPdUs1tBmQuTB5QhqmBWs5tSq3
 RodJtQ9GYsViB37WuACv2jyVfKI4jlhfBTjKls7XKxuM9Nl5e4ZiUYiwTg5xnHCDKPVd
 2kh6lYiiqgy5bvx/vnvbqoIiMccDyB4Rr9R2Z1AMHJYUTMJ+6NhTfwEs6VaKLi+5iLHL
 3HJ0Y9G7mxU4wMqMdRtFBHKhUgOMtWyX3Rd/+rRiEXaEU/92TCCD9Vh6QfAWenzrvN25
 QyxQ==
X-Gm-Message-State: AOAM530Kg/7/VTc2KCfIE1bBbV/QVEi2eLBnwUF1zgs8FHGSaugUdhRV
 tmmSI0v2U2r+oT5nZnCS2U5JMWF6x7bdbKU=
X-Google-Smtp-Source: ABdhPJxOh60dMGR+lUVir1U4lfhdWRVMUcj5x6W1LTUnNO5wGwN2dFR8tfzyyVUJVXZoWiFU6/iKXpuDy2rgCWU=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:b45b:ca56:952a:2176])
 (user=saravanak job=sendgmr) by 2002:ad4:4905:: with SMTP id
 bh5mr1667186qvb.63.1630713946609; Fri, 03 Sep 2021 17:05:46 -0700 (PDT)
Date: Fri,  3 Sep 2021 17:05:40 -0700
Message-Id: <20210904000543.2019010-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH v3 0/2] Fix simple-bus issues with fw_devlink
From: Saravana Kannan <saravanak@google.com>
To: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>
Cc: Saravana Kannan <saravanak@google.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_170549_627244_1F37A045 
X-CRM114-Status: GOOD (  12.12  )
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

Ulf, mind testing this?

v1->v2:
- Switched to probing the simple-bus device instead of marking it as
  NEVER_PROBES.

v2->v3:
- Moved all the code into the simple-pm-bus driver
- Addressed Ulf's comment about the remove() code missing a check.

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
 drivers/bus/Kconfig                 | 12 -----------
 drivers/bus/Makefile                |  2 +-
 drivers/bus/simple-pm-bus.c         | 32 ++++++++++++++++++++++++++---
 drivers/soc/canaan/Kconfig          |  1 -
 9 files changed, 30 insertions(+), 22 deletions(-)

-- 
2.33.0.153.gba50c8fa24-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
