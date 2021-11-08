Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A685DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 21:47:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75017610E9
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 21:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75017610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SzXv3DsJivL09XeV26JNw1tdAxYVvnxvYjOXw9Z6Hv4=; b=ugVRNPIj5qd2rH
	1Bu7nVvBMjDTonlmAHuKV8OzhAwQOsFtB3twFYNdp0N5i1pnTFauX42UUsjr7Fq538L4UKum5u7JN
	cUyABjy2pbTfP55pB00mVJQP782twc0C0yzhOUUMg/DM+7C21aXJLzRHgbu5vfQa2iJN4efZIKBLq
	1WgDDCnk5PVFkNvuo3KPHZ13g/35REAh7ckzo+mrHoLbrLUW7MTjAAjbdw8Bs66cMBrdma1to9E9a
	YZa0N/ko0ffEfTqBeN2LaV9OH/Es3l/nnQmoD5UqHtcgYxYw5tsZaql6QiK50FRyYDzhQJfthsqry
	VRkdilAADDl/P1GsmfXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkCTg-00HWfF-Rv; Mon, 08 Nov 2021 21:46:56 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkCTd-00HWds-PS
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 21:46:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
 Content-Description:In-Reply-To:References:X-Debbugs-Cc;
 bh=N66F6Wqb9JBCWGaFILjT7qMKPk0Bi6BRFQXkrAP8YSU=; b=dwCrZp+TvheeFG0rOfKtj6Cgrj
 mpJOjbGl+DQxUnvjcW7D64bmBs7HfRok5/F0nnH+61uSek1zYGJzOUtA35/5zQSqMrwo2+x0zE8I6
 kBa4xQwRpWUdlqUxlhsNxt1M81AgQhbCcNM4anrMu7xZLn32L4XiH1hwB6XH1icPEZUgLKvMYtmVu
 qcVEH8tpQEk+PPvJqj3OLgdSfrear1yeN8TetRZYtyGW24zgS3wcP0E66HsLGIOGingiXAaeUNkXW
 ySi3Z+nukH43ot6dubY++UEXguubrlxjjtfaj7u3wNGCKVVO9RVJVgfRwHuilxK/bMjh1KpeZjNr+
 Nz/RfbQQ==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1mkCTT-0001NP-9d; Mon, 08 Nov 2021 22:46:43 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.94.2)
 (envelope-from <aurelien@aurel32.net>)
 id 1mkCTS-007GI8-IX; Mon, 08 Nov 2021 22:46:42 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Subject: [PATCH] riscv: dts: enable more DA9063 functions for the SiFive
 HiFive Unmatched
Date: Mon,  8 Nov 2021 22:46:29 +0100
Message-Id: <20211108214629.1730870-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_134653_847660_D3B23CBE 
X-CRM114-Status: UNSURE (   8.79  )
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

The DA9063 PMIC found on the SiFive HiFive Unmatched also provides an
RTC, a watchdog and the power button input.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 2e4ea84f27e7..c357b48582f7 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -70,6 +70,10 @@ pmic@58 {
 		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 
+		onkey {
+			compatible = "dlg,da9063-onkey";
+		};
+
 		regulators {
 			vdd_bcore1: bcore1 {
 				regulator-min-microvolt = <900000>;
@@ -205,6 +209,14 @@ vdd_ldo11: ldo11 {
 				regulator-always-on;
 			};
 		};
+
+		rtc {
+			compatible = "dlg,da9063-rtc";
+		};
+
+		wdt {
+			compatible = "dlg,da9063-watchdog";
+		};
 	};
 };
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
