Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MISSING_HEADERS,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F8AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 18:41:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3B7620684
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 18:41:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BrB2foAY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="v5sUBMiw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3B7620684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdiZekw2Au2SmSabFnh60eocFlGSmhjqygZjmsFMScU=; b=BrB2foAYPsSZsf
	w/nv0BQi5P/GVKFxeP6kvapbNsQu+sVOx+0JQbVBX3gr2afeEITJ1jS/BQV+m/9MGjXgHOkqa262r
	PhKzpJkNxpqJv9JSuu8vd2jSji9KkTLAFohEB2b3gJ3bXfsob/Bg9UubrKDWhpgP3PoYzoVgyGscn
	yCe5HsLMc87bkSYjXsjXcdzeeksVHfvHwLweal4axy/o80/ZoonILdfQT0RKL1iv771C06OojJpX9
	/5/OpcQL2dvlC2H/wBPAMeOEONadNZzx3LPhJ1Rzk3rcTEWNbdkFNNW9qh2x9qrEKIOoRw08AARpr
	LBReTCnXXer0c2ZWKUjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2KQW-0003wu-IU; Fri, 08 Mar 2019 18:41:00 +0000
Received: from mail-eopbgr100132.outbound.protection.outlook.com
 ([40.107.10.132] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2KQT-0003oy-6J
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 18:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj/uHTSPRMiIS73g46NB5MYWGGCzJXJJvWiKMnQXqts=;
 b=v5sUBMiwewO5cutV0wwXmViU26mkHVTwqEpQmdVBW8qd9TEo2BsgM+CwSPlG4ep6/L4ZP/COuM/FPZXYuT6rrIEgo3OIpXJaRnr/l9B6js5gxpaezvQf3Aa/JjG7BoXi72ayh5BLu3XpSnr9dHPVzawlyKqOu07qhON/6bsLI0o=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB1277.GBRP265.PROD.OUTLOOK.COM (20.176.140.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.19; Fri, 8 Mar 2019 18:40:51 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1686.019; Fri, 8 Mar 2019
 18:40:51 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH v2 3/4] riscv: fix sbi_remote_sfence_vma{,_asid}.
Thread-Topic: [PATCH v2 3/4] riscv: fix sbi_remote_sfence_vma{,_asid}.
Thread-Index: AQHU1d5u4xRTm7jXMEGRowDv8gG2sQ==
Date: Fri, 8 Mar 2019 18:40:41 +0000
Message-ID: <9daacfb1af0b5429c384b00953018102cff4b8e6.1552069700.git.gary@garyguo.net>
References: <cover.1552069700.git.gary@garyguo.net>
In-Reply-To: <cover.1552069700.git.gary@garyguo.net>
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
x-ms-office365-filtering-correlation-id: d14a50b3-1607-4024-e772-08d6a3f59136
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB1277; 
x-ms-traffictypediagnostic: LO2P265MB1277:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; LO2P265MB1277;
 23:zt94KkrlqLeo+/y5S3Taj749Op3jei8PCnbN1KJ?=
 =?iso-8859-1?Q?Od1mT5xmSe/8eZ4UDRt6ZNEDqJYJwlJV/aGzy/VPBQ8Ojs1cIUGG1sLv6f?=
 =?iso-8859-1?Q?VN6yItnZJ2sTxgbougnh3gBmpSW7in0E0l58yavw9OGi8ASzodnmHTbV2o?=
 =?iso-8859-1?Q?rGO8HgS3WxoUFDv7H+ndigvL6Cp/SgoczgGsTpWy+VOTXOshBoE4YPOOyO?=
 =?iso-8859-1?Q?ihcSrewzIyFOXyd/ejhZ1nKrumJd2tuZ34euoPqM5VXF3szMltzUsiElT1?=
 =?iso-8859-1?Q?ORohPdRuJCMmwI+SaYsH8IgT0RNWh4bsKezP2Xb93yY4+3TSWp8cE4OICs?=
 =?iso-8859-1?Q?JfN9MpHN3WNoJdLM5YWLQeK5pcRsN/bgvJnYfcndQIB9TcHJ1ogtyUd1CS?=
 =?iso-8859-1?Q?F7W0UC5+1L5UvK8JYKbHQEi3JvzIsXRi4prmdOZ9LZCKTB7u1ASKb5OQS8?=
 =?iso-8859-1?Q?B+c1oIKmM6k3ph7lX4KlOqqyXh13nCp2YWDPN0g51HRQdIBuFSGy/fRWal?=
 =?iso-8859-1?Q?60yp1GgLpnP7s5LNiQuXnaSpnwsA5AX/zca7YLAbWtgIIqRigf1tCDso8B?=
 =?iso-8859-1?Q?jSz9ma5vthEAHNgI1fmmYbZBAqT9vtHkPRgyfC8S8WgQuwGz5YTeNwlvCz?=
 =?iso-8859-1?Q?4EoEQkxp7xr/FF//rGIRKrg5S7RJSYbaC4i9NbGjTErSimWZ2UWDxL3DFp?=
 =?iso-8859-1?Q?1jsiHwYBhi7dLm1+CmeYff6sP5xL8O2rEJlnDEzo4BXm2is1VhJ57J6euE?=
 =?iso-8859-1?Q?e9MYtSnOc3mLOWtzVmrdMROiKKhlu+ej20Hm+Qd2Ym/B3TDerAh3lnvO6H?=
 =?iso-8859-1?Q?eBTm40PHgao9tscYqc+poiayxwp2BODLU4CuZUYHwINKVJgJScS6cM77cu?=
 =?iso-8859-1?Q?9N90ZoZ9z56A3tpReAQz+H6bOXPAgE9W0LF93MQYB8AwzZJjDCgmwWXGLw?=
 =?iso-8859-1?Q?qZGB3DuUyUTjIjnUfazP2t9pCeztb9oky3XOYFnoYWxLM4cHnDJBFLb7UH?=
 =?iso-8859-1?Q?Ijalf6drVrBr0UaabKzkdQ5q0jjzGWbeROh1bkhxlIPdyYFIGhIzHoEkLf?=
 =?iso-8859-1?Q?G1qPyQi+ykDkLWOoSX+MutqDuh8ZRHzBIlBdys3PLu717FyxhOEYI2wnxu?=
 =?iso-8859-1?Q?5NKC2gxZJr1ydGA1sWjgVBC4xtmwY9e2rbgipMtfOAWBe+CXjYYJ+ikfdH?=
 =?iso-8859-1?Q?J7v2P2EhPgDJ8POMNjVVGJ7vm2Pfz8iRzG8oXF0hvxi9H7h0iPVdRA31j6?=
 =?iso-8859-1?Q?+qmmEMAZwOglyGHbO2xyQRNetMMTqFGyxkKO6OTDBMDOv1yhlGH5HLctzK?=
 =?iso-8859-1?Q?50=3D?=
x-microsoft-antispam-prvs: <LO2P265MB1277C54C6AB94AEA5CC09766D64D0@LO2P265MB1277.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0970508454
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39830400003)(396003)(376002)(346002)(199004)(189003)(81166006)(8676002)(2616005)(305945005)(446003)(186003)(76176011)(97736004)(508600001)(1671002)(2906002)(68736007)(59246006)(14454004)(7736002)(6116002)(71200400001)(6506007)(102836004)(256004)(386003)(6666004)(36756003)(8936002)(81156014)(118296001)(486006)(99286004)(86362001)(6486002)(476003)(5660300002)(50226002)(71190400001)(54906003)(53936002)(25786009)(105586002)(316002)(4326008)(6512007)(52116002)(6436002)(109986005)(46003)(107886003)(11346002)(106356001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1277;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +o3CJ4aXM45AjWOaV4rDW61+duoHuElUuoVaPCPCgQ5S2L2L494BC5BjMzZAG0MyR1r6+hin6SFGr3r8u348p4WmI7SR9wR7Qky8CH+UKATh92enWvYXsPegJjN6fP7SubHWh6cxJmk4Nfpd4utUsRlnsLNB8XdbBC400TsGdnoyZCXr7ctigzbUjj925QjwqLwHT8GyNhIHo/rw6RCXOQl4EanSdT1ApjsPt9ahPbwDMC4/Y4JFe1PYQqm7hgaPCND7A5QhF6zaWrlwpkxqn6B8MlRHmaCxPsX1auhseGtTUOYMvVRL9smxd8Hq/for02A9BSx0bgCKlQ4DuZerPtBCURo/szu9stVX62l0hGYy7PKJXktQa9RTJPVx+SNAMhYaasrniCnhVM4qz4nXomDe9XYERKdKUMITm+DQlZE=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d14a50b3-1607-4024-e772-08d6a3f59136
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2019 18:40:41.9834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_104057_525908_02391B29 
X-CRM114-Status: UNSURE (   9.38  )
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
