Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21496C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:36:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC22B64EBF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC22B64EBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9cXAFhuKOoo11ADvsC9d9nwIgl4UaX7UcOF3CQfnGmg=; b=FBTxQKwoG10zjzthAooSfq3RC
	YXqK8TcHBp7XuKiFpqGmngfL3nY7PzaxySTAZJOQ1MJISuifzk8UgAKAq+wHHNZ4vhU9+SOAqI1dD
	iNh48UHBN0l6jjqi3w90vVJNQoK6oecEm2nyry8wOYWRvmBJcmA7JfeUkYbwSyWooiWhU3zhVwCxh
	GvnVsHb8lVhIlZ/qpSAsOdn5+r4vYNk9Kju/fnOT0VwfUOuYhWrd+oOrBxKi39F9stSeQd9qBS1N8
	kM9ZCQCMBl1R4QmOTU6O7ToHX1UnXiHztjd6h2GCzPASMP4U2mPrmQIIpy9nb1DZIXlqe+lRgcrij
	ROpMSDMHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6t38-00089i-TK; Tue, 02 Feb 2021 10:36:46 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6t36-00086e-Dx
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 10:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612262204; x=1643798204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NrWUahIqENHSFdK2RKLLrmHQ2RErkyo5KHGTMfijdUo=;
 b=r3MZ2nZPTZjWXZBpVk29cvk0vIGWglVL7h+mmTFIUL6cKmx10yFq9wEP
 hFzCh/GVSHCBjYWUj5NfCvr5tAxotiOuKksgLlGW6wNtHX8AqgvPK0vnt
 YrK40HPWZC3EOSGcUl5o0s1ihWsKwnI4Lrq97pPwrH9P8GKzWpWrAcf2y
 KbBUeGSJgEf/WqOlWK+0oMIK75hv1fxTA5ull8Ra5NF0GkOkK9kMMlE2z
 vF0KPM8pKUROMdsReEKTl2br2ut1WgRD6X6kWC8+R56k1QxiIqlDkEPpI
 FIbywy1MOAyMxME6+l8oOA2VZQEPEwDfXKYuipoQKHgOSNH/T0ItdF9Nz Q==;
IronPort-SDR: 1mSphMudRLc4Si8GepY9O+aPYgBQ+H3DooTBN0UhyzL+pvp2rZu7BgeAB3yImfXNEwDO5eqXRS
 ZD+UY57e16zctsphZjh1Ebjp7RUOZqnm7kBZThjyHbDtFCzS1AClPd5FvK6wq9JsNw5oHTcA8/
 8n/sGbHcZ4i9JfO01d2pzVDtMEaJw/BaTZxs6LybDnnjmCvkxG0c2wScV04+Ax4oqILSCDS5Ss
 IVnCrh4cjmPMM4okkynmGWWitY2xL2ydBr4mLTbQ543c3czNRD61hfibTvhy/XOtYRc8Zt2+p6
 cAg=
X-IronPort-AV: E=Sophos;i="5.79,394,1602518400"; d="scan'208";a="163357059"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Feb 2021 18:36:43 +0800
IronPort-SDR: KQxxw8/Il1R6I47uNhSO2l+OAzXcljcc76uo6fV5SVBXkFWvudiKVeial+UDgPxFY74NOGr/Y7
 atjMvma1rCKl7RDyydAMSctA2+jDd3GUVUm0tPowCbrVLtlHP2xv6iFteSnxEr1aUnXeofwtr2
 hzLr262V866leARW9HKc4EaTkod0lhIXBhVgZ7pP/e28QvEr+24e3FN+OxFCD++r8FOJUF2Xin
 yU8i3FOIgT3UsFL0KTIO4LKj1P1rbIS3dpLeBgs2k3MFqDGmSNXRtwYNJv6jRqhmvLOM1PQq9E
 4zTSAzL99/o7ECZxZcDa8EkX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 02:20:52 -0800
IronPort-SDR: QfTgXTqTQ/iPcqf5lpORgWKzfaszxtYdHAcCr7OhKg6idQheXpwGheOpPZV2oN1umalBTF+sRU
 5uMS8f6zi6Taf3ZAwwBVlEyOoj287wEWHTeI/OjWtPHcDJgpnUBmLvHs9a8hr6l+VfOBdAoVvZ
 h5ZUlU07zGJckfTSIg+IEoAMQpGUZA74cviKobxbz6aa/A5Bi4btPljQO0fS3CU427xpo7YYJm
 wEsynyoTDH/17+Z3x6rPMnGkj2lJFer7U1QQH7BXbJSEQqjKUgpfi3TpVga3ddNnTdO/ncLLRr
 XSs=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Feb 2021 02:36:43 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v14 04/16] dt-bindings: update sifive plic compatible string
Date: Tue,  2 Feb 2021 19:36:11 +0900
Message-Id: <20210202103623.200809-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202103623.200809-1-damien.lemoal@wdc.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_053644_666912_DE746777 
X-CRM114-Status: GOOD (  10.35  )
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
---
 .../sifive,plic-1.0.0.yaml                    | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index b9a61c9f7530..3db86d329e1e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -8,10 +8,11 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: SiFive Platform-Level Interrupt Controller (PLIC)
 
 description:
-  SiFive SOCs include an implementation of the Platform-Level Interrupt Controller
-  (PLIC) high-level specification in the RISC-V Privileged Architecture
-  specification. The PLIC connects all external interrupts in the system to all
-  hart contexts in the system, via the external interrupt source in each hart.
+  SiFive other RISC-V and other SoCs include an implementation of the
+  Platform-Level Interrupt Controller (PLIC) high-level specification in
+  the RISC-V Privileged Architecture specification. The PLIC connects all
+  external interrupts in the system to all hart contexts in the system, via
+  the external interrupt source in each hart.
 
   A hart context is a privilege mode in a hardware execution thread. For example,
   in an 4 core system with 2-way SMT, you have 8 harts and probably at least two
@@ -41,9 +42,14 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - const: sifive,fu540-c000-plic
-      - const: sifive,plic-1.0.0
+    oneOf:
+      - items:
+          - const: sifive,fu540-c000-plic
+          - const: sifive,plic-1.0.0
+
+      - items:
+          - const: canaan,k210-plic
+          - const: sifive,plic-1.0.0
 
   reg:
     maxItems: 1
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
