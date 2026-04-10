Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9E2E99052
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UaV6Nvc8mc6O5n+A1pUOKZQLncrTKw09UWJe6Tf7/tI=; b=gUWTZdxlqYGtmx
	V9pE9WeqrIb7VKemOI0Jb13xcun2QBHKt1XbHTdOE+KKtOXXhhfKV3P3kCkkrk3bHJakIPF1paUyA
	cpO1ScyMfv5IT0X1hCLZJsnBMIXUgr1ZqwZT0F/Nm+rwW98bslX67qFbs0RgzLieelVeHcsvTAXrV
	hgFTuV1naCb4MwrrNgTNbyk/18KByYJxT8o5UND7PjKCLB/5Tqw2hc6BYrOykbbxCnsXtYrKVeRlf
	XDF0S+bLzFsrBrjcurLHK5K8L9gyxcC/zjkBTsIblOHEIbiZk34IiNX1sAvKIySu8uVGk5wzXMc/a
	XFolfwoSxmxu4wq+joHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6mH-0000000Bo4W-2VUy;
	Fri, 10 Apr 2026 07:59:45 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6mF-0000000Bo3i-0xnJ
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 07:59:44 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fsTjS5vr1z9sPv;
	Fri, 10 Apr 2026 09:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775807980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T2dY7nUbucCLtbQPyesJbvvM8gyBSryaljiV7Vdh9ew=;
	b=WeHuFJM4sHGvsWvSMNhcjGOwXy7+/o5f2NaDK2agyVsZdlcfAMwdDnprp1spOSEj5ZfrGv
	0mYtiPcARoQkf4WAMH+5vqPMAktHATJ/sG8F2xAlXiqPFb/d9PT8ZjOn/qJsqKLFkMNH5+
	2bIr+t6e0ETt5ISDpz8piPb/xSGYjBuVDqhHGZJNzp5Ga25KjMeJBkoTYNYPM2DyWUeRwE
	uAc7ESJV2Ipwf/O7MIMeK0M9NgEuOrjRikjTCaBe5Z+b/1YJlE7+cWRdq2wn8qwoNaT3tP
	uCcPs2GRd/XeI9ugOtiT/TRUyiQ61vyKgWGDyjd6qWRfsRR0uU552qVynrA4pQ==
From: Shuwei Wu <shuwei.wu@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775807979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T2dY7nUbucCLtbQPyesJbvvM8gyBSryaljiV7Vdh9ew=;
	b=rAWWtWWlvk/gqQBvVd2+IhyqURwuExA7cfgqRYWARoqmJHzmkNxUfOGEvWtttwzAqfhdIP
	aXucifJADXEvEBlzV/J6zsu3Yh5LzT9B7OdMT49V3OlczPs8HcP7InaptqXm1HxGx6XySc
	Zs0H1UlEJsNmCwmd1WX3n/wb9Ttup27a0OEKBBcZRTbOBGZIE0b2FLLMlXSxrGTcu1cuSc
	bkPHMxVj723HRPb9ScxlheUr+rjMMs28k3FUWNpn7D7mO4P2RlQA4TV/lzr7N8Nq5kl1Qv
	/R+vZKW6o3wi+Ee8kTxFjRG/ETLmx35L7rovcPgYLipY3ZOzSPzpooMNnzvSnQ==
Date: Fri, 10 Apr 2026 15:58:22 +0800
Subject: [PATCH v2 1/2] cpufreq: dt-platdev: Add SpacemiT K1 SoC to the
 allowlist
MIME-Version: 1.0
Message-Id: <20260410-shadow-deps-v2-1-4e16b8c0f60e@mailbox.org>
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
In-Reply-To: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 devicetree@vger.kernel.org, Shuwei Wu <shuwei.wu@mailbox.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775807959; l=808;
 i=shuwei.wu@mailbox.org; s=20251125; h=from:subject:message-id;
 bh=tv1SteH5+qLSYwGgTDPHiMVefHL7DAGC9ZjSkpHF5uw=;
 b=qqGyTe4fFVq3lwPI4KGuZozSKJpFe640d8ae4OBo64XxZLwq54SV6SEqqCDR1ny2RqhgERhWO
 4gjknvRMuJqCd7MFYCps1bU18K3RuRQipYSoseKs4uY9Z8pxwLURLpT
X-Developer-Key: i=shuwei.wu@mailbox.org; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-MBO-RS-META: pcg4fbn8c83pr3iyabuhitcaqoudsmqs
X-MBO-RS-ID: 686342cdb22240db965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_005943_414074_8562B2C3 
X-CRM114-Status: UNSURE (   8.39  )
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

The SpacemiT K1 SoC uses standard device tree based CPU frequency
scaling. Add it to the allowlist to instantiate the cpufreq-dt driver.

Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 25fd3b191b7e..31a64739df25 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -81,6 +81,7 @@ static const struct of_device_id allowlist[] __initconst = {
 		{ .have_governor_per_policy = true, },
 	},
 
+	{ .compatible = "spacemit,k1", },
 	{ .compatible = "st-ericsson,u8500", },
 	{ .compatible = "st-ericsson,u8540", },
 	{ .compatible = "st-ericsson,u9500", },

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
