Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3893CC433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:36:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C2364EDA
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2C2364EDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J53FULrU3J7sXFfKCPL3sTr0LCdrTJz2F5ww6ROOsbc=; b=t6tidRrw3LgJp7zz9p/k6q0oX
	GAJu3nClCWFOxP8UNQncAEfqKnYJUjVs692tc7CZJ48FuOKmXtUZVGHLqBAbjaYLulPGj9UxxN5fi
	JoSD+gsDq8jZKD0xjeD2gFdqksOjMZi9nU5LM6jcm4D8P8+8w6DW5LrJqK1yDN35qCNRsSda3rR1A
	ZZoFkmQ/a0akefXpHsyjeOUDUXsXmr8KKrdOFaQ4vwA9qj2mmUSoO0kKe9GlcCL6LnzmIj9vz4YeZ
	rWxjRkZ8SbsLdIMGEnlqUiOABuwRIaRoe+uUeRkMN365wzTeyHcemN2F2GwD8Td/fylVCxeLwOQrJ
	YJig5fD1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6t35-00088g-DM; Tue, 02 Feb 2021 10:36:43 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6t33-00086e-78
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 10:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612262200; x=1643798200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0gydr514UdHfaLZyMWZlPzEDnEe7NJxvNWRTRtcTWlQ=;
 b=Yd4n93M+phAm2GJzG4z7WsfpMX3VT+m6PJ5HoeL4FJ2IXnrBzTyng01t
 yqIauU9Pa0cIQ87KGSB98j0z+EgxaMvY3wZrddyTQ9oB7EurpBbaMEq2d
 V8I9AU5av4yLI1NSLxsZj7lMjgWDcujcYzEkQ3FRZ9DQzV+L2c10McYGV
 fMV6Qj7gO8VVyS5ZDiF942CyTp9HzWRPePRoN1p+Ft07bWmTaAmmiSnSQ
 1vVQ8lw5z4orvgr++oNc7rXLDu5bAJNerP4WPMoE7uDWQEY3U6g54EyzW
 f0x0/aS3LuxzjYMLc0U3ipPk8EH3NImQt/pkJ7nciHpxFfK+72ogvOZd3 A==;
IronPort-SDR: CzFV1sr/9wgGlVqOPhOh8kaT+CjqcBOzhBS0rfGV4gHBdF1Wt/XQGN0Mz5DZxlPYAazYw9h+mr
 5TsvaOG8U1xEHySsKLiy0fss7qOuSqR7VYo0q3TgJafbfA5BcksPJLmVrQabZPJbduNtZnswDH
 etlJv4A/WYwbbbakHksSXWsJ2mc5JABXQlpkciHoN7I3+IaG1v4yziwUoGCHwMTZwiFE6oiOSF
 p3KrOlLkgZwnt4cknbADAMS4ek/4F+tnjwp6F6YXhYLqJBXAY5BWFY+suF4X1GBqibbiYyoVxV
 Wg8=
X-IronPort-AV: E=Sophos;i="5.79,394,1602518400"; d="scan'208";a="163357056"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Feb 2021 18:36:40 +0800
IronPort-SDR: U4ev6bzRJv5xfzVIis+hNKZecF/CdKibPdDnBidWkCtpxGnAQ13j4FOUIUz7rkiolO0hY8Sn63
 b56wbEbgRFqLYT0V03Id3n8i9ecLhMkSo2mg2+InJPL3mCKKG9fjIXzio4R/hMdUKviN/MXEB5
 Xl/DD60Z3kdZwq43lfvBzOktg6yMmzXYVgJHVXGGIPAlvnsRD9Nlo5U5K7MKWUAUK9PlEZXwO2
 zBRmTrE9ZqAABTRsmGVps/tsWf8RaiX9M5rOkgKKIYAnHGEfmcrN5NM8Yy7njaw4w+jBOyOh1L
 7X3ce8njJ6AzwT6f7AV1ajjX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 02:20:49 -0800
IronPort-SDR: O/5YLX26xHBHZ47wxLB98AXixV5nwPdFuDDfOj0UjPef28lyhWd+9Na61rFSsdMXkZqbGYg03E
 YttiLsAChJNdrGmXdEzxSEG6PaBHJZG4IHZfsABfg3rdC634tWvZ+hWk3836Iz4Cxe5I1jEht2
 THbuFT3FZPz5lQ69XsnqryR3UyH7UftP9s0gNmazL+Qm9cyZOGdkUequmDiTV74C1vu/8bkTfw
 +GOlIOCy8S1a2PPWoS6fUjHMo6PHm7qX57kL6RniQfOULdZpayTgmWcH+RdlM/8MTq9+20cdGv
 g2Q=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Feb 2021 02:36:40 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v14 03/16] dt-bindings: update risc-v cpu properties
Date: Tue,  2 Feb 2021 19:36:10 +0900
Message-Id: <20210202103623.200809-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202103623.200809-1-damien.lemoal@wdc.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_053641_415685_A403D61F 
X-CRM114-Status: GOOD (  12.18  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Canaan Kendryte K210 SoC CPU cores are based on a rocket chip
version using a draft verion of the RISC-V ISA specifications. To avoid
any confusion with CPU cores using stable specifications, add the
compatible string "canaan,k210" for this SoC CPU cores.

Also add the "riscv,none" value to the mmu-type property to allow a DT
to indicate that the CPU being described does not have an MMU or that
it has an MMU that is not usable (which is the case for the K210 SoC).

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index eb6843f69f7c..e534f6a7cfa1 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -39,6 +39,7 @@ properties:
               - sifive,u74
               - sifive,u5
               - sifive,u7
+              - canaan,k210
           - const: riscv
       - const: riscv    # Simulator only
     description:
@@ -56,6 +57,7 @@ properties:
       - riscv,sv32
       - riscv,sv39
       - riscv,sv48
+      - riscv,none
 
   riscv,isa:
     description:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
