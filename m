Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FB0EDEC54
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 13:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ICevJj6xd3trHYZ/75NTu000lX147EAl4joy7+XiwYU=; b=jMkyUSQtSKhUEE
	QApuExPOcbMOrzwHUgi5VeJa11+etMP3OIJ9JepEV7M47auB2mEHrOHZe4Lwv6gU9nIcLsNPo5kqH
	Epwq2eUhHG+9ixglGPOV81fmb8o6maqK7c0FbB5GIf1Q+kGA2eX5lk/TzJDbY86eNlsxGwNd0GiU2
	6udAjftuGvuuMQnpHnj9dgX2YvLJtVrYNIeQvikMoCOqE20Ss5KcHBZVyRHEeVHoifZu8wJMJ54Qw
	jmw4WJbyKUzZ8ivRnsHpyuQL/1Xte0AL7/Y3C812FiEUTdPUUd3oLXbEEru5QzgCt+OO6kS7hrWaj
	v1ZNb/xA6oq+canfpZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQLl-0064Fm-2f;
	Wed, 13 Sep 2023 13:56:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQLi-0064FB-2u
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 13:56:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 29BA761976;
	Wed, 13 Sep 2023 13:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7120C433CB;
	Wed, 13 Sep 2023 13:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694613370;
	bh=9eSoQKn81k97ZS3dPFMO8j6znDqsfS9i9/EwB0IgH0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HXIDbRgaTvRE9wOoUV1pRzrzmyXKk5c4VzDGUqW17nHjTjv3EmCm1IDZ0+E8Sjd8G
	 S9LTCpOl8wkvxyeIVQJrl6aM0b/fALVuTbtBhVXVBm69apSCwbJcpfIyzu1DfUT313
	 2I44VdkZPk1/HXYdmWuQ7kP7Dvf8TqeHq5Ntk5yujhU4pJarqvxuNXG/eJxUW8LfC6
	 E3uSkuoi8YW3ljbluieEdqqDhAgaN/Io3px4U2XsoYAqYibKxKF5o+rAA+5haE754r
	 zdhE7Rjj/J651MbD6eCKWfpuMwDzNW1oxA3C+ossSFgGuA4SXu/Q95Z9IG4p/mi052
	 ryQUDGc8nhidQ==
From: Conor Dooley <conor@kernel.org>
To: ulf.hansson@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	arnd@arndb.de,
	changhuang.liang@starfivetech.com,
	jiajie.ho@starfivetech.com,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh@kernel.org,
	walker.chen@starfivetech.com
Subject: [GIT PULL 1/5] pmdomain: starfive: Explicitly include correct DT includes
Date: Wed, 13 Sep 2023 14:54:24 +0100
Message-Id: <20230913-swooned-ecosphere-aff4a05c1556@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
References: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=i5+EOM4kxuguOQSjSgCFjQq+qj0s7s7Br7dC6PPPcmY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmM+/ljbe0VzzMoZG1WemA2Z9vaAyvvPzZYVjppw9Xrv ur1zue3dJSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiyZIM/6Pe562TLPp+WELm vnCNyM/0uYXRZ64ZinVHscw4ut1t62GG/xGZe7Qubue2cdLKqW7/5lv8l/tQH9uO2VsOMBXNmK1 7mwUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_065611_007166_B2D6ED23 
X-CRM114-Status: GOOD (  10.49  )
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

From: Rob Herring <robh@kernel.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pmdomain/starfive/jh71xx-pmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pmdomain/starfive/jh71xx-pmu.c b/drivers/pmdomain/starfive/jh71xx-pmu.c
index 7d5f50d71c0d..d3b78a619d40 100644
--- a/drivers/pmdomain/starfive/jh71xx-pmu.c
+++ b/drivers/pmdomain/starfive/jh71xx-pmu.c
@@ -10,7 +10,6 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <dt-bindings/power/starfive,jh7110-pmu.h>
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
