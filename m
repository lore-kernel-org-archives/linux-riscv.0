Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F1A10FC456
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 00:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oh8S+OeoqLudMHXjnTFfSG2RSWX10cm59EFjBQAoOlE=; b=YPFFPOwWEa3fFn
	/uas1Rc4Dz6hY+MB7TbXFqlHT03WRpPUzj7uSnv1fU3OBIOUL1ev8DmImV5h8uDNrq61vSr4BAEJs
	8VRERusZ8apaFqs3AozQEoXugGbtXG2Jx/KcFpPs/YEIZniXDIw/QPwr0ByJ3K2ANXl+2e+GLhJvg
	bHVS6edlRKrfjuZ01X1yCEpcf3Cnhp1cjQcEvG6n29rawZQ3IoJQS/mHMbI9n7YvzU2VCPC8cOzZM
	bhfy47slZJNtFiRfdmPq57l8ygNE3j2OIU8v3fcYJyqPq8KLpxstC9TBtWaA4XwesLJlUq9l2FbSv
	a3CEgmW2oDHseg7SYrGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAdWX-00000009YRG-3leh;
	Thu, 09 Apr 2026 00:45:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAdWW-00000009YQo-14lP
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 00:45:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E38654178B;
	Thu,  9 Apr 2026 00:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAA8C2BC9E;
	Thu,  9 Apr 2026 00:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775695531;
	bh=UvKB/rO0ym8ehbjJC0/3pdgIwU+JdYoe/WxSBUf/xtA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NhMwCL5cnZOvjpW/FT1aqATt59YE9Kxmgii91apFLZO5TlGHjoyVQBRHkANRPMCnL
	 BoHHAOCzjjTye+SXKjDDUmQfkQCD3WpnpofcYR0MToDAxxmWs0skpJf/OohygcYK4+
	 GChEfiDfQvlgQW2ONNJQ7lOHzMb5EnBPqNWItqe0mIxipdAF/kb/CUVQ57B4KkqaTW
	 4BnFRbYCNMXInQOiL8Y4Amg7bGk+rxMe6nWeSghrIAPrADjl6b05vsNwNgEHG/9B6q
	 bkvfXiAcT/QaSlUtQoIv4TqnF9QojxdFqEZymMw4cnpzrigcjGtDRMiDGeHKv+OhEl
	 yxqNXSSsBNE/g==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 09 Apr 2026 00:45:12 +0000
Subject: [PATCH 2/2] pwm: pxa: Add optional bus clock
MIME-Version: 1.0
Message-Id: <20260409-03-k3-pwm-drv-v1-2-1307a06fba38@kernel.org>
References: <20260409-03-k3-pwm-drv-v1-0-1307a06fba38@kernel.org>
In-Reply-To: <20260409-03-k3-pwm-drv-v1-0-1307a06fba38@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=dlan@kernel.org;
 h=from:subject:message-id; bh=UvKB/rO0ym8ehbjJC0/3pdgIwU+JdYoe/WxSBUf/xtA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBp1vafLCs9aBUlDwfMwtLHaT/gneL5h3TmzUk0S
 QajC3U3UB+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCadb2nxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0/yQ//QYPuYB0b8I0gFUKwB3KMY+w/ICUaD59ogvayqcLMSc0LFzgi1UnGZ
 l7hFHdAvNn+AfWW5VCLrelrpHmbTUZcbTAvZYgrkKgPmk6CK67ag1KAexBQosMS6Lf4lP83OXQ/
 Ys/5rssqfUC+CSU3zbj4IpHf3sNB+MO2wEO9LWZityY/tVIf6/vgpNi5KZhhQy2UakBcvkl/e72
 uaTa1/FBhOefLHCWuO9BZ7q6psSNNdshqQJCRK0b08OYNtsyuLmixU2bY5WFVHGZmYsuiW+Yodp
 E3srFvPPcvDduawh3CgF91BfR7xPkf1QEPflDhIKWMgb4WsowHFTDkI3EGlWO9bdIzsUTQNaW42
 CQSXvDH10jpVBmC87uUim7ifJ9uOCARtQrqDcOtxptMVnvsYgkjB8vqDU0PtpiFZejdXbjDR0ZJ
 zjWFnzu2lRwR/FvWCwtMv9jts8Edz+nEsNxkRAEh4/8jXtv9g5sPegEJ6QYX6lBugQnKkHZfcUM
 KR1SnB2VaCaVqPTZKNMot896z7/Ea6gklx88FewMq11wSfEe3dIDBdc3qtjQsSDzYMNaKJTMIpp
 CI0bJ+peWVejVvBbr0wnNFbOwwxenO3WsUFhkwjyFle/J0OA+qd04YZCN4sn7wr4Koy/uA23ATg
 Chadlirppt1DFcLKBqN8I+tAJ5Yj00=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_174532_352895_7249DC8E 
X-CRM114-Status: GOOD (  10.89  )
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

Add one secondary optional bus clock for the PWM PXA driver, also keep it
compatible with old single clock.

The SpacemiT K3 SoC require one bus clock for PWM controller, acquire
and enable it during probe phase.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/pwm/pwm-pxa.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index 0f5bdb0e395e..2ace31405c2d 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -53,6 +53,7 @@ struct pxa_pwm_chip {
 	struct device	*dev;
 
 	struct clk	*clk;
+	struct clk	*bus_clk;
 	void __iomem	*mmio_base;
 };
 
@@ -177,7 +178,12 @@ static int pwm_probe(struct platform_device *pdev)
 		return PTR_ERR(chip);
 	pc = to_pxa_pwm_chip(chip);
 
-	pc->clk = devm_clk_get(dev, NULL);
+	pc->bus_clk = devm_clk_get_optional_enabled(dev, "bus");
+	if (IS_ERR(pc->bus_clk))
+		return dev_err_probe(dev, PTR_ERR(pc->bus_clk), "Failed to get bus clock\n");
+
+	/* Get named func clk if bus clock is valid */
+	pc->clk = devm_clk_get(dev, pc->bus_clk ? "func" : NULL);
 	if (IS_ERR(pc->clk))
 		return dev_err_probe(dev, PTR_ERR(pc->clk), "Failed to get clock\n");
 

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
