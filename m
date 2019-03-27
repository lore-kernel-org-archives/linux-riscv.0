Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F36C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 00:41:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C2672075E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 00:41:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="phzP7j1m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="EerZPSfg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C2672075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4CfOCzXb1Rd+8eMJP/0oBFKupzO96cYXeqb5Hy/oZKM=; b=phzP7j1mCEeGZ6
	AcbWZExt+fBqO6gsj+qs39EHjGq2FLNK6tPhqQWdAtB4rRWQ8TjSjXU7HP4+c6s5Y2Tpi8i0oHXPj
	oBjWy6/UZNPsP9ly3tjwbkeBmpVeQUz+Zw7MSYKHznX+kt8iD7b+qQ7WXSE4+fHeDL1wFFwW23ha1
	Xgi4Ls3CH8YrjzERo45UYNZstwq9JydxUktzvQ6Qr5nglRjCWU88ieUaJmsnEBcIqQpxRArBRHS8U
	8ESnWWWamKLMCEjtcX99bc+gb1AFFnFgCMFLVHlEi6h2YY65MqS+bdP94oG9EAVh3OZ4PZ79o8LJ0
	aDNwJYMU5JOVLdH1Nadw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8wdO-0005yd-GY; Wed, 27 Mar 2019 00:41:38 +0000
Received: from mail-eopbgr110103.outbound.protection.outlook.com
 ([40.107.11.103] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8wdF-0005wy-Ji
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 00:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFbdLP40k6MQbWFNqI2/Ns+tgctv+EKS0O8hQRkVxNo=;
 b=EerZPSfglrBfWk/9IxThYxLCkSbpcPhlXz+KnlOo3TE+8c/LwW9KUHUK5jUJJyl2pu/IR964ljfX8+1geViDNaXYcanjPZkJzwF6K4AUj2DhTeNR6lx/PVT2azvZ37BGJe1CjlZuNao/fEr+bjB0FmBIGklkc+eLSXQPJPD/eVs=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0880.GBRP265.PROD.OUTLOOK.COM (20.176.144.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Wed, 27 Mar 2019 00:41:11 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1730.019; Wed, 27 Mar 2019
 00:41:11 +0000
From: Gary Guo <gary@garyguo.net>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v4 0/5] TLB/I$ flush cleanups and improvements
Thread-Topic: [PATCH v4 0/5] TLB/I$ flush cleanups and improvements
Thread-Index: AQHU5DXGkBGe+BzwgEqkgu76Zq+y5A==
Date: Wed, 27 Mar 2019 00:41:11 +0000
Message-ID: <cover.1553647082.git.gary@garyguo.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0223.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::19) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d158459-1632-494f-e5fb-08d6b24ce8cc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0880; 
x-ms-traffictypediagnostic: LO2P265MB0880:
x-microsoft-antispam-prvs: <LO2P265MB0880706C96A6BED4CD6EB759D6580@LO2P265MB0880.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39830400003)(376002)(346002)(366004)(396003)(136003)(189003)(199004)(2616005)(36756003)(110136005)(97736004)(68736007)(256004)(46003)(54906003)(316002)(53936002)(486006)(6512007)(476003)(2906002)(71190400001)(8936002)(50226002)(71200400001)(6436002)(2171002)(6116002)(81166006)(81156014)(8676002)(7736002)(305945005)(52116002)(6506007)(99286004)(102836004)(386003)(5660300002)(186003)(25786009)(4326008)(86362001)(106356001)(508600001)(105586002)(14454004)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0880;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: t2Zx2zt99kMEpDSoF0xHhs67D5S1EuVsyTOiFDSes8M3gRvCoDtnGibiSfyWZOMtp9XhLBXKyNxEPOz7KYpYfxYWxf5Ws/L4IvXFq0cLK4Wb6IZExPPUyutlGpItpNKTYv25NxYUWRG4m1tdbi1sat82aOm/779ZL1CslY1uL49/Q/qs45u9p4f2+5MgxDkfi6zjO0bRedXS+hmcKlEAxpeIgEgwzAMzvRqaqC8WcoFw1dsRXevYi43pMHmiHCMk9Ts7xOCYyPPJjhgxPpxdxzQNttByBVzF/v0pburzRMmy8aEjOf55TooOCjEWQzym1p1eroOkeHj/qBv81u/rZwvHpV0LiW+YlBRLfTHd4MmpgYVbwgHB3JAxPeTYEpfTGJbWx2MT0EiV87DOUCDUQECT+8hgqqWgfUlNcqCdVfY=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d158459-1632-494f-e5fb-08d6b24ce8cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 00:41:11.6607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_174129_645868_706825B5 
X-CRM114-Status: UNSURE (   8.95  )
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
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Gary Guo <gary@garyguo.net>

This is the v4 of the general TLB/I$ flush improvement series.
I still have tlbi_method=ipi being the default as opposed to what
Atish suggests, as:
* There are still usage of BBL in the wild
* OpenSBI's support isn't made into stable yet.
* OpenSBI's support on the dev branch has some racing issues yet to resolve.

Once most SBIs used in the wild can handle remote shootdown properly we can
the submit another patch to change the default value to tlbi_method=sbi again.

This patches does:
1. Move long and expensive functions aways from header files.
2. Fix missing arguments for SBI calls.
3. Performance improvements for TLB flush.
4. Implement IPI-based remote shootdown in case the SBI ignores ASID and
   vaddr operands.

Changes since v3:
 - Document tlbi_max_ops and tlbi_method in kernel-parameter.txt
 - Split IPI-based shootdown implementation into its own commit

Changes since v2:
 - Replace __setup with early_param
 - Rebase on top of for-next

Changes since v1:
 - Use kernel boot parameters instead of Kconfig
 - Style fixes

Gary Guo (5):
  riscv: move flush_icache_{all,mm} to cacheflush.c
  riscv: move switch_mm to its own file
  riscv: fix sbi_remote_sfence_vma{,_asid}.
  riscv: rewrite tlb flush for performance
  riscv: implement IPI-based remote TLB shootdown

 .../admin-guide/kernel-parameters.rst         |   1 +
 .../admin-guide/kernel-parameters.txt         |  13 ++
 arch/riscv/include/asm/cacheflush.h           |   2 +-
 arch/riscv/include/asm/mmu_context.h          |  59 +----
 arch/riscv/include/asm/pgtable.h              |   2 +-
 arch/riscv/include/asm/sbi.h                  |  19 +-
 arch/riscv/include/asm/tlbflush.h             |  76 +++----
 arch/riscv/kernel/smp.c                       |  49 ----
 arch/riscv/mm/Makefile                        |   2 +
 arch/riscv/mm/cacheflush.c                    |  61 +++++
 arch/riscv/mm/context.c                       |  77 +++++++
 arch/riscv/mm/init.c                          |   2 +-
 arch/riscv/mm/tlbflush.c                      | 215 ++++++++++++++++++
 13 files changed, 417 insertions(+), 161 deletions(-)
 create mode 100644 arch/riscv/mm/context.c
 create mode 100644 arch/riscv/mm/tlbflush.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
