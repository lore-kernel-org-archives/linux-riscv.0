Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EABC4361A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 08:59:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B5E4222B6
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 08:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B5E4222B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0DA6RRka4ztKQPap8TWd49vrVowl3hb/CSn+iNY01Tk=; b=Yfh5KMICT6T2byTDAiuaWmJW4
	5e77Ibb5hD34Ldjrokn7+tXKakJn4xUPKqJKDM7GbybKRWwJkQcDiCtmIIFNn26Fy9BbNEy6bvygl
	g5SvdYSMVTIwi/mmXNAks9ohvAkpjyIz4tL+HoFh3OaFTFEBq1Sdsh47QidtaUUXLDVDkeF5bxzBt
	wg8eP4E09Rn05gV8c7thlP7eN2O7reBgUf9f19KW+ka2D5Tm+2g5tn6eth/fjMlXYPWAC8jH/DHKk
	oX40YriKC7FzTJpXzL3471CwoJtHjH9djgFgqFYkfsHbKXWQctZSDEv56RUdjIT2HnLVfsxkpZn14
	0jwYxkH8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl6vb-0002kC-2R; Fri, 04 Dec 2020 08:58:59 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl6vP-0002co-AX
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 08:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607073495; x=1638609495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jNYvSiz+H6AytLwCJnlGVjeteLNQ/vg7CpUZAEZLOKs=;
 b=Z2TeUz4uFaaNAbs5Avr5owb7BVRr/3GLRDF9w1SUgDl6sMGQxVVpdpJg
 y9IkWZsP+dfqqW4O8EDnSLDP7k7KZpXVU2kbzRIWhddpb+F8GVtCL4byv
 tjR7eZ4lO1rBJUmTIiEnhGR0RQvxoou41tYWoK03mSrWaCaAqLw3/qwcX
 Aivs2d3k50aboSIa9EopIAt6dkDy9YPxAEOBT372KHJ7tCB0EDlbTTDjH
 vD9TDMSZ/g1q8vRnH5t6nTpMgJAVRlh15redCAgClgQTJMUntzlPSbJhM
 4aDCWzH8dZdsEwMfochjkMe2t/DaDeuHjFQzfpIcHmtAYJHY6VvUcG0zb g==;
IronPort-SDR: oIISZ8TUYR7EDDLB3yEBqTR8zQyeip5dKScKWy+SzBTV7TQ4WjvZ/5yhNcBVYfXCSnSAuiaGah
 A0MTsSA0Wg2AipDwKJjAqyEgPXzl30ePob/FBcLK8UMg3prfvzASIlUiwgdokIPG8HxwmuDMzB
 RCL8huK8B24p3ahOTHGlIWteca+/kt1Ruj77nR2+NQVFRTy0Rq3gOSpjbLKEpMhjSrQrYakRKB
 kDllxogFJ4a+aAxfTBK8hyXBsSgl7V8AC9OIzzMUZKOCXfU8UC8hjlfAOm7E4WQ/NJ2FwMIAIZ
 RTY=
X-IronPort-AV: E=Sophos;i="5.78,392,1599494400"; d="scan'208";a="258129851"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Dec 2020 17:18:06 +0800
IronPort-SDR: gaJlWeiBvGDRoKXCkBGj/P8eDkxQ+EoPap+cMXuc+7INv5xQDLOoQjowMOhH7eu+ZS9s7CJFci
 +VM2H3jHlL1iRJtJQbgKFEReVhpVEUuTg=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 00:44:14 -0800
IronPort-SDR: J5zkwaI1zWnBh7tC1w9lVCiN2i9JhY5ygV36v++CgGATGZPXFVf4jUXgQf1yDo7CxaxXuAgBo2
 EPytFFLKykpw==
WDCIronportException: Internal
Received: from cnf010505.ad.shared (HELO jedi-01.hgst.com) ([10.86.61.200])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Dec 2020 00:58:41 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] MAINTAINERS: add microchip polarfire soc support
Date: Fri,  4 Dec 2020 00:58:35 -0800
Message-Id: <20201204085835.2406541-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204085835.2406541-1-atish.patra@wdc.com>
References: <20201204085835.2406541-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_035847_586647_42B9F646 
X-CRM114-Status: UNSURE (   9.19  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Bin Meng <bin.meng@windriver.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Anup Patel <anup.patel@wdc.com>,
 Ivan.Griffin@microchip.com, Atish Patra <atish.patra@wdc.com>,
 Conor.Dooley@microchip.com, Rob Herring <robh+dt@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Add Cyril Jean and Lewis Hanly as maintainers for the Microchip SoC
directory

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2daa6ee673f7..cccb7d6c58aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14989,6 +14989,14 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
+RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
+M:	Lewis Hanly <lewis.hanly@microchip.com>
+M:	Cyril Jean <cyril.jean@microchip.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+F:	drivers/soc/microchip/
+F:	include/soc/microchip/mpfs.h
+
 RNBD BLOCK DRIVERS
 M:	Danil Kipnis <danil.kipnis@cloud.ionos.com>
 M:	Jack Wang <jinpu.wang@cloud.ionos.com>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
