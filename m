Return-Path: <SRS0=xvkM=QF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCD9C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 11:43:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B957720856
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 11:43:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dajh2+Xi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gfjDs/wU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B957720856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=80IpcVK56pG76P8DOUVwRCWTZ3crWcLtQonUxHCBHM4=; b=Daj
	h2+XiMza5KD8d7vaILAhjv0gznaqNxt+/8f21zUgzqAqUEdaS/rWCwtm1mndh3h6OYnLQBmhcA1Im
	YWJOLIYQ2mx81XWPGdhYNIGtn3P0K/dRaUI3erfAB1T0UJCD6symJaXUSud6XTju1ytxE+rZw1hBO
	1Tubkp9Oyb+w6pRF6m/fhy0Byj3QTWNdqj1pdWsLBEOtTv9QWeArFMrgIerrQ4yb+L7pxYGUKRP2l
	KzFBz9ccath4fPbTxyu8A0Hx55UWBNZ1DpwK6atx49eSF2zOJLEy4D2IxaPzWA/oKW9ALVicO9xFe
	ZG5UtmgIM39HSjFo0dYHReKMdOWfniA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goRnp-000310-9A; Tue, 29 Jan 2019 11:43:41 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goRnl-00030b-W0
 for linux-riscv@lists.infradead.org; Tue, 29 Jan 2019 11:43:39 +0000
Received: by mail-pg1-x541.google.com with SMTP id z10so8630781pgp.7
 for <linux-riscv@lists.infradead.org>; Tue, 29 Jan 2019 03:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=BYtsksCc3g+PmSULTt0E8BRnvpc7E4mg6XPQVON9mcs=;
 b=gfjDs/wUKN6FehYc9VG0UQAzo8SAcw0p/mIsR+V4BLYvMJub3S7VgC1I8/q47qzeFK
 O8JvpFo/SgkXpxTjj09Byy3SSx12tZ4d5izHFj+3/vYuoZ8g946iYy5BWBFStVAMeNhK
 61QYTmBMDpuTLyUkyUNB65O1n4i9oJIwxaHxzuGaV6o3A2YMeG4qfLNwzEG2PzNEgiaS
 dP9CU+5qUwVTBqKAVaaqOYGSsDnbOsmg231a9RWacDmnce5iWUPGJuYWxkeDBzBeNIh6
 GBWJEGLT0fNvntImcNGQVUkZCA1pX6d38ROPCl2hoEZSr7sMAXAS320g+nKNMp9L3bO3
 PC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BYtsksCc3g+PmSULTt0E8BRnvpc7E4mg6XPQVON9mcs=;
 b=mR0XjR1xUNoAsSp97CUfXJR/AzSSO+CDjyCYffMK60a6rP6b7kBhK4PiLrvk//l4JL
 tMWIfyhQCOgKtjio5ZbxWb8SlUelhU+xfDgTnxug/cF1qhl44FtLFB4zC/V08LuQ4spV
 RnOeDLOvVpqPSG5Ds8HUUQX1SV0ggX588RRSrLkwi16SJAZQ3HWFLcIlJn1zif++4nPJ
 6Z8C8q2lnidCLfowbe1qci+heuUUTFKHQOXDQ1Y+3UXlIa/911QuY+mNVCvZzmwKDon8
 0ZgB6LuRG5gBYv9J4/pEnJEGxp7gGJfGK4REAsZpBAI3KdR7B6lkjlLrfg9ZZHE1emjf
 nMVQ==
X-Gm-Message-State: AJcUukdZzNYO4PGRJj2N+euWPyWiI7Xcrr3YvuzN4xieE3YHL3bQuzBq
 Sgs4+kSn92VST2vmKpgTB+v5XQ==
X-Google-Smtp-Source: ALg8bN5lqCpISIJjZ6e0fXkpLyie8zITnv5vzILnqTWRM0mpQg+5nEcjVr/meZAIfUK91Kz8COIfIw==
X-Received: by 2002:a62:798f:: with SMTP id
 u137mr26058536pfc.168.1548762217083; 
 Tue, 29 Jan 2019 03:43:37 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id p2sm48755717pfp.125.2019.01.29.03.43.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Jan 2019 03:43:36 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/2] PWM support for HiFive Unleashed
Date: Tue, 29 Jan 2019 17:13:17 +0530
Message-Id: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_034338_045887_7851C92A 
X-CRM114-Status: GOOD (  13.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, thierry.reding@gmail.com,
 paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series adds a PWM driver and DT documentation
for HiFive Unleashed board. The patches are mostly based on
Wesley's patch.

v5
- Correct the order of compatible string properties
- PWM state correction to be done always
- Other minor fixes based upon feedback on v4

v4
- Rename the property sifive,approx-period-ns to sifive,period-ns
- Rename macros with appropriate names
- Remove unused macros
- Rename struct sifive_pwm_device to struct pwm_sifive_ddata
- Rename function prefix as per driver name
- Set deglitch bit before changing output waveform.
- Other minor fixes based upon feedback on v3

v3
- Add a link to the reference manaul
- Use appropriate apis for division operation
- Add check for polarity
- Enable clk before calling clk_get_rate
- Other minor fixes based upon feedback on v2

V2 changed from V1:
- Remove inclusion of dt-bindings/pwm/pwm.h
- Remove artificial alignments
- Replace ioread32/iowrite32 with readl/writel
- Remove camelcase
- Change dev_info to dev_dbg for unnecessary log
- Correct typo in driver name
- Remove use of of_match_ptr macro
- Update the DT compatible strings and Add reference to a common
  versioning document

Yash Shah (2):
  pwm: sifive: Add DT documentation for SiFive PWM Controller
  pwm: sifive: Add a driver for SiFive SoC PWM

 .../devicetree/bindings/pwm/pwm-sifive.txt         |  33 +++
 drivers/pwm/Kconfig                                |  11 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-sifive.c                           | 261 +++++++++++++++++++++
 4 files changed, 306 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
 create mode 100644 drivers/pwm/pwm-sifive.c

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
