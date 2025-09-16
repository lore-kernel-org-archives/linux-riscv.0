Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F8BCAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 13:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2zCM/UeELmyE3Z4cyeguKWm2b8KRTkuMfzvGKB9rT0=; b=Js6dWw+zFzr30b
	OENY3WDpLcV1dXFOOHw8ELIIgkXla7XDPAfSBtOZ+xCOS/RoSQIUwkA5+iCt2nY8cHEF5WD/jQAWb
	aQ324fzKVBrPasrL2i8CSNiOYF/l42TfayXLZemnSLdEY5HI8wFC54958hucjMZXmRUgC2UA4DHBo
	g2fO4wDa8JiIQGUuCFrqVv1syND1vCNHbzXrz9robVZ5tURqu1WbSTfxIH9K13GT0Ji75F2JIIZ6l
	EXMXTau4k/k8IAbaGXL8QkKejwVar42VGWhSsWEVvPLvekbJG7z7o1LB5XE1K5LWfKER7EQLvdoiw
	4pg5P3bDhsLy2SNuLeeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVeP-00000007vBB-0IEe;
	Tue, 16 Sep 2025 13:23:17 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVeN-00000007v9k-1bDO
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 13:23:16 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-77619f3f41aso3087389b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 06:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758028994; x=1758633794; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzzsgn9kvMTgwJtY45RJ/1wKDH1k7Bp8Dx6C1RuTuEE=;
        b=kuSQtfFqUmVZ8PUHG57jlWZf5HFhzHzO4B/GyFS/fdW7IeXrXE59WXQLqggDsOhybo
         nL2C6A1Gddkw6mDX9WspNNranBKdArKjKz6HcQQQoakj1fzSCuMtb126i8uFmDSwSk72
         z6rMXPFrT/KZP4a5bnNG2EZY10TgqGRYZeECmstZ1Sll3AHhgzBuK7Rrf253oTnzq9FR
         w/g3K+Vlv3UoivW1LnxvhtOkFacat1I7IVjvGTaqOF6dGhXYT+JRj3desKvbZJYywocD
         qZsWmhS4xKSK7sKG8G8zCjPW3coTJt8/gupqAY3IS6oOxYHwhDGY0tx6fpqLhrWMKHJ1
         EygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758028994; x=1758633794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzzsgn9kvMTgwJtY45RJ/1wKDH1k7Bp8Dx6C1RuTuEE=;
        b=EDxPpd6wyGiY0KWRsz3tw0OVjJHNu6jJeoMJFkvyQSj+190peSgZ4LshCKnwa5e3bn
         tommfW9583u5U3djVz28WMFgliPDubVcPcobHKx2G4tIUWfhRh30czpVKNEpmB1i5r9l
         4pi93jZmIWCQXQUfDYjka4XEEySoiWLfPSNVCIf3WtI5byvMZ3uPp0Gd4UAiupDAK3Ss
         +lN47LpIinw3zsr95fK+1PH3iS6L4671nBb8WWcbqnWgsRaHqq6Qt/1Mt639VZgLZW3A
         sh4yp1Pacv6UKHHgNUENXXZYAA6ZAi+ZS6hWJPyw9MNDZ565rAxnP6d7CZzTFzD7+bQz
         JRvw==
X-Forwarded-Encrypted: i=1; AJvYcCU8SxTn48CGMtQqJ9STIkVpeqHCP867YCoeiNxUyvqqLVD1z47/aq9KFGB/FfJQqjetc3TzaO8Hbaho9A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz72IeR5FOXHSG0ky8KHnHq019ptYBZJxmaQzYEx768+hzZkR8p
	sE7FnZWMexHmWj5SZoBUUnxJVo1XK/BAHkFMTG9iQ7VWzQ1noA7n+xkq
X-Gm-Gg: ASbGnct9+H+QvcLUivHYwa8HEz5f25qVaoRyBXIgrSCxpEuq+qo6Nyv7HZq+NQfZ9AA
	e+0Gi8zkZ3mLettN3nv6n01Gg2FoIUHkSTwqATOPaVtGKz0ObQ8jL1xKxjE2BNkq6XDcxPbHR1J
	B3FF7fjoxDgbaZJi2Hafu1MOGtpTMrcWUXG3F0+hfyRGkzE4lr52XHBfZgiQ90ssaTk/VOn2pIz
	gaB9LAFNuLmvc9W5WXiQwzHKQlJodyF+x+36JwrbMHgX+g2v0P+xjuBGJoRt3deT0dKOv3dITh7
	J2GW4E19kk4wNCv2AWKeHGSFrjtmRD8lqkPQt2ComWzChMkVrSPa1IgdZglodKWEBRKMKo3USzf
	yRyaYMBP1O1rITHZLYZmawqzp4snILT4CDjb0vMY2
X-Google-Smtp-Source: AGHT+IE5hq85yAnL8KXZBwRly+Am1wE9i4harM8JJoKLoRcHxNlPBFEDqO+gKM8kuuZ21uWb8lnKDQ==
X-Received: by 2002:a05:6a00:1256:b0:76e:885a:c332 with SMTP id d2e1a72fcca58-7761219ffc2mr20627026b3a.32.1758028993976;
        Tue, 16 Sep 2025 06:23:13 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761562f25dsm13277310b3a.74.2025.09.16.06.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:23:13 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 16 Sep 2025 21:22:53 +0800
Subject: [PATCH v2 4/4] riscv: dts: sophgo: Enable SPI NOR node for
 SG2042_EVB_V2
MIME-Version: 1.0
Message-Id: <20250916-sfg-spidts-v2-4-b5d9024fe1c8@gmail.com>
References: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
In-Reply-To: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758028972; l=1060;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=SHdpc+7cha07M+f6R46l6uT5x3VEV6Ux3f9d/uogxOc=;
 b=qrayuAe2fZLnjYDzxOLnAw2az6O9llF8jgD6vCjLrtRLt6EDzsqs6MurTj5fqyOKNCoHEPBvE
 Pr3wyrlOZPfBNPeEyGepFgePvGPIMqcszpioEq6XQVSUSDGYOvRr9xR
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_062315_430420_67EB78EF 
X-CRM114-Status: UNSURE (   8.30  )
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

Enable SPI NOR node for SG2042_EVB_V2 device tree

According to SG2042_EVB_V2 schematic, SPI-NOR Flash cannot support QSPI
due to hardware design. Thus spi-(tx|rx)-bus-width must be set to 1.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
index 46980e41b886ce17dacce791fa5f2cef14cfa214..78460b2851a231a3e06b28f9ac6bffd4700e7dab 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -226,6 +226,18 @@ &sd {
 	status = "okay";
 };
 
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_cfg>;
 	pinctrl-names = "default";

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
