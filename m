Return-Path: <SRS0=a8/2=SE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4E6C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 09:18:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C7C42084C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 09:18:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sIhcOsBV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="T3ZMlFXR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="KM4UwECm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C7C42084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t+wcKJpyphxU02AA1M0xNrpGOV9CEslsnN0DJ/Z9wvc=; b=sIhcOsBVdj5iEP
	1YO8DWcQAzGU5b7ITB7focrPjjQmSlpKSM1LKcTmmYpoueNMLMfxnvTKODemNY4wnLwZLvIMCnJNt
	Iya4ANHmKyHoNhOD38zKINyRNVGQjObpVaEWfqt59rbLXUn05uEV/HhuxwzGzTEJXuQ7Io+DVO/hz
	7hR87EV5ZQKDSL4eeM6N9Wb1PEUB+3InQuhouxJ4MXEBCMl3bBv0SlvKNf4Dh3aX3w3YSGXsNbJD6
	+8yK2oBKJRxZTGdcA9Zfj9OEa69rSKFqYJUw0J+n/9zICDxSFK7lrASEncLZNPCvL4mvpucu0s+wn
	D2u41AoVaZbpdKc/tYYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBFYZ-0002pA-S9; Tue, 02 Apr 2019 09:18:11 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBFYX-0002oD-3t
 for linux-riscv@lists.infradead.org; Tue, 02 Apr 2019 09:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554196689; x=1585732689;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=er82yyelYx5INU3biE0ev4LdDRvdqMtPW+ooZPUYTbs=;
 b=T3ZMlFXR2X7J3zJDHOYR8qq7gOL4Tk4naG8ZZG+/dP2KA7CCJxL0f/Q7
 FcvNp644Jcmvkb49jPxF+UiJ1hq1l/XTfJAXuj7og84QvSVrHtjtzflAw
 6EkBNrAiXoF6c+SgaFzpM0d0prZc8KF8VSOnvsDxyDxa+X9dq+7GQJoNI
 z2sI1P62SvOH5Lp/OY47Mt3+Dqll34g9YN/qdwfSjeuU7Pj7K6fImARLH
 gIKFL6IBYqxNsZxcGhGm5NAeIaCRL5MyH2YnHJdDBbTAAqlNXvoP4eO+J
 pTsQvp0CKlZuU94C7S71CbdnaT25ym0/RNwpIaHJ/Kvx9hw0+cxnN3gKo g==;
X-IronPort-AV: E=Sophos;i="5.60,300,1549900800"; d="scan'208";a="109852023"
Received: from mail-sn1nam01lp2052.outbound.protection.outlook.com (HELO
 NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.52])
 by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2019 17:18:03 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKvSGmdeV/OzV0Wo/Ed2Jb8cfQfXuUxoDRNBRVlVtR8=;
 b=KM4UwECmszZiMSQcEfJJbpHtXZNhzJ670RFQhkNuhijZaXB7LgyYLqke1lR3AiCMHaAnagJVFlDIsjID/QgutM5IHPMVcAKTDUA1LW9KxZeeZaTujeT0CWkROtpGnMLrCck/8bU1FMyrYGFK3JoyjmlMk8BD9+d3NzvOf1oNb6E=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5487.namprd04.prod.outlook.com (20.178.245.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.17; Tue, 2 Apr 2019 09:18:02 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1750.014; Tue, 2 Apr 2019
 09:18:02 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2] RISC-V: Fix Maximum Physical Memory 2GiB option for 64bit
 systems
Thread-Topic: [PATCH v2] RISC-V: Fix Maximum Physical Memory 2GiB option for
 64bit systems
Thread-Index: AQHU6TT4TjtgcLh+40eL12JN1QVv8Q==
Date: Tue, 2 Apr 2019 09:18:02 +0000
Message-ID: <20190402091741.11298-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::22) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ae0f543-1060-4a41-c0c4-08d6b74c1afa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR04MB5487; 
x-ms-traffictypediagnostic: MN2PR04MB5487:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB548772187CE6B5546A92D8498D560@MN2PR04MB5487.namprd04.prod.outlook.com>
x-forefront-prvs: 0995196AA2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(396003)(39860400002)(376002)(346002)(199004)(189003)(476003)(14454004)(44832011)(36756003)(305945005)(81166006)(256004)(5660300002)(186003)(99286004)(486006)(66066001)(2616005)(71190400001)(6436002)(102836004)(8936002)(81156014)(2906002)(386003)(52116002)(8676002)(2171002)(1076003)(26005)(25786009)(97736004)(54906003)(50226002)(6486002)(6506007)(86362001)(71200400001)(7736002)(106356001)(3846002)(316002)(6116002)(105586002)(6512007)(110136005)(53936002)(68736007)(478600001)(72206003)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5487;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x35QSxNy4cd3FkdzKagBqBUCRHLSbwkOmNS6BoK0D2WMPDv0O4mI8E1YkmGAiQNYc8mgV0HbfNXbylP5jZtI73ZEJRlzyBO6GfyjA5VM0kW+4MO9qJsZj8FAORArAoQ7AalhKbR6CWBoLpF3uwjgDcAK2bbGMj6b0mi7DkcrIyMydlrRJUXqjsywHeXN2DiiI73nwD1KHNMB1mOlwam02UTTbjTRUcR/oE0AlgANsYQwcYoaVbv2WGLGwM0WC6AEluitCgjOuiLPuN5RUwDKO7KDfWS4I+4k1MKYYcyf+Uqv0NnkWC09Vl3xZmn0UkppfxnLDJTNZZZQUGZVL0mrthlT22f9yrdz8Xn0mAJgLJHcBAbLi7mjjaG2FSX0VxOe1VJvlMZ6toduzRO+CRLJ8jVmssV6ArfhkpX215iGeMs=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae0f543-1060-4a41-c0c4-08d6b74c1afa
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2019 09:18:02.1725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5487
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_021809_314688_DD420B8C 
X-CRM114-Status: GOOD (  14.15  )
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
---
Changes since v1:
- Use memblock_remove() instead of memblock_reserve()
---
 arch/riscv/mm/init.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5fd8c922e1c2..b5038a121005 100644
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
+			if ((reg->base + mem_size) < end)
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
