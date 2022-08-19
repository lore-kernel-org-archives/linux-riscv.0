Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3894C32789
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 23:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGJwJWmp9oF8Qf/CSG2H2/Z5pW5nMXtucRHfO1l3SxA=; b=TAvylaVcHzNyIn
	UHNIiStgVzMtoNfvTkS9fCQ7Cq9neBiy3akEc0aiF3FLA0aiBkM/VRbzKL0jdpaOEcR5qlAEBC2Ny
	Oq/ZbdmKr5Tsj0zANp4XHNfY7pqxRf8aDQnaEWS7+kGhzCeDrhKYkOyTLBlUegwQPSwVc5nJNdyOt
	crOECNB66oA4pHRccWYBZbZbT5lm+YXZGmUTovhz0bpT3sywJErLZsZjm+n10kvbrKFncJJsGJIXQ
	ZCE/XsOfBMgDLo4E0XBgzf0mcNqkyMNu4h+/jis1ESHqnIR7tP7SsvnflkXnwpUJBdKV24PSCo86h
	w1kIrLWg1qylkewbnllg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBCL-00DHek-CH; Fri, 19 Aug 2022 23:14:41 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBCC-00DHVd-3p
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 23:14:33 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bq11so133993wrb.12
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 16:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1LGGHQ6p+mDphp3bmxn1t5fZUfaS0Whf3Mk8geT3R/0=;
        b=M0ofL3nLJRPapOip5zzM+C+RY4pKZpArvpShfp51JaedAQJPbcSiJLMbgN8hXZHax+
         pvu2X1mOJxCoPIBexYf3rhO4XapBs0sK8fFZ2aS9oZ4ZXapZpOxe7L9ecSBthoFsNGbj
         gjJHap1v2Obq9ZdbyLpA6Uxi9bLlzNMUttYqZJB4ua72mEqqGRCRupu+/v+DLrz0PVt9
         q8lT7zrMptgf34JAjxQntdAp0Qnr0mUZgFJJnJtVzmkxr2TGBlPQoE+jEb9JoEMkYjm9
         1xsXsrNMYjZsqX8mcrc262UZ4IrTyn58p1eFFZkQBu3HMcZAJnwVK2vMH9zl0nJ59PTB
         N47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1LGGHQ6p+mDphp3bmxn1t5fZUfaS0Whf3Mk8geT3R/0=;
        b=g1JiJHFPwTvmhH0+Wwv1JcuNhE5JzAYzw8Ra3MVSm3OZnBI0fJW0vNkuu1h/uohxWG
         fsFVqD6nWNZKDOSPnTehtoUnc/99uNQS7RiA3Bwecef9lPmUDuSsarVz9tkgsZglmumZ
         9ecwyNl31HFmmmKcjrkmst1QIWfMEctJ7/EbK96ASsBst08r1Rnh8OW9Pk6IMWVQune8
         0oI9mVdKa3/0UCuJ88bAailJiDOYSh2GCwMiPGgm3MlswsCTE/uvPgSU4kjicEvPCKfc
         KsTCuHU6jULSVa5KOAFb04lB8FFzzY0qVK6THA7uoCQ+zsW3uyil5WC6/3QKofq/E2Sm
         lxJg==
X-Gm-Message-State: ACgBeo1JoohRgstwI6OozMp3aDX5pTrOURBXfQSixBZoNBaZ4wgbDRgw
	VqhWeGpBlGpnd4CKBHC+6mFwYw==
X-Google-Smtp-Source: AA6agR5HUiYYHhjMNaA5RLf8rXmmkgRypSuuZuVTDp4Hep5U2Q4CO8SNj0TYTdzVU15m+IkUBb8akg==
X-Received: by 2002:a05:6000:2ab:b0:223:6167:a213 with SMTP id l11-20020a05600002ab00b002236167a213mr5328028wry.310.1660950869802;
        Fri, 19 Aug 2022 16:14:29 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d46d1000000b0020fff0ea0a3sm5198522wrs.116.2022.08.19.16.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 16:14:29 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 5/7] riscv: dts: microchip: mpfs: remove ti,fifo-depth property
Date: Sat, 20 Aug 2022 00:14:14 +0100
Message-Id: <20220819231415.3860210-6-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819231415.3860210-1-mail@conchuod.ie>
References: <20220819231415.3860210-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_161432_241320_20413DBA 
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

Recent versions of dt-schema warn about a previously undetected
undocument property on the icicle & polarberry devicetrees:

arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: ethernet@20112000: ethernet-phy@8: Unevaluated properties are not allowed ('ti,fifo-depth' was unexpected)
        From schema: Documentation/devicetree/bindings/net/cdns,macb.yaml

I know what you're thinking, the binding doesn't look to be the problem
and I agree. I am not sure why a TI vendor property was ever actually
added since it has no meaning... just get rid of it.

Fixes: bc47b2217f24 ("riscv: dts: microchip: add the sundance polarberry")
Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v2022.08 or later of dt-schema is required.
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
