Return-Path: <SRS0=a8/2=SE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECF5C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 06:02:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDECD207E0
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 06:02:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ep8cTO/P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Sa2Ul6qA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="Yt7lCg7P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDECD207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dAiq0r0V2ab1TL5j/7uZZFsk2X7uJmydJRBIen8J7Jk=; b=Ep8cTO/PH31K4k
	GXXPnw5vyhdv52VULuyrS6qThXBS+gpsM+HSdjk/HJEGohayjsKqPCpxODY8Hgs/QWCsdp7ChFGpT
	IGG4CgZVZ6sC3n7m0TT1oiirECF72IzFtblf1DmiPSyuaLkIk2//24ttpYtCjT8RDaZNQtzM5002b
	QuJnVZCuFtUoONpwRgzphJg/+VRR+t9YwexGFxYRtcGmc0vOuAtIRx8IlXpfFZFMkb6wihUjFFtuM
	OFRyOtnk6zs7BhpibGo43v8QxRC3dV/tFODkHD9HrTl/NdpWz8c2lj1NPbI0nLaeHPprMEAg92HUC
	shwU+J4N47xnhY7ZVoqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBCVU-0005T2-Np; Tue, 02 Apr 2019 06:02:48 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBCVS-0005Sg-7S
 for linux-riscv@lists.infradead.org; Tue, 02 Apr 2019 06:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554184966; x=1585720966;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=9Z1y0gxqRMLGpY2Yk1sFK7ip9p14cbENeiuQF9lFemY=;
 b=Sa2Ul6qA+8NFZIWNNMXHjzwFNQjbR185AeXHBVVYEQeUtYNRblzGN/8l
 GDhZRbRs+iYQ7ywOaXlIo/RYTJ2V6icOhrc3FJ/Ndg/kC+G6zC566soca
 z1n/P8okDCE+zj8Zl2Kww8dQwCRNmrCb5Bp9Nw1FbqK4egD9FYoS0izho
 /Yl823dL6o+5xB0BcSM2YS4/noWfr59ln/DqOgFcuHVcdTTtJJhCYICcv
 Ka8Tm2ueYlztgWa1QFFP5tYqoWRYf1/IyLMJB8ThDZIEzzYzquvdalxMv
 8ERPhDCKqoqa3ThNpe4MMMasyI5DWW6Myi0R7tsaJbks0GZB4Xcl4LslA Q==;
X-IronPort-AV: E=Sophos;i="5.60,298,1549900800"; d="scan'208";a="104765019"
Received: from mail-bl2nam02lp2051.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.51])
 by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2019 14:02:42 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTrxcMC6BmBZxC/1x5IQtCPOx3IXwqtfOEFeiMWB75g=;
 b=Yt7lCg7PProayyaPzOSMro+p3M6jpewVoGelOpX5g8eUOKsODeJZtiCQbcuhHHvAmQ0MrQqmSFaHQ1MBHBKNUXgOxKH3z0xOjtI3s2y4B4U8vjhTafXG7zF4CGvnWsvXjlNSZMP6Pky2Q0DFzgSoRyhTTbkPK9eBUhJfeC8nlso=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5567.namprd04.prod.outlook.com (20.178.246.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.17; Tue, 2 Apr 2019 06:02:39 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1750.014; Tue, 2 Apr 2019
 06:02:39 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] RISC-V: Fix Maximum Physical Memory 2GiB option for 64bit
 systems
Thread-Topic: [PATCH] RISC-V: Fix Maximum Physical Memory 2GiB option for
 64bit systems
Thread-Index: AQHU6RmtavXCl8b8E02WvsawiHwFzQ==
Date: Tue, 2 Apr 2019 06:02:38 +0000
Message-ID: <20190402055902.14017-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0004.prod.exchangelabs.com (2603:10b6:a02:80::17)
 To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48adeb41-784c-475a-6082-08d6b730cf50
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR04MB5567; 
x-ms-traffictypediagnostic: MN2PR04MB5567:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB55679A8418965DB965EB80048D560@MN2PR04MB5567.namprd04.prod.outlook.com>
x-forefront-prvs: 0995196AA2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(376002)(366004)(396003)(136003)(189003)(199004)(81166006)(6486002)(106356001)(97736004)(4326008)(71200400001)(71190400001)(81156014)(50226002)(8676002)(72206003)(478600001)(14454004)(186003)(256004)(316002)(4744005)(53936002)(2906002)(25786009)(36756003)(54906003)(110136005)(66066001)(305945005)(8936002)(476003)(5660300002)(7736002)(86362001)(6506007)(99286004)(486006)(68736007)(1076003)(6116002)(6512007)(2616005)(26005)(105586002)(3846002)(6436002)(386003)(52116002)(44832011)(102836004)(2171002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5567;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6QcyB8eZ97sO35kSvHfUwTpCb0E9XX1CTiMzrbTHSxdyqNXU142fn542OmUIMg+3pJ7Mm77jX5iPS7pMjtWnI3B8dWNpbdVQVxjlA0lKCFBfzjutdDYoDAryn2Yp2qJQTqrKipJZsuvINhAq/14KayIlmryYYQU1KzCJJ/h61M49acPNteqPre8W3E0KyDj4DSA0dz0q3EuNd+HwfEGCKZDCsQufVOZBEKey8x8/DXW1vbv5Ok4uxwFs0f9g+A9aVgTQ7MJzwbFQZvVV+gVBDXz5i3tatjdo21iwV2Hwomqnpd+8iyKInrd1D7ScCKqfmv/94+3iYPMMtpxJowD+4ExzL7bYSY0dJs9kKd/EvblTX7IbDeQ8gHsl8tZHAHlszUdppI/PCM9zKpiMi/mQ8uJ/PvfOptHItFULdHgWOTs=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48adeb41-784c-475a-6082-08d6b730cf50
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2019 06:02:38.9432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5567
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_230246_320139_3EA65B9F 
X-CRM114-Status: GOOD (  13.92  )
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

This patch fixes above issue by reserving unusable memory region in
setup_bootmem().

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/mm/init.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5fd8c922e1c2..6b063f20a9d0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -121,6 +121,14 @@ void __init setup_bootmem(void)
 			 */
 			memblock_reserve(reg->base, vmlinux_end - reg->base);
 			mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
+
+			/*
+			 * Reserve from the end of usable area to the end of
+			 * region
+			 */
+			if ((reg->base + mem_size) < end)
+				memblock_reserve(reg->base + mem_size,
+						 end - reg->base - mem_size);
 		}
 	}
 	BUG_ON(mem_size == 0);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
