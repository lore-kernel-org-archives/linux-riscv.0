Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73FBC53200
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 08:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0bUuLxZTVdglfvQV2T3+ourXGq3/Dmb/j1UNKbWBms=; b=JwubyrtNAjwt2H
	bzHzsgGMl2WHP50gaq7gbv6ah3hcjUNC9sz6YRdRox6/0QWI7rkiwDt7cgOw+tWitVWiLsXy5Kkq8
	Pl3FB9GF/ySlh4V0Bv/uaXpdgen8jE+98vpYUD7rREZFhwJM491tmqYScueJMNkH2XAKaaHTDUnqR
	WoWKYFRbDMiq/35s6vbM3I70QmkETTVwgL4xzt91JuR/s13HV0sPyUR2c8Gd770x/jPm2a7SpyNs8
	SR5v015LBwMhL56DOe5ZVEnmS6UoQXpD2+qDBLpUk8hBdO/Q0oztTPdpOsABk1mltI9RKAn55Ws5z
	k8zopwKAjIHBbHstschw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLrh-0000000DPg7-3Ngl;
	Fri, 20 Feb 2026 08:27:57 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLrf-0000000DPfT-2i8y
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 08:27:56 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43626796202so1643219f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Feb 2026 00:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771576074; x=1772180874; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/igY8Az/VsZJlm1xDZMRduuC4c0JTGDigxQuwADxBg=;
        b=fK8aM2RqX+Nw24Z8FBm59eDEJainRJlqn6HH2hp4LydvO1z+/SxOAICC6eK5Ss5D1f
         i4o93vryoEgxPl18hXRC2EuqylRGoaay47lvc2I0HrXmqe6Oz07EKSlHnVLb0ipMYYGw
         xqK962pT5Bu0w/QBEq+9xmjcRxwDeDGZ5GAx47/XlFc60LajZHcwcsfwh3K/VyY0zaWT
         jryfbEJFkhuRd+0xok0310hDHkq8a38kjefdb7hcO0byjYUOMaPP+gnD7H7jWlQovO+P
         hMVWdhLB43XKlkbtj/dTu1q+uyshd4gQ5NdHQL8PKDYIetc6RD6NIA1w0r/2NRbhgCzo
         /nYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771576074; x=1772180874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i/igY8Az/VsZJlm1xDZMRduuC4c0JTGDigxQuwADxBg=;
        b=tcMrSRPTLnD0eLgWi6VJ86D9AdSGvHooo/FnOhjRsy9AaAxvrhJwWW2Dhh5C2jv1qU
         8HEsO+2UyXSntZYciOlDEjTS/UqSkxlo90AI0o4eeuO0Ct1Iq+kx9nkGxgZEoGR/6fOo
         Tgsac4wYO7GkOgBhmiED/mZvbqceacGubbsP+rnd1HwltWrsMQuFnBaoYvnwXxkQIBX5
         TayDz/Qw0aHmO7xSmmnIlwNTJPUVAEYpjTKb1KIO0KECxYXx2nIt04CJeGb5oZ/T5D8V
         wpPEXtHoiSS2M7ltYvPMDZu5YtKJW+f8JAZmXalQPQcladZQ5w4kZgbFraEnhUXM5fXA
         f9pw==
X-Forwarded-Encrypted: i=1; AJvYcCXnWS3SvrClsi3uPRcRN6Xt5U8Sl/hPzzKpY7kZ+SuHG6CvRrpU1ZysNmaNP7lyIZ45W1gOXNipUWF1Lw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmibZCMhyA3ll/lFR00WcEovXbuf1DRf7diCSI36SplWklbva3
	X6y0mrhnR3zjWfmclT3+3x+P+LFkp8J0Sqp8xllAxZM7gbrAEfTqQy01LUikc8erRfo=
X-Gm-Gg: AZuq6aJH6y4dRgSEE+G65uT1/TOFJZEGajBnSVPhIg2RqBchf5R8iDqFjrJxUB82A5T
	DgiN0XY5tuRisUf+3W9verOsz3s2GNXIykDO1Ipaabyz6HJZgSPMCZePQDar24s2f0agn4fKl0Z
	FTnk5kElsfKWFlavey19IjdeDX7jCJ8f4HHPm4+hLuHEtW0EINlNNV5F7g2ACN0a2oCcXP/flzR
	sTCaCMOtyrdUMYgZIZ+QjEsM6MK20psgUCyxobfXg25c/x8V762H1MrrscPNsWU+6NYpc8faRVU
	1UM/X/lFf5oKlSMK9bSItc5GFGyWFcCl7RXAN+If65cFeCnpu2ICqsuoeGkDQm4QfXuWHj+cjRo
	fGH6mnw+1XzkV0X5HG9Hb2oqC4PieQFWSxihpSctDu8Y6U8Zs5v6aYjqBi6Q7m7u+ajnvH8wODo
	y+mR/15QRvGdu5Q320OREc
X-Received: by 2002:a05:6000:3103:b0:430:f68f:ee96 with SMTP id ffacd0b85a97d-43958e4a763mr14559959f8f.36.1771576073712;
        Fri, 20 Feb 2026 00:27:53 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1bfsm54717688f8f.13.2026.02.20.00.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 00:27:53 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 20 Feb 2026 16:27:05 +0800
Subject: [PATCH 1/5] dt-bindings: net: macb: Add SiFive FU740-C000 support
MIME-Version: 1.0
Message-Id: <20260220-fu740-v1-1-c8af54130c58@sifive.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=YJgGJZFBEeFnKwCZBKtMF/4z3f6ENQ0IR89Zow+dMes=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBpmBr8Oji0/4OVhQOIUlKAIgJBQ5IPR4YxPGYhh
 goHXM5+HRiJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCaZga/AAKCRDSA/2dB3lA
 vdGEDACBZOQzifNbSjKgt1DwPNhFpnL3Bj+UAEIr0weXbZ7rZsZ2J71Bn7D2TjtbPF6gSUQh9TB
 u23Gvon4ro7QrbdH9K+Sg9Dhe50X7LjXj978B2jLf48Jb2xVvo32OBNuvHZidvgOv5ZGsuMvfak
 xlX0HB2czT1jn/Orh1i/zz1UW4/pMcGGgOhZ4/BMg6LutjuEic9quiKJo+oXqeBwySJmq4RTVbK
 zC87a0yqs40PXIHgUC76c9JjqspvRjEFVXRqY9vYgi5DQhRPOZIrjO196ZK6WDj5vrVT67yCkEc
 gRZeiums12ErPNalqrAOMceY3J1vHscNh2BzhAUmh50Hztck0BMHRc7TO/S/ExWT4yXFbwA2pfy
 41fHmAxMxpliC7zdowFN4ftLDrnxI05dS31ML9SgUoz82WPlypMS47DOw3bPrIMeI95HF3zRgDM
 7QdyG5280seME+oT3I9NUn6bVru2yTmihfXUlKeQs+7F+34waoB8I+wODhRbKVuwkaRpY=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_002755_716837_88A46B6E 
X-CRM114-Status: UNSURE (   8.97  )
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

Add the SiFive FU740-C000 ethernet controller compatible string to the
Cadence MACB binding documentation.

The FU740 ethernet controller uses the same GEMGXL management block as
the FU540, which is tightly coupled with the Cadence MACB IP. This
follows the SiFive IP versioning scheme which requires SoC-specific
compatible strings for proper hardware identification.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 Documentation/devicetree/bindings/net/cdns,macb.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
index cb14c35ba996..b46dde1da170 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -63,6 +63,7 @@ properties:
           - mobileye,eyeq5-gem        # Mobileye EyeQ5 SoCs
           - raspberrypi,rp1-gem       # Raspberry Pi RP1 gigabit ethernet interface
           - sifive,fu540-c000-gem     # SiFive FU540-C000 SoC
+          - sifive,fu740-c000-gem     # SiFive FU740-C000 SoC
 
       - items:
           - enum:
@@ -74,7 +75,7 @@ properties:
     minItems: 1
     items:
       - description: Basic register set
-      - description: GEMGXL Management block registers on SiFive FU540-C000 SoC
+      - description: GEMGXL Management block registers on SiFive FU540/FU740 SoCs
 
   interrupts:
     minItems: 1
@@ -181,7 +182,9 @@ allOf:
         properties:
           compatible:
             contains:
-              const: sifive,fu540-c000-gem
+              enum:
+                - sifive,fu540-c000-gem
+                - sifive,fu740-c000-gem
     then:
       properties:
         reg:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
