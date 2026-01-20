Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F33D2ED0F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 03:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKHTGyP5GHKtQo6Il9olRFY9uLzu0XV23ZPbah1uI3g=; b=vT6inIA6ncehtQ
	UXcu+INYzKuKyX+fWJ9qVenc428zFNg5VcbGZdaXIn0G0FbvDrM+UOl/j+yEjLX5+BLdRgW3gyz1L
	1YmFL4w8dOAlVmZzsgNk7P3AbKShgttpBAjNJps6A7SkUYk5tnQhHe+/JKRXXR3OQMdpsxY2c2UhG
	zNUGsHES2CQRdoEklprzZhvOxGnptwjA9io0Cmg+tUSDQQZfsyUZ4u4sE5tb06zAeHLvz4JlHCewK
	XvsvLeTazKMc8tTUiHBAS4Dadi+tAWDJgVilbs2Q2qbEWb4dIyvq7FzbYYYNPgEEk2zEf4PYsFtDh
	fUjIA76OPvDV3yQareQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi2Rz-000000037jm-35mr;
	Tue, 20 Jan 2026 03:30:39 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi2Rw-000000037jR-3YdI
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 03:30:38 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-502b698e510so23380471cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 19:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768879835; x=1769484635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlh3awqwpSDVfosrs2ZgXu5CLF0C481abnvSQYVV+dg=;
        b=hsdSVFlpp0/hboCIVD8EJNw02IzIdJAuyZQAeh8BOXm5vJTGyu8Ujr0ebPqA/GwIdt
         3FH1t0QfG2q4PSu+PI+/FwuMoPnNQn79sRoNnVuPQ8wnZiTM12bY32B7MtsLyJXHMI5Y
         oh23s6XGRu89OxdYojXzkeh9xcTTcyYXjlq+ye6KWx/nmcOs6GnPLPOOKqWd36XXPw1V
         ygH9PIClUkGZgiUnHR2BrHblJuAxOa4Ap89JUnS35PIFcTYWbm5yj4YYMSLrUZ3t4piS
         oh6UYo9RF3Go56DTNYwKEkKPpy1mn+HY3zs2dRcI/3e2krMaQaptBHGBMCxR1TPGOxQv
         CkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768879835; x=1769484635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hlh3awqwpSDVfosrs2ZgXu5CLF0C481abnvSQYVV+dg=;
        b=oE4f5nbBtCuHO7D2lvw4uRqtQw7wemCYh3z3+CkghS6fRsl+XDbQrhRLTH5YdQvaBc
         lS0SMymCxDP0O3188kvr6kr8BAFezrR0XkrS96cp6t11PbeuYVlf65TWofTDz3A+/uii
         zT5axEj4fYITtK2cVdS2b9sh8ASFawi9XcYuP4h0zTbmBzURzXXyWcoyjvcRcNTwFAc6
         3Se7QqoTTDn6W0DLmhxYcroU0eJjY10nnY2k5t0p9uV3HTczjanHTw/VIN7fHrD6VYcw
         u+yfiNC2mjcF93WjuWcyvh/3qBlWje4q+o32ce46DNBOp3mDuPrbAWlG+m655344KuRC
         5Oiw==
X-Forwarded-Encrypted: i=1; AJvYcCXu+b4QKddiP0qakg6zr/TsvQD2caX89gbTz+kWjF57qy0iKcjMXVKG1gcI4Hil86XiiEdpLPvfO5UYeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwR65AQ7QsPRGl9XWhO7WpmNLQ/qSSn5tiECSs7YoZkjlbZhdWD
	AEfWCOeeKsFgSYZbkDww4Gp2O2TQgZJ/S3CFiSpN5oTBdQjRjAppUB4B
X-Gm-Gg: AY/fxX5c/8+yK8a7L5lbuLYd4a7m0JB86682Yz/YZyEG/DGN0/9VSa5txlLCt/WEEaG
	nTIYPSLwEhz8zneyjhpp/dwguKpzecaDy9mJCMOS74BBwABsfcv12nfRGSMllzkcHEOiqdX8UB4
	mMn97vrRVPqYFkmr6l2iHYu7rTyHjdrG0Bhpm92dzrIWOgsa1xCzdDnIHWq1GxpvRdR3EjoN8j6
	nU4rQOaXptcJU2gUHd0B9cNXfUizSo3/6k6f0FXFJyYe0GAUDc+T/8S8V8Wm/1Ef4Hd9Fk/x9Bq
	6ERUrJJkbDYxLpU5NFSBWrwjF9ztgcuCCD+QgtUpXTi4gHrtYMgzLUOWLCW1JAExAJtXTFDNrGf
	xm0cGxYGRh4yGP2G90PsBPVbGLEgQxB38ZXRNtGZT4ltN+hUY6Cp7VPVsS9lNv4irfArY7QGTa9
	VJDuz5n07pMw==
X-Received: by 2002:a05:7300:6c89:b0:2ae:4f61:892e with SMTP id 5a478bee46e88-2b6b4eaddf6mr9178898eec.36.1768873045971;
        Mon, 19 Jan 2026 17:37:25 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b36550dfsm15337344eec.25.2026.01.19.17.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:37:25 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH v3 3/3] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
Date: Tue, 20 Jan 2026 09:37:05 +0800
Message-ID: <20260120013706.436742-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120013706.436742-1-inochiama@gmail.com>
References: <20260120013706.436742-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_193036_921228_6DE3126E 
X-CRM114-Status: GOOD (  11.57  )
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

Change the DMA controller compatible to the sophgo,cv1800b-axi-dma,
which supports setting DMA channel number in DMA phandle args.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
Closes: https://github.com/sophgo/linux/issues/9
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 1b2b1969a648..e1b515b46466 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -417,7 +417,7 @@ sdhci1: mmc@4320000 {
 		};
 
 		dmac: dma-controller@4330000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "sophgo,cv1800b-axi-dma";
 			reg = <0x04330000 0x1000>;
 			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
