Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064FECAC582
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 02:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDC/34S7lQvLGtIqFcjMV7jz6P464vtBIc3CKVnLVEY=; b=t8gkZ5uNbVWCEp
	/oYjnw/BzEdp5PeizjbTtWgpNVQJbux6lbz+5+dqhye4HgTTDAPsiFx7mv87BwNNRkfRRSQIwkB0y
	5Gk3C3RbIMNHJUobf4xhQ7/bIIQCG6U3ATMW5Sj459vpY2ljGVKfbBg1nyOrOjRarOEgPzl3Gfhib
	pqiHmXviHMnRsbFGJMoSilsEfoA4Wf4i2/tiPCnSVSFcXQ09aJXkVM7xTphEUGn1RuK5hYlSdr7RZ
	RoSddckfGPphcXgEfUbkJ/rEsseYBMhWV5GkkVAWgFXORfFSOBTfb/Je4w3Ehn1RJphsXP/8ZLW+/
	0oY1/bPrEySMpXd6Vv3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAI5-0000000BceL-2HBO;
	Wed, 10 Sep 2025 02:10:33 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAI3-0000000BccB-0JLt
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 02:10:32 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4b61161c32eso32311291cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 19:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757470230; x=1758075030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8dXK+URwMz/QYwLwmlxkiqTgmS0zDdGrSZfnYxwO4o=;
        b=dlQeJ/hgIEFFkWuq3po2FYGOnBnJB3p/k8XxTVSD4sWP62ap8+zZldxS/VuDruZ8Pg
         IBLpHhL6ldy2zGF0bigaa/VPuzbAh9PH4wCcUQfUWROJwrvvwwn39vR18/HIiXUvDw0G
         AuNXEUa4IV5pn1281j4z3cd2f4XXFlgopUUKJGjj6+VunS2M+StJS6pyvP0OnN0P8lqV
         m3aJZb29M7XekrtF9uC42Q/tjvPoqpFBxD2oPiUKM2BIgwgBOQTH/BqALqZZRdmdWR+d
         xhDdnCtv7xAUKj4GF8myCzF24uLvkh1X4MrcMWUnWdfFXIouUdRlAz26Tm8Tt/ajwNYE
         dgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470230; x=1758075030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8dXK+URwMz/QYwLwmlxkiqTgmS0zDdGrSZfnYxwO4o=;
        b=MSU6mplGs9V8X/5idQaH0pVvzGyv5hMxbDt0p7GYS/owj+/9/56ZwysUtxMJK9h+mP
         Uy9JCLspnfqB/rx4EbhvrS4cXS2yyzIMX5z+F5p6DhEYGZ3OMgNQmKpUE+9V0nuLzBMk
         GDEvYJLkXa6hwdRhpRYouqL82lB8E77k99FVEpXKFAaGLuhiAQPed5LRp8KfoXTPl5ho
         /TnUOTFDbS2/oebYOULSZqnnIhTzqXZQridqWuNaXASYTQb+yLKk5RYvJMlFv/LwFZ3x
         qg7RLC4y5dWhCUGBCKGicXhFoe4BwGZKGs1DVlO/v7A6HdbwJkC9o/h5b2OIRLKjzx0V
         xoWw==
X-Forwarded-Encrypted: i=1; AJvYcCU8CXApnInNwMCu8/Vh2PengCkb3gMVGwCI2Chxx4gKWNHmYn2KZLn/pq0VahBQX63kFMa1pnLtCfEBoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYQIfWSwb8yiP6M5QZc4FTpvzIe3PItucLkZ4BpsRz3hf1wbn/
	/kyT7869j3zL+r3yDgJyqVtvKOIaWHBTDO/S96xrvWH9W5bG+2QPj6ES
X-Gm-Gg: ASbGnctjFAi1xI03CPqIQdvusMUWkR9PtEwl3SR1wKNV7ARq8U/RP24mUkhmOdPi+Y3
	U/3B+1nFPoWDRclduAwlkc8JIoUb+wV3jhz5uTIR/HsB+ApFu66MEoLU1D6P9PrWJyijkrDMyba
	jYec5ZGUD0zc/fYdgVDtVzrSPIni2DkHxFldCMKkM7siff9aDiiqtD7AYouHYRwWZwlq2DZUQCf
	RNIOjyGTNmnlgwDEhoGxZvWK2FKCOdBXzUox2QA1eKejNfHM7Z/WzJd+5jCEoES+9aKWkVHQukX
	H4t/y3FwJFK8Npe+JRZgjUVYCNkTGGMUkWCVrlvHwHW31euSPJ3C/4vFmdgW4wk4lx52JzhZZfP
	ZBMwmIf0yzXntS97DZDuVL954V1eSBHhF
X-Google-Smtp-Source: AGHT+IEQT6CbOd2QsWi0+OjHaJf57cY/Drb66adJD+cAQ0n8TdhI1gbx+/J0LeyepotKxmQzV1314g==
X-Received: by 2002:ac8:57d6:0:b0:4b4:2d3a:8902 with SMTP id d75a77b69052e-4b5f836707emr165034461cf.5.1757470229614;
        Tue, 09 Sep 2025 19:10:29 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b5ed71ad8sm210106585a.50.2025.09.09.19.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:10:29 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH v2 7/7] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0
Date: Wed, 10 Sep 2025 10:10:20 +0800
Message-Id: <023eb6dbd2d9d808c3992e954ad7eb3840da8260.1757467895.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757467895.git.unicorn_wang@outlook.com>
References: <cover.1757467895.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_191031_116741_FD02AFF9 
X-CRM114-Status: UNSURE (   8.52  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Enable PCIe controllers for Sophgo SG2042_EVB_V2.0 board,
which uses SG2042 SoC.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
index 46980e41b886..0cd0dc0f537c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -152,6 +152,18 @@ phy0: phy@0 {
 	};
 };
 
+&pcie_rc0 {
+	status = "okay";
+};
+
+&pcie_rc1 {
+	status = "okay";
+};
+
+&pcie_rc2 {
+	status = "okay";
+};
+
 &pinctrl {
 	emmc_cfg: sdhci-emmc-cfg {
 		sdhci-emmc-wp-pins {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
