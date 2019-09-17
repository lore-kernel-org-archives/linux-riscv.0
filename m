Return-Path: <SRS0=Dbhb=XM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14620C4CECE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2019 06:24:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA30B21881
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2019 06:24:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gm5X+qlQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="VlcCfH31"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA30B21881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nXcJfD1bVmOkOq/h1QmPsDmJIpk2lzV9Oriabdz3Bkk=; b=gm5
	X+qlQedXva/DmzA9473885ruk477seyxYnSluXJqIr898TexCXa0CVgzQE/dLyFbchJRuSDbx0DZ1
	SDgSwNCRU8jsWmXoJGIn+mjAFUqOMtciKoYuugcl2bhpn4NJlzdl/YwwSMAbp/LYymUTxmBw3CDU1
	ulFI0AkuvoDB2jVEo6l/dK+diGHygLrUlgfirJk1fmUEkuTd8UQbRxLKzInaYnxkWTbv5hqpSXNax
	cFSq+XVOjMXesxQd3+WfVvLKPfvvhcns7AMu9mqkPjfgIwb+C55/Nv6gRfA+JWptTAveXB1FyS8vb
	XXHUfqNhPo7pUTlXZVI/Fs6B3CveNkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iA6uL-00084r-H4; Tue, 17 Sep 2019 06:24:13 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iA6uJ-00084E-BF
 for linux-riscv@lists.infradead.org; Tue, 17 Sep 2019 06:24:12 +0000
Received: by mail-pl1-x642.google.com with SMTP id t11so1065745plo.0
 for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2019 23:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=OFOaylH6u5pbrPHCYuJfQmib6XY1jyUZj3KgxSUlnf8=;
 b=VlcCfH31PMt3ExcsC2X+/sezp4PAAIN5vh85oD9LKcNDNxU/ELwo/z72zixRvnixc0
 ZdVkMvqvZ96CyFBdGNDyQfkdmp6uc6WACA4SL5KtZbU3u16Pljd9Jbel0mp2RqLA95kC
 8rHEW+tvi6OmAqfND6Nw/rOOGk/pEHV2lgYEI+X/aVlA67zIC/iNM9FvVmHvIhGVwUgK
 iZgnLzHh29kUZxFHoRueOtZAoF8LxbvSw25XJ2AzXNF6vAMKk0tgj/zi3QXy/v5FjBdF
 2Vmigu6dMOss3EbiPeQ9IHIVD3JZCbkV5f9ZapvzT+iuvfExoC5yuRjGQsGCGDjoSdI6
 6KCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OFOaylH6u5pbrPHCYuJfQmib6XY1jyUZj3KgxSUlnf8=;
 b=uJe+wxfrrjtpY3hd2KRsnOU9GuFdxvQ7L8Y/zQIg+v20RDb37OXaSf+CO3kubO8ugI
 SCsxS40Xgtiy1IK2ZJGB+bWicsmqnN8AUuwYwqKl3pXydinh8+cYUwdDcWHKWU/CHwB9
 h3Iy+65GwvsEIltQxqquhTx3grudE4XdumEDrwC7er4uGPeE6gX5+BoJs9vcPiIIG7Jg
 g8FooBy1pwcL1Rf2Uv1j28GfB5ChNMGfcgvKKkm9Y2eC9q/A/6vvtPusgmxG6NF/emKM
 bjYwxr+4Fviwx+EHzSCoMpr9NwvG6OvI6Tts1FacH3paTo9JHT70w+NQreLwFuoOJOB1
 YerQ==
X-Gm-Message-State: APjAAAWlz4H/sIEyNVoTeahwFu3V7kNQB4rs1rTYKATws5GZpTXH1wos
 kwtcNfTHtEJpE/zDCnRkuiPFOw==
X-Google-Smtp-Source: APXvYqwLe8dHC49vL+zoSKTIa0C+ovX5FQBv7ioYIkPQEBvBXsr1KFZTQa+ddZ91fZ4imVDjyl687w==
X-Received: by 2002:a17:902:8492:: with SMTP id
 c18mr2040072plo.279.1568701450621; 
 Mon, 16 Sep 2019 23:24:10 -0700 (PDT)
Received: from localhost.localdomain (111-241-124-228.dynamic-ip.hinet.net.
 [111.241.124.228])
 by smtp.gmail.com with ESMTPSA id m16sm1180463pgb.84.2019.09.16.23.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 23:24:10 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Subject: [PATCH 2/3] riscv: dts: add support for PDMA device of HiFive
 Unleashed Rev A00
Date: Tue, 17 Sep 2019 14:23:45 +0800
Message-Id: <20190917062350.825-1-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_232411_382726_B7D01A9A 
X-CRM114-Status: UNSURE (   7.70  )
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
