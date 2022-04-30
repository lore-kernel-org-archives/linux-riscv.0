Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634E7C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 13:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A0vqs832+Va2UOFKYUcy3Wd0X2300iJngrJZrWorO/U=; b=1smsIlUqdScwOp
	p2QF3X/18cna8qMz2HpkieON5Ud6ctOp80nfQaKfNX4U2z0bTJo1xqdCXzdzq+EYvwxg9SKJoM0r6
	vKWA/Io+Md/ZhJPEHr2zqP19Mj99Lqrr+2N5ARwgNNL/H8iv61Yc+AUNM0hni0fV6JOILCPA8oTMR
	e9VVl7UIoRVMg4BGqVvktZz4tF2EiJHbi+zY5b9REA4NDO06QNjue/BmbQkn5ke5P+vIpZlUlJPWw
	F6UlMZIDw6iIpp52EHcLPwiX/uc72W+aTJzJXlv+pIKuW9sdXuLBEs7DZZQ1VUU0LPDNM/rfHkv1A
	dYI6GNca/45B31uFgeww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkmuE-00EJNV-LX; Sat, 30 Apr 2022 13:13:02 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkmuA-00EJKv-BO
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 13:12:59 +0000
Received: by mail-wr1-x435.google.com with SMTP id q23so14061858wra.1
 for <linux-riscv@lists.infradead.org>; Sat, 30 Apr 2022 06:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4vCDZDxNF7ZpqCxnRxrYAOyYCsp207pYkROFjiHem+g=;
 b=XvSKxvLpEQjAkw8/ypM8c3YYtSSYtdpoJSa1Ww30x9aLc74D0KOsMl+k30OnNyQ9K1
 vQD+hhGLkeWvpJUbcaH1pWIvAovINFPJY3/oTaPq/yJ16EmdeD/w4K0fBJeTsui55YYy
 inTHM0Bp8+7apN2m/AVJQQ8YGOXdG9NCDv8PVXdmkkxiovBgh5aBJpsKqnUAyQrsDbMq
 uz3YiOSKYBrlQIJesPeuoA0FxDQS+mVow1cs86E4Pz3dfqoDIT1SQnfxHv6gr9szD1fh
 DbgJG6BR0cd5EAV/Cee2G6xGOWVv10cgoLrRaGoii9oiyrJAFz4NTz24zAa5rQcCcn+8
 6g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4vCDZDxNF7ZpqCxnRxrYAOyYCsp207pYkROFjiHem+g=;
 b=smkhJ873XdU4K30jERlwQHe1oeQ7W0RnpJdJse3DrJcc7dIIv18BfSwGZlWt4A7NYy
 eEuluYDRW0Y+E32ICPA4D6nK3Ho8wD36/7GbDpeNo2O6io5NSjfYJZc0Odo8Rijs0yL2
 hcYeRYJmDl//r5TZRYZpLwF81OqAIsWmXRgMQPshrn5Au2//Ed/12UIpSRRgIPSZy0O/
 Ht+4pZ4vP85Nf57M6iVJ8TnQ5hZqLPICsGVADVu9orNHBtzbDfPdPxamCLSaBZCVTbi/
 YrqKaNsk+sZnQq5f/hNmtysSt2QY2EirUsSxrYVh6GQJvjOGMycYN+GvEuUiQWS+qzH1
 7Uig==
X-Gm-Message-State: AOAM530+1oyKK2d9uc8d4ui5cXT2Iesr2Utr5yHBC7a/7pL2mn8NWyX2
 n2lOj2CyzWv1E0lYRnovNddZ9Q==
X-Google-Smtp-Source: ABdhPJyhk6sNyn6PYT8mUPpuoHYBQRyblDmpRGPqmY7TVB139oqJYZ2QO/EfyGQOU0BmMjp+TJTM8Q==
X-Received: by 2002:a5d:40cf:0:b0:20a:e0cf:2a47 with SMTP id
 b15-20020a5d40cf000000b0020ae0cf2a47mr2989078wrq.575.1651324373826; 
 Sat, 30 Apr 2022 06:12:53 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 p9-20020adfa209000000b0020c5253d8ebsm2004439wra.55.2022.04.30.06.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:12:53 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <mail@conchuod.ie>
Subject: [PATCH v2 1/8] riscv: dts: microchip: remove icicle memory clocks
Date: Sat, 30 Apr 2022 14:09:16 +0100
Message-Id: <20220430130922.3504268-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220430130922.3504268-1-mail@conchuod.ie>
References: <20220430130922.3504268-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_061258_449475_6B59A5C7 
X-CRM114-Status: UNSURE (   9.60  )
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

The clock properties in the icicle kit's memory entries cause dtbs_check
errors:
arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@80000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'

Get rid of the clocks to avoid the errors.

Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
Fixes: 5b28df37d311 ("riscv: dts: microchip: update peripherals in icicle kit device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <mail@conchuod.ie>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 3392153dd0f1..c71d6aa6137a 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -32,14 +32,12 @@ cpus {
 	ddrc_cache_lo: memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x2e000000>;
-		clocks = <&clkcfg CLK_DDRC>;
 		status = "okay";
 	};
 
 	ddrc_cache_hi: memory@1000000000 {
 		device_type = "memory";
 		reg = <0x10 0x0 0x0 0x40000000>;
-		clocks = <&clkcfg CLK_DDRC>;
 		status = "okay";
 	};
 };
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
