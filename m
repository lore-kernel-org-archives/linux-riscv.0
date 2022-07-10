Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F9EC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Jul 2022 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9SzdVE/1xHVkCHMvxgMlXHITm8XHTWEagPd3uGnqlY=; b=L7b0ObZMPWNQNR
	YwT5f6/s11g72IpLOnPMYUVaGrpa5XJSkxeUpsFgG8fn08syBx1aOSXlWcCX5or9EdBOF+del1RZJ
	gkSfMob/jxdL8a7vpCGNA2AgBdRghQkaiTlPPWkNV3+5rcMF7K/scjRCWh7Ze5bhKOk1eOZmN3VQU
	r7Q98YOsU3XYbvuSvKvN+aCzR19CNmTSIfVldpfJ78PnlMU+WfMN3+pnfmgP+GmZPkx76tTUKN+zH
	aFJkqRRR77RZfyTkkEXRk10qtxaeb14/5wM90nXMwg8oWOILiU/3wMUh55cyPwm1tBuG0TkLbpKTY
	5MMcDVxxaW69Gw0YQ08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAUsq-00BWRb-RG; Sun, 10 Jul 2022 11:13:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAUsl-00BWP1-D3
	for linux-riscv@lists.infradead.org; Sun, 10 Jul 2022 11:13:49 +0000
Received: by mail-wr1-x42a.google.com with SMTP id h17so3759549wrx.0
        for <linux-riscv@lists.infradead.org>; Sun, 10 Jul 2022 04:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V2JL5BeTsm1LVU5sfoBIObfRgPh6LElCg+G5xm4swvo=;
        b=VxaDdvWl0P6/uJ8yv18EHoDHlteAGEjjC1Yk3e3o7bKslJR2YCCQSghdZMTZqzTuvz
         /BFrcnLEB04vkAnqwB5XkZ8mGMCzWRTK5D8p0ICMBhsZXlqmDin7Ot4TMEZEVSrp78Hl
         D+k+inJ/SuMIVi0E9FC/kwJ8NDrHNNWlIDYxlpiwCf98TzpoW+zJIlAI4kREKsfxK3xk
         T481hJQp29+5wkFgMJmi39fXkqh0jACGeiR2FssNgNbYb46/heN/TzYDTbFyiNbDUq0I
         ZrFS8LJ1XCNYrpmkS2+BYSl3ETjSFFQdZDtOLF16kVfMWZ/gJ0lVKFiK5f2kD90OFAkR
         mgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V2JL5BeTsm1LVU5sfoBIObfRgPh6LElCg+G5xm4swvo=;
        b=ICAAfZqqeFl/o4EMmBfIIF/iffAIlNvbG+SNM3aP2ATH+F85UrP4AWFwY/D7TNzZcF
         1RhNdlbHdZE19n5jqAhVqErSeniuFYBklT063oOi7Jx45QAcVGCglIUJ9tGBk9VpEgbU
         fnCnnMXXu3n/WMOfOZ7raP7wivHLzc5RjVlQjbG1cwyYfY9DgH0oQZPnhHc8+mrZPejq
         2iQoIm39vm6m/EIHXXInYdALYyolLuy38RlyMWnNHMDMJAIOCk3iClingQsp8DFw8mx0
         2GCpOvzRZeflrNs0iqKkPaxP+gjKgIVLt8oPUyTvIsDoGl4oTeUADRm+/t4b5e9vlvoj
         Y5RA==
X-Gm-Message-State: AJIora9AEGe2RqkkRx9UFz8cf5p70K2nvunhFMrHjdl0xMJFNRwcNQW/
	x5M6O/RVLn0FHlyI08gCauxjjw==
X-Google-Smtp-Source: AGRyM1sEfa6eIIep9qALXMST+NFEzagEiy/l9oKOcP5IfksNblqVLn636IuIDNIVL3Xdcd/gWWKKhQ==
X-Received: by 2002:a5d:5581:0:b0:20f:fc51:7754 with SMTP id i1-20020a5d5581000000b0020ffc517754mr12664990wrv.413.1657451623554;
        Sun, 10 Jul 2022 04:13:43 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id c8-20020a7bc848000000b003a2e7c13a3asm61219wml.42.2022.07.10.04.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 04:13:43 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 1/2] dt-bindings: riscv: document the sifive e24
Date: Sun, 10 Jul 2022 12:13:29 +0100
Message-Id: <20220710111330.3920699-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220710111330.3920699-1-mail@conchuod.ie>
References: <20220710111330.3920699-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_041347_468351_899B288F 
X-CRM114-Status: UNSURE (   7.90  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The SiFive E24 is a 32 bit monitor core present on the JH7100.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d632ac76532e..195e762094a8 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -29,6 +29,7 @@ properties:
           - enum:
               - sifive,rocket0
               - sifive,bullet0
+              - sifive,e24
               - sifive,e5
               - sifive,e7
               - sifive,e71
@@ -75,6 +76,7 @@ properties:
       lowercase to simplify parsing.
     $ref: "/schemas/types.yaml#/definitions/string"
     enum:
+      - rv32imafc
       - rv64imac
       - rv64imafdc
 
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
