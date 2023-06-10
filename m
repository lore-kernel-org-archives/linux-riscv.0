Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEA2C7EE2E
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 20:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3pQV3vnL6wXuCbwqKFuZNW2OAIpouM60KZd2pfcMyh4=; b=L4EUMJYb8rGQ6D
	8tBhUTVUseEWiDKgGwoD9k1Qkex+y/R+4hwamZE5vFgY0en/nc1QrnMkb5PcG7z/Gtl9neFEmjn4X
	DN5K0I6zZY8n4JL8LPuKpAiCX4n7SRIXAbwrukN5Ff8mM0V2cH67VaW7FasY09ATNz5fo/ogynXMN
	vx5LGoiZUjxotDnwv8RGV7PntXBQTDcdf9rwfeBViCwZVDyNIamcjNsW6z77jbxEMqUcMryYsdk27
	KNhYfTPfHmC0+2DTzSUgZJuDdLz+Y1kVwwzI1D82px6meIpxo/MHPftmv3u4fmtaI2T47vhrTb0kt
	QhFutxRZStky4IRNwSJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q85Q7-00H1nm-0I;
	Sat, 10 Jun 2023 20:42:47 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q85Q3-00H1my-2D;
	Sat, 10 Jun 2023 20:42:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f6e13940daso30714155e9.0;
        Sat, 10 Jun 2023 13:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686429760; x=1689021760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VQbsytz9TyV1LG+i5o+RBweOKvc/HeR56N+REltTEvs=;
        b=QlViBFfedjLHorPByjYuUi0uDD/Zn5SlZiWJa4SfzVV/53gsiCRRqS65k7J9Skvbmn
         J6MeuA+I6Pbqrh7h4SGTfc512NJLgVMK0kujhUjAyGrAllvR1pkm5x3Quwvg+jyAyKvR
         EmSt2xAndhmQveisgStzKhSRBFKNq5Kp8s1Ixp+tikNcUyQnDg1GHbVDeYpg1QoNc9Lk
         ENdE2L6Nq1Yads4PkRnL2wVTaUwc6GEHy3wEJ7h40d1bru90LC9zXh+AwjTVzTWytQzo
         MKSLCKdXI7YJeh8yx+I+r+ChemT5Xg/wjaQWk1McCeF/AxqgtlzVtKlZSX+N0lsBl82z
         Uv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686429760; x=1689021760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQbsytz9TyV1LG+i5o+RBweOKvc/HeR56N+REltTEvs=;
        b=bREjXWq9vvJ/0P4qf+ywtdW8Dlamw7WfgNpJl8lZwahaIsCCDNQoIb6yhGkN+NptKj
         1KVPuj4DveTd99+tp1sFinPMXdtavhpoWhDBGCQw20Fpg/gfYF2COSvbkVcHL8mjKq6H
         /1t25oMpN2FW8vmkEIt+MOd3ady1N7I3p6FCTHc3ltlQGoiEmg7ZBk8d+cB6hkxG4zNg
         6kT1QsTNtYg3mWrxzNcjdyM6MePPfzTUpa9XMxo+GJ3//F3f5qtuWwpeVeshjT4IZGay
         S3hgx3a7mE2EBk5xgHeR2VvLv8Rem4m0w5TatABnMVT2L8Kh0NV8MC8PdwGCtHpW1mS+
         8uyA==
X-Gm-Message-State: AC+VfDw95sI0nbZfsVzIoOwGMmPIJHmRPrPhjvYaZNpnPWMWxyEt0Xdf
	LfLU4zCRTbjEcYoE2aV71xU=
X-Google-Smtp-Source: ACHHUZ713JxFEO0RaksKMViLB1b9DqxdlXmn5SaeyO4l4BysqXEWjvxThMiW/bKGtAiipgIsiB6RTA==
X-Received: by 2002:a05:600c:2147:b0:3f4:16bc:bd19 with SMTP id v7-20020a05600c214700b003f416bcbd19mr4214297wml.23.1686429759836;
        Sat, 10 Jun 2023 13:42:39 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003f605566610sm6547733wma.13.2023.06.10.13.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:42:39 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/3] Add D1/T113s thermal sensor controller support
Date: Sat, 10 Jun 2023 23:42:17 +0300
Message-Id: <20230610204225.1133473-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_134243_749557_A59DCD02 
X-CRM114-Status: UNSURE (   9.66  )
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

This series adds support for Allwinner D1/T113s thermal sensor controller.
THIS controller is similar to the one on H6, but with only one sensor and
uses a different scale and offset values.

v3:
- Fixed SoB tag again

v2:
- Fixed SoB tag
- Moved binding patch before driver changes

v1:
- Initial version

Maxim Kiselev (3):
  dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
  thermal: sun8i: Add D1/T113s THS controller support
  riscv: dts: allwinner: d1: Add thermal sensor and thermal zone

 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 20 +++++++++++++-
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 26 +++++++++++++++++++
 drivers/thermal/sun8i_thermal.c               | 13 ++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
