Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18194C282CD
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 22:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EkmRB9A7+PjugvUXNYK+89ghhZoy/U10tJi46KNkzgA=; b=R10FpQJXqug0KP
	Xbq5/+Pe7uMg2YYUChFxKcQNu2Hs/XNgO8RzrsuZEjicaXPoM5XEV5d9wem+gh9PfRAJJ1lsSnEgT
	qVrkq4wCrOn6SPVkj7TrkO9QRT/tVfVjnd/kk7SJUwd/Cc4ScccJPQERLYaYK7Mjdv3UWz3U0n2bG
	9YXzqBoYnTHCJVk67eC/o6J5noHHD2hfHxCZ5e1b6Dw7I/a6i+hUucUdlUXrtp1HMiubcWtWRTBvE
	cTmdf35/nJBKaRlTdDBCKwtgakIKCURdLqC/0+O51d13rANyrQgZD7cIp6ZwC4/5vZH9irM4aYdfz
	gX/PgS2bCJ7C84PW8tNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEOv-00000002TxH-0W0C;
	Mon, 03 Mar 2025 22:36:41 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEOM-00000002Trt-29Q7
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 22:36:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D29041D02;
	Mon,  3 Mar 2025 22:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741041363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u27HA2HEokPvKqwQjggBWEvrgK3mo48hACrvMtvh3yA=;
	b=dHgJQ//NdCGq5ogxopr9r3TSpa3UPjpLbyGODoslvnACf/mrei+2vs76JGWKpp4P1Xbfyi
	Mzaf2GC8gSBXT53vLocMPSxwMaX7z2jOEpcfN+Q1c7xfCn5imh50wkDRWVuFYdM4OU7KYL
	pcqTsRA5heGF/og4/qponOD0EnKwKPK9fr+O753CWrdvjjB8UTBgETH3HbhTCmiFrKT47P
	CQo0k4/iYexSplpVfH0vVvccb1OaonZ9HwDHXTcnBcx+YSNPvUmaEfZC3DRjAEI1nlWxJp
	e+W9QCLhvHsW4Vf82WZwgh5pjZH99gTpdVFcB9CbMeuTHxE+uvy3ZarZRhvCJw==
From: alexandre.belloni@bootlin.com
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rtc: mpfs: switch to devm_device_init_wakeup
Date: Mon,  3 Mar 2025 23:35:56 +0100
Message-ID: <20250303223600.1135142-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddtfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmnecuggftrfgrthhtvghrnhepgedtffeugeeftedtfffhiedtjeefieeuveelffetledvueeludeggedtjefgveevnecukfhppeejjedrudehtddrvdegiedrvdduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejjedrudehtddrvdegiedrvdduhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopegtohhnohhrrdguohholhgvhiesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegurghirhgvrdhmtghnrghmrghrrgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigq
 dhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_143606_967658_BA322A58 
X-CRM114-Status: UNSURE (   9.32  )
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Switch to devm_device_init_wakeup to avoid a possible memory leak as wakeup
is never disabled.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index 5a38649cbd43..6aa3eae575d2 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -266,7 +266,7 @@ static int mpfs_rtc_probe(struct platform_device *pdev)
 	writel(prescaler, rtcdev->base + PRESCALER_REG);
 	dev_info(&pdev->dev, "prescaler set to: %lu\n", prescaler);
 
-	device_init_wakeup(&pdev->dev, true);
+	devm_device_init_wakeup(&pdev->dev);
 	ret = devm_pm_set_wake_irq(&pdev->dev, wakeup_irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
