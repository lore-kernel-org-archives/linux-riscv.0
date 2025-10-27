Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D79CCF9EE
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByBNnq2qNUJBvLq6LAJMYWAKu10mIpYu9OCzJLkw7mQ=; b=DAmjQJskxdS9FQ
	/1ql5S+HI3G3C0o11MgpiQ7Igw+e2klOp5ZRVcsuIq6aQTYW9fs7YQ5ea8FK7KYRJuTwEPAhyDcW2
	ZxBjKWPDRjyqd98nig9ZZbYWo2gNbExaU92HKeTrqoB/cgwirIPBFUv0Ogt3jPVmuWy3nVNUtAxPc
	4xVJJED+qBzpEGU1ctVaDzFKA6Y8G+aS+lpzuPtXdKgKuluOOMQxVkrVzHolHpkg/N7e7dJxiwvxc
	JrAdW1u7x6k215uVlQJeLjwvH/J9b4UctGjbcydtvy4xmWOXZrAmdHnwl18rLKLKGpo5WsbSvrL4a
	kJDqYrkBuuUyXMupFZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIi-0000000E1x1-1DgN;
	Mon, 27 Oct 2025 13:30:20 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIg-0000000E1uu-0AxL
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:30:19 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-430d7638d27so48691135ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571817; x=1762176617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8ni6EXakGblNMElr9yGEmr1BYrUDmPrrWLSAOgcMRI=;
        b=2uunErUGwCAjiRZytu+Kp+pE4oDti+YuKxl9G2bRMwCmL1pRUbn0SQGxZMI/lsto0n
         BpBjwNbtpBbbb+/KWCz6NS+I6xWRuPA5fK0sOrUWAS/hT2TkiFEBWD92G1AzV8YaRaZX
         re3HdxOvWPDqTupqdi6qo1iuvupWfZxw21BUFaYQSAZu/jGV58amP28duRIhQ8iuao2g
         4oXB7NUcze5TiZczsgv/ZKBeZLlajIo/d18FVrv2qumNbSAA/SC/aG5cZb/8MaAc8yUE
         p9eSQQa0oarQRMVh7fRUWo3n8LYShahTwazZ1ib2xoSPiyFgMIpZ6STjpJ+AFQZZpHqB
         oRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571817; x=1762176617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8ni6EXakGblNMElr9yGEmr1BYrUDmPrrWLSAOgcMRI=;
        b=eUNvSTJBSMbjs2QDqANbFmLYAVXSboIKQaAO6j7w2XcDKmZA3EjeMtpFxc+jEGeZOp
         E4sEj5sqnrGqk/0VDgXuV+Z9InVabaYYkzXONUnLnZF9p8RadGD8Ex1zCYFC7LTnJbq4
         Q/+QrywgpX6noVKAwxRtQnuEv5XNktG9JfKsu77rncsIhLYjyQT7lVXKBdEUfxkji/OX
         z5nCP3bfJ+PCGhoY2VRN5oEWatyjjAU9QqT4huQmDqkampc6HEZwVSYKxGvTiqmRIhff
         ND+UKIY2bhQmZ9SbrfF3nvIOPGwtigUYhunAkssgLVL29A4B/ME/cFKRdDVKHdND1S9f
         wrEg==
X-Forwarded-Encrypted: i=1; AJvYcCVCmglguT3wEN5B7Tx9B4a9+FxFTrxNJJabGPrNOjqxxS+s5RkLQsawG7uKTFPFPIH8NLV5HfcZpPVfBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBAr1TaYYoA0N5TRDAyOzqFGjg6dapR9Y/Pn4PpGDBmv+WI50/
	GpKKfy3mm+OnDXc7vN/p9GvjOSN+DSY8+qLanliHJ1HVG6vxwLnkt1HMgB4ccH16QQQ=
X-Gm-Gg: ASbGncvX6U3mckZGRJnGaelYAaZg9EZD+2Oltijc9V8i9b3xSN8+sMYKFxWuFxuG1Cf
	SM+0rsGVt1viPaTDp52Ebcj4mbuAjXTgSqsIYZEdxkJUzjlnQE7xocohNxbwAg1Mtz0R1ksjwvB
	Fs5ts9+BgGT5XPuqS51CdRR8cz0DqT/R1rRPIAlmCWarqkVx9zld7pyXYyxZQZx+G/nAmR1ntsS
	+O2H9VbPE0rrqa9p6bX3T4Kjf/VWFJoesMhuI1PsNekVo12qn1Drc3UdRiGWTLhM8TGXJxoxZcJ
	3nxjL+gIc+tY3VxZLTsDQVADlI3P4NPBD+v5icnxzUQxbSsrY5I+G4hj2OeE/eWuO8uqALc+JMP
	03RT0oi8fQQk8J6EFLnhxA7wiGJmNsALoXRyHv5kjyu02a9C5foQFGiPu5+1o8nSdZXqZscNIbs
	gedNSOOlTbbBDCXkMYbPpZYq8GR53nkD2W8txxJVwznlA=
X-Google-Smtp-Source: AGHT+IF2HAyYtoY7tqjtENmVwo8nugPI2UtLxqpWE0EI0lLCgNJiG2I5oXemQ3pGAy09KPpQQnNXJw==
X-Received: by 2002:a05:6e02:12e1:b0:430:ca90:d0b with SMTP id e9e14a558f8ab-4320f7a8964mr1116135ab.26.1761571817075;
        Mon, 27 Oct 2025 06:30:17 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:16 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/9] dt-bindings: spi: fsl-qspi: add optional resets
Date: Mon, 27 Oct 2025 08:30:00 -0500
Message-ID: <20251027133008.360237-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063018_082062_D4F631DB 
X-CRM114-Status: UNSURE (   8.58  )
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

Allow two resets to be defined to support the SpacemiT K1 SoC QSPI IP.
Move the allOf block down, below the required section.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v4: - Moved the allOf block below the required section
    - Added Frank Li's Reviewed-by

 .../bindings/spi/fsl,spi-fsl-qspi.yaml        | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 5e6aff1bc2ed3..1d10cfbad86c7 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -9,9 +9,6 @@ title: Freescale Quad Serial Peripheral Interface (QuadSPI)
 maintainers:
   - Han Xu <han.xu@nxp.com>
 
-allOf:
-  - $ref: spi-controller.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -55,6 +52,11 @@ properties:
       - const: qspi_en
       - const: qspi
 
+  resets:
+    items:
+      - description: SoC QSPI reset
+      - description: SoC QSPI bus reset
+
 required:
   - compatible
   - reg
@@ -63,6 +65,18 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: spacemit,k1-qspi
+    then:
+      properties:
+        resets: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
