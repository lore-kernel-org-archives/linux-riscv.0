Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3D4C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:05:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 065AB2389B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 065AB2389B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J53FULrU3J7sXFfKCPL3sTr0LCdrTJz2F5ww6ROOsbc=; b=SmmtBgkQEQ6ejzYFsu8a8I0Lr
	knjpHq0KwXFH6TcBZONYbAGcOBJHXPCIMRTmgoAU7jhpwWuVW4Cc56UqO8UgWLETdKEYLXkeNVmVN
	97a4PxNEmU5sGnMNO1qWAqTB8HAWp5dRBuQM2qeBEM5yIhBwL7gnwtLC7KzSpjYo7BPNQoBLR+fsn
	pkmq/uh3DtBPUNv+1QkulY0aljvXmW4GrYRwoMjAcZ23AJx45aR9L6rnp8HGL/f/LL0R13GOaLNnn
	Ajzd5izXeSSNOF8spsrgwnUVXKtDbvqY3bydbr2xliLIP74vZPjCOyTTvB0GwQwu32aKUyQHHs1nu
	pEf1dKJoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Pim-0002ym-Pm; Fri, 15 Jan 2021 14:05:00 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0PiY-0002qA-WC
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 14:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610719486; x=1642255486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0gydr514UdHfaLZyMWZlPzEDnEe7NJxvNWRTRtcTWlQ=;
 b=jQVAV/nCmqSUtB8PMbISFD2pbhmculJYkpS25SuZnaX1tvJm4yBkYwdu
 adWoS7RXtohoVjLPN/OoUKYavEKjw6u92fmgZ6RhiraYsbuk6vrkBVDVa
 iRB7BrCy8iC8yUIm1JTJe8QpMEjMyUlpMU0Va3aHUWvhNuAORWBQJIHCb
 o4+FCfsVaJzV0Rl/y75ug7Tm+PDoDbD+kQORbcjgsAsR8ajIbyTSrn2KL
 Fad4MtCQ6Rr/lapNx6+ouN+EUTR5vyzkQE/Zlqr5o914u71SLWdRGLqK9
 7Q52CtWV+jyRT1xHHm3pKYMSzipPX91Y39NCB7FKSpcKh5j4hkKt+0IIt A==;
IronPort-SDR: 47BjretQFaP3quQNh73pMyejxUat2j9ngTfEUMFEhK7M7qOqit6Mm3cXA8hBOoLQg4bQNnyC+G
 2MYLXeFf1pva+0qZ+7aohdaQ4Q/Ig8hqLQjnXARRBLBl4QL2RhMEgTb3pxXeA7eaBjdiwF2cJg
 Jy9N/RFGGADqG/659dJqZa6KaVNuKVqIVzkYsbfrpaYDf6bW2f7KeIkJ2R+SZSH+Axul9PfNS2
 itMZa8RoFy8JWxXNjxr/tRAG6EdSOFBkQp6YxXZJBr2o4nqKdUu8e4OAQJmkydjQschm337i20
 6sQ=
X-IronPort-AV: E=Sophos;i="5.79,349,1602518400"; d="scan'208";a="161955764"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2021 22:04:46 +0800
IronPort-SDR: EqebLEBZLW2Gtytpln0jGSruwc3r6yG8rlaS4JBq6IjYBHgPZf8qmGkZ2i1m0R1U73dlM1tkKo
 7KqXQnkaKXo9WzqFH1LhZYavRL0KWSKXeGo98OPsFHZB7jzDUpcsdTj18RY/j4DQB7MhDS+N+V
 N7WVv7NA7pGaR9X1KTFQliXU6TMmdCodZA57sN3vBMqtUu5C6LPsIqQzEM9MSMiCYUcBDgjZ1a
 LcqN7s0DDYZG4o/tFYajZhoThXNsgohgGW0Wu5F9HmEEs17XUx38tKW64Uf704PVFfPwbWUBPe
 Y16EkZu1JTBxlF3m7cXVjGgt
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 05:49:28 -0800
IronPort-SDR: sfbO9Hl3NbtP06FM9vFhxxWYbPbnhsLD6vbTWtQYPKLZp/V3Eg+5Ck5uQjf3w7e1MwD91XpEy2
 m6s8/sYAhKD1j74L94lYXg7z4ljN+zvNsZc3I9BSv+4V4KYFfMMgXoFkfXg7CSfZQFoqxiSQ6F
 tpIM8S5qeVrMkm/+V0PbJjyBraILXmaexm9e/XKQiuFHVQsA3WpkT0VmXFYlx1EaUAZ10bhWjx
 LDU5o7Mi/UjyOkk68tFhMf6jDS2Y7E+TxnFOfsX2ef3/HvFTyepd0z6bL4tw3rzvNfC7wivLrl
 jeY=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.177])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jan 2021 06:04:46 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v12 07/17] dt-bindings: update risc-v cpu properties
Date: Fri, 15 Jan 2021 23:03:42 +0900
Message-Id: <20210115140352.146941-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115140352.146941-1-damien.lemoal@wdc.com>
References: <20210115140352.146941-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_090447_286580_A682D031 
X-CRM114-Status: GOOD (  12.17  )
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
 Paul Walmsley <paul.walmsley@sifive.com>, Sean Anderson <seanga2@gmail.com>
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
