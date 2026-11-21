Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B53D606A6B9
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 07:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qCwfZi+J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=njbIRTBd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Iq470NWNuaZIhU4nWtNuRF687YRcQbXt+6qdGra98eE=; b=qCwfZi+JbKN3aOXtm/xqRp7Wqy
	AR3WZ9Xo5APE2nfLR31GAN885g3072pse+DRjyTfO23r35oMlFqHYi0eNwc4Jea+rFLuVJ9TcK/sF
	ocsOSD6aIkx/qfeW2vnbbxBPO1iEueKKDW4sWc0mKWdEvGkQ3OZvPaQYFITauNHdPEPxmFGuDFYA2
	HNMhuhcBwAprERfMqPEOX0eEywjrHgf1s3lBnBDoWJ9Osbj36JgaZuXNIOiGvgamWoXuDE9lTHpsH
	US/q6O11TU+eHIBWJj1RMDK65Geizksb4Janl/bSWD7bvy+o4c/ci7pm11gw/G1JBgXHKN2JyWNg8
	+1GjeGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUfiS-0000000GqzE-12lI;
	Sat, 21 Nov 2026 07:40:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUfiP-0000000GqxX-3tLo;
	Sat, 21 Nov 2026 07:40:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB2DE42A84;
	Sat, 21 Nov 2026 07:40:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795246852;
	b=zG+PdeRLO/7MUdBE9O9dfJyZdK9yLkpTEsE1e+YFzfnndYwB9xT14GQ/wM9Z77lwa8m1
	 Th8qCDxVsro0dyiZspBQgwcAVHieTjTvnrdY73yh/0/18jd0LcZbZeXUn9LFnlIWeUxWw
	 A1OIVYpAwjrmSNq9kTJWDe6QY8rAk2PnWJzTCzyboAQfmuKe8L9uMh2+lPPS1ZDwh5i4D
	 tRT6xQZ3WSZTfK7tOZgcATIfY03J8cAte52Ziv4ah+YY926vlXsoUGBsx/I0M1kJ+CFe8
	 PzCMGCB6jeiHa9Prv6brAeniuwlVP2V5Ab8R0ObDsTWQOic/XguFz4GOdtzNPXftDTA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795246852;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=36V+mCW4ECCK+xw/ld7e56VJdb4cJ09mJjljNXhrscc=;
	b=hPm014g8rjFPQk7/EE1uLsvTdN2wrmR0BC3SKexn/rQfG5ya2jXpgICCWzCkmh6srul+
	 G4h0SmmYllRobhGmTrCnc5fjRJYq9ZZ1dzWr9AFWMcrzXlD/edHWO/I7xyuuDT0cyOC8R
	 bYsmyHTMq+La2OtcqX3A0v5V0Rfu96YYrp5MhRyib7+AFGQ5WJgD1ux/VlgKDC13lcCic
	 IFeW3tSCtShZ4C77HmmpXFg3UxSaup0355OlmnyJxmQ03Umd+0FHr+M6fpxV2j52kPPVF
	 FhRspLLnq4n0zFANnzbqWuQW92DpJNeLFETksIatgYftxWZz6DHX47lakX0Cuv53a8w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 413651F000C0;
	Sat, 21 Nov 2026 07:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795246852;
	bh=36V+mCW4ECCK+xw/ld7e56VJdb4cJ09mJjljNXhrscc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=njbIRTBdfbRhS67jmPPhvWOCeLGt9RANEv8PSUpSoB/ogqOXNnJcl6zys5cxB1gbQ
	 NwycZbdy92shcPxDhbrEZLsR3/RQphqCWKG87gdLy38crhpVDeNXgfr1E3RFCzZad2
	 cQfhNM9baR7HsPI2BDfM8QfFNuX/IQdYQ4ixOb9aJfziFFOGxRJxBeApPsviIGKHCY
	 GOQVqhXTFVZWBhN2IUPb2EKc25Ycbnoh0J8a19/3JudNpTjN8f1Oi/ZAApUCyHaL3p
	 xue2+B3YVZd91dZajfG/Zg0mgeDQ8zTHp4kjUmlq99uj5ot1fP/FD5W3lH6QL306In
	 NG/TTqZdoN2FA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BB8C34BB58;
	Sat, 21 Nov 2026 07:40:50 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 15:40:43 +0800
Subject: [PATCH v3 04/17] dt-bindings: soc: spacemit: allow eDP/DP PHY PLL
 pixel clocks on K3 APMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261121-k3-display-v3-4-ec419e8e96b8@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
In-Reply-To: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Sarah Emery <sarah.emery@canonical.com>, 
 Ze Huang <ze.huang@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Cody Kang <codykang@vsit.ai>, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795246844; l=2001;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=8z29uiPe9ruZwBHD+8tg202RRjoYCzOLJvY2lG+G4Hw=;
 b=j/KA3NbGILk6e/+FOXm3iIrI4CJGQMEo1o3wlEZ4XTxVICrTNLIpZWSFw4IhMdt6cYhvqJdp/
 2N/YrEDtRJKCCu/Pj3JL+4mSZbXur+4mv28Fyo+y0BAqZNB8Gcqok7L
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: codykang.hk@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Cody Kang <codykang@vsit.ai>

The APMU's eDP pixel-clock muxes select the DP PHY PLLs as parents, so the
K3 syscon takes two clock inputs the other variants do not have.

Gate them behind the K3 compatible instead of widening the shared clock
list, so a non-K3 syscon cannot silently accept clocks it has no mux for.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Cody Kang <codykang@vsit.ai>

---
v3:
- add Reviewed-by: Rob Herring (Arm)
v2:
- drop the redundant minItems: 4; four is already the minimum
  (Rob Herring)
---
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml   | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index d3a7c93c3c54f..a6ef456fe14be 100644
--- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
@@ -31,14 +31,18 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: osc
       - const: vctcxo_1m
       - const: vctcxo_3m
       - const: vctcxo_24m
+      - const: edp0_pll_pxclk
+      - const: edp1_pll_pxclk
 
   "#clock-cells":
     const: 1
@@ -95,6 +99,21 @@ allOf:
         - clocks
         - clock-names
         - "#clock-cells"
+  # Only the K3 APMU exposes the two eDP/DP PHY PLL pixel clocks as extra
+  # inputs (parents of its eDP pixel-clock muxes); every other variant has
+  # the four base oscillator inputs only.
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: spacemit,k3-syscon-apmu
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
 
 additionalProperties: false
 

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
