Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509A9C433E9
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D214564EB1
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D214564EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CobTpFA9scSRrNTMd1NHma5ttxWf60hziFhI15Lh/2g=; b=jtL7gmZeiFhG1NTXJAhhQ/G8N
	sGHHUrPEtRg+8SpXL/pFVE5UJav59L5T0NV17fhHk21Dtd+kNqeae+Piso+hh0CgkEWkc/UpmXrut
	Z5RNdyLDA0skkFboRMXuiv1Cnnv6PWTNCd1HOyuOZoqPFKhcXdB4XUYHylRhRpe0Io3VKgyGV/h0x
	oDzNIJBvwcHqTUjwLj9HXaUiitA205N/mMB8pZvPjwC9XaBSCZyAjAmB+U3V4JwnHhQUzl0pPqS93
	0fx29wWwKBNLTft+Mow6Uc3u3PNreyj+baXmOaZRNedwsKj6j4ZomukFEshL/hQEkyS001YxkRi0n
	jLoTLtX0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9SA2-000881-Jx; Tue, 09 Feb 2021 12:30:30 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9S9y-00085Y-EH
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 12:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612873826; x=1644409826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NGUiJ8C+bTM58/VzIl1j0v+4iWOTF+8rASnEfXwaBo0=;
 b=FRY29YR/Dc8VYPI/9TXxJf0CXgRF8k7AdbuaXzQqbvyUtqyIHzdcePsp
 mI3k35aqu7H/8f3AO0PHBkHP54SnyvEti3qvkii0lg5BAvaQztexoEyRi
 HqFNq4OZXTmQib2BKiaTLyQ0HjrFtvV0WUXLnK21hb+cfrxS1IX44HU1G
 Fk+pz2FUCaj19L6GDQoeMy2rhkBTzyf1+up4yMcDD1GWeU/ix7+8SGwli
 o+O7nM3yCYSVB4XFP4jNAFPrI4bcnPBYL0TvhxJgFy+6A05aVwjYnlCqX
 ZSQzRTgk0pAkbJZyfjoaGF7Nw0NOg4hbphU5FsZvmKrTYWc/1Ma6Edd2j A==;
IronPort-SDR: XKMRGq94L3NDz1TDwVGUsHOoq9JO6MDgcp/35ELjSgVgQ6QC91Ied71U5kq5HMPOqUeI2pUXiA
 fFHoZ0gnxkbdzbbALxKB9oQRtKoJy9U/pZvUYRlduk4+w/8P8sbEpUAA0dfiibJN06MoYHJI8r
 vWvThgP0WWAZkXGwMzDDpLgbnXmxrcO2k5Yg8SxkeasM05+sEMv40r8wOxbV8Wm20M396syYT+
 cL9ngqY61n42qnO8+EW2Yzd1Tlb80BQ6/B+5CHp1OU0ubuM9N9yTkrJA+OXQYN7lNksnoRVHtk
 87I=
X-IronPort-AV: E=Sophos;i="5.81,164,1610380800"; d="scan'208";a="160707550"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2021 20:30:25 +0800
IronPort-SDR: sbQUK5JHVJQuF8aQiYfkGK2gC/R+oqYXxp9zqMycIRYF75FYPfB9NQGOOSeFUJXE3VYf/yFiZg
 FNmfvlW4Zu1lb70QPk+xaycgF0IofjMUDtWGEZguxFiN3RVMzcG4+/UnyDQR2fpgaRwBFQdVJi
 ckFsN/thTLKgonLVfQ+mWtufYxCFQIyU3y0YaDqTMcKjcbVQpHnCCjxo5EwwSedU5J9tLhAebn
 e9UHIMcfQDEWcwsg4ZvdOU/oO4ZGiJz+4co8unb4vQVnK3H3wFzQJO9AKbzGPjqacuOi2oxS+1
 VmpCakfIRNdhY6vDF49hRbwg
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 04:12:18 -0800
IronPort-SDR: tVpNS3b5HttM+gO4JgIkVgnoba0hYx90quy4/NNyq9c/v+AM+MNv8pvaTqGs4Ddevvit0ObYvx
 DQiJF+KtJgZRy4tLAh+zF3M7YzziIMADUcu/nZ6fZy5lXYjG2qWqcmjPETvAv6ASQce2tHI2JQ
 gOx5k/tfTcuCcTjVGdHu0+KEkx1SqegXfmidkPrwHvBlJg+B7SW+R2FcquYC+kqomSdOQBLfL0
 FhKqBy0EQu9wH91VcsEZ9WMHF6zAZBh2E3ef2gVAPsOyzWVVnsHBjshLhPcGp9UFoPHekqV8sn
 +is=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Feb 2021 04:30:24 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v18 04/16] dt-bindings: update sifive plic compatible string
Date: Tue,  9 Feb 2021 21:30:02 +0900
Message-Id: <20210209123014.165928-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210209123014.165928-1-damien.lemoal@wdc.com>
References: <20210209123014.165928-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_073026_625766_DA9039E5 
X-CRM114-Status: GOOD (  12.11  )
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

Add the compatible string "canaan,k210-plic" to the Sifive plic bindings
to indicate the use of the "sifive,plic-1.0.0" IP block in the Canaan
Kendryte K210 SoC. The description is also updated to reflect this
change, that is, that SoCs from other vendors may also use this plic
implementation.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../interrupt-controller/sifive,plic-1.0.0.yaml     | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index b9a61c9f7530..08d5a57ce00f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -8,10 +8,11 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: SiFive Platform-Level Interrupt Controller (PLIC)
 
 description:
-  SiFive SOCs include an implementation of the Platform-Level Interrupt Controller
-  (PLIC) high-level specification in the RISC-V Privileged Architecture
-  specification. The PLIC connects all external interrupts in the system to all
-  hart contexts in the system, via the external interrupt source in each hart.
+  SiFive SoCs and other RISC-V SoCs include an implementation of the
+  Platform-Level Interrupt Controller (PLIC) high-level specification in
+  the RISC-V Privileged Architecture specification. The PLIC connects all
+  external interrupts in the system to all hart contexts in the system, via
+  the external interrupt source in each hart.
 
   A hart context is a privilege mode in a hardware execution thread. For example,
   in an 4 core system with 2-way SMT, you have 8 harts and probably at least two
@@ -42,7 +43,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-plic
+      - enum:
+          - sifive,fu540-c000-plic
+          - canaan,k210-plic
       - const: sifive,plic-1.0.0
 
   reg:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
