Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91393CCF9E6
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 18:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVxOeIiIbW4AAXPO2p7y96W/PXcvAvUSTN6uLppHBJ0=; b=1vJH6+U3avOF1O
	IxqY7dKWiPvilvRpnS5uR9AAnR3UaWbFAkAzFvsB9EAOtR2o7KBNaKqrh9L6dgEymSaxAEIMclcPL
	Fs5GNqHRBOWl8KrInMfIJStBXznPe7hDM8sERJEx1wK7CAzQUTH3IssK/06wC6BY8sekIKHodPXqO
	J8uHPvrUc63anMu2WTudSbARfRZcGRP8ly2gtqJ4xIMEvoghNnlOq0e05kp2WzDhcM0ihZlNV8W2+
	SqN17rOiIoOG8mNLkImKxkTBiShi92dn/dmQnOogCeYfavaZnUak/0tk1qwmJe1xf3WiVYrdyS33q
	Bfds2VOtM1XHj3WVGvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzb4-0000000789e-0TJ4;
	Thu, 23 Oct 2025 17:59:34 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzay-0000000787e-1ea2
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 17:59:33 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so15926125ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 10:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242367; x=1761847167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSMHyHNn/1vbJ7NUSylLHrrY4cYCxvOBtERxkVz+doQ=;
        b=LcKLoBVj/uEbR9WpXSIIq6k2KW3EIqNoX0Pd8Dl8SdWp6mgzv5oEl4BrpgtKxEDKig
         yi1TMfDByWHM5So85rJx1m1QTGCo8W0oQ1ZSXx/NDF7g7UWHodkLvLsvxU74Hc0ix6NK
         9m+dGVtFLW3Jt43rJDVQATg8/rd6UrJk+EIDT1Pfnm2tu8fJE53WqUi+28fahnKsADvg
         j7nfyOtNseCFz5REtLdKPC41ikjk8pKSI9vXXNEixUWcGEaZ0Na1M0InZ1dUOPDBWbKh
         fJOWmYpO/iqBrme36RRrdpwTJ6vohlkWujsg4w+v9P26AChyFdXnJk0NPRftGR/OEuw0
         KsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242368; x=1761847168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSMHyHNn/1vbJ7NUSylLHrrY4cYCxvOBtERxkVz+doQ=;
        b=q3d4P5Jg9Z8jfL4FJK4619MTvOtG5TtHrZ997z5vLwHuqmwgFZnhFBH6pquTk00aOh
         67v23mFLDYm7V+dOANuG+ljUFBA+3nASDDERpRUSjhKs5HDLwfHVjlJKbBmnSw5YXtlA
         DdVhlJzMmin+ci7qEqskMnX6TyXeMMvivp9Se91VPTgibK1lrhj9m+Qo9JSOM4ynFomo
         OPndRnwHmwtfiQZpG2X4J21bykWyDwNIV2EeR+kambjrGVCako2J6nTpYjyuIRR1iOjr
         rOX949HE8owgTztkl87TSERr8bUj+zwh4q7Y/zhYte32EHIIkBkB1rvgdGek0YTB/inh
         dCTA==
X-Forwarded-Encrypted: i=1; AJvYcCVWBEZyRMaQm5LZKy7yByaoj+3o0zbf2agkZLpHK7vffNIQcR0MQRWAsmrloykmZJAqb/JWEh/rZsBqAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB5bWtMQYSeJ4b0syJlIFZxGxTlCYTjDS3XLpScNgK5XlXFK99
	K/5PZ56zaBx2IgTSmQdprwfpjpNKDzaI2rRc6+9Ct35sNRUvbApVOnUUCyoPhuq4gTk=
X-Gm-Gg: ASbGnct2JfhPob8onXiX7yAZrR47VTgMEIDABmN+Jp1bwqnumi/ZcGiPneq9HnYgbL/
	BdapDvMI6NDdNIN0mC1XFc6FIJQaN0yeqUdDicWyS0qItFujv/OJKjM0Fb96AOYTjzfzKIFTHPp
	MUNosxm6L++Ain4KmQSzXswwkSFY/j7f2n4NCnt9zuOcduW4RngfZvhGtEYnRuNQYShGgYNBRXH
	S9jCzjXUyPLLJi2MEqGkYcshSVtmAx5RF9Y+PXBCo+iHTpr/SE1MZ+ogiL73EqGZ7BKpiuCeRPS
	qWAQ7Mb2dEedBkWabVJE/653ITeiPB7rI0wQq9Qv7HtCrkIJcwVEUBogd/nWtauHFrL5WjOU4WI
	zUjfYIA5iU0X0GOYhIBOBcc+A09ynxWcdavbCtXvXz7Zd9uSbyFYA3xlnpUkDjNZ6ziPq/tBpf/
	YZxYHCYs4GmoNihiwPT+7yAbp3xTLC3VXN9w==
X-Google-Smtp-Source: AGHT+IG5ODtZ8NpgnPdL8N4UrnSSIWOWkDsOvPyVBDaaByRktns1SQuJqvUf+UP737qEBLe07B5fFg==
X-Received: by 2002:a17:903:440c:b0:264:8a8d:92dd with SMTP id d9443c01a7336-290c9cb8b95mr329120295ad.20.1761242367696;
        Thu, 23 Oct 2025 10:59:27 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:27 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] dt-bindings: spi: fsl-qspi: add optional resets
Date: Thu, 23 Oct 2025 12:59:14 -0500
Message-ID: <20251023175922.528868-3-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023175922.528868-1-elder@riscstar.com>
References: <20251023175922.528868-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_105928_429411_03C88E7E 
X-CRM114-Status: UNSURE (   7.17  )
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

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - The "reset" property now only applies to spacemit,k1-qspi compatible

 .../devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 5e6aff1bc2ed3..edd3158a6f2e8 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -55,6 +55,21 @@ properties:
       - const: qspi_en
       - const: qspi
 
+  resets:
+    items:
+      - description: SoC QSPI reset
+      - description: SoC QSPI bus reset
+
+if:
+  properties:
+    compatible:
+      not:
+        contains:
+          const: spacemit,k1-qspi
+then:
+  properties:
+    resets: false
+
 required:
   - compatible
   - reg
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
