Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C05D4663D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 23:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5yUOoj6RQHw+1NO8TCfayQQgy5U7z0mF87ob2H2DXw=; b=FNi0h1EkGHwras
	hE1cwH0I8bgRX6oHYXEqQQ50RtBiexqcPcsVwHQBsPxKKRVJa4t35gnDFu2v/ai1UWE4d4smPmUgS
	+krRDmsRNIHlS27/1AlM09FZmmuZEublTlICYNOfEcJYB2/saJYhn8lVm/SONWjM6l47VFUAUHQ1T
	z2XEVenYiwXrEeH9XYVKxldN8kzNFr09rAjM1Ilra2WhP0JDW43Xf3gY3g5LAwYdcJbvDmb2ApGGe
	b7G6PbSr1qvFIUWJil8L1EMWjqZ0WhNrORZ2OaBpxe+erUyI2meZfu/iBBO39/UV1yoLgts0kv++g
	Yjv9T1zGBkcE7yLBw+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzQ-0000000DKKp-0rvH;
	Thu, 15 Jan 2026 23:42:56 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzN-0000000DKJg-3Nl2
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 23:42:54 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-79018a412edso14885897b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 15:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520573; x=1769125373; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0Wiua7ymfJDhSGN5M3Dn0d7IWpEsqVX/pz6WUwMkns=;
        b=hIhlm7sluvurKK6GVNBV6vyt08BSB5WzKmiDVjOwLVZMylNRMFuDSbks0MjDMWVr1N
         G+djfSTVxlE2wokj2w4g/6HIeusl8admlRDkSbbQlzTWAB55jOwCro1SOndZAIY0ZFOw
         FIHpdnQv/LnzohZq21YlpWfDFwR/Va/urPnOEUjkBYoTZAjPU8vWsiWB/9AH1uUu2b9v
         DPlbLX1mv6n/6XxDj7bvqtZsKlu3QcTMSWXRel7dD3ex3zNARLnC1KJRjjUDbkTVeA1t
         VjFWa0vuwljB0n3EeYPXpUhdg9m7iJ74SkeNiHsxW4HFdidyjSGPHASVvC0s3uf97UiQ
         saHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520573; x=1769125373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z0Wiua7ymfJDhSGN5M3Dn0d7IWpEsqVX/pz6WUwMkns=;
        b=lXc5Qr0tI2KSlbTh89PVmWYyCGWSpsgNcKe4VCpeNzMkAcR8JHSKWqJzU5R/lTc6nl
         to8u9/GNmNlLa8Im8Io0vdGI6f8Y7t/C9gWlJm2ttDjNNq3e0+72k6kXf1RAzljY3sR4
         6z4Wq7kwtoA2hugrAOprgNbhLwgZr/hBdNcasSNEo7QV2tJpDxRuzyoptnr0oLIfT+tf
         2JzzWFi8PZY+YyAZQhpGjbK1/xxWeDQCPxa2CCDCOoYNYyMZXfRUcRTpWqVVH6Xlbrzv
         omt94/guACquAqWlHf2aEfS9KZ5NkkOc9jLs7g50QYYXMP12xCO3FHdxtpyAlqHIotd4
         Ga1A==
X-Gm-Message-State: AOJu0YyivzXYxrFmc28z63ZSTWRbEksD4cJN08gROLpQLbP/IcCbIim8
	GBypOp/NUqttsZs75uuzefLnpK5vDPjuGNeNBOnZ3HKnqzyDVqLKi2vCRbnsGUOU6xQ=
X-Gm-Gg: AY/fxX64HaZZ+ouyvNTk8vfEbnSTik/vFW7r1eSBhzSzXuxWeuKjOY1MGympJ93pyK5
	Ue5npq0KPvxKebwsfvcoQ6UhoCDDvmRFX2xOHT+9HvKADr/YxcK8TgtFCDa3CuSDaYGR4dxh8me
	5saedTqKV7bd5YRZdGESv6QGwopmbcPHJOlgpJP3AaYIl56keMiEC528ZmF/6OVSJR/CdGCewy6
	e8g7gUltFBJC0NP7+PF9ehCzrEoVKfU6Jz94vcGrqfZv1wwOPMwZUzaJrBwZk/H3ol5kmz0cypp
	hbi7tNCcida1H/0t+b2cpVv64ywcugsXdNkKEqvU6jZOBRwAx+TKGFjrO9UikZDLTm3jk3/pzNg
	Rho1oxkU3KRh+mq8U5dmSIBb0FIdGjqlNBlE+y6HX5dJl2BcCQPufGXSAsBergPZyEiQHN0ND3W
	vBCpl0c+6YhxAlw3wkvyxBXXLCQP/tyEOjLgpm5QK2abb8zwWke8AMP0ZGICU3coN2CStue2E0i
	Hw5dhBk1Q==
X-Received: by 2002:a05:690c:670f:b0:788:1cde:cac9 with SMTP id 00721157ae682-793c52b193cmr12384547b3.23.1768520572934;
        Thu, 15 Jan 2026 15:42:52 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:52 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 15 Jan 2026 17:42:07 -0600
Subject: [PATCH 8/8] clk: tenstorrent: Add reset controller to Atlantis
 clock controller probe
MIME-Version: 1.0
Message-Id: <20260115-atlantis-clocks-v1-8-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
In-Reply-To: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_154253_858305_8C77A6DB 
X-CRM114-Status: GOOD (  12.75  )
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

Create a reset auxiliary device during probe of clock controller

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 drivers/clk/tenstorrent/atlantis-ccu.c | 59 ++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/clk/tenstorrent/atlantis-ccu.c b/drivers/clk/tenstorrent/atlantis-ccu.c
index f3a2ea49a82e..e4f56018907f 100644
--- a/drivers/clk/tenstorrent/atlantis-ccu.c
+++ b/drivers/clk/tenstorrent/atlantis-ccu.c
@@ -491,6 +491,7 @@ struct atlantis_ccu {
 struct atlantis_ccu_data {
 	struct clk_hw **hws;
 	size_t num;
+	const char *reset_name;
 };
 
 static const struct clk_parent_data osc_24m_clk[] = {
@@ -706,6 +707,7 @@ static struct clk_hw *atlantis_rcpu_clks[] = {
 static const struct atlantis_ccu_data atlantis_ccu_rcpu_data = {
 	.hws = atlantis_rcpu_clks,
 	.num = ARRAY_SIZE(atlantis_rcpu_clks),
+	.reset_name = "rcpu-reset"
 };
 
 static int atlantis_ccu_clocks_register(struct device *dev,
@@ -875,6 +877,59 @@ static int atlantis_ccu_clocks_register(struct device *dev,
 	return ret;
 }
 
+static void atlantis_cadev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(to_atlantis_ccu_adev(adev));
+}
+
+static void atlantis_adev_unregister(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int atlantis_ccu_adev_register(struct device *dev,
+				      struct atlantis_ccu *ccu,
+				      const struct atlantis_ccu_data *data,
+				      const char *adev_name)
+{
+	struct atlantis_ccu_adev *cadev;
+	struct auxiliary_device *adev;
+	int ret;
+
+	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
+	if (!cadev)
+		return -ENOMEM;
+
+	cadev->regmap = ccu->regmap;
+
+	adev = &cadev->adev;
+	adev->name = adev_name;
+	adev->dev.parent = dev;
+	adev->dev.release = atlantis_cadev_release;
+	adev->dev.of_node = dev->of_node;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		goto err_free_cadev;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, atlantis_adev_unregister, adev);
+
+err_free_cadev:
+	kfree(cadev);
+
+	return ret;
+}
 static int atlantis_ccu_probe(struct platform_device *pdev)
 {
 	const struct atlantis_ccu_data *data;
@@ -905,6 +960,10 @@ static int atlantis_ccu_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = atlantis_ccu_adev_register(dev, ccu, data, data->reset_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register resets\n");
+
 	return 0;
 }
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
