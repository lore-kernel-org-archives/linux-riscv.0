Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE13DC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 14:00:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BF9220823
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 14:00:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kBE17+VN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="fI8+ZH6D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="PnsjftTU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BF9220823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCnPItQSkzZYH3nfhujgICZ9tIxh2BnKHSE4GtCJRpc=; b=kBE17+VNOZSJ6W
	Q687bfzekbIumngTB9xAVGInURdn5xGt4RBaxutJqRB3bar2ruTH3WIPAvdmtlvIZneFG+mykmKtw
	TW/7PTsNLTvo7O5IjHh3xBFYJlPEGWM1dihUbld22GMaO0QiUTMQxpUOSyvdq/liwLQoz6JPkr4iN
	96J6+SwgWNDD1FJQc4wXLMol+u75wueJZTg2REDjLO72HNiqappfdmnFYMDhQSLMFq0Vc5iCw4CT8
	Cp2lglJ5m0OEiNGReodzihSzzQH/AOGvYdYNhieGqTzhv7MnUSKqOQdEZ00fgQIPtdWQU+9J6n8SK
	VQp8N2xkzIaPfsx7gIIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtYbm-0002yK-32; Tue, 12 Feb 2019 14:00:22 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtYbe-0002wG-MQ
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 14:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549980015; x=1581516015;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=peWHjgeJOcMs/VI6T5c3UHJM4S2Ufl+OBhS24TMyuHU=;
 b=fI8+ZH6DumvacDuo9mOHV/mH9otWm0r8grlw8zTdwZwjZnG+zR6DV857
 pQTmQ4I2Wqij/qdYgdu5MKlRQG5BBpNU6+V/hZftEh3T6ISoQ553hizm+
 F4R9lPr+XgD+ZqDx3v46CTs0Vuvf5MQODDU+AiP1orYBfICFW2rfzpJA2
 coSbs7UB/78o9OVck4L2RBZBs3at6F1q85hYmSxHsDWwBRNHSSM0bL57h
 kJcJKQASM63ieR9DpPnJHW0lqh1VPz3bPEf4vv59I0F58ZVBeoYeJBF7u
 HqpWFTx7Wc8yAqkDJ56JnWYjKewYniJfMPFVzNc/jVXAFwCFT4XuQ5DkY Q==;
X-IronPort-AV: E=Sophos;i="5.58,362,1544457600"; d="scan'208";a="106025549"
Received: from mail-bn3nam01lp2053.outbound.protection.outlook.com (HELO
 NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.53])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2019 22:00:14 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eE7cuLCrwqeCI2GErviQj8ukoOuFeD6pf7McpNqny80=;
 b=PnsjftTUhZYNtf2Qzp0sFq5RlHfPS0XYC+J00NL1zOzTowrlIDdw57q6Dj7111CUj0MMOFabbLPw2FqjIwPPt2B+492J5LlF9PdlMJfSRkO+424Kji4PRY8+4zNQrOH02hbyOh/+CaxzUiSJz7a4lkOFpxRtnjQOe0Fl+vUQvLI=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.247.148) by
 MN2PR04MB6062.namprd04.prod.outlook.com (20.178.247.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.21; Tue, 12 Feb 2019 14:00:12 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::2cdb:c465:af57:8be1]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::2cdb:c465:af57:8be1%7]) with mapi id 15.20.1601.023; Tue, 12 Feb 2019
 14:00:12 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3 1/6] RISC-V: Move free_initrd_mem() to kernel/setup.c
Thread-Topic: [PATCH v3 1/6] RISC-V: Move free_initrd_mem() to kernel/setup.c
Thread-Index: AQHUwttFxrDRYApwwUmalY3+4syPHQ==
Date: Tue, 12 Feb 2019 14:00:12 +0000
Message-ID: <20190212135942.105008-2-anup.patel@wdc.com>
References: <20190212135942.105008-1-anup.patel@wdc.com>
In-Reply-To: <20190212135942.105008-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0126.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::20) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:de::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [49.207.48.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 246676c1-51ca-4d7e-bdbf-08d690f267b6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR04MB6062; 
x-ms-traffictypediagnostic: MN2PR04MB6062:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; MN2PR04MB6062;
 23:ahieP0LQNL3ngaItGn/lMOAjVLyaqc6cnv/WtIE?=
 =?iso-8859-1?Q?NHlLlfaG0R6sO+CnMddHrmcKGfAhIeMOKeQJy0pkJz0KjP17v0e/AA1Q5Y?=
 =?iso-8859-1?Q?oTkzDW8/v0HGszd/vHEL3a/v37wtoyyFsLn+oqT1NStZwxDbpzBLcL7dMd?=
 =?iso-8859-1?Q?u6LZVIbXl8WKP7E0tCqAkB+Clxy+DR4s4VYfbQqteUSbxo2AQhldFExU8v?=
 =?iso-8859-1?Q?jcDIYXQh6a4Z5T0SuKUlubX/hDE6137Usi5mFUW/LNqy43moKLQUrUuUbU?=
 =?iso-8859-1?Q?X8qzPDFJX04GdR57hAZfSjKmiHFdfLzqdux8/79tCA0LHOFZXPLsyPZXh7?=
 =?iso-8859-1?Q?oOT5u6Y4EWObiP2rvx+JDJLDVY4Xj+nPRMzYe78xUKdQ4/VkX34mAooh0d?=
 =?iso-8859-1?Q?kK10wUd6SbpDKyKPLpNGyxplhORFPPRWrXu0k+92uv3mekMR88cTo/Xf49?=
 =?iso-8859-1?Q?Z6+4q6ZTRZjrqhp0dJ75+j1XOjcFC7h36wiZrh1rYU5OiqNGW4//lxmeOn?=
 =?iso-8859-1?Q?/P3V0EccNjaJIWq7e60PivEiagPzii0w5pyDshuNp1nELXJSmODXItDgfJ?=
 =?iso-8859-1?Q?FwroPFu8Qgzsi8cKaMPyUdrwpiAIrNf42Q+vXWGWMSUObfmLqgQwAYAhjH?=
 =?iso-8859-1?Q?qQbUJ/AVsgT/UcPyymRDvuPT85UQG9klSwF9TCInmg9rEZnCU/BoX6ckvT?=
 =?iso-8859-1?Q?YeMQsgif0WswNqGh3GGCOmA6ebUX28b+fYIBpJNl046VSvPw8GxMGcWlLs?=
 =?iso-8859-1?Q?g1SA3pgSbCSx3m2YEKopw0R2td3qbdb4zpP5CLw20g9Ieh2U6Fn2i2V63P?=
 =?iso-8859-1?Q?/2VcmzlSmR0n83nFDMLWryuW9mFeT49l5PoH6rcrC2JMBIyA7XBjzluuY9?=
 =?iso-8859-1?Q?eLkcnpydOgmoxk2TnquET3JJEm4Y/TewVy0GVNLP80J67EmP/3fOPhu0rt?=
 =?iso-8859-1?Q?+JO0VpSdTLbxEfB/GFriWvxkjVN6TmXEJLKn5ge0XnD9Cxkqv2JHIIDopO?=
 =?iso-8859-1?Q?09S/11eGyxPJeHSvv4qEeTSfKcPn6Cr9wrWtWHeiKbfRkImmVJYhdus61v?=
 =?iso-8859-1?Q?oFcprcWoIZlLQ/0Q0FNWIPLSm3nRgQ5ufpw4fAbC4KiKAo7/kSNmrWlKux?=
 =?iso-8859-1?Q?PCgWsSBJA3D6K6qM4XS3+uVpB3reBzaWbp66ch7kwTWHqzBr+m8HRxtXru?=
 =?iso-8859-1?Q?lc0SlIMHmD/9Qigm591kJBxE+0xDH4w9DqDpCCHuUDX/bpkMUzLhDX1Z0W?=
 =?iso-8859-1?Q?JUHGD2ngjNU/Z4HoEjiVwCpe5ExWlw2am6b/bVkhmy2C8opuBculgLub9I?=
 =?iso-8859-1?Q?ZlsYWs7ubzskmbmR89xq910?=
x-microsoft-antispam-prvs: <MN2PR04MB606276D1D258C29EB5062CBF8D650@MN2PR04MB6062.namprd04.prod.outlook.com>
x-forefront-prvs: 0946DC87A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(346002)(136003)(366004)(396003)(199004)(189003)(8676002)(2906002)(81166006)(86362001)(44832011)(50226002)(2616005)(11346002)(106356001)(446003)(68736007)(316002)(53936002)(476003)(81156014)(76176011)(105586002)(25786009)(486006)(8936002)(55236004)(14454004)(6116002)(256004)(4326008)(36756003)(3846002)(71200400001)(71190400001)(102836004)(66066001)(386003)(52116002)(6506007)(99286004)(1076003)(186003)(6512007)(2171002)(54906003)(110136005)(6436002)(7736002)(26005)(72206003)(478600001)(305945005)(6486002)(97736004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6062;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xin1Qd57C4u8AhARWRLcm1/CfZlNIqdCc++l6wv//0AtyB98DBQUWIIfQHu/OiURVoeXhDkHRuTASPNd0Y9nkS7IwDAC97Pn+qidYLehSszUCgk/dh4xgY4A0NQ7YmCPIPpcWq6apjcs6mln0iEv0Vsa7wXH9V8UWkPgpiAeqpoF79yN2hpSE5s0MJEPEglyp03j9mVw1UyqKvpZCYjDLy5hrF88eCpiaPdiieTjf2xowbZOQ6tQBumYxvGHh5h9pWQNzbIe70YOvzmPKGczLXeATFcmlxQtoUAoYzypTSC11KAkd0RuJ64X5Tf4LtuWJ909FE2OI1SnrEV0gwEK4QguVEN3I6Z37NOVpnikHnFGr+dL3tXWHg6LXJ3vBeZXEfvt96FPlBCE2vOhICNoeu22ApHmZhPJus7hwtKqgQM=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246676c1-51ca-4d7e-bdbf-08d690f267b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2019 14:00:09.1711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_060014_853194_26EED224 
X-CRM114-Status: GOOD (  13.68  )
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

We move free_initrd_mem() to kernel/setup.c so that all initrd related
functions are in one place.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/setup.c | 4 ++++
 arch/riscv/mm/init.c      | 7 -------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 77564310235f..36f60b4d2147 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -96,6 +96,10 @@ static void __init setup_initrd(void)
 	initrd_start = 0;
 	initrd_end = 0;
 }
+
+void free_initrd_mem(unsigned long start, unsigned long end)
+{
+}
 #endif /* CONFIG_BLK_DEV_INITRD */
 
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 658ebf645f42..504a5e491f5a 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -14,7 +14,6 @@
 #include <linux/init.h>
 #include <linux/mm.h>
 #include <linux/memblock.h>
-#include <linux/initrd.h>
 #include <linux/swap.h>
 #include <linux/sizes.h>
 
@@ -64,9 +63,3 @@ void free_initmem(void)
 {
 	free_initmem_default(0);
 }
-
-#ifdef CONFIG_BLK_DEV_INITRD
-void free_initrd_mem(unsigned long start, unsigned long end)
-{
-}
-#endif /* CONFIG_BLK_DEV_INITRD */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
