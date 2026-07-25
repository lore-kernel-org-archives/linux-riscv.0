Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1700C531FC
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 03:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7f+a6np0kBBgS0v4KIEwkOgxUPRJchPiZqBdvg7XrQ=; b=U9kuddyuNhSkAy
	3cSuQiVfoELc9hMvHO7EalKVFyS19xUG1RVzk+c1aZ4SiB1J8kZYmxt97HKM7ICMR0rPuafULEEkt
	wRNOyDr2b394gs5tXHCPk1TsnwCCw/na7oKtIORm+hJPb02YlqIHhrob1L3VuuSfi6TZh1Z16KJ4K
	5IMdXscndttDNyToJW/l4IKgD713uBmhRQ7lglXU7GI/neIq/lrwSiJUDj3iXjz7oGFXC4hBMNfHi
	24sdsAmzTGm39KHpUbfuaNFHh852/OtllUYH+3q/1OB04BDVETHNEM/hCpBB3JzNDFVw3HsEHMs5P
	AM6BqaIbiqUJT33IaBKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnStY-0000000HXTI-1YBQ;
	Sat, 25 Jul 2026 03:17:48 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnStW-0000000HXSd-0qFa
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 03:17:47 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-cab1b0bb489so1045771a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 20:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949464; x=1785554264; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+s3XIzGgmCw98QusnVJUh5PtZQnQQOXqs7KUawjh9Mc=;
        b=DDZk516gbUIWk4IaELUOfkEOaIeDPE2eT6rLz7gFcgRX/CykXjcDxv6AxVgCEPLA62
         AUaDu6b5YlaUH5nz4Ogv81JkPcoVbDU04vZfX8pfj3r68baliBODQjON5kstF0PQICLk
         gYTk5zC19ST6XPMhzA0W/lQ6iGYHeF0RN+oRpFfBTahZ1AK+8rdRcyluLot9SnaRFFJG
         6eYRT/Mbk5+3z6JVjCJmiGVVaNse83pL3WAJR2TbyEuyfCMz9djsYLble9odRhwK4wgm
         hCvZe/VwSvV2gkcllJ34vja+aJtu4k99mLaUdZ6XpimoeRFWEalDtP7friyO733SjkLn
         5Ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949464; x=1785554264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+s3XIzGgmCw98QusnVJUh5PtZQnQQOXqs7KUawjh9Mc=;
        b=srqIdhjowlXQIQ8R3i5XeGMANweDN+JEn2Yc5jBuu6lYyCzhxrah8Owq9Zk0XBjOWo
         Vh/H1jHk0JZBT2PdkZPYnigUYOrRFLZTHNkjFgaI8Epa+AFAV4moCzipwgyFgrU/u1jm
         aR78FT8KjHcm4NOd8K1QO/X5MtbSlc0xig0/dF1mGurIeAlqsjVbIompCf4dOPic0ntl
         xzJS3f4gfM27rNaZfYjdnwbKL3pkdom5dX20+c51fV3VYZNzus7puO8qjItd0NwYrBhw
         0LzlgOPWy/Yv5phR29WQNu69Sglf2Fvp33qIM1/Jx41sLJwxbZ09cNEY51b4Pcacg0AX
         4OJg==
X-Forwarded-Encrypted: i=1; AHgh+Rpdr7NFo8fC8l7LN2ai7Xj7ITvTEHe/fiyXLORDXgAfEaUN4B0Oxey+EHvlPtCPOVUEl70f9pF0WhaoPw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1/S7yfG/p8mjzInCzkb0tglqywdC8LTAKbbQqcCOEQUylKW7W
	MCyRDfxWniU/h2/sZ6b3tmWhapMMP1cxI1jtuoWBnetKqFz5PBeGQcyh
X-Gm-Gg: AR+sD13bB5VZjny8Aucnj8C+4A+/tKYaB5vGWp2w+wFZDxvw0QgHwMTjpxsykdugpwo
	C6ZTVkvkVklACzu/la3ooBqBumqjdaYLQC8hlgdV8Jljivo42kU9b95JbcW4AEJinpNrpCdOOhA
	q2G0S6qSltXw2FNbPwQebWT5I/Q5/GZI44d7EZcnHMbH0ugaLAQVcnTfZ2LNgCnHCLGRIGcGMdC
	NqEeD07apJJT1M9YvK2hZGz3xIOFSlvuiXZCXYx1HUXar1T4gIqOvr1B9IKVueGlI4xHyJ+67k8
	7/Dyt/Z5poeysCXo7FO8sDFKwV3Bv9q0rjEJjoVZdqz8eiRXLlm9TfMMGE508Bq5JpBlvZTLrt9
	VH9hzqC3ovKWO7ISbP4JaJoeC05pMCpeG3xt6XSWi6lmBiA4pof3M2sE=
X-Received: by 2002:a05:6a00:9288:b0:848:2f77:e2da with SMTP id d2e1a72fcca58-84e595d33e9mr653832b3a.67.1784949464300;
        Fri, 24 Jul 2026 20:17:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:43 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:36 -0400
Subject: [PATCH 04/17] dt-bindings: soc: spacemit: allow eDP/DP PHY PLL
 pixel clocks on K3 APMU
MIME-Version: 1.0
Message-Id: <20260724-k3-display-v1-4-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_201746_276896_13D0CDF6 
X-CRM114-Status: UNSURE (   8.62  )
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

The APMU's eDP pixel-clock muxes select the DP PHY PLLs as parents, so the
K3 syscon takes two clock inputs the other variants do not have.

Gate them behind the K3 compatible instead of widening the shared clock
list, so a non-K3 syscon cannot silently accept clocks it has no mux for.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index d3a7c93c3c54..b8fc6632a392 100644
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
@@ -95,6 +99,30 @@ allOf:
         - clocks
         - clock-names
         - "#clock-cells"
+  # Only the K3 APMU exposes the two eDP/DP PHY PLL pixel clocks as extra
+  # inputs (parents of its eDP pixel-clock muxes); every other variant has
+  # the four base oscillator inputs only.
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k3-syscon-apmu
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 6
+        clock-names:
+          minItems: 4
+          maxItems: 6
+    else:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          minItems: 4
+          maxItems: 4
 
 additionalProperties: false
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
