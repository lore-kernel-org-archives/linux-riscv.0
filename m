Return-Path: <SRS0=MZUz=YV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E0ACA9EA0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2019 07:59:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 341FA21783
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2019 07:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FXj9GZNs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Nhf2YH2L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 341FA21783
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SciYZ/WKlV+O35auAfvLWbx7AMO1R6eNo1IZ/ci2f7k=; b=FXj9GZNsrANWksJdbh0ZrZG7cm
	7NQZ1MUN0fc2o1ew9mSLBjDL8mmI5zZBE0rYK9cIdIv9Po/BcGjwL0tkAqWhgqB91u7mU7YYQXkxJ
	Ls5VMdNSsrxC9G9fhyMqeqgRYYyF7QfNcpC+E+pdGfCKmAEYVdpoSCcaCy9K+LIOIxD9XpDxwdsg7
	4VIfoJP1ZxkU+SKxV3x0jovysdAhKCqbRdxRXx6RyqlVBpoX9/ZBGVJ83Xnn/bkdgyMv0Qexm6arJ
	p49wuvzIoKkdBWq5krmII8X9vXPIH2gQ/x3KvKOf5Wg88s+OUEWivX1i5T5SgJPnpUsRbBOYYb79p
	WujvnERw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOzvv-0005oZ-AP; Mon, 28 Oct 2019 07:59:23 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOzvs-0005oC-5v
 for linux-riscv@lists.infradead.org; Mon, 28 Oct 2019 07:59:21 +0000
Received: by mail-pg1-x541.google.com with SMTP id p1so6369279pgi.4
 for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2019 00:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rTp8veXsbPSlIboKUPW27VEfaouXwybhFA3W6d1O8fo=;
 b=Nhf2YH2LsGxBcx7yIKRbk3dyTrz8MeW1xjaYAUFLDZP8QChbJJ0bzWoT6V3pLJ3t13
 EznfckCTNYAdsW0SvcCWR0OOFdIET8hQI9lOonu2OuqmByjlKP5J2Sz7T48KiZqu+6x+
 EBYLXoXrJDJnvVyVY8oA3XzYZmc+dSpnusAjR5JbXyH9eDjtWPaKz5Ny7Fap0sndmbsG
 YDespJ0XT/A5ffgwKnx8x6Il/6MUpOVBKCoszEKNFXsJYU3yPvg1ALqOhUwNTJ/O1hrP
 GWCuwN+l5Sg3GiN8X3Hk/6akJF8t+EdT+JNt+MKCuKD8NxZLAT9uR3qS3WE20iJTSae3
 sQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rTp8veXsbPSlIboKUPW27VEfaouXwybhFA3W6d1O8fo=;
 b=A2G2ynetdKnx8W/BcEozJ4Xj+S6RmPp+2CYN1xvVJebjSuWh2xka0Y6rtFOOlOAH8F
 Dv3CakuR3GibZRoHSNc7QiMWBthvo2yeGq5ldcsJFy4DdK0Yz/Dclfk0iRvYkKOhphHc
 XmofQ0ueI6I/rj7FUW2eXjfUpm4NH/kgwwcjZR023UoVpKpiH01CNiTS70LNVr42Dw/q
 3JBu0oRZH5VDgN4kHMZB19vXlSFBH2nw0VEXes/F+dcE4PdPTOe0+t1ylEvrIp1spLld
 MGhyiH9oNFD9A5xG1EnlMWAkUoYHhSiJi2GoUotKQxp/gMICR0WIjjRmYo0BeHew1lAf
 kHgQ==
X-Gm-Message-State: APjAAAUyRO9jXMKHFNyMyIjhbTXnC9Ks1Cmg113AIC1d0uBkPMle6pMA
 coPO/VshfQFrmbuOSYfNUVt9UQ==
X-Google-Smtp-Source: APXvYqx+JIR+yzkCTCD7Bbm0NZp9TiSO96dmNSrfppX02pO25pWjTQLw3ymkAK+lbP8F1+zHbf7yeQ==
X-Received: by 2002:a17:90a:ac02:: with SMTP id
 o2mr11693235pjq.83.1572249559634; 
 Mon, 28 Oct 2019 00:59:19 -0700 (PDT)
Received: from localhost.localdomain (111-241-170-106.dynamic-ip.hinet.net.
 [111.241.170.106])
 by smtp.gmail.com with ESMTPSA id y36sm9504752pgk.66.2019.10.28.00.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 00:59:19 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Subject: [PATCH v5 2/4] riscv: dts: add support for PDMA device of HiFive
 Unleashed Rev A00
Date: Mon, 28 Oct 2019 15:56:21 +0800
Message-Id: <20191028075658.12143-3-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028075658.12143-1-green.wan@sifive.com>
References: <20191028075658.12143-1-green.wan@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_005920_222594_7AB34D4D 
X-CRM114-Status: GOOD (  10.07  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>, Yash Shah <yash.shah@sifive.com>,
 Green Wan <green.wan@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
 dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, linux-riscv@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add PDMA support to (arch/riscv/boot/dts/sifive/fu540-c000.dtsi)

Signed-off-by: Green Wan <green.wan@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index afa43c7ea369..70a1891e7cd0 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -162,6 +162,13 @@
 			clocks = <&prci PRCI_CLK_TLCLK>;
 			status = "disabled";
 		};
+		dma: dma@3000000 {
+			compatible = "sifive,fu540-c000-pdma";
+			reg = <0x0 0x3000000 0x0 0x8000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <23 24 25 26 27 28 29 30>;
+			#dma-cells = <1>;
+		};
 		uart1: serial@10011000 {
 			compatible = "sifive,fu540-c000-uart", "sifive,uart0";
 			reg = <0x0 0x10011000 0x0 0x1000>;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
