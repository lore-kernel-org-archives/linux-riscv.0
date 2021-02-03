Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FB2C433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 12:59:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D661764E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 12:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D661764E55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fmeWfU4Yd/bLYT/opYgz7wdgSDMqhsmYtQxGxit6THA=; b=apFTPe9O2UCyyn5as9PWJe4jT
	BxY4jRnGn+IxBW/ci4e3oboh9cAANFrqxpZG0yiZFxH9EqGaKOqOGU3HMRqs7n3aMuNsuqel1nHs1
	zS7TMR4XsSFqhxwdDS8mf3CdtZHsaGCOvTA6Dq4u4lxqOI99ES6c9YOHquUJpEoMOicbt0qeI5dYM
	CY34hpwCZTT2CD3J+6Ott2xDzaurUyTE0e4b5QFbD2XBAI0AM2aZ4/sCBhqWJw3dCOTitFxAbGzhf
	KXVQMQduRJAHr+pYJf7zn+TBl13Dy+NIqEz/x7vuxiyulbFXf1jNvW1d9yLe/XgejnAznwpxCVC4S
	K+ugxwSmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Hl6-0005os-12; Wed, 03 Feb 2021 12:59:48 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Hl3-0005nX-Bu
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 12:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612357186; x=1643893186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jwniwUcZLE8n7k+ni5KlYqSimijQG7AIhlKC+pOoIxU=;
 b=ru72QrrBa5ohaVw/8p7RboUjZdCPsKOEFl2fEJwPSqGYzegZTZ3ddjQA
 uBAMSHHhIh3L4Lnkvv3BBT0kOS9cZ1VFkNsnNM8WlYT6Q9GSO/iFnAyLz
 aONWFvmqoUro5QmY4CjNdN4moooL8ROQPyzcuhbB4UoZvVaGyuz7fjp9w
 6ScQyIBk7Tpj8Q5NCEKY2fkDSf1d/t2aNMk5cz/0bWKI6gMbJIeBxgbsr
 RMWAE24/X/OTID4+R8RT0fQXngkvKJ/7xZV7gj4uRVHgWZK9Flhvvu1uC
 tsYNF0fPP50c4/vbFJ3Xl/UhbWGfl0xmLT1WzyBZDUpqDXKqBIguGQF7R g==;
IronPort-SDR: BsnPpJfq7K/3aFefgqlzIpy30tDSccy+R6LADEVnBSTYx/dKPMzhf0g2QwezzoO9FiwlXlqcli
 H/y9VmXHHhuu4KnpSMvrIlpEtGgMNH+oMJX+/Lu5QaXClC8tAno6yWj2kZ/7Zlk1P0TAUgijoZ
 kG6QGkeHQcnOrGypxfPU9A/JIVEKUZaWZXAHUC3DpXRB8vadrCsTCU9RyNf3vkiIq6h5BC0pIo
 gozl+RXxu5hgwQVm3483Zd/YJiAcBsb3qJTKBF/H14DUXWWke3nZkyzxpinTS6TR55X0G2263C
 bd0=
X-IronPort-AV: E=Sophos;i="5.79,398,1602518400"; d="scan'208";a="160202872"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Feb 2021 20:59:45 +0800
IronPort-SDR: P4mqowMPIEDfpeqBME9mlRNl5P8DzNAvmdBSO4Ui32NfJdImouxtzSTrIzpr610xQG4OUa0Wxj
 H55JPguW8NFnld9b9tFOGoL5nfg6ascQ5MDnwH+F2BblDy5z/aO59MYICaAB/zW1upKa77OHkP
 cBCDZ6WzJ8iA9PMMcPwoKyJwoHNIMP3VzcUDeU7mZUtXKv1lBVeSzGWS/EYaY3i6d33yUHCbiY
 5EzSZj5kPtpNr6kDrUjP+5d7ClfeflH+AlD8E2C8nOLlO7o+v9GIQYlout4etRBgZtQHk/DIcX
 mausLLkcgOVtTBaO1Gz3AQMu
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 04:43:45 -0800
IronPort-SDR: cVKvZiiYGu6DrrDlbkhYYpuoAzeqlUBJov9yz2p+7GMmDQCgGAfn8xDRfsTNWd0U1EL6IN0YcR
 /j1ssGHoE8O1A3pJglGnhBccX32N23cyFMzS4Asn/Zr2v9Vi1o9bkLZjFWiXj9vi278NqK7cjP
 fSiXjE+yuUH+Zki3QLukcLUE//FaBPr88wJcShxJomyNa1hkfkfY/yLdfonHP5w+dpAcBNdEHT
 lubfhrOTJTAgDraQWxkmKzAXoxbu0/8h9bXxsKowoD7GY8BUEKvpcp9KcqIaBZGRC7/yxoI/Q/
 D/k=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Feb 2021 04:59:43 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v15 03/16] dt-bindings: update risc-v cpu properties
Date: Wed,  3 Feb 2021 21:59:00 +0900
Message-Id: <20210203125913.390949-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203125913.390949-1-damien.lemoal@wdc.com>
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_075945_666181_4683C4D6 
X-CRM114-Status: GOOD (  13.52  )
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
