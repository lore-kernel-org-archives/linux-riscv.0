Return-Path: <SRS0=jXit=RM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MISSING_HEADERS,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BD0C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2019 14:52:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE1FC2081B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2019 14:52:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ErD6i0FS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Sx5DR1z/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE1FC2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdiZekw2Au2SmSabFnh60eocFlGSmhjqygZjmsFMScU=; b=ErD6i0FScGjMKb
	mX3/paqesVynKkUWukj7abcZYJ2XnAF89OhdX/OBtRBs9XlXP9GT63SP9IJKmwjpaT6EWodChwQA8
	Al3Hll0bhW3qU8+53eD2k15GllN3GMIQIrDSEpITQKNfXWOBFuxg40BPngwl5zmVh4GewiWbGPQm4
	D0G3/tbaMkeQLV9Nibxkpl5sA3+xUf2dPxe6mPs3ldxJiRkuIdegr3ANzSu2Tvwo4Biju77a6yysr
	5LN+qgjB1WKiad/a6tTknChMPgFn2AY9M+eCFZZ/y1f9CCC62dTdv1i71HrKrn4IS6hSMXIuQp5Ni
	iLujxqN7WxoGcX4sYqbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2dKk-0006GA-57; Sat, 09 Mar 2019 14:52:18 +0000
Received: from mail-eopbgr110109.outbound.protection.outlook.com
 ([40.107.11.109] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2dKh-00068V-38
 for linux-riscv@lists.infradead.org; Sat, 09 Mar 2019 14:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj/uHTSPRMiIS73g46NB5MYWGGCzJXJJvWiKMnQXqts=;
 b=Sx5DR1z/4Jc2f1sVl5nX9poZDx6FyyAfYeW05XmoNT/0lu0cBaPWVCLz0lqLCiBYTrtiFdaA6ePRDwRCp71qdVY2dmltQ9bD6OACJWTKENf7NIOiS83I2i3pExKMf2IHlMNGsLUKRF6eMyR61pHJJ7mZV9mQv0K4nNQaJm2YXx8=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0158.GBRP265.PROD.OUTLOOK.COM (10.166.98.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.18; Sat, 9 Mar 2019 14:52:05 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1686.021; Sat, 9 Mar 2019
 14:52:05 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH v3 3/4] riscv: fix sbi_remote_sfence_vma{,_asid}.
Thread-Topic: [PATCH v3 3/4] riscv: fix sbi_remote_sfence_vma{,_asid}.
Thread-Index: AQHU1oep0uclkkgrWE6ZQOO7bzDQbQ==
Date: Sat, 9 Mar 2019 14:52:04 +0000
Message-ID: <cdcce7a6e327c4b8b1949a1eb287f72a2d4fba9b.1552142593.git.gary@garyguo.net>
References: <cover.1552142593.git.gary@garyguo.net>
In-Reply-To: <cover.1552142593.git.gary@garyguo.net>
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
x-ms-office365-filtering-correlation-id: 648a48e1-bb04-4d86-79e0-08d6a49ecb7e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0158; 
x-ms-traffictypediagnostic: LO2P265MB0158:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; LO2P265MB0158;
 23:YcTOZE1yUY9ZXw48KhMugPQab7mnHmMmrNGPsxv?=
 =?iso-8859-1?Q?L7F7pMclrD23nqLaeRyXzrYzh0tjNAENzw8RBF5ImDmnWy3V7na2YmSJep?=
 =?iso-8859-1?Q?m0LcxHCuo5qvPk/tcVACsMXQb5J4pe4v4LpQWj7pmfddf9z6HoaVnpluOZ?=
 =?iso-8859-1?Q?EZx0mT5IZ5BmP4pgOIlaQ4sjqYOSMAFxQG1EaSPtP79lDF9hWhInySWj9x?=
 =?iso-8859-1?Q?I21LKD0HR0c2MoAjAjEbdQPWmes5xakYVom+ZYi+Pb3RKDUjSCFF2WoAA8?=
 =?iso-8859-1?Q?BmZt0A1ftM5IXp2AIXyGkWpnK8cEhFns7bs7oKkE2wgbAm6JUMzRfbLqlA?=
 =?iso-8859-1?Q?IkBZALGU5hgvXESjFXoWTOIUpEn84800tuspwFyvm8X7jaHPqJ1P8FbrZn?=
 =?iso-8859-1?Q?jeF5O8lz0AGzVWQeA0rQh9mSFcBEZ70PiPROlCLvXxW76UTSuoPEthKZhA?=
 =?iso-8859-1?Q?mZh4sRaUO5V9ejgVvlIshH023ahW8RRjigTVM4nuY+gwfDbWhSuGLK4WlO?=
 =?iso-8859-1?Q?b0hZ79oQS7SjJoe49D3E4Jr5WIL3r5IrAsy2rhR8pyzdxYBHqvUjPsTTak?=
 =?iso-8859-1?Q?7IdrqbEiw8M3NUU+NvdMe1rHufghNWZpx6bxtJdMejc6RiudZolj8+yfsV?=
 =?iso-8859-1?Q?hc2Nge3+ssXs2xLmyBIJ4Mcv+pWQULwoIZvTd5KBqGgkiSzTrJb8LKJSqs?=
 =?iso-8859-1?Q?DBADMNxWHyzBRDc/kN11P90Nj6d0f27yhVR9PYxMx+y8jfvyfFM66OP9gz?=
 =?iso-8859-1?Q?hF/zmIL5jikfFRsFxmuS1SVL40sRE272So4XAgXfRg2ctMgtg+/0eQqKV0?=
 =?iso-8859-1?Q?bSZeAUtSquQi37JHk6mqFkw8BdITmWZsqedf7iKa9MkS5tFmylmOA1Kfdh?=
 =?iso-8859-1?Q?mlSNakMsA3e/nn0LltSj23qEy71qv25gIyX7TfeSJQu1qz6iGXrUNcFntw?=
 =?iso-8859-1?Q?MzrUnnJVSF0qWlxmcIpvwmqewMU9kC4E8w8aSvh0W9np2j/9MO1Zk99aIr?=
 =?iso-8859-1?Q?nfEd5zBfTiriLDGJBM66BKtjXr5mBiqVqRiRA3W3eCpNvr6azinmzxdyAh?=
 =?iso-8859-1?Q?NKSoqn8eBDwJAiVfQUmtuVkYzJgoQWUDaMnEC87LPUw2hG9AJtM2fYxwzF?=
 =?iso-8859-1?Q?45NdJiM+nGTGPY9jcFc1wXXbK9NgNjwS3zksufYEL3xfTwRi88zwQ7RxrW?=
 =?iso-8859-1?Q?/t436X4JUVCYxww27yq8Ie8+d3SrPSybXZ8h0eGl9u95lkKKFHa5ngqkco?=
 =?iso-8859-1?Q?VXj/iPoC4MdK4KiQZ4z1QPu+Pps1blIEadjbF0g=3D=3D?=
x-microsoft-antispam-prvs: <LO2P265MB0158FCA35BC71955AF28FC4AD64E0@LO2P265MB0158.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0971922F40
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39830400003)(346002)(366004)(136003)(396003)(199004)(189003)(305945005)(53936002)(6116002)(8676002)(1671002)(102836004)(86362001)(508600001)(97736004)(52116002)(36756003)(14454004)(76176011)(2906002)(99286004)(386003)(6506007)(7736002)(25786009)(81156014)(81166006)(4326008)(6436002)(6486002)(6512007)(446003)(11346002)(118296001)(2616005)(476003)(105586002)(68736007)(106356001)(71200400001)(71190400001)(186003)(486006)(8936002)(50226002)(5660300002)(256004)(109986005)(107886003)(54906003)(59246006)(316002)(46003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0158;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e4/AKhbGWnVae9PZR8YUnn49RlUqwSsDyRlM5JribZ2B7uG0nHE34iUwpWljK4IyDavLVoTKbjWXAfNjCLob/Dfuy+Ji+OC5l17eT28KIKeXbM5gkJOHVejeSz1Qf52bd8QMnTWk/Lrwjw5Cs3upBZdZf5/nJs1zmKFiLzVGQnq1bsNwJcwlcM4se65EGyJfxLOYYWhfVx9WQIHnhcFuRe+Mwg70Mg+73MSEPYmlKaRexe4zWlcxM63AG3WLVyjCX3FLny03VejcR82eyrL3YyOp3ZpPmmBigKYLvOd4Pq2vUkFz5yj+Llkns30XZB3UyNCgkVF1y2gOPUDtcwu5BTy88twzsUX6lvx/X2R2vQg4v14fJ+aVNazQzbHo1wefz3wMiY0y45wn6DUcZne2AsmJHlh4PGwk2RYuOeMNGbg=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 648a48e1-bb04-4d86-79e0-08d6a49ecb7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2019 14:52:04.7276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190309_065215_138258_4C329350 
X-CRM114-Status: UNSURE (   9.02  )
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
