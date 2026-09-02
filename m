Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33A2C61DFD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 07:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+P/20l1iaKFCffuZ8k9owHadmfRdZsoYDE2ql/zsx5I=; b=Q37rvTsDOAM4/F
	MRT03ql29QIH8eLMYM/OyIC4bwyYspU6lESqX1xfKY5lB+UNPOz9TbWAYJ5U4TVcjs3pwBMAhQ07F
	LEELMRv8TX3rBq8+NylgFHdQm7k+dXkPCT6pO/qleoNxfHCz1uT/cDZehPboAXsFMXJz2SdZ+IwUd
	9G5xiq9XTRwBm/SD0hbHiPSxb5o/FK6rNtqfXcAQDErHQ25u0mIOQpyxXw2wn26c+TK/IS43+vKN0
	D8Hti/KRJF3waHKRI5Zi8qbZZnsQGmDYwzLXgQ0paUVKJLNrHIkmehwfFQOF5WxvCs11HSHaXblTb
	wk0DmlX0NPVKSkMKiCMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1f0Y-0000000DtdE-1DmL;
	Wed, 02 Sep 2026 07:03:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1f0W-0000000DtcI-1NVl
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 07:03:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0AA360233;
	Wed,  2 Sep 2026 07:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792FE1F00A3D;
	Wed,  2 Sep 2026 07:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788332619;
	bh=ADWDnrTMdSyIzp5BL5L3Cq8dXeGxwG3/LxsyTlSUayI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UiVvmcVW37V2AEY+lW/6cB2m+DZQe/ityzpRDUakEHWKYsLKWLowcwJSxtwXvLwV8
	 iqXowvMTcWVz9dXQN2yD09FfAfpTbcE6vE45KS5VUw/UTZnt/MKwJssAhuYtdPesBG
	 /LN2iEjdIbrym7gj6YAVM7BIw8lusYowPU/SR2/XoVkz+8dEqKLvL8RBauWtC3BeVV
	 Jc32ZMP8I8gkH1KRg48jwfiVusX+xY23vTrmAFmXUH6ADhkfnbM0n9O+xotNE8HmJi
	 dkEsHjzftr1ZklYT+3uT+dOic9d2RuHQ9UTxDqE/DqRa8bFck7c/4c0dKC01LvroOd
	 c7oCWOVcIPjWQ==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 02 Sep 2026 07:03:13 +0000
Subject: [PATCH 2/4] dt-bindings: mmc: spacemit,sdhci: Add tx delay
 property
MIME-Version: 1.0
Message-Id: <20260902-07-k3-sdhci-dts-v1-2-4e7909cf4233@kernel.org>
References: <20260902-07-k3-sdhci-dts-v1-0-4e7909cf4233@kernel.org>
In-Reply-To: <20260902-07-k3-sdhci-dts-v1-0-4e7909cf4233@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Long Wan <long.wan@linux.spacemit.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384; i=dlan@kernel.org;
 h=from:subject:message-id; bh=tKK/nlQHRnas6UGu8eqQ6yK4XJJKgs+znczKLewdiy0=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBql8o50i812oFbAhr2Jofm+9kGBHm6vbVkx1dUT
 F5oz5CiGSuJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCapfKORsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+14fA//QuSck89nvcqi/+KpW02jct5qiKpEAQzlBc+h7N9JWR1fExF1+OAbs
 IOguEw+LXb2/6/V7DidmNaGHX7XbkUtXWIUt8ES6HAJOLvSLLueblKjVMWrm8RxgS0yh3o5RatM
 wYzX9917qeu841xafn3OGjE/Z+2QZiHrbAJo6/WDDAb1ngkNCsDyuI1HTkQqzfyUtekqH0WAJsH
 d0/yt8Ln+9pHqg/WX4H6LGqoTg81CiE4B3FrIUHb0PTu5OdT666G7QOHdGC4nksGYKuOBYpcL2A
 cp+/I2IqVZAhEExvWJXLGPOOZpo688Z2aOCw8gKYErbA116Yenv7S5Ks8fa0E9igshDRSqlD9zA
 Mo+f57OWCpVAibsMI2hH8i8yEtPsg9v+GBGV3mPR7eQk4/DVZJ/OKIIJZz9J2aWdvi9eyVB/jiK
 YGQhdf+0BnG5nU2ofbBehFAtoSzx/SzWTQdA4sKuM+rDzGiaeCRZ4ltZEPgcc5bHMbp3+tMajPl
 M7F2ifQKmBG2NgtL6D+pejatp2MsLYMWWEzlxqJW3WCUiUs2SBousnoP08+ADPWuG1dF1TL8R/J
 lHnSf9dY1dqAvvfzcmFwawWoPcCv3uSD996INPlWW8Uzkzg80LZ2s86V+pqORtvAAdCM2Txr7g2
 gKyvJ7bFy3SD6YVd3dQxVohYgdKypE=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

From: Long Wan <long.wan@linux.spacemit.com>

Introduce a vendor specific property to configure the step count of TX
delay line which should be applied before RX tuning, compensating for
board level trace differences. The TX delay line result comes from test
out of real board which vary from different hardware layout.

Signed-off-by: Long Wan <long.wan@linux.spacemit.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index f35bf7ce08dd..3399a2d076dc 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -63,6 +63,16 @@ properties:
   pinctrl-1:
     description: Optional pinctrl state for 1.8V UHS operation with "uhs" name
 
+  spacemit,tx-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    description:
+      TX delay line setting applied before RX tuning, compensating for
+      board level trace differences. This is a delay line step count with
+      no fixed time-per-step conversion; determined empirically per board
+      specific, used on SD/SDIO hosts.
+
 required:
   - compatible
   - reg

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
