Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MISSING_HEADERS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F03C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 18:40:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDD8920684
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 18:40:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PtsKCf1a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="p6HRichI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDD8920684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yWP9HlERmICyzKvpaCiFP82MjD/CoRNN+gsKFgwcN0o=; b=PtsKCf1amFrkLo
	p3c1G6d4+rEgImDl0lBH0zOBzLv/SAgiXHZ0wf3D36llB17Tuxgxa+jPRIOT2jpWsx5OpZYR4A3Ot
	/PglfKfOWS0CAEMeEupMpqxI1JsLoYO0QfwAs9o7CMlXCd5A3/86raOKUK34USk4FWc2zHyOrW9e+
	f2wxDLGyWSXONrZJmT7nmvKKXu0iZZNS8uxOq5XeC6XLwRwfCrvTF0sgYsvvnralT/Xa1Pplc2I6m
	ElhbF6MSyHY2txYwv3sC3KQ/xd9ZmFi4xIf7sJ+mypUV+mQ8dU7U4K95x5xjBzsePcVu0wlIxQDxN
	8DypNssECg+upakfpx8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2KQQ-0003pp-CN; Fri, 08 Mar 2019 18:40:54 +0000
Received: from mail-eopbgr100132.outbound.protection.outlook.com
 ([40.107.10.132] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2KQN-0003oy-9n
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 18:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjTYgWC5qxwoQePQeSLAjZGu/ayllP5q/TBO1Y8iKwc=;
 b=p6HRichImWT36C2Vr/PIjeplEPYuuWb+U81dGlQI/EjOd8GG5cYQPziuI+v9DYZX8ZUI7ueOAFUxCPtgcb35bNO9EQZqNhuw5mwQacPlZ4wn660qh2et0P7Tde5I+wLQ/8Rc1zWd3GLT5v829z3Dd+O+a0d6okXSvHZKeaM/qZk=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB1277.GBRP265.PROD.OUTLOOK.COM (20.176.140.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.19; Fri, 8 Mar 2019 18:40:40 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1686.019; Fri, 8 Mar 2019
 18:40:40 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH v2 0/4] Improvements related to TLB and I$ flush
Thread-Topic: [PATCH v2 0/4] Improvements related to TLB and I$ flush
Thread-Index: AQHU1d5uCyF6Q7bPG0mLAw0LN9vB7A==
Date: Fri, 8 Mar 2019 18:40:40 +0000
Message-ID: <cover.1552069700.git.gary@garyguo.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0170.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::14) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 678545d4-7d22-4b36-7364-08d6a3f5905f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB1277; 
x-ms-traffictypediagnostic: LO2P265MB1277:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; LO2P265MB1277;
 23:ol44KQgeNwgyJVlwXks0UhEu54OjdcuQpHTXY37?=
 =?iso-8859-1?Q?2acwoqYlvQ+VD41/CsQQLoUUkSYq3Pb+07ZqP+aVr9iv2CGR8Fp9MfAzUt?=
 =?iso-8859-1?Q?gbt4K5/RNBTBM9LJD4C0k22ynn7HWs7CeK/2RgWam8KfzyBZDntZWSTDpx?=
 =?iso-8859-1?Q?RmgIbmu1ESXeWO5bKcOFRGD/XYnPYTQlzpU5rlBIuAlQ5SOtMj5y/SftOX?=
 =?iso-8859-1?Q?PDUep0cZwFnpnQKZKq8wg8CeyYpHgL1jK8kedtjpOy7ceXIpr+9FCSdr1d?=
 =?iso-8859-1?Q?ztFr9erYkrJMHXU27YVmnnv2sKiec2CqzwNsTM9Xpq9YkNfa5z80yfR35J?=
 =?iso-8859-1?Q?44WDDO6CizutbWVI5kQ0COEKV1kPwPop+BRngTdN4T2k/wCG2maPqbytfB?=
 =?iso-8859-1?Q?mDcSwKVzlrTlIae2hO7QS8ojdtrWvrfNS3kWyzKty0E3P7GWskGHSg00d+?=
 =?iso-8859-1?Q?su5GHcI/JBX7duYfPm/v/YkHP9tMiQ8na+7ja4Xjxju31Kz4IOXajas8df?=
 =?iso-8859-1?Q?5DgQICGm06Bkg8MptDLsxvDrCah17Ld4/XJ8JBIscDotFos3Qb+i8gQALj?=
 =?iso-8859-1?Q?QEfMQ+E5KIjh7J5D0u2shI8GZKNCAiGWIPdOj2NpM7VqMSkGAe1NFZcNnm?=
 =?iso-8859-1?Q?Fy8R44shCw6UJLva3lotRn0r8Ag4vIRWVmGOGvygeC0jWS3d37VFThdNFL?=
 =?iso-8859-1?Q?bZ1iuBmKm7NMYcBO3OCm7ltJR+OhEjmChyB/HfVBHVd9Z6lZEkwDmrCJ9m?=
 =?iso-8859-1?Q?lZHAdcJcSC6terShQtNDGi4x1kX+z0XONUKGkboKuEg0gJR6rOvAGZLGcn?=
 =?iso-8859-1?Q?ft02uprtQ53N8yBAqXDXq2/zkO3sSv8PYgD/3JVf8C0qPQudvMBk5GffZd?=
 =?iso-8859-1?Q?1eH3F6/WolhoKPHzroBHTY6nHZu+IaOzKJ445Z8amPmAYH3RsWbbR5KNc4?=
 =?iso-8859-1?Q?PVftTsg9EAtSjCB4bSn5Kc4FIHoDhSf2JYkBSrh2VVOtjULKk98jTEmwCX?=
 =?iso-8859-1?Q?Y7O+vCx7u9PAWGWDpiWm3u80yMprs4khqcqjTjmsOzJnTg9Gl7oj42434y?=
 =?iso-8859-1?Q?Ozg9rER+E8SHtwdm41TzZ7Orz1fgWJXC6YORIFCd3SoewlA1NNVVAnWKlf?=
 =?iso-8859-1?Q?K6Zc8MrABY83mv0L4yy6/23LzxAcFWGJdRQwXbXUDRJMAoBSa3ymSxDjKw?=
 =?iso-8859-1?Q?NB6wLbPo83MOQKoW8fX//DgZcs13MJKug=3D=3D?=
x-microsoft-antispam-prvs: <LO2P265MB1277E88779437190BE36DDC3D64D0@LO2P265MB1277.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0970508454
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39830400003)(396003)(376002)(346002)(199004)(189003)(81166006)(8676002)(2616005)(305945005)(186003)(97736004)(508600001)(1671002)(2906002)(68736007)(59246006)(14454004)(7736002)(6116002)(71200400001)(6506007)(102836004)(256004)(386003)(36756003)(8936002)(81156014)(486006)(99286004)(86362001)(6486002)(476003)(5660300002)(50226002)(71190400001)(54906003)(53936002)(25786009)(105586002)(316002)(4326008)(6512007)(52116002)(6436002)(109986005)(46003)(107886003)(106356001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1277;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zC2kuoXRWtBYAShTfchFC7wS9gMTGfPSka99gAi9BUP47Ms7LX+TJZ2MoBo67rWqp5m2h4F4oWOIPYLcRkM+bLd8YRMiY+mRCs3xf8CKxEUu5gcOlwYNX8apJUOTZ+Zk8KLaeVQTBQwr/yRckHf50c6WBEKd++DnsZuqSRCMqrX+Gog/ru4S9+A1tifQq34Kkr2u6pSjHo1HnVPWOg/DMkSWseFvUuWRYghI2/0EqtPfUQhNC8uxCb0FrEXaqiQNPb/1sOogU1KWea+Qz6j9xBYDA4CPJdZQdpuo3CSippwxTmNevBvmjnQLd1UfIPkD+ys7MSpEZLvm8Mc6mb0EmGVFaI5ZEq2qRslaErtRyNnZXTyUlf8Nw+cnprV/Yo7gtcURgvkdOPC/j2Jyw9m0nOOjH3ylFIEKzePBoEGtS04=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 678545d4-7d22-4b36-7364-08d6a3f5905f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2019 18:40:40.7115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_104051_406690_C9F28AA3 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Gary Guo <gary@garyguo.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Gary Guo <gary@garyguo.net>

Here's the revised version of my TLB/I$ flush improvement. Originally the
I$ part is a separate patch but I've decided to put into the same patch
series as they're somewhat related.

Instead of using Kconfig, the code now adds two kernel boot parameters
instead, tlbi_max_ops=<int> and tlbi_method=<ipi|sbi>.

Gary Guo (4):
  riscv: move flush_icache_{all,mm} to cacheflush.c
  riscv: move switch_mm to its own file
  riscv: fix sbi_remote_sfence_vma{,_asid}.
  riscv: rewrite tlb flush for performance

 arch/riscv/include/asm/cacheflush.h  |   2 +-
 arch/riscv/include/asm/mmu_context.h |  59 +-------
 arch/riscv/include/asm/pgtable.h     |   2 +-
 arch/riscv/include/asm/sbi.h         |  19 ++-
 arch/riscv/include/asm/tlbflush.h    |  73 ++++-----
 arch/riscv/kernel/smp.c              |  49 ------
 arch/riscv/mm/Makefile               |   2 +
 arch/riscv/mm/cacheflush.c           |  61 ++++++++
 arch/riscv/mm/context.c              |  77 ++++++++++
 arch/riscv/mm/tlbflush.c             | 216 +++++++++++++++++++++++++++
 10 files changed, 399 insertions(+), 161 deletions(-)
 create mode 100644 arch/riscv/mm/context.c
 create mode 100644 arch/riscv/mm/tlbflush.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
