Return-Path: <SRS0=1KMB=TN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBF6C04AA7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 20:08:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13E5320850
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 20:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U33DxckF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hSXxafaV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13E5320850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mf4x4McP0T4i9UeJSKRGsVk4opknRhHnQK/Qto8DuOI=; b=U33DxckFtfcfSh
	W8eCvx736hVkqqyjhMC5QbrIGzrGWTtT+M98xP2VM4/3QU+xFdSFjiUazR9MO6LuuwpwgNhMZclHT
	f5Pxg2bEAl5Sp5+if2LWut7aegCo1KyHeJn8IBhbPgwnKmsSt2tV4AdoCvOekhrS7S32cMHQpjDmc
	cQKSOPsXz4M4hEpql/6l/Ig/eY36Tsplouzi3y7l9gGfqHY6tm2HgBI6kHGNIKF2Ir9T77RpjnIM9
	qnzavs4kmodBH1AW9TA3YYXohsFDpAjYcevMSTp1FEFYhv0DEXQMYzhZl+4iqu0xtsoDbTR85o9R8
	5rbJmsiebwR465fWC0Ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQHF8-0003Bp-DR; Mon, 13 May 2019 20:08:14 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQHF4-0003BB-H4
 for linux-riscv@lists.infradead.org; Mon, 13 May 2019 20:08:12 +0000
Received: by mail-io1-xd43.google.com with SMTP id b3so11096572iob.12
 for <linux-riscv@lists.infradead.org>; Mon, 13 May 2019 13:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tVpxrVqtZ6so56rmoXRO/UqKolhNWwjERgPc3LzGFN8=;
 b=hSXxafaV5iTjOToTOFm4RvKmXIJLq851eKZ0B8cA9rjCzP2lEK7Ikybh/EnCwRncxd
 y4SFaafG08JvytYn5XC+jiHhPG2URqrcilytocl+eOTZmHcYxn9/IEgq25FW5lz79n2q
 4qVl9TtNf80RAVLRrsPKKLHLkPn9xNZbZcwAFgA5GEHrCVMJyk3INBoBbmfModA0ugMO
 9HM1hRCR5mxxaKFmCVTokyVPhdzIJq1ZrhfwoCNM9EKO/hi5s5aICg+1FEvj8l6JXuun
 NpvSgJdDZovD7yJfYykntLRjnfcJjEIvFXOwfDFbTQKdEFxz7RRnvi3+FTWXNPBIpVsa
 1sBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tVpxrVqtZ6so56rmoXRO/UqKolhNWwjERgPc3LzGFN8=;
 b=WAB4IkrbsMInaPlHkQRMhdV7AoV52x9evJl18OWpwCWwcfuG/92dzhEHsApgrgxRq5
 duAZT2xep1BBJBJ6g35qr3SYneLNmNx90b3QKmVNkx5+b6p60nzWjh0amlzmurWN6HjZ
 RiqRrdnwUwXxfY5eETfE2nBybLZ+ObiR0f3YYE6pp0DCatUCpx1bYpdsiw/WQkJjzhKw
 yDx9N2iz1SD8xJQDLEic7g/aRkHheIZGBnzzdh9EQIa27/HU1w1EKPwmvUGQ5W724YEZ
 G325UrIjuW1ODmWVW5boC0/qHlrUs1QsXkBQuECgjJJ+RMjgyfjCj5+fbucyF4GfnHW9
 Ailg==
X-Gm-Message-State: APjAAAXwbNSYf8qtlT6Vrb7CfzvKr2X32dPVJtnjVIBf+M9bMU54RGi0
 r72aJWjVlyucdaHoH2HJP2Iczn5/DVg=
X-Google-Smtp-Source: APXvYqyw8zFE1ynOjqj9m0tDEwjIwV/Nsk7yMgV7lkFPmgfuZg00tc/M+Qp16udiiomTmHQFlr0Prw==
X-Received: by 2002:a5d:9e01:: with SMTP id h1mr2997330ioh.57.1557778088886;
 Mon, 13 May 2019 13:08:08 -0700 (PDT)
Received: from viisi.lan (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 h21sm242468ith.8.2019.05.13.13.08.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 13:08:08 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	pavel@ucw.cz
Subject: [PATCH] clk: sifive: restrict Kconfig scope for the FU540 PRCI driver
Date: Mon, 13 May 2019 13:07:58 -0700
Message-Id: <20190513200758.15241-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_130810_628984_88565454 
X-CRM114-Status: GOOD (  10.68  )
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
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Walmsley <paul@pwsan.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Restrict Kconfig scope for SiFive clock and reset IP block drivers
such that they won't appear on most configurations that are unlikely
to support them.  This is based on a suggestion from Pavel Machek
<pavel@ucw.cz>.  Ideally this should be dependent on
CONFIG_ARCH_SIFIVE, but since that Kconfig directive does not yet
exist, add dependencies on RISCV or COMPILE_TEST for now.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>
---
 drivers/clk/sifive/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
index 8db4a3eb4782..27a8fe531357 100644
--- a/drivers/clk/sifive/Kconfig
+++ b/drivers/clk/sifive/Kconfig
@@ -2,6 +2,7 @@
 
 menuconfig CLK_SIFIVE
 	bool "SiFive SoC driver support"
+	depends on RISCV || COMPILE_TEST
 	help
 	  SoC drivers for SiFive Linux-capable SoCs.
 
@@ -10,6 +11,7 @@ if CLK_SIFIVE
 config CLK_SIFIVE_FU540_PRCI
 	bool "PRCI driver for SiFive FU540 SoCs"
 	select CLK_ANALOGBITS_WRPLL_CLN28HPC
+	depends on RISCV || COMPILE_TEST
 	help
 	  Supports the Power Reset Clock interface (PRCI) IP block found in
 	  FU540 SoCs.  If this kernel is meant to run on a SiFive FU540 SoC,
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
