Return-Path: <SRS0=bbt8=HM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836FBC433E9
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:02:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4905C64E57
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4905C64E57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ndn6te/sz3mdePW5tHgwvH+Ot6tYmmRpXbfK4S9IcOQ=; b=de+rnBRfbrMbu8NpFLiHC5Oqx
	eMI+qcycQbDAerIbxbbvH9EmtYzkxwGTTO+2CeyxlS8d5y68jxFM0mA5epQbmUzLYNhKdVYYJbOb4
	2kFAR7MVlsEgNWCmY4circntrfuo+lnHxFRc4vOcaXebrMagDDvZAkeajx44vSqRfOOqd0fEbC+Y/
	ip3Ius5ejxebjq5UhUfO6aSVYW3lUlhKF4rCQk7UZiEC/0wpo+cfFso/EkFiMX0iiunJMuLR1UO4Z
	UTO7EK9xctYMR4mC3Ia1TxRB/DME911Mgw2Qv3D7LDlpg5Sk2A0W/PBV2iYbAoaqC/xSLfwSM44gK
	4Fld5KBKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9heK-0003Ip-3z; Wed, 10 Feb 2021 05:02:48 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9heH-0003GM-7L
 for linux-riscv@lists.infradead.org; Wed, 10 Feb 2021 05:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612933365; x=1644469365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6K57gJ4d4JJEae1PJW0yBIWM0fdObKVyG7NMETneATc=;
 b=pqds6du+zA1Bs1xRIh1yMdBVel1K+PMYbgkyXgUumxz+QLW+Mdm7BtmZ
 AZqYgjAXBSNBypqpx3IrCe/Bx+ATFvfsN7eeKMBdqpWYagbe0JGXGBL0x
 z/PP5+2O5LBT2QPt+k2flNW0gCsKG518CYbysbs6AhEHdLu6U4yuusOE8
 cA793DKwWnZVkoIj5JjwW1QSFmQCsi03/xul2huB43jSLMp/qNEM2tL3L
 3VnkEfwluSvT3zXITb47ubIJfNlL5IFx8OpugT6m0fdJw4IkwoOpTENrS
 TirloYGipc4+bIMZGts5xkfdX2E0tTc+ljlQMMA81S5cb7P2txAOyDpp2 Q==;
IronPort-SDR: 0gnroE6giY1nnQXsPlTKz7N9Nap+wjDJemaOS6EDidEKg1N1meu5pHugMPBV/TsdUkA6RRJNPM
 gE0OjrFSqDBbqcBiTULRgmNOPPH20AmZU81qyvK0XzUIddaf8B/CkmDqSPgoqbnxxbtvTJtem6
 Fnk5T4HPWXeSqYa/SrQ5WXiI74/R/zK78Xt4zV1HWIi4J7YMES8Y+O43+QJB+6m8tZyTLjSHlV
 iLyjSG3JfypvgsIsF3xv3pVJUXaQ6VmotaNmWO2utPt/miK2NvSWy14JG91qcdNkeA1371+c1n
 F1c=
X-IronPort-AV: E=Sophos;i="5.81,167,1610380800"; d="scan'208";a="159592670"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2021 13:02:44 +0800
IronPort-SDR: 22prCbYgBRUUyFVbBfJqUpe0b1SzWhqnE9c2tRapes7SXKeQmm9NHU407R+G+OMA0pydyy1qmY
 o4I3tyuZVG0YphdCNAPcrhiWRFi2McIia2vdLsmF3XD8pLN5AcDDlY6w/+ePUs1fz4V/Up8Ilr
 9MWFUmdgbKMyjkHdwaAXJdvJRuX6MjH+cqF+EIMKDcWx6O9oTrm1C9fVE9rBHWVgfxWvvSmHc3
 oejmBWhmUcJ58zSQVXiAHKT/yfwUeyh7gaXmJNsAp6RJ51Pbh13/+aCoUXhrBvBPljNfNFTJfT
 NNTwacmoCSbO7ewfmdj+LtEh
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 20:46:28 -0800
IronPort-SDR: TITWKvSN19c3WNW5f5rorrmo5m5zbFm2KO5kAgK0rfPO8BtfjNhipHZAazDySqj8mR78HptrFK
 MNzogvfUqAnhOkyMoPEXgG2WzWU6Ul0fjbU5H+3pUJWp6iZjYtEgRD5y480M5KupPAXEnnbegF
 mgCxsBRr/ufGnQcF56gZFCHxDh1VvmpFypo6eA4SO+qJgJ6vu9rn1icv3NwdaoDY8hbsudRu1J
 jXClDkxCL7fKFIS8FaMJelcm/qUEkf9hIIo1VTxqquUfOsjBhIeKKSLUvUWwCAZ99v4P7ByXuK
 ETU=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.72])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Feb 2021 21:02:44 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v19 04/17] dt-bindings: update risc-v cpu properties
Date: Wed, 10 Feb 2021 14:02:17 +0900
Message-Id: <20210210050230.131281-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210050230.131281-1-damien.lemoal@wdc.com>
References: <20210210050230.131281-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_000245_415906_2F274F7D 
X-CRM114-Status: GOOD (  12.22  )
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
Reviewed-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Rob Herring <robh@kernel.org>
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
