Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21279C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 00:41:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96CBE2075E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 00:41:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UXRV7yi9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="wgd2DmJB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96CBE2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdiZekw2Au2SmSabFnh60eocFlGSmhjqygZjmsFMScU=; b=UXRV7yi9egYS7q
	4oo0LCQ7gMUthTHXiHyJBjZIvmJ9uJFi4xELDUAV2ClQqGBAuXn/ZRhnhMQK1cZkbA2m/nOwJIVeC
	js8QXp6tzaHk1a/FdnOhj+rZIrPN0GaQo39NJy7qmMdnGTidHDsjgf9ygk2Pd5Mh8lFCimH9itPU2
	6iZNaQ+JD8zoeKk5H/NppsbGzokO4KRGvFZSaZROhE1ZopS6TYEzH+DYQeIrajhf7jfYipYst6GPK
	Iy0CKS3gXHqDKUJ+4Kqwn5oYvrEKB4crtG69f6jmj8Z62TwWC1OSkZ7szEdwKw1kyIEFB8QtyJclG
	lQvlKwW+Xa3K3sNWSHNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8wdS-00063B-Nz; Wed, 27 Mar 2019 00:41:42 +0000
Received: from mail-eopbgr100104.outbound.protection.outlook.com
 ([40.107.10.104] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8wdO-0005xc-B3
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 00:41:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj/uHTSPRMiIS73g46NB5MYWGGCzJXJJvWiKMnQXqts=;
 b=wgd2DmJBzyB4lZHduwFhTPGpXDRwa4ldFHSu+tdiauB/pU/gevAvinQMxvt6UAmtZL0amvTu4gJeUnw2fCgaTnw+nBTZ7LP/hPx9MAe0KZgdqJRODxlgY/WRQvD+Y3m6LphvgG/F+v5CRj/vMBBUOR7S3jTYhGh6g52xKq5brvc=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0880.GBRP265.PROD.OUTLOOK.COM (20.176.144.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Wed, 27 Mar 2019 00:41:29 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1730.019; Wed, 27 Mar 2019
 00:41:29 +0000
From: Gary Guo <gary@garyguo.net>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v4 3/5] riscv: fix sbi_remote_sfence_vma{,_asid}.
Thread-Topic: [PATCH v4 3/5] riscv: fix sbi_remote_sfence_vma{,_asid}.
Thread-Index: AQHU5DXRSs3Y+39Hgki2RidsB6GKvQ==
Date: Wed, 27 Mar 2019 00:41:29 +0000
Message-ID: <cdcce7a6e327c4b8b1949a1eb287f72a2d4fba9b.1553647082.git.gary@garyguo.net>
References: <cover.1553647082.git.gary@garyguo.net>
In-Reply-To: <cover.1553647082.git.gary@garyguo.net>
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
x-ms-office365-filtering-correlation-id: 6a68253c-7770-4824-de88-08d6b24cf382
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0880; 
x-ms-traffictypediagnostic: LO2P265MB0880:
x-microsoft-antispam-prvs: <LO2P265MB088023224A9F99FD159B8923D6580@LO2P265MB0880.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39830400003)(376002)(346002)(366004)(396003)(136003)(189003)(199004)(2616005)(36756003)(110136005)(97736004)(68736007)(256004)(46003)(54906003)(316002)(53936002)(486006)(6512007)(11346002)(476003)(446003)(2906002)(71190400001)(8936002)(50226002)(71200400001)(6436002)(2171002)(6116002)(81166006)(81156014)(8676002)(7736002)(305945005)(52116002)(76176011)(6506007)(99286004)(102836004)(386003)(5660300002)(186003)(25786009)(4326008)(118296001)(86362001)(106356001)(508600001)(105586002)(14454004)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0880;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MigSQp/1+43J6Vbc7PD2mtvuF3ZzfgU4mYzXSvX9K7WnLGK5LVxZ7oMNni1OihduqomKffrE84PRXzEb4JXiIFVuO0vAtCvfip1nnfojVUIRQoZ9liPTEzGIw62PQvL4bz0b9MTUqa3OGkAWjIsZnXg1eTf2+19DQ8VbBeqPxSCisHbKCXKvCiupFtBWWiuPL9Eekz8ODzpHQk+HxgmXOKOTbopbckJqPopK7JJ7MtWW785cZHvdtd3K3+J+AQy8mdLij3dJhTxgtV8k8ebRwWWE4IkfVWSyXqaPYucTSOAv3vMfTXCberVI/gWkSfeo9cWJPKscTvnIbiYEpb02nUWcSzLY7wlYk3P3caV1bAeGK4R98qBSIGT+p600rXvb0DRn6Xy8ZfrRYKr9dQZm6Jn7tIQ4LANGa4iN2cU/f1o=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a68253c-7770-4824-de88-08d6b24cf382
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 00:41:29.4123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_174138_378772_F5E1A1E5 
X-CRM114-Status: UNSURE (   8.75  )
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

Currently sbi_remote_sfence_vma{,_asid} does not pass their arguments
to SBI at all, which is semantically incorrect.

Neither BBL nor OpenSBI is using these arguments at the moment, and
they just do a global flush instead. However we still need to provide
correct arguments.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 arch/riscv/include/asm/sbi.h | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index b6bb10b92fe2..19f231615510 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -26,22 +26,27 @@
 #define SBI_REMOTE_SFENCE_VMA_ASID 7
 #define SBI_SHUTDOWN 8
 
-#define SBI_CALL(which, arg0, arg1, arg2) ({			\
+#define SBI_CALL(which, arg0, arg1, arg2, arg3) ({		\
 	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);	\
 	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);	\
 	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);	\
+	register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);	\
 	register uintptr_t a7 asm ("a7") = (uintptr_t)(which);	\
 	asm volatile ("ecall"					\
 		      : "+r" (a0)				\
-		      : "r" (a1), "r" (a2), "r" (a7)		\
+		      : "r" (a1), "r" (a2), "r" (a3), "r" (a7)	\
 		      : "memory");				\
 	a0;							\
 })
 
 /* Lazy implementations until SBI is finalized */
-#define SBI_CALL_0(which) SBI_CALL(which, 0, 0, 0)
-#define SBI_CALL_1(which, arg0) SBI_CALL(which, arg0, 0, 0)
-#define SBI_CALL_2(which, arg0, arg1) SBI_CALL(which, arg0, arg1, 0)
+#define SBI_CALL_0(which) SBI_CALL(which, 0, 0, 0, 0)
+#define SBI_CALL_1(which, arg0) SBI_CALL(which, arg0, 0, 0, 0)
+#define SBI_CALL_2(which, arg0, arg1) SBI_CALL(which, arg0, arg1, 0, 0)
+#define SBI_CALL_3(which, arg0, arg1, arg2) \
+		SBI_CALL(which, arg0, arg1, arg2, 0)
+#define SBI_CALL_4(which, arg0, arg1, arg2, arg3) \
+		SBI_CALL(which, arg0, arg1, arg2, arg3)
 
 static inline void sbi_console_putchar(int ch)
 {
@@ -86,7 +91,7 @@ static inline void sbi_remote_sfence_vma(const unsigned long *hart_mask,
 					 unsigned long start,
 					 unsigned long size)
 {
-	SBI_CALL_1(SBI_REMOTE_SFENCE_VMA, hart_mask);
+	SBI_CALL_3(SBI_REMOTE_SFENCE_VMA, hart_mask, start, size);
 }
 
 static inline void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
@@ -94,7 +99,7 @@ static inline void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
 					      unsigned long size,
 					      unsigned long asid)
 {
-	SBI_CALL_1(SBI_REMOTE_SFENCE_VMA_ASID, hart_mask);
+	SBI_CALL_4(SBI_REMOTE_SFENCE_VMA_ASID, hart_mask, start, size, asid);
 }
 
 #endif
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
