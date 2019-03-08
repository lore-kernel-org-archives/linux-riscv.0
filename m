Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MISSING_HEADERS,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3F6C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 18:40:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D49C20684
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 18:40:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ig09jnoe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="PH1OO1UD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D49C20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYgdteB8wkiXaJiMQi5t5mOqH1JZtz6ppZjYejsgdmk=; b=ig09jnoeC0Fqgw
	C28DF8zAY6tqpUMbLZDrZGUhzTjB70yqiJ3E/xvLYBgRGYKdgAtdb0ebWl1w+DANHQRSCL0p9badg
	+mVfTRRWItTAPJguI8nVH2weO/8+mqzwFIIXSaIXjx2sJNBi6uxmmsaqVR+BRHASdKoMFt6bVreyx
	iKLzJAVVviRvNALmL3TnczKmsEnCCDk/2RRCZd4zmT8hq304Yio40ndQQIrw7wfaDEGVnoL7eNJiI
	cAVTonBPRqTzWhGSIjijnLrEzygnPha3fcJQ7u9kYJxlPjI7aWaEma7LdKFhKj7mlNM9wjqk1KIGo
	CaZHLOKp/MA+E5k+8lTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2KQR-0003r7-SV; Fri, 08 Mar 2019 18:40:55 +0000
Received: from mail-eopbgr100132.outbound.protection.outlook.com
 ([40.107.10.132] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2KQO-0003oy-Vv
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 18:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TMRCRkZlWDb5DgG3a/IFQ4jS6pMxwpHwOa3rVRdYik=;
 b=PH1OO1UD3Fb1R7NF9DyXhmOSs9reXKttMA+9FEktBQcKZZRJiUq+M1IXkzpi5fvTeOH7XtMVb4XxiCPmA+bazhVmYqSXmWuc4pZ9aKU70oqmYOU1mVzcwJIeyOWzWE4bYQDOrmLRuBfYb2+U7cTxq3NQ9pvHQIrFfsZkZoqCZ8E=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB1277.GBRP265.PROD.OUTLOOK.COM (20.176.140.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.19; Fri, 8 Mar 2019 18:40:49 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1686.019; Fri, 8 Mar 2019
 18:40:49 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH v2 1/4] riscv: move flush_icache_{all,mm} to cacheflush.c
Thread-Topic: [PATCH v2 1/4] riscv: move flush_icache_{all, mm} to cacheflush.c
Thread-Index: AQHU1d5uSE1MyRE3LEG58+Wg47x8VA==
Date: Fri, 8 Mar 2019 18:40:41 +0000
Message-ID: <e6c967768ec47519591a61a94eb4d53a5c23807c.1552069700.git.gary@garyguo.net>
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
x-ms-office365-filtering-correlation-id: 18241572-58b6-49f3-e73a-08d6a3f5909d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB1277; 
x-ms-traffictypediagnostic: LO2P265MB1277:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; LO2P265MB1277;
 23:DbickJHXsMc8vStxKBB2aE6bIoj9Gwy8SsKR3H2?=
 =?iso-8859-1?Q?dHhtSzlb2w8fehT08KDG1LVGm/PbzpSOE79yF3yvankpHBVa8piRkqS2Hf?=
 =?iso-8859-1?Q?gVkCd92zISJoqGGXDBsXrGjPV1NFtCIY5qSBNrV70PcAGPFA/Au528SZLI?=
 =?iso-8859-1?Q?v8AFGTl/B9Yg3FWT/+twns/JGz/ibRenfvaBqkSUhEujpWSb67W2L+J4fM?=
 =?iso-8859-1?Q?SF0+c9rPi4+F0uFu5APOe45zWzFWayvMVPM/XHWXNrfp+CiLtt/Og1iyG4?=
 =?iso-8859-1?Q?Cv3fBbqTZpRaUykbfdpqBH1QqrPTv4vD4tqAq/qDn084Eel7AvBaO9ZKJ5?=
 =?iso-8859-1?Q?cZY2mgtuiPJ1HmvxSA3C66WfTAQOwJ3aUjO/x+M7B3w+A3FHjBEelC2II4?=
 =?iso-8859-1?Q?PquUujyhFpa8+4w7EltHC2Ih57+1skXz3eWKiYG5mcf5Oi6FH0gCfWPJu6?=
 =?iso-8859-1?Q?870uqdbmw2o4vD1//OY8DsAHXelT7sgdApfgARrAqSVDHtGS5v5+OzGwoI?=
 =?iso-8859-1?Q?xxxAWNLCoxraFAi+lpmTIy6GwrH9Cdz4fU9QKvwIEh4Xzxmko0M0OQJ6NC?=
 =?iso-8859-1?Q?JHyxl+VLVUB38ZMlCy5lWtN5JczHESYCd2YXL9SryfHeaKAZi8MUBiar/E?=
 =?iso-8859-1?Q?ZV2Zbvr/lnwWtn/jxwsSpwPHkz9P2hPfNVdSUo8ZCXSxNXVtIVU5RX687D?=
 =?iso-8859-1?Q?SHagANDRy4tl2CxreKCIaET1Pwdyeavzd3rYvwmfpbfFHBG1LoRhfuSVkR?=
 =?iso-8859-1?Q?gnK38ZGOq+7hZ3Icz3bmZa0jGfPuyEB5zxjMFyF8Z7U2EHDnV5upkx50cL?=
 =?iso-8859-1?Q?oEsvMokaWlI9gjiPHkkFpsETqqOumhrl6KheTj41MwjRGjA9S+NhwdnSXi?=
 =?iso-8859-1?Q?ZZiymL9o6xkV9s0I3v/9kCv93Y3Yslu/Vwous32qMJiqmk52jvZgZcQqAn?=
 =?iso-8859-1?Q?gziOpUJCRIjhM+SmgPn2d1+oOAPk1oKN3ssZn5X5XNQGTHCUM35j9X/s37?=
 =?iso-8859-1?Q?tkmEUZO/ej16LYt/P7FnDfDYhrYVt/A4GCd5gCKr059bxNd8pXaB0ufOLi?=
 =?iso-8859-1?Q?vDP/iMOj7g/niRz6s4nPlJUyNT/qxXH2gtEAXveV+Hle9lm6QbsywjCOFT?=
 =?iso-8859-1?Q?PKcfKM3XSwZa/sSBzlGojUgK/BiR4WUI/c3Ujb36G3TjmMHMGeL98tV1HO?=
 =?iso-8859-1?Q?Pm+QROVKPxGFzE7JCCsH5mqcWGKYkf0/ZiK3up7POfPCYFdCIWNvZd8bqc?=
 =?iso-8859-1?Q?Gymnmal2SauO2aE6tpZVEfYRTUXa5P8g1lIAm+gtEsU1aj3CjMDOMV1YfS?=
 =?iso-8859-1?Q?DGot9Co9QzykvoojwhTUOMXTpQpCzZ3rz7t2C42Mxp0Tw=3D=3D?=
x-microsoft-antispam-prvs: <LO2P265MB1277CA5448A9AE42F285BF0CD64D0@LO2P265MB1277.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0970508454
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39830400003)(396003)(376002)(346002)(199004)(189003)(81166006)(8676002)(2616005)(305945005)(446003)(186003)(76176011)(97736004)(508600001)(1671002)(2906002)(68736007)(59246006)(14454004)(7736002)(6116002)(71200400001)(6506007)(102836004)(256004)(386003)(6666004)(36756003)(8936002)(14444005)(81156014)(118296001)(486006)(99286004)(86362001)(6486002)(476003)(5660300002)(50226002)(71190400001)(54906003)(53936002)(25786009)(105586002)(316002)(4326008)(6512007)(52116002)(6436002)(109986005)(46003)(107886003)(11346002)(106356001)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1277;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kKIyMCCX3wuFHOeYj2Jo6X7pCK+bNcTY5e2n09q1ZG43m673YquUHVFacYjbZl7NKgZQ0p3F0AHmO3GxXuylyiIdRXfMoRtwh65WuckvZTjs1+Pmwn1nxZNx5gy1USRHCPLfsfmT0vChmTzbbFA1rEAk11WtyCw/xQT00BE6NBmjA5DM0PgKfhhsH/4I3W7veT0dYz8Ii3mnQpRK/oHrlwFKKCpxYWgmxCLJNRhsxBOTmyCw7Ho9tEXUarqyTXOyqC+HzVI/jeMq1hA1PgkOMpYjt0+iNueB6OnGtFtfrhhLZ2rDQb8Xl1SKMof97L3VIwsWafySKTww4oMobW989U5adl2lLlRDL2g2SeADOitbS/9POeIYjQSEWa71iDY3ChlPA6WZdwzkmX+TJmnOlDR3aLLJ9NHpOoZHLsnFBQQ=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 18241572-58b6-49f3-e73a-08d6a3f5909d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2019 18:40:41.1868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_104053_025745_334A94A1 
X-CRM114-Status: GOOD (  15.42  )
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

Currently, flush_icache_all is macro-expanded into a SBI call, yet no
asm/sbi.h is included in asm/cacheflush.h. This could be moved to
mm/cacheflush.c instead (SBI call will dominate performance-wise and
there is no worry to not have it inlined.

Currently, flush_icache_mm stays in kernel/smp.c, which looks like a
hack to prevent it from being compiled when CONFIG_SMP=n. It should
also be in mm/cacheflush.c.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 arch/riscv/include/asm/cacheflush.h |  2 +-
 arch/riscv/kernel/smp.c             | 49 -----------------------
 arch/riscv/mm/cacheflush.c          | 61 +++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 50 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 8f13074413a7..1f4ba68ab9aa 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -47,7 +47,7 @@ static inline void flush_dcache_page(struct page *page)
 
 #else /* CONFIG_SMP */
 
-#define flush_icache_all() sbi_remote_fence_i(NULL)
+void flush_icache_all(void);
 void flush_icache_mm(struct mm_struct *mm, bool local);
 
 #endif /* CONFIG_SMP */
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 57b1383e5ef7..f066344aaf42 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -162,52 +162,3 @@ void smp_send_reschedule(int cpu)
 	send_ipi_message(cpumask_of(cpu), IPI_RESCHEDULE);
 }
 
-/*
- * Performs an icache flush for the given MM context.  RISC-V has no direct
- * mechanism for instruction cache shoot downs, so instead we send an IPI that
- * informs the remote harts they need to flush their local instruction caches.
- * To avoid pathologically slow behavior in a common case (a bunch of
- * single-hart processes on a many-hart machine, ie 'make -j') we avoid the
- * IPIs for harts that are not currently executing a MM context and instead
- * schedule a deferred local instruction cache flush to be performed before
- * execution resumes on each hart.
- */
-void flush_icache_mm(struct mm_struct *mm, bool local)
-{
-	unsigned int cpu;
-	cpumask_t others, hmask, *mask;
-
-	preempt_disable();
-
-	/* Mark every hart's icache as needing a flush for this MM. */
-	mask = &mm->context.icache_stale_mask;
-	cpumask_setall(mask);
-	/* Flush this hart's I$ now, and mark it as flushed. */
-	cpu = smp_processor_id();
-	cpumask_clear_cpu(cpu, mask);
-	local_flush_icache_all();
-
-	/*
-	 * Flush the I$ of other harts concurrently executing, and mark them as
-	 * flushed.
-	 */
-	cpumask_andnot(&others, mm_cpumask(mm), cpumask_of(cpu));
-	local |= cpumask_empty(&others);
-	if (mm != current->active_mm || !local) {
-		cpumask_clear(&hmask);
-		riscv_cpuid_to_hartid_mask(&others, &hmask);
-		sbi_remote_fence_i(hmask.bits);
-	} else {
-		/*
-		 * It's assumed that at least one strongly ordered operation is
-		 * performed on this hart between setting a hart's cpumask bit
-		 * and scheduling this MM context on that hart.  Sending an SBI
-		 * remote message will do this, but in the case where no
-		 * messages are sent we still need to order this hart's writes
-		 * with flush_icache_deferred().
-		 */
-		smp_mb();
-	}
-
-	preempt_enable();
-}
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 498c0a0814fe..497b7d07af0c 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -14,6 +14,67 @@
 #include <asm/pgtable.h>
 #include <asm/cacheflush.h>
 
+#ifdef CONFIG_SMP
+
+#include <asm/sbi.h>
+
+void flush_icache_all(void)
+{
+	sbi_remote_fence_i(NULL);
+}
+
+/*
+ * Performs an icache flush for the given MM context.  RISC-V has no direct
+ * mechanism for instruction cache shoot downs, so instead we send an IPI that
+ * informs the remote harts they need to flush their local instruction caches.
+ * To avoid pathologically slow behavior in a common case (a bunch of
+ * single-hart processes on a many-hart machine, ie 'make -j') we avoid the
+ * IPIs for harts that are not currently executing a MM context and instead
+ * schedule a deferred local instruction cache flush to be performed before
+ * execution resumes on each hart.
+ */
+void flush_icache_mm(struct mm_struct *mm, bool local)
+{
+	unsigned int cpu;
+	cpumask_t others, hmask, *mask;
+
+	preempt_disable();
+
+	/* Mark every hart's icache as needing a flush for this MM. */
+	mask = &mm->context.icache_stale_mask;
+	cpumask_setall(mask);
+	/* Flush this hart's I$ now, and mark it as flushed. */
+	cpu = smp_processor_id();
+	cpumask_clear_cpu(cpu, mask);
+	local_flush_icache_all();
+
+	/*
+	 * Flush the I$ of other harts concurrently executing, and mark them as
+	 * flushed.
+	 */
+	cpumask_andnot(&others, mm_cpumask(mm), cpumask_of(cpu));
+	local |= cpumask_empty(&others);
+	if (mm != current->active_mm || !local) {
+		cpumask_clear(&hmask);
+		riscv_cpuid_to_hartid_mask(&others, &hmask);
+		sbi_remote_fence_i(hmask.bits);
+	} else {
+		/*
+		 * It's assumed that at least one strongly ordered operation is
+		 * performed on this hart between setting a hart's cpumask bit
+		 * and scheduling this MM context on that hart.  Sending an SBI
+		 * remote message will do this, but in the case where no
+		 * messages are sent we still need to order this hart's writes
+		 * with flush_icache_deferred().
+		 */
+		smp_mb();
+	}
+
+	preempt_enable();
+}
+
+#endif /* CONFIG_SMP */
+
 void flush_icache_pte(pte_t pte)
 {
 	struct page *page = pte_page(pte);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
