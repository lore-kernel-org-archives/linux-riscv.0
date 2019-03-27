Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349D0C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 00:41:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B072075E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 00:41:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y/2tiEF2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="T89AJ91S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00B072075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJv05MyYlKd/yL3BWQaKirV50P4rICQKYQKfipoa7VM=; b=Y/2tiEF2xVkqmY
	ExDkvETKyqK8D2d3MvDjLFNAKn1RDXYCd5KBpRG5T8+RSRxfEKbT2cX4BmqMxS/cWIZy/YLVqYdll
	s9+hpo+NSKOlEt03C7XQy7fYBg0IiwHX9trSv6DTbIQ2T73XIF2/X3GCvpr3BeVApzpjJm70LT8pI
	xuqBxsLYuHMon5xvJVDpGKgBukWQuCKT3sxflLvrZPDT4XGLuSXPicaVme7iNGJK8NB/CvwSj+JMD
	Y0ePSFtKjGv/6QJea5BUF8khmy6Hipyc2dKsW7rd91Nvl+hBtXj7A74EZ7/4CGtzHD4fl2XeTK6x7
	haB5qJZhUbPY3GYoeyog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8wdU-00066U-Tu; Wed, 27 Mar 2019 00:41:44 +0000
Received: from mail-eopbgr100104.outbound.protection.outlook.com
 ([40.107.10.104] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8wdQ-0005xc-66
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 00:41:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+eVrWMaM5mTpfFVDgyTw78SxAv+JfJ1oiZz/MdJ5S4=;
 b=T89AJ91SGfeHo70RN1Zez9wueqf3xjwFSUwirYBCtjNF+yUtiNjGXh1lVPF/+nEaYM4VOAG9dieMvEF6JfzrpD8KBWdZx/ascHpAdNmy65MEGNqlOx7YzCjR1Wv5yToXuIs6K/lc9lEfsDxjINSeasWbNlGJs418mnV/NsAnhA4=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0880.GBRP265.PROD.OUTLOOK.COM (20.176.144.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Wed, 27 Mar 2019 00:41:30 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1730.019; Wed, 27 Mar 2019
 00:41:30 +0000
From: Gary Guo <gary@garyguo.net>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v4 5/5] riscv: implement IPI-based remote TLB shootdown
Thread-Topic: [PATCH v4 5/5] riscv: implement IPI-based remote TLB shootdown
Thread-Index: AQHU5DXRggKhRQnKDU+ZIEb8FqarGw==
Date: Wed, 27 Mar 2019 00:41:30 +0000
Message-ID: <d1c980f2e49192c7cb2ddd4f3e4af577d1eaf539.1553647082.git.gary@garyguo.net>
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
x-ms-office365-filtering-correlation-id: 06ea7b16-ca78-4416-a7aa-08d6b24cf3dc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0880; 
x-ms-traffictypediagnostic: LO2P265MB0880:
x-microsoft-antispam-prvs: <LO2P265MB0880F0BFA109C191F80C9365D6580@LO2P265MB0880.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39830400003)(376002)(346002)(366004)(396003)(136003)(189003)(199004)(2616005)(36756003)(110136005)(97736004)(68736007)(256004)(46003)(54906003)(316002)(53936002)(486006)(6512007)(11346002)(476003)(446003)(2906002)(71190400001)(8936002)(50226002)(71200400001)(6436002)(2171002)(6116002)(81166006)(81156014)(8676002)(7736002)(305945005)(52116002)(76176011)(6506007)(99286004)(102836004)(386003)(5660300002)(186003)(25786009)(4326008)(118296001)(86362001)(106356001)(508600001)(105586002)(14454004)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0880;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WYUMCY7oLJIuOihA8BMGiqOtn1Xtdut1iqBtWlK8QUgNKUVXkxAkR1YeII+jU83WC/eCStw21GhhYq+SF7Cl3d0MCRx0WbWq6lbitJc7gCot5ttpXpNcJVGZFXvx85/2qf3WJLkoVEmmAfNl2eZXdVK3aws9dF0V59vC/pDLa/Tktn4BIidnaIPYNFPg2icckAfjoaBnVVoeU54FBWy3LW1BiNV8prZppzPKTCICePyptFRvH/J2om1f/PTZFPFW4pJVNcKr7tLxiqcLvhQfi0duEwiphZWCdCqZa9oCde5U7jsv/Uy2enpKK9fMo0tvy5oKSHrBaPBHqQmEH9KaMS5XEQ0oH9tydx4+Nh9cEvN7yUNqRVy8MVxIwxhCMzfWbfFlh5U10GwXTI89XGeJQv2KogAe5ilvzpuoKDeR2os=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ea7b16-ca78-4416-a7aa-08d6b24cf3dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 00:41:30.0268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_174140_273480_F0E81254 
X-CRM114-Status: GOOD (  12.96  )
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

This patch implements IPI-based remote TLB shootdown, which is useful
at this stage for testing because BBL/OpenSBI ignores operands of
sbi_remote_sfence_vma_asid and always perform a global TLB flush.
The SBI-based remote TLB shootdown can still be opt-in using boot
cmdline "tlbi_method=sbi".

Signed-off-by: Gary Guo <gary@garyguo.net>
Tested-by: Atish Patra <atish.patra@wdc.com>
---
 .../admin-guide/kernel-parameters.txt         |  5 +
 arch/riscv/mm/tlbflush.c                      | 99 +++++++++++++++++--
 2 files changed, 98 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 7a60edef09d2..afd34fa1db91 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4552,6 +4552,11 @@
 			flushed.
 			See arch/riscv/mm/tlbflush.c
 
+	tlbi_method=	[RV]
+			Format: { "sbi", "ipi" }
+			Default: "ipi"
+			Specify the method used to perform remote TLB shootdown.
+
 	tmem		[KNL,XEN]
 			Enable the Transcendent memory driver if built-in.
 
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 33083f48a936..ceee76f14a0a 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -72,19 +72,106 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 
 #ifdef CONFIG_SMP
 
+/*
+ * SBI has interfaces for remote TLB shootdown.  If there is no hardware
+ * remote TLB shootdown support, SBI perform IPIs itself instead.  Some SBI
+ * implementations may also ignore ASID and address ranges provided and do a
+ * full TLB flush instead.  In these cases we might want to do IPIs ourselves.
+ *
+ * This parameter allows the approach (IPI/SBI) to be specified using boot
+ * cmdline.
+ */
+static bool tlbi_ipi = true;
+
+static int __init setup_tlbi_method(char *str)
+{
+	if (strcmp(str, "ipi") == 0)
+		tlbi_ipi = true;
+	else if (strcmp(str, "sbi") == 0)
+		tlbi_ipi = false;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+early_param("tlbi_method", setup_tlbi_method);
+
+
+struct tlbi {
+	unsigned long start;
+	unsigned long size;
+	unsigned long asid;
+};
+
+static void ipi_remote_sfence_vma(void *info)
+{
+	struct tlbi *data = info;
+	unsigned long start = data->start;
+	unsigned long size = data->size;
+	unsigned long i;
+
+	if (size == SFENCE_VMA_FLUSH_ALL) {
+		local_flush_tlb_all();
+	}
+
+	for (i = 0; i < size; i += PAGE_SIZE) {
+		__asm__ __volatile__ ("sfence.vma %0"
+				      : : "r" (start + i)
+				      : "memory");
+	}
+}
+
+static void ipi_remote_sfence_vma_asid(void *info)
+{
+	struct tlbi *data = info;
+	unsigned long asid = data->asid;
+	unsigned long start = data->start;
+	unsigned long size = data->size;
+	unsigned long i;
+
+	if (size == SFENCE_VMA_FLUSH_ALL) {
+		__asm__ __volatile__ ("sfence.vma x0, %0"
+				      : : "r" (asid)
+				      : "memory");
+		return;
+	}
+
+	for (i = 0; i < size; i += PAGE_SIZE) {
+		__asm__ __volatile__ ("sfence.vma %0, %1"
+				      : : "r" (start + i), "r" (asid)
+				      : "memory");
+	}
+}
+
 static void remote_sfence_vma(unsigned long start, unsigned long size)
 {
-	sbi_remote_sfence_vma(NULL, start, size);
+	if (tlbi_ipi) {
+		struct tlbi info = {
+			.start = start,
+			.size = size,
+		};
+		on_each_cpu(ipi_remote_sfence_vma, &info, 1);
+	} else
+		sbi_remote_sfence_vma(NULL, start, size);
 }
 
 static void remote_sfence_vma_asid(cpumask_t *mask, unsigned long start,
 				   unsigned long size, unsigned long asid)
 {
-	cpumask_t hmask;
-
-	cpumask_clear(&hmask);
-	riscv_cpuid_to_hartid_mask(mask, &hmask);
-	sbi_remote_sfence_vma_asid(hmask.bits, start, size, asid);
+	if (tlbi_ipi) {
+		struct tlbi info = {
+			.start = start,
+			.size = size,
+			.asid = asid,
+		};
+		on_each_cpu_mask(mask, ipi_remote_sfence_vma_asid, &info, 1);
+	} else {
+		cpumask_t hmask;
+
+		cpumask_clear(&hmask);
+		riscv_cpuid_to_hartid_mask(mask, &hmask);
+		sbi_remote_sfence_vma_asid(hmask.bits, start, size, asid);
+	}
 }
 
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
