Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC3FC55162
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 08:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tCfN61VwoCwMbNKkiTM1xk3YSgF5mRx/aCOy/BMEkuI=; b=rCZI6GS+3QhlhK
	vP0luvfeENL/hkY1NChvZ/cdRc5AEKrsjSbKB5w2FzV3A9xbbRWN8bRO+MceGi4UFd08oT9JmEC6k
	4E666SX+uGTLE0TjQK9ii/uJOPCGCBgjR6YlTl9I7pKkVQi5qZTSry54eSww0vwEfrjpUHv6UJq/R
	wZ+ggTrI0eRbNabpUSXH86/yIyg1OCx8wDLdNwlo6rxP/sBfZVhLc6G6mWF9q+IHeKRtwcvZU3Xpa
	W1DY0LqpLV+HtDKJ/qrExtvTNpugi0g4oRfUKe+PrbsHevddOmXKuLjMhv/7UbS1NQ95+cDaeh8LY
	MJZRP2dCgifRG1f61Pzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLrv-0000000DPj5-1fy7;
	Fri, 20 Feb 2026 08:28:11 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLrs-0000000DPhy-3RsP
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 08:28:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4375d4fb4d4so1146164f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Feb 2026 00:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771576087; x=1772180887; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kucOBfKNVCMhrq/sy0oackHKIElCYKPpoLdnzqCWN7A=;
        b=KuZSGAQXVToWIw+uQCPevgzVOlXhZqcXr5D4zZxqhYrTcgBHYGzgw/ZOztVtZjlnVW
         +CqqDMguaxJfKWWfCP/co0lJOggR5Xt4UmldGWvUJ3nAkUYAs9NNMVbGIvD/AndnrTe1
         TRL72D6DSSQW1xeVGH8dCyyL1qT8NCt/dOUEj2iW+Q8inX0Vm3zdk4vm1GPSosylxhUy
         Lzkw1whwGoGv1VD2Hqn6dpIRAWvyzEbXvWeJww5csuDX4xKEhPSuZE369qPQPm413X1s
         n6Xfq0eMesxz7TcvYhByErXKtGsgtC28xPk0Cn2DUz96E7+Le9m0vDipBs4HWIASFghy
         F5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771576087; x=1772180887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kucOBfKNVCMhrq/sy0oackHKIElCYKPpoLdnzqCWN7A=;
        b=YMvDgBS++/zXLiP7DWdv8mJFXkQbBX4eyG1IaobkHcl4ASY7TWgirohLHyNDc3uw3x
         GPfOAza0jtVFlav4OHL7mCiFy1NwIB0yQLI84NNrEwtJ/XlXymAGFcHB5HbH/JsU3v4+
         YeWobyL7xguty4NMhHQvwD7t5U1T1QIbf3GUWr/gbiYS6TqQoJoPuYfgksvtyOS0o/2K
         TFcvYoJtytAbq3hVoiHeyVewTySX8e0enurQVoQ3F03F54SfUgYGxWMDBtpJ3nnO9C1u
         b5z6+fQiOh6V0k805Xf7i6Dvxh6L/1nrIH5v+p03IQRGFElbvsxR+ZZuwhET5vnw2+D9
         e1qg==
X-Forwarded-Encrypted: i=1; AJvYcCVt6erJmid8fZGnFHKlgMkvB9uMANwaHWGLr0+Xv+O2N3FK3iqspNTlVnIqviVu5Vaw6mPZWv+m3kTQxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHylKh+BDggm/dyJk3ghT462zz8kM1bZueYJnSGPGoVf4+6hni
	w/dklFaN0PCaQOX0uNFQ9lRSTRzzIwhNs/5lN6CVo0D5PzJv+x/1/aRIzGRJ5PSCVVY=
X-Gm-Gg: AZuq6aLnnvh913w9vcPlYqs2ruJwqq7A1XuWmqiG8UzjnUZNDwTEc8GOXaAqS9lh9+B
	+9tBFmspQQjPAI8v6nCzAem3LUi3VWv/kD8Uv00ejj0eyHWQodeTHs/8zHU+NnEfcFQmBycP+/y
	19DaQYcUyWrFemvMGfZNY5NzTJiqzX0r/YSxjsH0DqE/KDZ2k/rx7o1dHYATNilJJ9JAkldSgT/
	DB8vHX7qxReOaoZD0chFaWI6VGoCWvuMexLRN10Pi6eyXR8aovuI/qePZwCHN+5uULH+mMz3DJE
	JbSc+9yNWO0BVTcRVk253kcUnRDtD5/Xtet8t7FaWwMH/QDJMIDqZtnjQ+kAenniLKMGVMmIZu8
	PPB9tawd3CaptCkL+zKV6SYlNB/GrxXjimVUaTiKhhu57i4TevPRANGpmPxe9rZ1yMMhUd+k1wM
	QwvNYLuXCCHhVCiS5YXPiH
X-Received: by 2002:a05:6000:24c1:b0:437:81b0:6638 with SMTP id ffacd0b85a97d-43958e541e9mr13914164f8f.59.1771576086872;
        Fri, 20 Feb 2026 00:28:06 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1bfsm54717688f8f.13.2026.02.20.00.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 00:28:06 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 20 Feb 2026 16:27:07 +0800
Subject: [PATCH 3/5] net: macb: Add support for SiFive FU740-C000
MIME-Version: 1.0
Message-Id: <20260220-fu740-v1-3-c8af54130c58@sifive.com>
References: <20260220-fu740-v1-0-c8af54130c58@sifive.com>
In-Reply-To: <20260220-fu740-v1-0-c8af54130c58@sifive.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, Max Hsu <max.hsu@sifive.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2939; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=0m9SXNeE/1HuxmVVgd6EQeU2mfVVz/U5fwVARClwTUI=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBpmBr8KrQfSF56ZFRp7zsifCcNkjxhIe9isJ/dR
 /Xauu9FbtqJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCaZga/AAKCRDSA/2dB3lA
 vY0fC/9G0xFFMdVahjzntxTBBBwK1F7PW8C7zDUURKiLa8PkirTxJxTourqf4rQb2XgFbwLO0rN
 us4GMZapSvbla4BFvmyqGflep/5R/NUytr0oUofbP+aszYNwhy64wx+9EsJ8m06/dawIB6Ijc0i
 v4NFVg9sY/qP/AvpcNnza98E35pHbJrRPzkkla5r/RuOYDOZmqahA7xNbeR68Bhl5CYfs5OK0uU
 hz+bQGglKUjorGsOdwVMXVSfnAzhzssdWBYS1dpwN/mw8vSwHSTcyK/No3seAEFAAtxkDll8c58
 EqMwp00Fn4lQwl3cRrNCMvL7gK0e8olM3Yj7ZWt9clJf+phxFQibD6hu4Qk6af224t9ZaFN2IM/
 8P7vdlJRFc6wUcSrx2a8yMSJXpl9ARr15zMKVOmOERjn4mOuBVA6iAVC5Vb1EXEgGUvqD3hkMAe
 tsXWsIwDXasWBbXpx+Ny84ejE0h8Plckd3fkHi9XhHKJXsYjAXFaJCYf6aVAQpczzEkQQ=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_002808_892970_5C0B2717 
X-CRM114-Status: GOOD (  14.49  )
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

Add a distinct configuration for the SiFive FU740-C000 ethernet
controller to comply with the SiFive IP versioning guidelines.

The FU740 ethernet controller uses the same management IP block as
the FU540, which is tightly coupled with the Cadence MACB IP and
manages boundary signals. To avoid code duplication while maintaining
distinct SoC identification, this patch:

- Renames sifive_fu540_macb_mgmt to sifive_macb_mgmt to reflect
  that it's shared between FU540 and FU740
- Adds a fu740_c000_config structure that reuses the FU540
  initialization functions
- Follows the established pattern in this driver where multiple
  SoC configs share the same init functions

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 43cd013bb70e..10d049391a73 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -39,8 +39,8 @@
 #include <net/pkt_sched.h>
 #include "macb.h"
 
-/* This structure is only used for MACB on SiFive FU540 devices */
-struct sifive_fu540_macb_mgmt {
+/* This structure is used for MACB on SiFive FU540/FU740 devices */
+struct sifive_macb_mgmt {
 	void __iomem *reg;
 	unsigned long rate;
 	struct clk_hw hw;
@@ -4650,7 +4650,7 @@ static const struct macb_usrio_config macb_default_usrio = {
 /* max number of receive buffers */
 #define AT91ETHER_MAX_RX_DESCR	9
 
-static struct sifive_fu540_macb_mgmt *mgmt;
+static struct sifive_macb_mgmt *mgmt;
 
 static int at91ether_alloc_coherent(struct macb *lp)
 {
@@ -5236,6 +5236,16 @@ static const struct macb_config fu540_c000_config = {
 	.usrio = &macb_default_usrio,
 };
 
+static const struct macb_config fu740_c000_config = {
+	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_JUMBO |
+		MACB_CAPS_GEM_HAS_PTP,
+	.dma_burst_length = 16,
+	.clk_init = fu540_c000_clk_init,
+	.init = fu540_c000_init,
+	.jumbo_max_len = 10240,
+	.usrio = &macb_default_usrio,
+};
+
 static const struct macb_config at91sam9260_config = {
 	.caps = MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
 	.clk_init = macb_clk_init,
@@ -5411,6 +5421,7 @@ static const struct of_device_id macb_dt_ids[] = {
 	{ .compatible = "cdns,zynqmp-gem", .data = &zynqmp_config}, /* deprecated */
 	{ .compatible = "cdns,zynq-gem", .data = &zynq_config }, /* deprecated */
 	{ .compatible = "sifive,fu540-c000-gem", .data = &fu540_c000_config },
+	{ .compatible = "sifive,fu740-c000-gem", .data = &fu740_c000_config },
 	{ .compatible = "microchip,mpfs-macb", .data = &mpfs_config },
 	{ .compatible = "microchip,sama7g5-gem", .data = &sama7g5_gem_config },
 	{ .compatible = "microchip,sama7g5-emac", .data = &sama7g5_emac_config },

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
