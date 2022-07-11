Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43460CCA47B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 18:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wrWpfxQ8Q984nb3XpaVopf29yx0WE6QSHNnQrc2IebU=; b=s/xg7Z5JYNGC1/
	G9I/aRbD83xL1aZ/N/339NnP9rBOH6uZ9rY4d9HvhcwEfeXA/btPPyr7N8r6Dyq/YgKhyQ26opwL3
	UayMW2+oqSYg1Bhyo0Nm5vrImnT4o/Q0M+WtggjsgL2p6b0KxWhiJ6uX4CwZJrxovjKriZicYV9He
	J7c2Q45O0nFpsjQRHM3+3kXjrtr/o9DWDAo4RqAKubPZmPUH+koTMhkAWDTzoxWBlNe2CJj0AgtUL
	xr8ppUvBLRZwQxCTva1scrs+k8CdxGnNpa4RWyyk1AV8W1jDFTStk2SCDIvBZXlTwJTUE9lbcl7ed
	Jq2SJ93fd/1JHLczwt9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAyOH-003xfV-EJ; Mon, 11 Jul 2022 18:44:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAyOB-003xcP-WC
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 18:44:15 +0000
Received: by mail-wr1-x435.google.com with SMTP id z12so8159612wrq.7
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 11:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W1IQZ5rMVEddPML6F8h702sg3EwlT7K9zE2hYh3JCeM=;
        b=Jj+OLkUk2I13jTPtOe9Kyi7VcOuVAPM5BzlQNEypZZQp+NbKf9nMZCCFQ6hHqiqW86
         tHABUXE/YfQlNFzH02VLigSQnRyMO6RX68IAt7jTy7bg8wqYs6Pi/wZmk6vanMypaWqE
         yq3BDMUQEyhYOOs9qMBeoSGec3rKC/acJ0OJlRmVS0NOQz+eWaPudEhyXwtFRoV5VCrU
         BR6v+4fB9VcyCy5FcimyhsXOn93hng3OBJ82uoQAUeaGQreemb48CXtrir8Vr/lMXfE6
         SXvSBmpV63c4EogvWZImFBN6z5sb82Lk06Ak6eG+PCnnbtwgHAdd/ggGETj36Qx8m49v
         y+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W1IQZ5rMVEddPML6F8h702sg3EwlT7K9zE2hYh3JCeM=;
        b=FgRFLGf7pzyBbKOAkC1J2gnph/LO3d8ijMxCIpJvKTiJ74YpFi++hk8LcdcG4cqO3j
         5jYPSx/9Wy13ZI3R3Awe/Q84+pqhYwQPaZf805mrk/8okrtaxzlYL4pE0IpT8yD96pNz
         1zEEb/G/hTYcMi72WAeWViAND7/gp0qMg8gix2LwpMWoWmwu1yYvWlqtkg6aJkZOKBaA
         sFiLDkr7v/fD8mvmaXhZ91hzWfyw8I3WyR7yGZvfX9JQnFT0CMNUnyDhzlSy+6BqzqMB
         3uDMBzq2iNf3gsIwg7sS6GvcRIFuX281hI/vfQgq8j+jrI/fYZphhWl4//TWEGP8yqHt
         eA5A==
X-Gm-Message-State: AJIora+6qX0EMJlP5Lkei7vweviaI5UvOZcSBPBOB8DLzzYshyDo93a5
	tp9aHR13ZwNT1dbfbQc4R4zJDw==
X-Google-Smtp-Source: AGRyM1uVjauKfuKiTPMOqOvAQPCUUKMYYNjIBIvYdkM4RZWSrJUmn+aRiqrXVxOF1fvtcHpC/7FBxA==
X-Received: by 2002:a5d:4f90:0:b0:21d:a6da:eb6f with SMTP id d16-20020a5d4f90000000b0021da6daeb6fmr5729408wru.283.1657565050659;
        Mon, 11 Jul 2022 11:44:10 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c410900b003a02cbf862esm7330892wmi.13.2022.07.11.11.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 11:44:10 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] riscv: dts: starfive: add the missing monitor core
Date: Mon, 11 Jul 2022 19:43:26 +0100
Message-Id: <20220711184325.1367393-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220711184325.1367393-1-mail@conchuod.ie>
References: <20220711184325.1367393-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_114412_071534_76E1E16C 
X-CRM114-Status: GOOD (  11.14  )
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

The JH7100 has a 32 bit monitor core that is missing from the device
tree. Add it (and its cpu-map entry) to more accurately reflect the
actual topology of the SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index c617a61e26e2..92fce5b66d3d 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -67,6 +67,23 @@ cpu1_intc: interrupt-controller {
 			};
 		};
 
+		E24: cpu@2 {
+			compatible = "sifive,e24", "riscv";
+			reg = <2>;
+			device_type = "cpu";
+			i-cache-block-size = <32>;
+			i-cache-sets = <256>;
+			i-cache-size = <16384>;
+			riscv,isa = "rv32imafc";
+			status = "disabled";
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
 		cpu-map {
 			cluster0 {
 				core0 {
@@ -76,6 +93,10 @@ core0 {
 				core1 {
 					cpu = <&U74_1>;
 				};
+
+				core2 {
+					cpu = <&E24>;
+				};
 			};
 		};
 	};
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
