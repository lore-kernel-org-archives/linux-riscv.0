Return-Path: <SRS0=YX5X=SH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BE5C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2019 05:49:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 603FF21738
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2019 05:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aE85XRI5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="DrGrv+/r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="NSbL/Idj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 603FF21738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rwaN3oURknjsRmDSPUpe1yw+gAKyu3hwzDOCQP5nP+0=; b=aE85XRI5Kn1jkt
	7HX9afrM7LsBAoU33AEkPRivdFhjHaNTWjshaaATR1f+7vJqasstOlKfPJ2kuuEwFWnVGd7kXf7Gi
	DXtpjYCovGXTauf8ByWYOURUzai2i+l7YrDECyXcAHEbeWaxd9GVJGhwpzWazpKsy+ozxwhRd/U2B
	dSC9v+z+KHWH58v8wBaMaB7Z1sIF+MQcrl2O0+j1sA/2hhtAvqsP+flGVNMn3SqIcioTzUX9Px4Eg
	amOPSGWwO+Rg1c0kvZ7aQUm7qzyxggg3qD1NQiSOngXIWqysZoEIBgZMDJFcl0BaigE5pnVShrYBV
	DLxG4J1vvixFHZZBU+bQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCHjV-0008SU-8n; Fri, 05 Apr 2019 05:49:45 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCHjR-0008Ra-G6
 for linux-riscv@lists.infradead.org; Fri, 05 Apr 2019 05:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554443381; x=1585979381;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=jaFL673RBcYD0MxzbcKzRSHkARG80AZ4VElLTB5Jv00=;
 b=DrGrv+/rVDgKfmuRL63d5JHH3dukJTTPHt+tq6wSdKEuQm4NByAM2sUQ
 olDzIjXTRx0Y9CQt+FUKw+QKgzEuryqYWSqLmJxKxpQIBiXPCdEyI+pHH
 WvatsDFDZ9J8joPM60feIIafGAUqP4+Px8AgV0tJsEivQbhjUdSjgRP2R
 fTxkR02eR3KcgjzmNQdi+TVIEYWhIHy7ziZ9RFpSZyfuMStQ0xH3UyP0j
 EI16llqI+xdNUupYDRLJ6N2eEoA+cW4mv8d74nb6r1e05tc/1+kWzHut/
 FzU6igECgWKMyj44K7swl7nsyPtMte2h9sNQG+ifbmLyl3oUOaV4BWCVe Q==;
X-IronPort-AV: E=Sophos;i="5.60,310,1549900800"; d="scan'208";a="106421600"
Received: from mail-sn1nam01lp2058.outbound.protection.outlook.com (HELO
 NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.58])
 by ob1.hgst.iphmx.com with ESMTP; 05 Apr 2019 13:49:37 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jaFL673RBcYD0MxzbcKzRSHkARG80AZ4VElLTB5Jv00=;
 b=NSbL/Idj8eDk7SXYR6YrWrfQRAviEir3Tn6Y1ZUek8oZ3Ikl/wiImn8A3Vq9Lf+SroFTf7BQzaK28IjPbb17dJsCGYH5g7CcAYngQEUBsQf5zdS7QAl511l5fEXZvgIhH8LvxMW7o1G/NL2eJtsaRP52MAJAgr72ThF89vWcLnc=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB6064.namprd04.prod.outlook.com (20.178.246.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Fri, 5 Apr 2019 05:49:35 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1771.016; Fri, 5 Apr 2019
 05:49:35 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3] RISC-V: Fix Maximum Physical Memory 2GiB option for 64bit
 systems
Thread-Topic: [PATCH v3] RISC-V: Fix Maximum Physical Memory 2GiB option for
 64bit systems
Thread-Index: AQHU63NZIDKXRCAY5Uanum6fHV6nQA==
Date: Fri, 5 Apr 2019 05:49:34 +0000
Message-ID: <20190405054909.3238-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0090.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::30)
 To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae31c6b4-9078-4426-f505-08d6b98a7b4b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR04MB6064; 
x-ms-traffictypediagnostic: MN2PR04MB6064:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB6064F5BF3F480E260613F0118D510@MN2PR04MB6064.namprd04.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(346002)(136003)(376002)(366004)(199004)(189003)(14454004)(386003)(52116002)(305945005)(7736002)(256004)(6512007)(6506007)(186003)(25786009)(26005)(102836004)(36756003)(99286004)(53936002)(54906003)(110136005)(2171002)(4326008)(316002)(97736004)(1076003)(486006)(68736007)(86362001)(2616005)(106356001)(6116002)(3846002)(6436002)(2906002)(105586002)(476003)(66066001)(6486002)(5660300002)(8936002)(50226002)(71190400001)(81166006)(8676002)(81156014)(72206003)(478600001)(44832011)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6064;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gZ3E4Pc/WMeOtugxBDdIFYM0h3jcVYlQvtLPBshiKqrzJLn+Vtnsc/14hC59HqU9VJgzOMCxBFTs5E4fT/deM1vUIh2IW3O5KCBk2fAC7Rqlho6XX7J47aob/nzUSSqJyq1h7YY/cOCERttMpjnPuEnYFH24r2Lgz9EypaAFW5VbdLnxVpEjla4ccJ2aoOvO/ALMCbgOo+yO43QYhsBRkkxdMqrJ7YuaRVg+I01VKf6q4u/KClEApSYqaRb7H2Atznwu8gd07msM7lkYdGKOV72P3YrzxN2SVypdYk1JnzDL6IJiXzwVe3EcuqzC3OG82/qDOtcpCD6+jdn6xaZmDT8AW9EUHw6hsaCcLnne4gYvTOLyeYEvH/+xL0cVST6ikeCAFEfLdtBwfNmq5v55aWyzoRjOB92QFlTd9NciV54=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae31c6b4-9078-4426-f505-08d6b98a7b4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 05:49:35.0248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_224941_692469_87E22807 
X-CRM114-Status: GOOD (  14.58  )
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
Cc: Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The Maximum Physical Memory 2GiB option for 64bit systems is currently
broken because kernel hangs at boot-time when this option is enabled
and the underlying system has more than 2GiB memory.

This issue can be easily reproduced on SiFive Unleashed board where
we have 8GiB of memory.

This patch fixes above issue by removing unusable memory region in
setup_bootmem().

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
Changes since v2:
- Drop brackets in if() condition added by this patch
Changes since v1:
- Use memblock_remove() instead of memblock_reserve()
---
 arch/riscv/mm/init.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5fd8c922e1c2..bc7b77e34d09 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -121,6 +121,14 @@ void __init setup_bootmem(void)
 			 */
 			memblock_reserve(reg->base, vmlinux_end - reg->base);
 			mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
+
+			/*
+			 * Remove memblock from the end of usable area to the
+			 * end of region
+			 */
+			if (reg->base + mem_size < end)
+				memblock_remove(reg->base + mem_size,
+						end - reg->base - mem_size);
 		}
 	}
 	BUG_ON(mem_size == 0);
--
2.17.1
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
