Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6512DC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:05:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2653723888
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2653723888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nUfA5Q+6xQgzVx0dWQlCzRB29d5rAg8+HLiipfRC8pE=; b=d0hirOtQlsRrDZZJiYAwg/C7h
	OdJ9SMomMxqfx8LRHUaWLBlAYwuI4N9veb43xMXusDelxeg66C6l7f8STfnIYfzlyHMJm0m5iSi0p
	MjA94FzIuX2zySYWnhDWxCu7CBEOdhx3booyrhfIySbrJFgRVp7AYQq4kFUtBsXdmTKyaAZkW78ZR
	L+ICmX5zers6Yqb3gfKDLeXU5pQQBD0zAEiEQZ40Lo2Hn5/U+dqJa3bfuJUaUl/IgpwDcC/jvpyy/
	SWgXwaneC8SMA57WfhDxF3HYcTA2UBppW+mFg/GK0OOS61I4Xs4df9Rfym13VkoGuQ4IwkifEe6x0
	9MaYfvQeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Pit-00033I-VN; Fri, 15 Jan 2021 14:05:08 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Pia-0002pm-Ew
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 14:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610719488; x=1642255488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EtL2qzwmDcnW1fQU2frLeb46tiz62PjL2rf0Kz9/lC8=;
 b=l6CMEPqGBjO7p2p8MTssigyw0UnynVIGyTP8HRl5csGcM9QdGga1177M
 VqTVFjSqeNNVchwPOjt/WGRSiO2RHVhYAd/R/WpcExyGsbnLEpz3k4YpJ
 ODPJJrJUaQre1XPtbiA+3KX0r7xYpdpy7SMX76AekyomNtbZ9FQr+3pjV
 5lbpNKIusYKe/F3/ntW/gHqPyhR5+mU2OD7I/zpWnjzV3sR8wZBQYe7vM
 +Wd92JMiFlhCkfs9AO2ki6VwzychLtmtbJTf3MGdrsFj9r/2yyPuiLP1p
 f4xWpYbNMvOyFqoIIlasRDXxyyjlEd3xC8B60u5P+MjQxeWO9jaX7RAz6 g==;
IronPort-SDR: ZOKzt/tZ61O+lJj3e5a+oHu3B+vFlnGL67CxGB5SjxjPMXJzbvUW5RtUHSUZ0T5Cljx/Mc0Z2b
 JjLRRC1IP14/TGZ1lG7TLr2eXvTTM4ixBLuP9rYCYKMPROadDLpdyu/HzQX+rqt3OF3oqlBMmr
 26Ugk0ALpv07SbFnyxa7ylI1jlqf5tt2ecquPWnEul22GYazE+bMzczyL0qcR5mkwVXJyt2rSw
 AihcqcnsAHoznMELT+grxhH/jgMvFCsGiPsFS7+m9Czq2km6FELcAnBTOvn0+rrTf1QDg9pHbf
 L8Y=
X-IronPort-AV: E=Sophos;i="5.79,349,1602518400"; d="scan'208";a="161955773"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2021 22:04:48 +0800
IronPort-SDR: +/qNWfEs8DCZysjqQyHc1RZVorynm8qe2pnt9ZYLfr5BO3QtA/p08MR2tMbMf3n+FmUZnV/ZB6
 0PV4XMPjEFMeruWaZOQD3CwjI1ZZFQ8FvBWQ53xrSKX8cWW4h2qRolapIe5xfdeLu1N13pnvhL
 WCr3N66GYKeJs8rF9rnVjGwoPQe6qLxuTBHMCNhT+NLwippfPjmVbhxM1FVObnYDvZ0wbNbdTu
 SwAjuqaEbNL5JCydgXs2MOV9zNvWlE3Uko8cF2EadxDT4RFFKKQEv0UeqO8ioKVTNyZu/DmL2f
 YBr0Ae5DoIMu9wSZusO0YCR2
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 05:49:30 -0800
IronPort-SDR: JC5ud1Aie5s5GBUGPKB/4k1MQtXjjQf7M952OQjx03uRNLt+E5iO5tqDsoCi7OCT87qba+eyUp
 Cfug/866HQFAlEFwNvHGaGgU1ZIcile0z9jt/VzR0MujlG1hELIuLPzCZ9C27pjx/CTf/iNcoE
 EBHQCeWBN3AxnKpi27AP58PzwoOHF0Etb4WzWJ7yhxcPCQMRXhkxaOq7ZYxmRGtgG9iVJplplC
 DeridHx9Jfbwq3u/liz3g2bBJO416LxNUbpf7605bGf7PJN/FWReeJ3ld3K2c4J+DZzhXJ5C5f
 PtY=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.177])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jan 2021 06:04:47 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v12 08/17] dt-bindings: fix sifive clint compatible string
Date: Fri, 15 Jan 2021 23:03:43 +0900
Message-Id: <20210115140352.146941-9-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115140352.146941-1-damien.lemoal@wdc.com>
References: <20210115140352.146941-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_090448_697006_ADA3A20D 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Fix the Sifive clint compatible string definition to make the value
"sifive,fu540-c000-clint" optional, allowing a DT to specify only
"sifive,clint0" for its generic implementation without any tweak.
With this change, a Sifive clint node can now be defined as explained
in the compatible string description.

Cc: Anup Patel <anup.patel@wdc.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../devicetree/bindings/timer/sifive,clint.yaml          | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 2a0e9cd9fbcf..c6b1f37a2949 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -22,12 +22,13 @@ description:
 
 properties:
   compatible:
-    items:
-      - const: sifive,fu540-c000-clint
-      - const: sifive,clint0
+    oneOf:
+      - items:
+          - enum:
+              - sifive,fu540-c000-clint
+              - sifive,clint0
 
     description:
-      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
       Supported compatible strings are -
       "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
       onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
