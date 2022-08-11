Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AAAC19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 20:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NgfF8/9XHv7BhtsUeeChticnwujI9sEWfweZq/CTpBk=; b=JhArPlgOVqb+84
	J/P8R9cal/AcKLlXve5FyNFUf+sn1CLI53u6sCu6Q8oPt5rFMNErX0OEpPqw00eAFCuFS7ya1fPLF
	K3rI9acHaHFfoNN0rrBzeKCzv64rV+hj8wVTJPZMIrwToL16yNENBeU6tdEylzPs8nwTzh4L+KHWH
	+RPubKY4PVWElkMJ9yp8Jv/Ed+M5U2pDuDYqpbzylQehUUwDjDnvWQSlLVm39H8USN4xiRK5hQX7Q
	JUQu9vrOe4pS+U5Ed/PsBIHupnyeOYEWaGWZ6AZu9M3bCuR+Al34OivA6ZdDiWIfMk4u2GD/38SSY
	vDHvFpxKJ5JSh+6Ztu7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMEqo-00561c-EI; Thu, 11 Aug 2022 20:32:18 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMEql-0055w5-37
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 20:32:16 +0000
Received: by mail-wm1-x32e.google.com with SMTP id p12-20020a7bcc8c000000b003a5360f218fso3260063wma.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 13:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=9cA4nPyy+3oc8csp/5WI6MWGRIz8pwoP//Q0NeWm1pQ=;
        b=dRJ6nmCzs4/bVQQeyYikvOMhwX+qBAjdKkM6h1FZYIRz7AQtdUfctdNkP+omUlEAfv
         fM5EF7t1oRTXw1dpzjpRFYZHlQfl0FrG6WGes7inhzrk6McQ/4U6jyywhJRxX3QyuXod
         nFdEFP++Z7dO3/pcm62XZyVRqUrEIq9q37NqQOctD+frwr6rZTtfF1gFM1AfDz5V+bUU
         ReWnPW3FiByNKy5y3aMTJ+YhvbInIZ/tlMhzUBZ/IFiRfipdl1WANgKPQlyjGiLYSO+6
         J1znoOVXInn248WAp28EZHhzz2ZlJ4g2hkT/ece/hEDH1a+qmWP6pRYZ5W6QHswZZ8ao
         UcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=9cA4nPyy+3oc8csp/5WI6MWGRIz8pwoP//Q0NeWm1pQ=;
        b=Bv7snrqZHSzSTeREWmLn5Yolz4F2fZ2ME1tdrXv03y1+pmk8FaoWHntTg2566qXRyZ
         64PoDdlcZ9pdJrdFIspOfhvBcSjd7pAGizG5eiNq/7Jx8U3XpmHEW+AexEjFA2OJ19kX
         MAYzIytSMWHBehSv3E2CGGjF8mGY7hxsRHhgOzY3W8UpBychue74OI8hG+i50Ow0Xnr3
         etpDoDuFrtp9x9NOL/RFE8hI/2OfcarlHu9F/6LPWI7P2K7VkvGl4p2WFC0pJKQuneVL
         VsFU/0ExXDXvvdNzrNtskTM7Qq437n7dWV75hPuJiuETNQ4Wy9kwkTqVjNHRBVkrml+n
         MEkA==
X-Gm-Message-State: ACgBeo23dRWfKG1oiJIa/NahBbcmVy461Jt8N2LCpTRFF+aHxiTjxLAK
	+pCynMS8WB0MylfTnPyuNm1l0g==
X-Google-Smtp-Source: AA6agR5ZW6U+wgHEyk2sIKMDaM5dl4O7s3S9HPf5I4c+4RPoHVA6W6ojaNVCyERE/MuRFYtOHU7lUQ==
X-Received: by 2002:a7b:c453:0:b0:3a5:b42e:c4fb with SMTP id l19-20020a7bc453000000b003a5b42ec4fbmr486780wmi.167.1660249932431;
        Thu, 11 Aug 2022 13:32:12 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id j42-20020a05600c1c2a00b003a30c3d0c9csm8417365wms.8.2022.08.11.13.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 13:32:11 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: microchip: remove ti,fifo-depth property
Date: Thu, 11 Aug 2022 21:32:07 +0100
Message-Id: <20220811203207.179470-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_133215_188709_55D49F37 
X-CRM114-Status: UNSURE (   9.80  )
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

Upgrading dt-schema to v2022.08 brings with it better handling of
unevaluatedProperties, exposing a previously undetected missing
property in the cadence macb dt-binding:

arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: ethernet@20112000: ethernet-phy@8: Unevaluated properties are not allowed ('ti,fifo-depth' was unexpected)
        From schema: Documentation/devicetree/bindings/net/cdns,macb.yaml

I know what you're thinking, the binding doesn't look to be the problem
and I agree. I am not sure why a TI vendor property was ever actually
added since it has no meaning... just get rid of it.

Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 2 --
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 044982a11df5..ee548ab61a2a 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -84,12 +84,10 @@ &mac1 {
 
 	phy1: ethernet-phy@9 {
 		reg = <9>;
-		ti,fifo-depth = <0x1>;
 	};
 
 	phy0: ethernet-phy@8 {
 		reg = <8>;
-		ti,fifo-depth = <0x1>;
 	};
 };
 
diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
index 82c93c8f5c17..dc11bb8fc833 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
@@ -54,12 +54,10 @@ &mac1 {
 
 	phy1: ethernet-phy@5 {
 		reg = <5>;
-		ti,fifo-depth = <0x01>;
 	};
 
 	phy0: ethernet-phy@4 {
 		reg = <4>;
-		ti,fifo-depth = <0x01>;
 	};
 };
 
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
