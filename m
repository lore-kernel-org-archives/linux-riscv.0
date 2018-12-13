Return-Path: <SRS0=TUPX=OW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB0BC67839
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Dec 2018 23:15:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1CAC20851
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Dec 2018 23:15:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="laPEsDov";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="i4Op6rYB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1CAC20851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ACN3DnP2iQm1oBjgAxuEhMRKAoxupjBZ5dA91TbseqA=; b=laPEsDov9dpbaB5lv1gkoq+fdl
	ghyY7EO4Pdbt3JUb/xAYLa746i6Y+v3fbRqiMfR1loleG1zwu/rM8wRjWbU3MV/zUNmiHiYPFkMie
	3N/Wqebjhg66VyAV1eMzTVaQjFmSomfm35FlmkeS0xkXNfu538ZPZnzGMbAuu/KRQ98mqEImeiOEO
	GNj0P2oyrAnTZJ/7Ds4KX6dixXx16YzU0mBPgXEvunttNnWIFy4YRX87Q4ykdB0VDJkcEMAGWAj6g
	+7XzUsMTq2B8VwWAVRCjQTxpZi8/fwIud5JyOxU36vUA7Gy6sUhjW0AyJKuSoqHBQUBEAliLNOUTd
	Ptvc6nJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXaCD-0004T3-6Q; Thu, 13 Dec 2018 23:15:09 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXaC8-0003WL-OB
 for linux-riscv@lists.infradead.org; Thu, 13 Dec 2018 23:15:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1544742905; x=1576278905;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Dw7BVJruXEjQ+4ypD9yLQOYA/HM5jvLkotJAMWN215w=;
 b=i4Op6rYBz6frxmjG47IDvn2GqrcKooigIt4jhDlQbdtwl5hLw60HZBxx
 2XzGSbRw7FTwnS7suOk/Lgo7cef7LpNckOkwT71ykpTlmgF/iPGdunnOJ
 h15xPf5EGi9RA+n+S63ou9CQadbhURs8o10qCt5zu+kHPukFzR2Agotuy
 UWt8ZMIckJrr7xaE/41O3LJDpjOzYfR4APORCzcTyFgIlhYt73MOEbMnx
 8J2LEXCSJKvrd0+HTjrvXc47Fw+rt+lKoZotv2D+IclGyufUXd0qAnSPj
 mMAXSsxNkKflxu4egA98e8X4EnADpt+11xZZAqQ5+UePMb7jzzFciP8AJ A==;
X-IronPort-AV: E=Sophos;i="5.56,350,1539619200"; d="scan'208";a="97770424"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Dec 2018 07:14:52 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 13 Dec 2018 14:56:27 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2018 15:14:53 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: Correct RISC-V's timebase-frequency
Date: Thu, 13 Dec 2018 15:14:26 -0800
Message-Id: <1544742869-19980-2-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544742869-19980-1-git-send-email-atish.patra@wdc.com>
References: <1544742869-19980-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_151504_936361_EFF77571 
X-CRM114-Status: GOOD (  11.72  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmer@sifive.com>

In RISC-V systems, timebase-frequency is per cpu instead of one
instance for entire SOC as there is a individual timer per each CPU.
Fix the DT binding accordingly.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
[Atish: Update the commit text]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
index adf7b7af..b0b038d6 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.txt
+++ b/Documentation/devicetree/bindings/riscv/cpus.txt
@@ -93,9 +93,9 @@ Linux is allowed to run on.
         cpus {
                 #address-cells = <1>;
                 #size-cells = <0>;
-                timebase-frequency = <1000000>;
                 cpu@0 {
                         clock-frequency = <1600000000>;
+                        timebase-frequency = <1000000>;
                         compatible = "sifive,rocket0", "riscv";
                         device_type = "cpu";
                         i-cache-block-size = <64>;
@@ -113,6 +113,7 @@ Linux is allowed to run on.
                 };
                 cpu@1 {
                         clock-frequency = <1600000000>;
+                        timebase-frequency = <1000000>;
                         compatible = "sifive,rocket0", "riscv";
                         d-cache-block-size = <64>;
                         d-cache-sets = <64>;
@@ -145,6 +146,7 @@ Example: Spike ISA Simulator with 1 Hart
 This device tree matches the Spike ISA golden model as run with `spike -p1`.
 
         cpus {
+                timebase-frequency = <1000000>;
                 cpu@0 {
                         device_type = "cpu";
                         reg = <0x00000000>;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
