Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EEAC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 13:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8W7UmJUsHNiVLlgJjHR5NRjWep/gFzPpweirC1GT6A=; b=pZWRV77ew9+1Iz
	9t/dzNsBd2IArk2zBp/AkureUkSGe4OmlDFl1rLgjQfK8/Tr9B/Ud2Q02rHvajkaDVhbJKckCANrn
	49/BmdmtToZToEMM5xyBHWlsuS7C60kGXkMr2EWAxuMozawePKpSh+XoosVzpfrzhEG/kwjtUaCeP
	6l2Z26AfUyZLi1xvcCXgtaugAIdxveShEtZTgUm5BVqjzRl8ebJVLf9RQ/IsSO8d88257u+9Fuwrd
	bt5Ejdexolg6LrpOrtkrCZNgHfJpXkUYb+uO7KV5GVy5zRXdl1LYFOgvf06WSWQh/xaEQiIDMC0rt
	5sqsh0v9fLlWVNF05S6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkmuG-00EJO3-2f; Sat, 30 Apr 2022 13:13:04 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkmuA-00EJL1-BO
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 13:13:00 +0000
Received: by mail-wr1-x435.google.com with SMTP id v12so14016332wrv.10
 for <linux-riscv@lists.infradead.org>; Sat, 30 Apr 2022 06:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D3SEdr+fxIa6eNX5euS5Om6MuK6d2iGlkw5zs0H/ONs=;
 b=SkmHarr4ODHRRfHsVgW+WUZyogxa7T/pT1YaBfhU7ZFrtvTjXUbrQfqi/OyqAAvPlx
 WLvmoOBPYswSby7Wlf4NKPOMi1bPXU/vk5A092djDYYM17RPJNBliiwtkQqLd7vrKi1Y
 tfKnWH2Pz1C8DBZfrsckNoKk6XJzxqM6iFAdbKJwpdpDJtLXEokZPRoZsLVyhs0LVKH0
 fMd977IxvpOH5iDbZnz+tfT0ptHDjlExVzX5wEPxDCKVcSBgj7axOfFVEZA1s618hH5n
 DhwV7NhonaR9XLG13BEBpWWV3dvTJ1Wn9JsTRs6xn7YnHdYLGSYFCoEGkrUhrO44/3EA
 7NpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D3SEdr+fxIa6eNX5euS5Om6MuK6d2iGlkw5zs0H/ONs=;
 b=p9dOHftL6tbYonl1x4iIRSH1rf7Sza19THtGvp0lKk6/58YXJZttoVAgX7OuTGF4UE
 fbLWVJ0ok0cl3SUmWIYYz2B5upGoYMgK1WWZWsNIiC3UwrTT+az6HdqUzsOA50m2mo89
 RYVGX+AqBL1oKayQgajBEWBA9UQcveLk8fV0IpiLgukh7r1syBIcvLeB+Kntd3A6altw
 PwcvkJx8m1LFrHfHS9Pg01okhibmOHrVT004OSXdC0+zVC+n9lBzLnPaXIsfgMFmFuQk
 h9N/J9ZAA4BjbnpOwYdepN0LIeDvep3n5N+9/vRqFJVxwBijrg7H126DsSTFYPha62Ki
 RnkQ==
X-Gm-Message-State: AOAM533+s+rASaMQYN2dZSnOoo2FT8Ru93LBw0piS8IgL+4wzCIA1zcA
 EXINVtmnZjGFxtO7lboRmXgQrA==
X-Google-Smtp-Source: ABdhPJzMz8I3WPzdOc01vlw14L5jOcx76muJKJWSX4TSNP+dxUOGGZG58Ebk8tPI/T3KW4pjmDxb3g==
X-Received: by 2002:a05:6000:18c9:b0:203:fb67:debe with SMTP id
 w9-20020a05600018c900b00203fb67debemr3004347wrq.494.1651324374961; 
 Sat, 30 Apr 2022 06:12:54 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 p9-20020adfa209000000b0020c5253d8ebsm2004439wra.55.2022.04.30.06.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:12:54 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <mail@conchuod.ie>
Subject: [PATCH v2 2/8] riscv: dts: microchip: move sysctrlr out of soc bus
Date: Sat, 30 Apr 2022 14:09:17 +0100
Message-Id: <20220430130922.3504268-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220430130922.3504268-1-mail@conchuod.ie>
References: <20220430130922.3504268-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_061258_448379_3CA25BC5 
X-CRM114-Status: GOOD (  11.10  )
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

The MPFS system controller has no registers of its own, so move it out
of the soc node to avoid dtbs_check warnings:
arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: soc: syscontroller: {'compatible': ['microchip,mpfs-sys-controller'], 'mboxes': [[15, 0]], 'status': ['okay']} should not be valid under {'type': 'object'}

Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
Suggested-by: Rob Herring <robh@kernel.org>
Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <mail@conchuod.ie>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 746c4d4e7686..bf21a2edd180 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -146,6 +146,11 @@ refclk: mssrefclk {
 		#clock-cells = <0>;
 	};
 
+	syscontroller: syscontroller {
+		compatible = "microchip,mpfs-sys-controller";
+		mboxes = <&mbox 0>;
+	};
+
 	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -446,10 +451,5 @@ mbox: mailbox@37020000 {
 			#mbox-cells = <1>;
 			status = "disabled";
 		};
-
-		syscontroller: syscontroller {
-			compatible = "microchip,mpfs-sys-controller";
-			mboxes = <&mbox 0>;
-		};
 	};
 };
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
