Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7775C282E1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:15:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87FC9217FA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:15:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DQXgZqwQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="akA9BmiT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="F2vsYy7D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87FC9217FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nuu8tYN9E5FFT9lor3aRhBCoYPVIPAmyztkiL+E1mzI=; b=DQXgZqwQ+l5Wlr
	2jtFauYoqzfXsODIbyIvjsyYvW39raVJDZwLy+NKs94jAZD/l92b6Adc7IOwORCmRkGEU2ovnNLlN
	896y43Psdt6vPBDhQeQbt63YB+UTzRjna3eegtakPNgLTB7eSOTqHCl3YeC2fXHYg2nLYTQYlUUdM
	qhq/PxC03owVwZUV7Fi3zGGKXaRa2swnFHOMqxW2MnIHjt2coScSzUm9SFuZKwicHJonSZmRZmpT0
	bMWCkPc2M02tz1skP4BJKGprJ+tGG/x1YhcKkt4TFzIIgyjrt9FdHPbcN7rQbfhbFRIcQOlw4ARBI
	wpP7QM7k4IKztyS7dq+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJZXP-0007Wo-8B; Thu, 25 Apr 2019 08:15:23 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJZXM-0007UV-Hs
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 08:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556180121; x=1587716121;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qWrl5iluoHriyffRoGf9OGiYcTMqaJKbW95CDI7FhBc=;
 b=akA9BmiT56GeT6a1VobigTYNOwuObmoMw7YqKau9i1+h3qMlVneVE8hI
 zJ0dApxcOhHbPxo0IUVcgk6Lq/Jef8ZVpuM7w6ZU0yJP5XPf6iO8rb9Ab
 /egSE27gsVTLNVQ+ykjP9WaLZglykYhqCE8oJqDY9tH2iTvA+PzVR5S4n
 +r9BvkIi+w/kJ7fG9cwhCwJlGuT2Jlaif6HCx2Aew6TNJRK4sAIyufJNx
 mCOw4Omgw58b432mAcxpjBuc0DsA/FUF8C2qisd5R4Ob47Ca3Yp35Paor
 Gz+tNIcnjs8oc0VLfMsqaBGEsY2GJuhmiYQ/ol7AZjigNEGBTtfTgbTGt Q==;
X-IronPort-AV: E=Sophos;i="5.60,393,1549900800"; d="scan'208";a="106779064"
Received: from mail-bl2nam02lp2052.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.52])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2019 16:15:18 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWrl5iluoHriyffRoGf9OGiYcTMqaJKbW95CDI7FhBc=;
 b=F2vsYy7DQ7Jz6BO/RpYzBXdFjuWIgTss0kPwJN1I5NEfT095xA+018uOvMiRaNfjdpA6OfgDJVn0dGGQFMXC6/2HBFdSop8wa6D9MGACAIn2TE5DnlHnw+cVVMCn688weyqVvyDozyXwtan+oEMITV1BBq8Qf81ALH/XIkYI3gc=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB6095.namprd04.prod.outlook.com (20.178.245.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Thu, 25 Apr 2019 08:15:16 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1813.017; Thu, 25 Apr 2019
 08:15:16 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v5 1/3] RISC-V: Use tabs to align macro values in asm/csr.h
Thread-Topic: [PATCH v5 1/3] RISC-V: Use tabs to align macro values in
 asm/csr.h
Thread-Index: AQHU+z8D2/7WVz74r0KPtl1y5u9b5w==
Date: Thu, 25 Apr 2019 08:15:15 +0000
Message-ID: <20190425081445.929-2-anup.patel@wdc.com>
References: <20190425081445.929-1-anup.patel@wdc.com>
In-Reply-To: <20190425081445.929-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::33) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a17bb31-aa93-49c4-a877-08d6c956255f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB6095; 
x-ms-traffictypediagnostic: MN2PR04MB6095:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB6095134C03E4E488D4DC81C08D3D0@MN2PR04MB6095.namprd04.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(366004)(39860400002)(376002)(136003)(199004)(189003)(26005)(81156014)(54906003)(386003)(14444005)(7736002)(97736004)(2616005)(76176011)(6506007)(256004)(110136005)(478600001)(68736007)(6436002)(6486002)(446003)(316002)(71200400001)(71190400001)(14454004)(11346002)(25786009)(2171002)(476003)(102836004)(72206003)(8676002)(4326008)(486006)(81166006)(2906002)(50226002)(44832011)(36756003)(99286004)(186003)(3846002)(52116002)(73956011)(64756008)(1076003)(66556008)(66446008)(5660300002)(8936002)(66476007)(66946007)(6512007)(6116002)(86362001)(66066001)(53936002)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6095;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sPNbZ5t2nUjaiZxMLlN/7XS1AiNe7XoH56AjR+C6yMqck/2MENfwsVl2MdfY4A37tSHohAI7fMn9g/Iq/UoHea10KEvCRMABweArfObeClT5yuEsB+c03hw+NQspNxR1T0BD2nBPu34oEAGBwodzWTuurDQjKqvlzK9hfTh6119JtKkyw9qddxZ9tGCRDMfYwXqc1IuSji8JTbjeAULiAWWLpVbfZR6fyqTckyaEaAxXXKpPHFJ7cq3WVgdrew590zCFt5nDBt4Pa5eZ9O3THuaB+ac2U/0nYOvLwSY7XfVTphXVBIoq/qWsknEpktq1l/7HQHvessOte9kAx3gJK98RwX8L49qlHz1+2PDxa8ocotUgXMYx7eV6Ic7VdC7FlhaBw3szwDz4EQGB9NSi3k4xqUVgmKipXpSlCZ9gto8=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a17bb31-aa93-49c4-a877-08d6c956255f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 08:15:15.9396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_011520_647894_079DBF41 
X-CRM114-Status: GOOD (  13.96  )
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
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The spacing between macro name and value is not consistent in
asm/csr.h. This patch beautifies asm/csr.h by using tabs to align
macro values instead of spaces.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/csr.h | 76 ++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 28a0d1cb374c..2ae54a7386f1 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -17,54 +17,54 @@
 #include <linux/const.h>
 
 /* Status register flags */
-#define SR_SIE	_AC(0x00000002, UL) /* Supervisor Interrupt Enable */
-#define SR_SPIE	_AC(0x00000020, UL) /* Previous Supervisor IE */
-#define SR_SPP	_AC(0x00000100, UL) /* Previously Supervisor */
-#define SR_SUM	_AC(0x00040000, UL) /* Supervisor may access User Memory */
-
-#define SR_FS           _AC(0x00006000, UL) /* Floating-point Status */
-#define SR_FS_OFF       _AC(0x00000000, UL)
-#define SR_FS_INITIAL   _AC(0x00002000, UL)
-#define SR_FS_CLEAN     _AC(0x00004000, UL)
-#define SR_FS_DIRTY     _AC(0x00006000, UL)
-
-#define SR_XS           _AC(0x00018000, UL) /* Extension Status */
-#define SR_XS_OFF       _AC(0x00000000, UL)
-#define SR_XS_INITIAL   _AC(0x00008000, UL)
-#define SR_XS_CLEAN     _AC(0x00010000, UL)
-#define SR_XS_DIRTY     _AC(0x00018000, UL)
+#define SR_SIE		_AC(0x00000002, UL) /* Supervisor Interrupt Enable */
+#define SR_SPIE		_AC(0x00000020, UL) /* Previous Supervisor IE */
+#define SR_SPP		_AC(0x00000100, UL) /* Previously Supervisor */
+#define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
+
+#define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
+#define SR_FS_OFF	_AC(0x00000000, UL)
+#define SR_FS_INITIAL	_AC(0x00002000, UL)
+#define SR_FS_CLEAN	_AC(0x00004000, UL)
+#define SR_FS_DIRTY	_AC(0x00006000, UL)
+
+#define SR_XS		_AC(0x00018000, UL) /* Extension Status */
+#define SR_XS_OFF	_AC(0x00000000, UL)
+#define SR_XS_INITIAL	_AC(0x00008000, UL)
+#define SR_XS_CLEAN	_AC(0x00010000, UL)
+#define SR_XS_DIRTY	_AC(0x00018000, UL)
 
 #ifndef CONFIG_64BIT
-#define SR_SD   _AC(0x80000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x80000000, UL) /* FS/XS dirty */
 #else
-#define SR_SD   _AC(0x8000000000000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
 #endif
 
 /* SATP flags */
-#if __riscv_xlen == 32
-#define SATP_PPN     _AC(0x003FFFFF, UL)
-#define SATP_MODE_32 _AC(0x80000000, UL)
-#define SATP_MODE    SATP_MODE_32
+#ifndef CONFIG_64BIT
+#define SATP_PPN	_AC(0x003FFFFF, UL)
+#define SATP_MODE_32	_AC(0x80000000, UL)
+#define SATP_MODE	SATP_MODE_32
 #else
-#define SATP_PPN     _AC(0x00000FFFFFFFFFFF, UL)
-#define SATP_MODE_39 _AC(0x8000000000000000, UL)
-#define SATP_MODE    SATP_MODE_39
+#define SATP_PPN	_AC(0x00000FFFFFFFFFFF, UL)
+#define SATP_MODE_39	_AC(0x8000000000000000, UL)
+#define SATP_MODE	SATP_MODE_39
 #endif
 
 /* Interrupt Enable and Interrupt Pending flags */
-#define SIE_SSIE _AC(0x00000002, UL) /* Software Interrupt Enable */
-#define SIE_STIE _AC(0x00000020, UL) /* Timer Interrupt Enable */
-#define SIE_SEIE _AC(0x00000200, UL) /* External Interrupt Enable */
-
-#define EXC_INST_MISALIGNED     0
-#define EXC_INST_ACCESS         1
-#define EXC_BREAKPOINT          3
-#define EXC_LOAD_ACCESS         5
-#define EXC_STORE_ACCESS        7
-#define EXC_SYSCALL             8
-#define EXC_INST_PAGE_FAULT     12
-#define EXC_LOAD_PAGE_FAULT     13
-#define EXC_STORE_PAGE_FAULT    15
+#define SIE_SSIE	_AC(0x00000002, UL) /* Software Interrupt Enable */
+#define SIE_STIE	_AC(0x00000020, UL) /* Timer Interrupt Enable */
+#define SIE_SEIE	_AC(0x00000200, UL) /* External Interrupt Enable */
+
+#define EXC_INST_MISALIGNED	0
+#define EXC_INST_ACCESS		1
+#define EXC_BREAKPOINT		3
+#define EXC_LOAD_ACCESS		5
+#define EXC_STORE_ACCESS	7
+#define EXC_SYSCALL		8
+#define EXC_INST_PAGE_FAULT	12
+#define EXC_LOAD_PAGE_FAULT	13
+#define EXC_STORE_PAGE_FAULT	15
 
 #ifndef __ASSEMBLY__
 
-- 
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
