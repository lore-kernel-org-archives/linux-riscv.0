Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174C7C10F05
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 11:53:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAAB021850
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 11:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Iw83kKd5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fdO3JfgZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAAB021850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=OsE2X26OEWipPRgMxLgVPTEvyyeVt5GwstRfBG+rgxQ=; b=Iw8
	3kKd5f69yp2iiyll7Z31q+X5MXMVGNZAqOKGuVNODkTLuMcjX++sIPhHiKhPrNeu2/Ft3ceTK12eL
	iF/wxVo8rv4ZxBEtvm4YdCguXqD122mz1XIw2m9u0yskfiUz6zHY25Uq4ZAJYF596pkQsLuEHprfZ
	cyq/o3J9sOPZZnwhp0e3q27feFlW09dN/XGutCodh2ub55UgjapwMzoir+s0y1legR90N9FBn4daf
	KAxb5FuVJgYUMBP2GU1/H/hZrCZgD3N7785z/vd3/5EK+IRVXoXbUhmh0BABWtdvhuN+8H7Nrw3nZ
	mLDncrrx7j3kDdaJ+yxV252/KvAa+KA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Zms-00044q-TN; Wed, 20 Mar 2019 11:53:38 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Zmq-000446-AM
 for linux-riscv@lists.infradead.org; Wed, 20 Mar 2019 11:53:37 +0000
Received: by mail-pf1-x441.google.com with SMTP id c207so1767964pfc.7
 for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2019 04:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=/bJv9DuAM2pvfcOoOnP+vj4tP5tECf/i0mClvD8AEJk=;
 b=fdO3JfgZrTNp9uy82okXfuvE0KpIXfP4SmG75FdqKVuGqMOSW+kLv6pHOO7E0ruj+2
 wrp6L2tk/eDGfOKdB9yXIWgNYfq7kpeAmxgbSMpwMRIvE1C4loD6gDMM3KQRhr2VBcI+
 ZDUJwFYAB5dy+rwuxbZEwBs8IPCTBqYXSLbZCyEFvqSrZtdEkhEPP4H7EebYvropxPhO
 uxxO0DxCtD0GvRwMpUXhfSnDxkvAOLyVxa7uFt5p2EviWeot17c75DKdq5Uthm+MOcr0
 Maps2bSGmACCl/cneOPyMBAvhzg6GxzJroZ/l75/1fnMxHdg6nmRL19MK0GSuvjr+oNy
 mwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/bJv9DuAM2pvfcOoOnP+vj4tP5tECf/i0mClvD8AEJk=;
 b=SRzOJ/c6Q8QNHBAuiVoQOLC3N4U1zgxKo0aMsxTv+HON+EgkAYCuc/+o7PUT14mT77
 V02m8PK9ZaMWmZp4ZFH2fI2ZdmTM8MQ3X/NapAmp9NJ7k3wegxWFltLZowGTRV9ov2yl
 GPTsOGttHOoB9kf9tPNxU/7XR2yASTo1ChDfziUwqy0ZIQLNVCgIYbZdhKgZ/qI/AaZ9
 ZvBSmmIPtQOPajtFvbC3dGpOwt8jpnonO+0+RCnxCrL775fF/q7ODpO6wiFMteMQcY3M
 P5tEs9bGPM6liUW23rrHH95NB6R0BVXlQ/30RYDExQID6tnYyUJI2lTsEQZScqjZJYWA
 CBbQ==
X-Gm-Message-State: APjAAAXlEaPUokS9UM4XmtqF6st0mkQ1An+RelTpOXwS3pXZD7SPOzuF
 ij4R46AvVpxK0qMgw8KTyEcPgq2Nka4=
X-Google-Smtp-Source: APXvYqxhNTKxGiSZcyTfaxPZffk1AyonVYUpmBTQNMKUdsKk3SjMnpPOAlRt7jZaQUZX/GU26WDQrQ==
X-Received: by 2002:a63:1f61:: with SMTP id q33mr7029298pgm.325.1553082814378; 
 Wed, 20 Mar 2019 04:53:34 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id u10sm1999435pgr.2.2019.03.20.04.53.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 20 Mar 2019 04:53:33 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org,
 palmer@sifive.com, paul.walmsley@sifive.com
Subject: [PATCH 0/2] EDAC Support for SiFive SoCs
Date: Wed, 20 Mar 2019 17:22:06 +0530
Message-Id: <1553082728-9232-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_045336_380275_D2AC7EEB 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, bp@alien8.de,
 mchehab@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series adds an EDAC driver and DT documentation
for FU540-C000 chip.

Initially L2 Cache controller is added as a subcomponent to this driver.

This patchset is based on Linux 5.0-rc8 and tested on HiFive Unleashed
board with additional board related patches needed for testing can be
found at dev/yashs/L2_cache_controller branch of:
https://github.com/yashshah7/riscv-linux.git

Yash Shah (2):
  edac: sifive: Add DT documentation for SiFive EDAC driver and
    subcomponent
  edac: sifive: Add EDAC driver for SiFive FU540-C000 chip

 .../devicetree/bindings/edac/sifive-edac.txt       |  40 +++
 arch/riscv/Kconfig                                 |   1 +
 drivers/edac/Kconfig                               |  13 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/sifive_edac.c                         | 297 +++++++++++++++++++++
 5 files changed, 352 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/sifive-edac.txt
 create mode 100644 drivers/edac/sifive_edac.c

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
