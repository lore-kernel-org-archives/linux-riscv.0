Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792CCCCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tqHE+R9H4Wryf2ne4nKGzXKJb04UZPUBDe6rKSDcsvw=; b=ZctLhDfQiss+nU
	7C32ds1/4mlXMU1nNL7UEUJToQ66vehgoJQ9psQgoCwa7xclxErzw/bAtQWPiv0frfPy1dTTYTkJP
	Ga60pnuVCB5YTrkvWWQ6jwJz7uNbtG/GPgcEO1Fq8NdzDPQz3G3s6Fx1KDdT+JqDGfYxxaUKCtd36
	4t7absgCj9ldEXE0IIwtrCpDu/e/Zzaa/PuYUpbIOGlw5wm0x7lErI+NnMQURko3jlg5qA8UkZpXL
	XFlDCtvvN8Y1nJBKOiOin47IEKbL/IZ+YSJF32EeELB9Ls3svO/8+p8wh92eN/plVKNKQcR/xK1EG
	MUdgY35ZK0e6FM+7tSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGZ-0000000AL4t-3ih2;
	Fri, 24 Oct 2025 19:15:59 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGX-0000000AL3q-0tkR
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 19:15:58 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-940d7cd5045so103257339f.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333356; x=1761938156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOGEEJh/33D603wteGhrxPA31YJMUwUVVAtQyDoqnvQ=;
        b=cEeuFNR7GTRFxkSNKMWLL9eVYTafz/XtKeMOPoFIlvldlREmm86n3etS0ryMLFxtBm
         DVTfBcGl8ncYRZP8GUzYD7cSgI7craKoxNBjYujcpi1UUtP6pGRIi7ji9+2khP19WZSP
         JbyzBpgduYtmMmBEoCZ+9NjEggq6xeEUa0uUWgF8cAj44kFzS/+04Enzxg+MErIKeTzk
         vQkds35Ip0INrYP9HOMSw7LPHQ7eAn2KLVQFNOqgncqSelsU6aiVEu/4EOjCF/5qVoBb
         c/E6IXi+h3gPMb5SqpJKHavzY9OTvgF1XzDWKQtGou6oDvzmvKTvBjR48x1G6dsNRI4c
         UxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333356; x=1761938156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOGEEJh/33D603wteGhrxPA31YJMUwUVVAtQyDoqnvQ=;
        b=hU8Vc7Y2T2CFNNwG5gT16hs0r9tRdNmlL5RCe62gPyAT1IZLQfZz3z/IURQerGDhAQ
         mgcgGX6aPZzuxzK5FiEI5A4CA16XgZ5cOyPQT73K5Ob5Dz3tcpYOT06YKycFAoxnLNJ6
         93P8J6qV14X6BQLlGg1gmvHeeRGj5BTDRs5SWq/gNFx6gArmEp1qYqppSuSjHq3omBKL
         j7gUvDYgWrHEAevX3BlsyPxPJzFQRFr214i8s3CqVLsbr3I+YMPsLOy5plwOSKg8DZAx
         HpFMFA8nByi7DgGu2v1cIk+TCYogmIplSE4T+yuHMiAYNN3TBacu/zNajnvrm1/n9otq
         b1LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcTlpNuIEqhlHvkxmlBqECt7LWyI204TDy18VKLOgg2KfTZplu1FTQRhsCPt5KyvgYnIQ7H/KtOmqXqg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz45pQ7EGEb6EsYNzAMSWJQMO2f8d96/aSap9rx6YgQDBulInqS
	oBNwYXntxt6Y9GVFxrL4QjY1P6VzQZAdAt7jdF1DMsiK07/GMot/a+8rU8qG10NuNwE=
X-Gm-Gg: ASbGnct0+7L3QlUs2Qf4hh5+vOqDkruIZJ7cMNcI0Hkypst6AbH/UMYe6HpRU/LEdgJ
	+wkIti3jVkzgq4+DXI8DlOMfhFLFCcRFwro1FEEBGBV53vBXFqD73YUDvRAifoLvGVDJGdQUC5d
	jqV9+am4YQDM8/7LVfcWst0Wm1ZdSxBjoF4B3m1AA/BXbiz1rCCkMT5kzN9OEiWV3ho8sNOPrQw
	VWVn5x8IrqjOhgDkUWp8tTJkZAIUzrjq7iyCuRwyOZBjeeBq7BDDEoLf4ajhDsH6R5MkwIzG9NL
	7+kvsUHmApm9GNtPRy3sxRa8MGbdeZ/LkFrp35/IzejTBYpTT1EeTtA85sdsfKVemF3zt9vtznm
	VXBOwZN6oACAY8d+C4LVJm3FuJwAESQ8ko1Y3XESaT78MnU7OuyJON4EShpSq81RTOp8tbAflqt
	7aB+yodJLgwLbfHqQqiNs2kHeVEZYgXSvzzZvUmh29tLdvkrtku0s3vw==
X-Google-Smtp-Source: AGHT+IFDogyL6cWcfQwc3FAklbFwL0iLqDuDqQppxCvEgv6jdMEMsj7R+FgIMqftII9RxRpxH7qsMg==
X-Received: by 2002:a05:6e02:3f04:b0:430:c49d:750c with SMTP id e9e14a558f8ab-431ebed79admr44368525ab.27.1761333356161;
        Fri, 24 Oct 2025 12:15:56 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:15:55 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 1/9] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Date: Fri, 24 Oct 2025 14:15:41 -0500
Message-ID: <20251024191550.194946-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_121557_274932_B3DCEAA9 
X-CRM114-Status: UNSURE (   7.21  )
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

Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.  This
is the first non-Freescale device represented here.  It has a nearly
identidal register set, and this binding correctly describes the hardware.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Added Acked-by from Conor Dooley
    - Added Reviewed-by from Frank Li

 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index f2dd20370dbb3..5e6aff1bc2ed3 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -22,6 +22,7 @@ properties:
           - fsl,imx6ul-qspi
           - fsl,ls1021a-qspi
           - fsl,ls2080a-qspi
+          - spacemit,k1-qspi
       - items:
           - enum:
               - fsl,ls1043a-qspi
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
