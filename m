Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6EBCA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 07:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b6YYh8JVpJVFNqwRHorpyTMigEjJfJMIVxvn45JWNnA=; b=lcdUWCnE2Mb4s5
	rNMt/rAjFfBRkLNwMtuTe6uNh16bjQZjJLUkZ90e9HIuga2a+vVMa0vZ3HgVl6+N6r9wI44fx1xLM
	1auns1+P7PyMoqMdQ6jxwoTUnEM7e8WbuI9UANk0OHmnEUI89IFbe2EV9SOngUkLqHonOq3PLHvQ/
	8BToabE1Ea1L7/wiNEISYgyUxcDi/y5Gb3G6Jh9nYSgY0uCr/k6vK/jSHObUzlYvPF9SuYoDyulIq
	GarqE9Um9HPNb5pPiGs7nCvXPWycd4Qd9Ky/5adrTPlA9S9A7l8ClEKljirBkY8IyIaeBwO+c88mI
	AppWbi490BExDnYrNANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unufo-00000006rXU-2PF1;
	Mon, 18 Aug 2025 07:52:56 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuci-00000006opP-2MSU
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 07:49:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755503380; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YPOQyiQzZXF7BjL1Ii00u+6sVYI3xgAeVkxi37Ww+CkEHSFo4BgDodEXzfpNMTFTNrKXgHjuTZGrhDhEGQrDt92hhOZeKZ1pUNvBaANQgrsAssvGCFg5zga6Qx302Mdy0qNFbFPFfgO0HB4ZQCeDCrdM6IQW5NUCAf3cCcrPEKU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755503380; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v71hNscntsNElHfK1DeG9/bpCIY/+k/7AMAOxJUUKlE=; 
	b=jepRpt1JfkkVP1u2BrfP/96x19UnvZNa+pBaxMOyXjWwrcmo7H5viWbt4b7yiDlKuSwQjNCHZ3aC+VLs6Zml/0xl5IbwkA5Mg7yMnPN0D9i4KPjLgJkxuQrivqwJWVUVM5eIoajmooLCar1LLYmej9lfPCcfd6UcZ04QoaVyFd4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755503380;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=v71hNscntsNElHfK1DeG9/bpCIY/+k/7AMAOxJUUKlE=;
	b=Ejfms6rgpvxnqBcugd3F9yMvH489ENsnfLn+mtnu5VvXjGT/KOM5W79SW5YrQGqa
	0ydtUaz20eJMwmqjVx8Ty/83Dr91Tn3ZeVtBjgT1mSsWGaHsgbCIU8gdhsP0ZiQu6i/
	ambU/3dMRRTdrtiICHU7euNscxRNmaz1XjIGq48xRlXX1fn3Binls8VADVcgkgzhIRe
	HMCAjVswspZVRwkhQ9s4+jVA1DsTwEtphNhew1YCa2x6F8dV1heXP9w3T7X+dI9cwmP
	VX+JC5H8YJDlfH2geKNcuEvEdVGVi0hWb/k5qmoR9FZGTqnCmlePtm8soWpbposg2+R
	3Xm+33gFLg==
Received: by mx.zohomail.com with SMTPS id 1755503377570478.03956771827745;
	Mon, 18 Aug 2025 00:49:37 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 2/2] pmdomain: thead: create auxiliary device for rebooting
Date: Mon, 18 Aug 2025 15:49:06 +0800
Message-ID: <20250818074906.2907277-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818074906.2907277-1-uwu@icenowy.me>
References: <20250818074906.2907277-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_004944_684309_D4D1123C 
X-CRM114-Status: GOOD (  12.41  )
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

The reboot / power off operations require communication with the AON
firmware too.

As the driver is already present, create an auxiliary device with name
"reboot" to match that driver, and pass the AON channel by using
platform_data.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/pmdomain/thead/th1520-pm-domains.c | 35 ++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
index 9040b698e7f7f..8285f552897b0 100644
--- a/drivers/pmdomain/thead/th1520-pm-domains.c
+++ b/drivers/pmdomain/thead/th1520-pm-domains.c
@@ -129,12 +129,39 @@ static void th1520_pd_init_all_off(struct generic_pm_domain **domains,
 	}
 }
 
-static void th1520_pd_pwrseq_unregister_adev(void *adev)
+static void th1520_pd_unregister_adev(void *adev)
 {
 	auxiliary_device_delete(adev);
 	auxiliary_device_uninit(adev);
 }
 
+static int th1520_pd_reboot_init(struct device *dev, struct th1520_aon_chan *aon_chan)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = devm_kzalloc(dev, sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->name = "reboot";
+	adev->dev.parent = dev;
+	adev->dev.platform_data = aon_chan;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, th1520_pd_unregister_adev,
+					adev);
+}
+
 static int th1520_pd_pwrseq_gpu_init(struct device *dev)
 {
 	struct auxiliary_device *adev;
@@ -169,7 +196,7 @@ static int th1520_pd_pwrseq_gpu_init(struct device *dev)
 		return ret;
 	}
 
-	return devm_add_action_or_reset(dev, th1520_pd_pwrseq_unregister_adev,
+	return devm_add_action_or_reset(dev, th1520_pd_unregister_adev,
 					adev);
 }
 
@@ -235,6 +262,10 @@ static int th1520_pd_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clean_provider;
 
+	ret = th1520_pd_reboot_init(dev, aon_chan);
+	if (ret)
+		goto err_clean_provider;
+
 	return 0;
 
 err_clean_provider:
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
