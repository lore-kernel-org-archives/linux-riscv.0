Return-Path: <SRS0=fbrL=XO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A75BC4CEC4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2019 07:29:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F3F5217D6
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2019 07:29:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uqj94+MP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WT2Pxo9+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F3F5217D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nXcJfD1bVmOkOq/h1QmPsDmJIpk2lzV9Oriabdz3Bkk=; b=uqj
	94+MPitKhCOfcOdDQ9ksK2JYnUQAZzlMfq37AOCHfH6XGGNps5pYLT7w7aCEnDCH+Euvr+OcK69TZ
	Cunuy+tGeHi2GipvirC0ceigCT9QC9bg8YjKjRIvKC7of33bEGBdZjgjLl2QtWxuLEu8V+ENTL1ko
	yw/o3aAIqC3Bmo91a/1tJMfXiu+NQ30HvbIpTWbKt8p/XYlCu8nNcmbSjRNIG3q4ZJ4KTBKrLGtGW
	3dGWhJ/D2PGBxSlNLYECGcnrLAPHflo+V+3KB53CuOcyEt/B8RLkq7MJ+Zo7OzjyjlDi+ZSETv8Bn
	8gObF/7ZOr6Sw27bl7ONcaLDFBPOMEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAqsV-0000jn-Jd; Thu, 19 Sep 2019 07:29:23 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAqsT-0000j1-1Z
 for linux-riscv@lists.infradead.org; Thu, 19 Sep 2019 07:29:22 +0000
Received: by mail-pl1-x641.google.com with SMTP id t10so1181913plr.8
 for <linux-riscv@lists.infradead.org>; Thu, 19 Sep 2019 00:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=OFOaylH6u5pbrPHCYuJfQmib6XY1jyUZj3KgxSUlnf8=;
 b=WT2Pxo9+vdqo+cFeBngcdvpi/70AZ90ZQaQMGg5JQjt+rxT2ODU+n9g4ZmXKtXKH82
 PhGmkNWBY/WNJICfL3iDv1Rq9a1KHX0HSP804LwIiZN5fotqQQnQM/TkebS5E7x40fl/
 Sh33Iwz4ftxRxh+Lzb9q/nSa985dmZDZ9nj2rtEJ4emyA+OT6csvZJQATB9i83PMrHFi
 eFv2O9xdHjfmbAA6yQtsPDWgi2KfduxhvnSaaHkA975eaknOLaprO3aHEIjBre3eW3yF
 nEKHrIsLWEdXM4Rm9tGK+f4jdFQ3DzWjU46mKBh/DDKZRuBeYDkuknAOvdg3912sQwtf
 sFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OFOaylH6u5pbrPHCYuJfQmib6XY1jyUZj3KgxSUlnf8=;
 b=ftfb/ll10TolY+sgbPeRpvTUclQa0wM2ahLThxgHhqW8rj92VEK0A3HUmmXWqFd7ix
 LqEHFCp3VUO+FRXYCWxUtt6jLw4mPQI96dZggEChAntuwkVFL3EMTPXRQLC5nIIkOFU+
 1G0CajTk99knIRz/G8UBYcmfn0DgbydsZSGtNtmentu1MDFsKxV6jJjq83sp0docUj7c
 PKKF8GMeDSkr/kZ8HRHScU2ECFTmCDWOHKy4EyPo9JrrJy5p7Rv4SChH9B9Vv+7gZJhi
 ZrqAGr/mSks/qSE8eOs66EdXtzFi8w8bSI9McApvVJzPDx/K2zjLzJvvz8VtH0vjxZqH
 Okpw==
X-Gm-Message-State: APjAAAXnvmFUuIXGkNND7IlPv+cjoUncNjBt1a3icyvM/VfU2NDGhIxd
 Raw5vXoAZsZhENDBBhClQsvIVEc78MkvcA==
X-Google-Smtp-Source: APXvYqwsapyHm6wAGVWo7hnSXqyZwiK5M1XVWSUnIBQGDny0XMJWzBKktws1pfvK6npX5ze1JEqclw==
X-Received: by 2002:a17:902:14b:: with SMTP id
 69mr8386982plb.286.1568878160122; 
 Thu, 19 Sep 2019 00:29:20 -0700 (PDT)
Received: from localhost.localdomain (36-228-113-219.dynamic-ip.hinet.net.
 [36.228.113.219])
 by smtp.gmail.com with ESMTPSA id d20sm13029211pfq.88.2019.09.19.00.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 00:29:19 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Subject: [PATCH v2 2/3] riscv: dts: add support for PDMA device of HiFive
 Unleashed Rev A00
Date: Thu, 19 Sep 2019 15:28:59 +0800
Message-Id: <20190919072903.2083-1-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_002921_143462_2CCA5697 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Green Wan <green.wan@sifive.com>,
 Yash Shah <yash.shah@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Sagar Kadam <sagar.kadam@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-hackers@sifive.com, linux-riscv@lists.infradead.org,
 Bin Meng <bmeng.cn@gmail.com>
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
index 42b5ec223100..d3030d7fb45c 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -164,6 +164,13 @@
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
