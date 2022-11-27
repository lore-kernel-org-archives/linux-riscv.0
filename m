Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F1FC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 13:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmD8Wz2TlrDa34EhuW4kM/rM1hpVTcRPu4JOTbqyiAY=; b=DdyibRoz0jPcDX
	79acaSoVAT5TNLbJf/B915RdINhOogpWStImVKsWirQuvfr3KMZRzgeAE6impQX/OKQ8Qb/F3+NDd
	MV3O7OwHziWr9DHWmZze79dofxGf65Ga/iHEmChHxRuDv6M7L8jB7d13SISOl282TtNczWr2ckZsm
	82wHV4MV7yhBE0ja3/KaQc/CLigcdjewFHixRmEcjpY9H09XBn4bWLjkBxiLkrLkSS53TEjHciGZT
	VWK6VxiWdyRd9CGwX/wE4rcZ5q+R0anXm7gyrLiViakS6tG2cr/SKTIKkfUTYhmPsfT11DNuIbekE
	izfPPN+YPQIxSIzfw9Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHo9-00BPoL-Qw; Sun, 27 Nov 2022 13:34:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHo6-00BPkp-KH
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 13:34:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3237C60DC6;
	Sun, 27 Nov 2022 13:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B3AAC43147;
	Sun, 27 Nov 2022 13:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669556093;
	bh=/ZCJIapbhAFwGAPm2huWKEnvb+N3AThTq3C/dUcmpLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVjto4Nx62tTNObrQpJsOpuQqme64t/VpTSXAEPbc5ygHlmX4jWYSgiZ+tcOt8NvN
	 Tkp8sB4Io4lw56KQg04oSl8oTPAhnbd5BgRRnJF/HMGOH2xPAYhc9KmnWDIP7y9f7f
	 ZFczire6Ly+lC3rZQ2dr/dYfLmkMJ1YKWHTul7ZwJY4PNAhZp+5zqi42Ez9dFQGhL4
	 TTYEhhqqHMn4K/dHQCftR0Qvv24FiSZlZ/1hXAdJ7N0gjgzWt4WJLB/5hSoNuVBSi5
	 UgJZvHXRxjpJvNm+oJGJjWQoZJ32waIkdSHxxcinP1CcNdq5bn/LB0He6qyEy/qrdy
	 3Yb0E62nyd3vg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 4/9] dt-bindings: vendor-prefixes: add bouffalolab
Date: Sun, 27 Nov 2022 21:24:43 +0800
Message-Id: <20221127132448.4034-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127132448.4034-1-jszhang@kernel.org>
References: <20221127132448.4034-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_053454_721202_6965DE3E 
X-CRM114-Status: UNSURE (   9.03  )
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

In the following commits, we will support bl808 SoC which is from
Bouffalo Lab Technology (Nanjing) Co., Ltd.

Add bouffalolab vendor prefix binding.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6e323a380294..81618f1dc01b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -194,6 +194,8 @@ patternProperties:
     description: BOE Technology Group Co., Ltd.
   "^bosch,.*":
     description: Bosch Sensortec GmbH
+  "^bouffalolab,.*":
+    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
   "^boundary,.*":
     description: Boundary Devices Inc.
   "^broadmobi,.*":
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
