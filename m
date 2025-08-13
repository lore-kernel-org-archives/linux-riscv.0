Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50D1CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dldiiq08kgOxFAfsvsj4xklFCeyfdM3eGKNmn1/H5dU=; b=YpVfBVSch2fQb/
	F8hqKC2LC5cJs6WhuSV4OOS9bTYaDYByhfBlalwzNiIrIBDddch4Pt6kYdkT5x4lPcM68B18VDJJs
	h1A2N3tQIowADl5fQuvNLKklq9FcINY114RVf6rtI1rHczqTFchgNGFc7vd3a0fpxHRduRNyF9ioe
	VM/72HPnChPu19GTgu1TIPAs5ygHQtmk0lGuq1fQZiIt3JcnESvwLW2sopcBLSuFrS7vUXEa9emTY
	rPvR4yYIWNOgYZWwlXJa25ds4NXefcjBJH1cO0PK74gOtR5uJD+uH6AruWFe+RGvLcwFq1JF3l5Dq
	M8trse30BISLHlnmsCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEoT-0000000EUdw-1D1j;
	Wed, 13 Aug 2025 16:58:57 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE9T-0000000ELjb-1jRu
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 16:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ZOtXcjPuxjagf9eB8C0wPUSDpBGysa5i4y09sy2PoRc=; b=bFjc8o
	TuIcM9+O24OfyieJtvU9l6niGKeW/ICA1QojsVm4e3rshzScmSISWCXCz2B2VWwz
	UDIekxZo2XOHShgun+U62e9r50wLbq2smZWo2nM0P+IpUeFjDso7LxsSvZmk75EB
	cHunPYyULHsTgNN30c/mqE0ZebN/mwM5z8v4fseb1AxUdTqnZdKj5vysg/JbO6DK
	Qk2mGPhYpqk9myGe/iv2F15OKRHEa1BOOO4sS1nDThLA8l+Uoluu133sbVhPlmqX
	pIdzddYZXjhd/5K6FSlZKonrSeO1OAoI6VPfZ/K4WxKgUZG/f9etZIL6rNN1KKIQ
	TmXzu3PcFYrm/11A==
Received: (qmail 695518 invoked from network); 13 Aug 2025 18:16:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:25 +0200
X-UD-Smtp-Session: l3s3148p1@oaxwekE8vJFtKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 16/21] reset: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:15:02 +0200
Message-ID: <20250813161517.4746-17-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_091635_726855_DEFCE13D 
X-CRM114-Status: UNSURE (   9.42  )
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

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/reset/reset-intel-gw.c | 1 -
 drivers/reset/reset-qcom-pdc.c | 1 -
 drivers/reset/reset-th1520.c   | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/reset/reset-intel-gw.c b/drivers/reset/reset-intel-gw.c
index a5a01388ae7f..a5ce3350cb5e 100644
--- a/drivers/reset/reset-intel-gw.c
+++ b/drivers/reset/reset-intel-gw.c
@@ -40,7 +40,6 @@ static const struct regmap_config intel_rcu_regmap_config = {
 	.reg_bits =	32,
 	.reg_stride =	4,
 	.val_bits =	32,
-	.fast_io =	true,
 };
 
 /*
diff --git a/drivers/reset/reset-qcom-pdc.c b/drivers/reset/reset-qcom-pdc.c
index dce1fc1a68ad..ae2b5aba7a59 100644
--- a/drivers/reset/reset-qcom-pdc.c
+++ b/drivers/reset/reset-qcom-pdc.c
@@ -36,7 +36,6 @@ static const struct regmap_config pdc_regmap_config = {
 	.reg_stride	= 4,
 	.val_bits	= 32,
 	.max_register	= 0x20000,
-	.fast_io	= true,
 };
 
 static const struct qcom_pdc_reset_map sdm845_pdc_resets[] = {
diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
index 7874f0693e1b..3ec22ae1fac1 100644
--- a/drivers/reset/reset-th1520.c
+++ b/drivers/reset/reset-th1520.c
@@ -78,7 +78,6 @@ static const struct regmap_config th1520_reset_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.fast_io = true,
 };
 
 static int th1520_reset_probe(struct platform_device *pdev)
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
