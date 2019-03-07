Return-Path: <SRS0=2IPI=RK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8F3C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2019 01:28:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38D1520663
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2019 01:28:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XRaCqDIQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="WwGHJCQe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38D1520663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YaBH44ASQMbppYwzn/LAJ7Sm6IaI0FoPk2wtDS3M5TQ=; b=XRaCqDIQQviUgK
	1LfBRijEzxvMFvEgs+AavJoDbWElOzdkFeSWltWmvzttV7j1hkJOhVi+GlIzSXFqAwW7bPadb4ts+
	57EytRgkt+P+MNNf+TKZSb1hZqcY7LVcbrF+2tg2mxhcEr9YJGnGD1D+qbyEHiAM06uepQAVTEv1E
	z6yk0Ikn0Am4KkDVYqILaACbtK4RUeIfT4cA8R5I5OMuWFM4+53LUlpwsMv32W5OkGMF3yujC7YN4
	tIdaZQsXHi10oqiPlBjmKSXGqYccJkNbATLHMetDgZtzN54bfKqChVe0DYKS71pNSjsdjTche0X5N
	tKf6pM5bMrMYZ0Qw0Vew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1hpG-00074d-7u; Thu, 07 Mar 2019 01:27:58 +0000
Received: from mail-eopbgr110111.outbound.protection.outlook.com
 ([40.107.11.111] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1hpD-000743-FQ
 for linux-riscv@lists.infradead.org; Thu, 07 Mar 2019 01:27:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CoHnj3x2YXXngvNzi7vlykrubgKuBpalz54LU5B5P0=;
 b=WwGHJCQeGh3Qj0o9cda0hoDrTx52ej7I2qEGTJ2Sx4nBlusz/CVRooHexVipmlYKdaT/FNzgSUaDNos7nCVhjnVpHi5sfqExVcR5b/hVoJIGtYTCrVtgCLIGlRV3OQDtkfDZsnxItYLslb+8qwReVbrBTCX5jc1eZT7zrQNiz1U=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB1742.GBRP265.PROD.OUTLOOK.COM (20.176.139.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.19; Thu, 7 Mar 2019 01:27:52 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::edd6:26d6:eea4:dfa9]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::edd6:26d6:eea4:dfa9%4]) with mapi id 15.20.1686.016; Thu, 7 Mar 2019
 01:27:52 +0000
From: Gary Guo <gary@garyguo.net>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: [PATCH 2/3] riscv: fix SBI call of sbi_remote_sfence_vma{,_asid}.
Thread-Topic: [PATCH 2/3] riscv: fix SBI call of sbi_remote_sfence_vma{,_asid}.
Thread-Index: AdTUhPYQhTRt9IdOTgye8auXO6Z/NQ==
Date: Thu, 7 Mar 2019 01:27:52 +0000
Message-ID: <LO2P265MB084728F9A60B2B52508179F0D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-originating-ip: [2001:470:6972:501:87a:d393:5800:ff8e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4aeb6aa3-86f4-4d34-01be-08d6a29c1e79
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB1742; 
x-ms-traffictypediagnostic: LO2P265MB1742:
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1; LO2P265MB1742;
 23:b2QxRam0Ehcu3+B4It5w1EbwcRcrptaN0Kb7mL2FI?=
 =?us-ascii?Q?zcjBQigbx0VqEnPOpa0l5fWyS/Nmg9TyGmDD2mLlDNEadGqQAHhKXOCNxiWp?=
 =?us-ascii?Q?2FWgLIxwxiHvjdUWEyjND8r89ZLvCauwZFhUQH7uW8WYj43WmKLQah6A++fa?=
 =?us-ascii?Q?q7xunlD1mMZ20T4xE3qDDKajv9wV0X+d8/CHxUiNPcZSaToBofQQf5bzLUxC?=
 =?us-ascii?Q?Kl0sxaJ4pmgBJVb445QPlXKpX9o4kpzk6Z2kpPd7DXkxd2vhu+zKwa77LYLO?=
 =?us-ascii?Q?YKlp7c734sYV9ByholOFdmEp6jLD8l/eMBb31BDAx4dNjp9ea3s+BaHBd64d?=
 =?us-ascii?Q?+OTxXTGjqp36BRRIBsJt2geMr+phwq3Xja7f8oXwalZrqKgnu2Sae4+cs7Hl?=
 =?us-ascii?Q?4TBwbmYDrc2D1kyB7KSyPLI2AmPP1y5HAtG495YfTaU6Qpj9wC4PgjvSWYz1?=
 =?us-ascii?Q?LEdXhcGTFfSjVJmci8xs+4dgqQNS0deyslO2lNU2zgVFkjtFHaBqCmmK3ozl?=
 =?us-ascii?Q?lGS/saDQfjQc1xXTUz5U4yBSvLWlLDMt0IM2tT+sXTT96YTN7gwxmKA8ykQO?=
 =?us-ascii?Q?3MUtCnAO4GxkI+uI0qEPUwXouBqLH3F46SLyqfYuSKlwQH0BRUX6/EC4vOd/?=
 =?us-ascii?Q?KcwAOfP8IqGJ+zW/ai2H2lJXc+FX5/1v5W6PMl7aJSTsKm3+wPAvnFIHqAgu?=
 =?us-ascii?Q?jyX6oIV8i/Riz1n6hfqU+5E44ZoeUsi6jMsIIljViEaQg0ZCbzSA7rYiHX5O?=
 =?us-ascii?Q?WFMmI6eMm9OumZr1UQjc1Oon5GSqU578ljbW3lZ764/IqYJ1VKtDVia2oJci?=
 =?us-ascii?Q?5d1k1QDnNNuP4U+mKvPzGrtp8WFkeP/4+ask5nucKCa2ypDVkd40Q93p8cPA?=
 =?us-ascii?Q?gsw9lEePR/aCKaP5ff6slBQ6RqPuUqbwsaeVUALivrySX7jVaASMfOy54Wsv?=
 =?us-ascii?Q?xYrZrN7HPGxWI4tysj4OrreCeoy+WI+xr3TCxUFXcmyHvFAs/MJekprBr2zs?=
 =?us-ascii?Q?jlC8JWS9wRv3o4vzAkSfkBx6PegFFT2M9vTcl9uBuuGMLeXgXKpDyg2mbtxV?=
 =?us-ascii?Q?RpF0Vcz7PK6bNHhlKotVHXCD+TpFrZA6cOWce1Dy1mV0qrnNBRroJ674X+bw?=
 =?us-ascii?Q?b4yRngZDQk=3D?=
x-microsoft-antispam-prvs: <LO2P265MB174283F35A0BF3A13C55D008D64C0@LO2P265MB1742.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 096943F07A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(136003)(346002)(396003)(39830400003)(199004)(189003)(256004)(105586002)(106356001)(99286004)(2351001)(9686003)(5640700003)(6436002)(53936002)(2906002)(508600001)(25786009)(74316002)(81156014)(305945005)(5660300002)(4326008)(81166006)(68736007)(7736002)(55016002)(86362001)(8936002)(7696005)(6916009)(71200400001)(54906003)(316002)(8676002)(71190400001)(46003)(476003)(6506007)(186003)(33656002)(14454004)(102836004)(486006)(97736004)(6116002)(2501003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1742;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JvB55I7qGRVZ+fJZDqQWXSKHeD1PPRCSGyy3WJJlrByPOmqZ0EVT+Tt2kTQoWd2TRkc5dVS+0JIwjXx8v5zW8CaMzW9Hm729yFi3m39Gb8RW+75oao0nBYtMoDoq0b3CJmSBgwl4q6yTZrqui6QfbiGIRY40DoFiP4KDjot6+HxNOtGJD1lhNvDLhg/yBDrbDr+ctY/4XyvpfSkh8JbdJNYgiKjO4oG+qEyhPXDklNF/GI5ntctdUdIPSlycWiOf3LuQ5KCMKxpSZ4nG5WmjnxKFPJv6eeeePJAx7Us+srkEhsZHNqTC4aWWbIn8YhYWuBfdn524iDu6aXEECvUgd2q643/tQ5/VCXOg1CSohina5k6OcOVFJc3wJMqF4pf1FjL/XoK6MhLhPIy0hsm4BZSN74q48f/HU9D9ZJcuJvA=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aeb6aa3-86f4-4d34-01be-08d6a29c1e79
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2019 01:27:52.8427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1742
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_172755_517293_AD0F1484 
X-CRM114-Status: UNSURE (   8.53  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently sbi_remote_sfence_vma{,_asid} does not pass their arguments to SBI at
all, which is semantically incorrect.

Neither BBL nor OpenSBI is using these arguments at the moment, and they just
do a global flush instead. However we still need to provide correct arguments.

Signed-off-by: Xuan Guo <gary@garyguo.net>
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
