Return-Path: <SRS0=jXit=RM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MISSING_HEADERS,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BEFC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2019 14:52:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BE6520851
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2019 14:52:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kvW3xV05";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="kad4Jegu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BE6520851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YH2el5IC6qA8d9RbVZsPJeyE57aIZtpY4Z3aLc4GyUk=; b=kvW3xV05iGT8zx
	5DuhVE/dyUUY4tFZnoIc1Blz6qpTx94h4eQ188ObB3KyMdglIxNOczBaOC75V4lmMtnXFX7VbAVMT
	uMUTW0DFJQPe2oaTHp1nNRcab/lDU+kERzuSsd+AIkQiIlduJCrVLt1PxHDEM3vslKaWu6cjCNEs6
	wIlNOPyWNqTJE4n9FsYSWKenrFK1bn1kkFxzW3K0CORlSjoawEfW0BjBuIDHU12tleDft3UTphhDn
	fZjmWQYxSvWy6l8ErJd69k1NF4EDPwBZGlVAK0X13CmIkvwkCYK3tkX8YCMBBWeRqyf3udR6nlUG6
	ur7G6sYxItUN664W+TXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2dKe-00069T-7I; Sat, 09 Mar 2019 14:52:12 +0000
Received: from mail-eopbgr110109.outbound.protection.outlook.com
 ([40.107.11.109] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2dKa-00068V-89
 for linux-riscv@lists.infradead.org; Sat, 09 Mar 2019 14:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx1HmzPubYLeA1WZ/oPFwROd/pYFJO2VXPGT8sFAPhA=;
 b=kad4JeguS0M41QWqBxHNtT4WzPY62fltumiJJHhOM8TLi4rKrsQnfK9NRdzt750pIpOXnwkfA0IZ2Vm1uAME/Bxy5oqTEKW6p95Ef8ZPS7GjnDkwOZMTs3fHqwWYlpQI6qS675749n2rdTRhA29JB7JO+rdruYqvS4ThrVmUR3U=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0158.GBRP265.PROD.OUTLOOK.COM (10.166.98.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.18; Sat, 9 Mar 2019 14:52:02 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1686.021; Sat, 9 Mar 2019
 14:52:02 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH v3 0/4] TLB/I$ flush cleanups and improvements
Thread-Topic: [PATCH v3 0/4] TLB/I$ flush cleanups and improvements
Thread-Index: AQHU1oenWGSdkatWs0K34ZGZqVyp6g==
Date: Sat, 9 Mar 2019 14:52:02 +0000
Message-ID: <cover.1552142593.git.gary@garyguo.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::27) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d7a8420-795f-4683-12a7-08d6a49eca13
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0158; 
x-ms-traffictypediagnostic: LO2P265MB0158:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; LO2P265MB0158;
 23:OpmvftmGu/RAZr4coV++BPXl6KX6kFANjP16GSj?=
 =?iso-8859-1?Q?VnFSO+2hIw0/Y7z7LRl+0aR8rTryIGfwqEqXwDXLjEvqC6dUyuilfABowG?=
 =?iso-8859-1?Q?QPWkFEnZm+4oazeYWeyklq8xMFK2RJ7JvnAP0gjXqltvnwcI+lxepW1Y3o?=
 =?iso-8859-1?Q?JpBTz3RZrMWD5BaLZIcxJmYuy4M0enWiIAkAljNWLaQLCQj6UTetwVRv0E?=
 =?iso-8859-1?Q?M38SDjqEV/fWirUPAiFjuo5Y7nFYFEPyahB6zcI/hxqO3spElbAVr7l2c9?=
 =?iso-8859-1?Q?zJlD/lSu26tOZOBqJ6RkByhEBxXpRyHQtdmEkIjNf2k8zUvX5PKMC+q9mF?=
 =?iso-8859-1?Q?MQHQPxqZlagF9tIdqwi2gLDKSlFR+IEDH3K3G9FQi3D33zguFpiIR4XP/r?=
 =?iso-8859-1?Q?va8lbzM4MvjMjeJMGOgoM24KI6isWrtCU7ny53oDskCkqdlsztGsj2eGbz?=
 =?iso-8859-1?Q?uPojof28aywWlTdsq+iaUWyxkOPSfCFmCIjcVvxBrO2LEAycN+sAsDjrCF?=
 =?iso-8859-1?Q?Hab1RM+o47yYU0LnmXcRtph88BN76JEZueuao2bZtNfPrNHWxJJBvQzxtu?=
 =?iso-8859-1?Q?CRUTwz8W+Q2MC4tu2E8x2XbomkDN+K8hQA9JjUk8jsqJK5ITX5tElchBSs?=
 =?iso-8859-1?Q?a4XWIDzNADfVnKlZUfqGgMmePS9sqVagnwF9UJZZQzcOn9uI5BGfwDp1mN?=
 =?iso-8859-1?Q?R4UhMFA4WjBO8j4nt60NPEkQcKqOj0oyuum2z+uxnYyDSnfMTYmgU1iccP?=
 =?iso-8859-1?Q?wRatQKxu4bnX3FFzjivQy0vd0YtzlDNhHL9E3rbNKgP/Wgulf3R+m9IEuX?=
 =?iso-8859-1?Q?OQAK+hBC2PzXlsVdGsPnEkqH+ixgyXiCwCLKl2bOam0m165ysvDpN9bjrF?=
 =?iso-8859-1?Q?W6vahWkUunpBTL2q5gzmYycHJVt62R1jOItocZPW5YNM1xalBMQ+ifkpCk?=
 =?iso-8859-1?Q?H80cIBGxlgKhR1Cgq9n/x+Bl7t/X5et0VwjlP7dysf5SwspEP2UjQAizJM?=
 =?iso-8859-1?Q?ONS6FONmqDx382mMDBGkQcOkJwPSztT2HTo3D/S7dlS7AQFFq3POAzkMHo?=
 =?iso-8859-1?Q?iOpJK7sD37jWzo1rS0ur3Vw9+b2J48YJBx9TIYiMKdS45zqQE/DWD7PmJw?=
 =?iso-8859-1?Q?Y73KVZXEYycdfXj8YNtEFr0EF8v9wp/Ar0F/M6YrvHXe3M0RBeJb4zOFiq?=
 =?iso-8859-1?Q?zO0Rpvqpck9Hw2pS81eD2zpIjO2rxdrfQ=3D=3D?=
x-microsoft-antispam-prvs: <LO2P265MB015868D9A30243C9DBDB46AFD64E0@LO2P265MB0158.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0971922F40
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39830400003)(346002)(366004)(136003)(396003)(199004)(189003)(305945005)(53936002)(6116002)(8676002)(1671002)(102836004)(86362001)(508600001)(97736004)(52116002)(36756003)(14454004)(2906002)(99286004)(386003)(6506007)(7736002)(25786009)(81156014)(81166006)(4326008)(6436002)(6486002)(6512007)(2616005)(476003)(105586002)(68736007)(106356001)(71200400001)(71190400001)(186003)(486006)(8936002)(50226002)(5660300002)(256004)(109986005)(107886003)(54906003)(59246006)(316002)(46003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0158;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Xg7KKnBNrvk5kku78Qpgs6S9HWznQFWGW76AQqZahSvBPQSo2PFdVStJ5MewmaMJ0xHa7QTZ0/ID2Su3aR4hpgv93zjaLlGQgvYvjiT5fgGrGSo/Yx6c7zdwBSnNSIXkb28T+HeIIX1Qy22i7LrXHtTC+clthxK+1Otos6qWcRkVDIsZ/CS8efd1zRe+MS/A33qBSvfls63Ww6nzI800WKcT/PoCy2Ra5El3+8gOoSXwkZ09dGlJjSMMzvdD0T4c3k4IRtGRurxJBVKZPpXdC++EkDCroSJ2NesMvAOUdhWCghHMJ2vVrhdfumvbA4Oz7274VHI+2nY5Zm6lXaOgcRm7gN6MrZWGFniBSW1mECZ+HRPOSU4uVSEJ+gpZLly5xh19lxHE6nsCXvj+XTiehlX9z0flPFacBzG5q7YGKIY=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7a8420-795f-4683-12a7-08d6a49eca13
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2019 14:52:02.3750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190309_065208_333127_469738F0 
X-CRM114-Status: UNSURE (   7.73  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Gary Guo <gary@garyguo.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Gary Guo <gary@garyguo.net>

Sorry, I didn't realised that there is a for-next branch and is basing
my changes on top of master/HEAD instead. I've now rebased and fix a new
reference of of local_flush_tlb_page.

This patches does:
1. Move long and expensive functions aways from header files.
2. Fix missing arguments for SBI calls.
3. Performance improvements for TLB flush.

Changes since v2:
 - Replace __setup with early_param
 - Rebase on top of for-next

Changes since v1:
 - Use kernel boot parameters instead of Kconfig
 - Style fixes

Gary Guo (4):
  riscv: move flush_icache_{all,mm} to cacheflush.c
  riscv: move switch_mm to its own file
  riscv: fix sbi_remote_sfence_vma{,_asid}.
  riscv: rewrite tlb flush for performance

 arch/riscv/include/asm/cacheflush.h  |   2 +-
 arch/riscv/include/asm/mmu_context.h |  59 +-------
 arch/riscv/include/asm/pgtable.h     |   2 +-
 arch/riscv/include/asm/sbi.h         |  19 ++-
 arch/riscv/include/asm/tlbflush.h    |  76 ++++------
 arch/riscv/kernel/smp.c              |  49 ------
 arch/riscv/mm/Makefile               |   2 +
 arch/riscv/mm/cacheflush.c           |  61 ++++++++
 arch/riscv/mm/context.c              |  77 ++++++++++
 arch/riscv/mm/init.c                 |   2 +-
 arch/riscv/mm/tlbflush.c             | 216 +++++++++++++++++++++++++++
 11 files changed, 404 insertions(+), 161 deletions(-)
 create mode 100644 arch/riscv/mm/context.c
 create mode 100644 arch/riscv/mm/tlbflush.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
