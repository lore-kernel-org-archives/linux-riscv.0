Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE609C32792
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 18:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGJwJWmp9oF8Qf/CSG2H2/Z5pW5nMXtucRHfO1l3SxA=; b=Vt8eTM97pNdk0c
	8S02OUoKtUVvFKhiKACiYoFI7eDD0l5FiHBshoknVL9u0HyFvLBlhG0+/g2lT17IKU1dWd1QmFn4Y
	T3xYd/PMUPFWiK0NE+A2QIIDDggqPbNng/dpqTOCdV+zIb3Q7N0yUJF+quXnf6p6S0ZR+ETEnjBgk
	QyUurJhu9DrTKgVXD0NYlJ8NWrRNeZZfoaayhJQmJFK5pZPh7cA70YMaiimgiBMFXH8onR0+urjYH
	VgzABZg4Q84A/7CTlX2/DJbAd7ZsGhLn6ZeAV8LWvLnBBTJ3sCz+ptijxlnh/iukOOXFcyCkeLflT
	BedsuXGNNK8FDYyAmyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1GT-005oGj-Ge; Tue, 16 Aug 2022 18:26:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1GL-005oC0-Rt
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 18:26:03 +0000
Received: by mail-wr1-x42b.google.com with SMTP id l4so13579625wrm.13
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 11:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1LGGHQ6p+mDphp3bmxn1t5fZUfaS0Whf3Mk8geT3R/0=;
        b=TiOXfR9UekVJZRu7evd3xJo1JSSbcUbx/ZgBAE+jckIRBaEzCO5PwmG3rqD5z5zN53
         0AUtBwvF39Nfxva12oH0R9WNAVRfcWT1zluLWip42kfP2Hl7UgGxAJ6crW2lEvSFh5BH
         nkX9NvPQ9x7JlYkKi6K9YqcEPT+ZrEhwFYF3Sh+XQk/v4JsMDMpF1KlZJMBZzl2JqKqY
         ScVfYOAfRcm+1+wC0uA049NWyCbH8DO4s6/azpjdBZmnMp7G1Er0FoZk4zWi70CfKRvD
         mCACPBrFGx1PgSbm7sBofXPHA98a4rFi0Ogtd/hFKf1Qc3YKLpdXqsljBHFCzwBR1hWI
         3shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1LGGHQ6p+mDphp3bmxn1t5fZUfaS0Whf3Mk8geT3R/0=;
        b=NgKVzK0yrU8U4tTlM4AMmSttYT39QiJaINNOVnite3HgJ+ByIPeUjR3tqduMj0EJt+
         umANS7ZrOF7iFffD9OUJU09uqJNgsIgJl3Jr4q+D8jHdZmP3Nwq6DuQma8jfBj0SB2ai
         PGaqnOf/koXDbLaJjXWshK7KWPIiqmvUDGditC+eoBfIUa88Zrtr8bdENQWv1TvsNMwp
         YThldJzRDLH/+7ISfOp1XsYcaUEtbzXc6JG/u1bJUeQwFIJce+jNJbap2soRRGesnckh
         j8gM0Z38DS+UqK/lZUSP/zfZV7G6WNeALBHuwTlrHd13EqU/J0R4p9ZcfKihaIwd+/kd
         TmUw==
X-Gm-Message-State: ACgBeo2XdEvxFqbycHEDXvk/u1zoy1zMBcLOA7bBkFbL2e3o4uWC7GrF
	EIEYQ+fdD3ZbhxaGn6YEkkdhmQ==
X-Google-Smtp-Source: AA6agR40opo+7mClW53ltFMT6yiRmc3Yot2+VJrAVQqciuJ53cfMm+Ju4S49z0oFptPwsbaT26fANQ==
X-Received: by 2002:a5d:588d:0:b0:220:73d3:997e with SMTP id n13-20020a5d588d000000b0022073d3997emr11899733wrf.546.1660674360051;
        Tue, 16 Aug 2022 11:26:00 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003a603fbad5bsm4015482wmc.45.2022.08.16.11.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 11:25:59 -0700 (PDT)
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
Subject: [PATCH v2 4/6] riscv: dts: microchip: mpfs: remove ti,fifo-depth property
Date: Tue, 16 Aug 2022 19:25:46 +0100
Message-Id: <20220816182547.3454843-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816182547.3454843-1-mail@conchuod.ie>
References: <20220816182547.3454843-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_112601_939887_3F150E8D 
X-CRM114-Status: GOOD (  11.58  )
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
