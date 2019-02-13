Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F033C4151A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 11:53:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8B1F2147C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 11:53:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VvWPtb4r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="p9ay4t05";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="UQxrw5r0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8B1F2147C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7LuT+zi1cmxq8q7+C8KvqzZf1wT1xq8PcP5wDAQ/KI=; b=VvWPtb4rn2ArMJ
	egOg+pVigCghvyejrYzpNO4z+yxm6Z20/WdQ6her2dctGolFJf6gNwX+5ai58HWqz66lejvZr3QjC
	P+VXsqU0ct+OR+VyljicwsPs9Y6F33dm5zJdWffzzwhUNZyXwrcaQPZ547Av73O0z/m6q18bA3DD3
	zFuT2tjGWIyleebgJFfBXR/EvflmRlcv51bpXkrNonaKKr8xYt3sk/tzLDrljN3OB3pkoUQSCuIO6
	cOnhjsGQhMlhXEpZ5j3D5OhS0ONjvJqe/5nkgcS+/nWK8+giV+36gRcrysx/4ToGwnfpGvREiEmBe
	u7I7GiSDhZzD7g3H9n4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtt6w-0007gn-O0; Wed, 13 Feb 2019 11:53:54 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtt6j-0007Mt-Cy
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 11:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550058821; x=1581594821;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BugnXiiHSquLMITdS4N4nCW3CaOWl+ENENqHgGEP1co=;
 b=p9ay4t05ZxS+Wf7TuRPjOMe2CuZobhgo6BHYBExmkXGUDlrRKnVDuKtB
 0930cVc1UBUnH5LW3KstEvghvPjGcNn5S9aMAPA1+zdjSW7HLTfW1EhUI
 7y8iSR3Syeu6LVjnBnjj7K7T4jpDlg6yfhIl/keNzYdOHIvPGvvvmLzS5
 t0ot1JzwYSyvjTErUBriTKhVSqoRyKpg8ZoKncdVz+0ocUVKxi643mGco
 po2nImDXAQBrPKxh4e2yNwl+noton1++BJDhoe6yErF/4TNIS3RlI094q
 Blj6xBPlmSP+XnfNUGGsrqYmjPo+PKvXyB3oWMvnDJ88QpbNDnC1HSQNS w==;
X-IronPort-AV: E=Sophos;i="5.58,365,1544457600"; d="scan'208";a="102883425"
Received: from mail-dm3nam03lp2055.outbound.protection.outlook.com (HELO
 NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.55])
 by ob1.hgst.iphmx.com with ESMTP; 13 Feb 2019 19:53:34 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iavg7vVy3aEZO2x3AbiPR7yXfQqOvTeZkm7ohvI5WJE=;
 b=UQxrw5r01V6QuEdNylW4UOd5L1+wYddnRTFTuMQ9RilBFcCso7+udgYF5dty5svPMtidd3q4R2jmEW9oYb78Hev5voSXPuD2DOe9TFZsH2b7tHO2VMYSBn0h5F+Zc+C1NceX6leQcpvLulnEvgp1m3fw7v/VRhZ+NhDOFSxHvm4=
Received: from DM6PR04MB6059.namprd04.prod.outlook.com (20.178.226.89) by
 DM6PR04MB6171.namprd04.prod.outlook.com (20.178.227.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.19; Wed, 13 Feb 2019 11:53:33 +0000
Received: from DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c]) by DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c%2]) with mapi id 15.20.1601.023; Wed, 13 Feb 2019
 11:53:33 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v6 1/5] RISC-V: Setup init_mm before parse_early_param()
Thread-Topic: [PATCH v6 1/5] RISC-V: Setup init_mm before parse_early_param()
Thread-Index: AQHUw5K+eETtQHy410+MMjhdKr9Y1w==
Date: Wed, 13 Feb 2019 11:53:33 +0000
Message-ID: <20190213115301.103989-2-anup.patel@wdc.com>
References: <20190213115301.103989-1-anup.patel@wdc.com>
In-Reply-To: <20190213115301.103989-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR0101CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::17) To DM6PR04MB6059.namprd04.prod.outlook.com
 (2603:10b6:5:129::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [49.207.52.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2462f792-35fc-451b-f688-08d691a9e0d2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR04MB6171; 
x-ms-traffictypediagnostic: DM6PR04MB6171:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DM6PR04MB6171;
 23:rkfe2+f/EmvWnxrvl29LIQCdmQpQ4qlLBwDf0UW?=
 =?iso-8859-1?Q?MyiHyDJS0yxD1jhes1A07x5Mfu9mB96EGBiSfvkhAi4EZCnaV9A2xOzK9d?=
 =?iso-8859-1?Q?Db+o5XYkrjxHywT5ZaWym6MKdLsVX3EUlUVqOGUB3wrW5xsnKjOSKxQV8I?=
 =?iso-8859-1?Q?zctppw2nwL2iupxLCjrkfxjHeRs4W1W/M6X6R/HyOibZa+JxEBWc9PizT9?=
 =?iso-8859-1?Q?Wd8NdD3/cGvuCsevjZO1QoQjoAnz5sEKi6E28Uo2MPyeuyuNBE2ieWuRQ0?=
 =?iso-8859-1?Q?6lNt7m7QHYaR+FEVsme3VOPAY+LEWMVvBuDFlcGrTnuLpklm8zLUqo9Kd7?=
 =?iso-8859-1?Q?bJYSVXeihg3Dy2i1e9mS2uV78Az2fNLCknBd4o5/xmUtpM0qMDB0YABEBW?=
 =?iso-8859-1?Q?dyUiV390t/t/pVIhFojRslQRI/Q/Uy07ifBDI6tHF9SFCggi8jMA/iIWsx?=
 =?iso-8859-1?Q?ixrftBdfcviSq/Z5IUdsn9WIUSrlKWaK8Ec9+94HTtLNgpNBriqBUz0sHH?=
 =?iso-8859-1?Q?xDfAs5CT2lvKl9l6KxS4DjYkMAF3ffnjuzmTpLwK0AK7WEqqlSc9Ldn4cd?=
 =?iso-8859-1?Q?Z9WHALuxOo0Vq/b9AsFP0eMZNRzw0Wpc6RTanflrH8bDzSRe292qlDmbdt?=
 =?iso-8859-1?Q?5Vjq1Vp+IvXLCfJQsIZq7KOdmPcNVnqzOeyTKntCgFQqxstylqwD/Ywogw?=
 =?iso-8859-1?Q?s0n3SkMFh+ZLOiW54oOmqlSZJTaDPNn0hrx4eJP1oABES56ddfHsL7pbAL?=
 =?iso-8859-1?Q?SKUsOlIhwSCfSdCTsIqCroL5hrjX9KiSqqlRJcjxxNxv8sZxK8zjBTVn9H?=
 =?iso-8859-1?Q?e7zCeG5h4PtGBpyGc5jnTni8o2ngBDDvfjzOXl/++frtYevzey/6YBeKSs?=
 =?iso-8859-1?Q?A+m9/qtabmSAaTRi2oTevYLxBaboHWRKD0Mw50EvdTiecRzxCUwKmMnzja?=
 =?iso-8859-1?Q?+oZ408xBo4xtjpfAauQg7NFNNmoXztDHsp/wJHMAgcfKX8pYzrwSQm6KYe?=
 =?iso-8859-1?Q?Gp/dcNjcoNPhKFp+HP/7LP6qKI+vQw9SZaB4Yu//VRE316YZpm5tiZByX0?=
 =?iso-8859-1?Q?1ubG4OXRq9OG4DTtn3VVezn/cki7WQOZDLXNCKiQ0PL6VQksIbVFpTrpEA?=
 =?iso-8859-1?Q?7Lg+kbYxjK1wnI0XPpbRVepoY/QaNrVzh0icnIhMtSNVl2rm6LvCn5+zqa?=
 =?iso-8859-1?Q?wtR79Tr/l3YQy9fbzdR1uYD1ywuNTxoj+lgvmhcTXlrxhKKvtmzMkQDXvK?=
 =?iso-8859-1?Q?qqHxG9c8+S4ZuSd7wxPy5g6DvlzZC2CZSaQ3zo71V9XS4WGUuE/lTrTY5T?=
 =?iso-8859-1?Q?z4s6Jk6HlYhrseCAMcAPsDj?=
x-microsoft-antispam-prvs: <DM6PR04MB617106EDEA866E204A6DB7E28D660@DM6PR04MB6171.namprd04.prod.outlook.com>
x-forefront-prvs: 094700CA91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(346002)(39860400002)(136003)(396003)(199004)(189003)(52116002)(4326008)(66066001)(71190400001)(76176011)(316002)(8676002)(6436002)(106356001)(6486002)(6116002)(71200400001)(105586002)(3846002)(53936002)(386003)(44832011)(6506007)(6512007)(256004)(55236004)(97736004)(8936002)(54906003)(478600001)(72206003)(305945005)(26005)(102836004)(446003)(186003)(68736007)(1076003)(14454004)(81156014)(81166006)(7736002)(25786009)(99286004)(36756003)(2171002)(486006)(86362001)(11346002)(2616005)(50226002)(110136005)(476003)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB6171;
 H:DM6PR04MB6059.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ROjJ4sd8oQgPb/rR042naiRtbFdJLWJL7aD0WyYxdWY7SS5DCE965/pne+18GYxL5g5jQXCmjMj8VxaQW7oAl5K//W6v4b8XD7SR4Oz1XrGYAccz33ORSmI80foSz8slJV4dtTUBDOJeNIFkRM6k8rbOTqljIT2DQOt94ghKLXNgXYNiKr8F0VzTKywl3x/EkLgVDNbBUmaGjZcujSmckiA1UUZpob1EIymhgniqktSKdRgGQQ4+5tIM1mCpLcRrXeGsTjqxwnE0oceOYZ2iueY4ljjXZF+uKdRfvoS3nI6EAX2GY8jszlytau8tG3teWtoD5aq+TxL4mebNab1+QbaOGFdSb27mjyGZHETyllVRGIJThXW9/R8FSdkQZmFQHu6XxmsHI7rTsoMd+nOrYwoHX9qz/EomHDtfy/dQRsQ=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2462f792-35fc-451b-f688-08d691a9e0d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2019 11:53:29.7426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_035341_475063_98F8431E 
X-CRM114-Status: GOOD (  14.53  )
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

We should setup init_mm before doing parse_early_param() in setup_arch()
to be consistent with setup_arch() of other architectures such as x86,
ARM, and ARM64.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/kernel/setup.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 77564310235f..c6e858122815 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -204,15 +204,15 @@ static void __init setup_bootmem(void)
 
 void __init setup_arch(char **cmdline_p)
 {
-	*cmdline_p = boot_command_line;
-
-	parse_early_param();
-
 	init_mm.start_code = (unsigned long) _stext;
 	init_mm.end_code   = (unsigned long) _etext;
 	init_mm.end_data   = (unsigned long) _edata;
 	init_mm.brk        = (unsigned long) _end;
 
+	*cmdline_p = boot_command_line;
+
+	parse_early_param();
+
 	setup_bootmem();
 	paging_init();
 	unflatten_device_tree();
@@ -231,4 +231,3 @@ void __init setup_arch(char **cmdline_p)
 
 	riscv_fill_hwcap();
 }
-
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
