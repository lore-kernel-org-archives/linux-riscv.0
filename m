Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C54C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 01:34:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5E726112D
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 01:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5E726112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Be99Lh6u0a94ZXT4i8RtIVttN4ks7LcYSOJATYIxQTs=; b=eVp6h9J17m4Vc9
	JhDFv1XC04JuY7gNUdjXGf0KUCj+aqXsSq+PWSnfFcoblHhrQ2OjLKwDYjxtVJVQs8Hh1KtpeuJsP
	WLbtDjLPYaaKsN1qZQLPkbwasfJLQPvOB5b1x7ReLKT/GNl+PukYf86Ngo50SWXp2ivGZ2YExJuz9
	9vm4jsF71vt6ZYeqyMsk6iD3CsRSUiaeLOPoWavgm566V12AQw30nceZ9xS3xOeSvuIeeD0RMynS7
	mMxe3plkLcxgBIKaFCBVE/4jJCCaL96RkMkE3ghDowxAZrbLalsDhc/Mh4QW05TdcJBAWCpwR/an4
	awGBrz2B5ssSs+GcRo8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdjS9-009QY2-Ha; Fri, 22 Oct 2021 01:34:37 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdjS5-009QVi-UN
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 01:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634866473; x=1666402473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nQmD8tz0siK/3ewe7eS/wMF3ydoICuJwawIePzDCHFY=;
 b=JQzmuoBRtt0nTELwIvb/odDalWOIKekWcotMMNOvzzPg3MpK4GxHc+u1
 QdAnMv5+rTP+T9hnO5+zBclzbhZGf8a1FXdjOUSRdi3HfNbr2Lsej3LVh
 SJmhlyU03D2dDOvmKzdnZi9i5vCfiswSkcVd0NOSWGJ1Ds7GDABLID0XI
 YotuPG08YTHrfEF+4n/CW/qjMt3i/JZyOovuJ7GA7oWXirr4AdXG81Ifi
 zKgUcmteamAfKajJ1QWyjbU/a5+cd1DCfIzdxRe+nhe6RSASQSXGTY62e
 U5rcaqCGPD/cj2DneOhiH/N/evHf11H9pbEWFF1segXIdFXalDAhbZTMO g==;
X-IronPort-AV: E=Sophos;i="5.87,171,1631548800"; d="scan'208";a="182583844"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 09:34:31 +0800
IronPort-SDR: 1w2B+wdRphzKuVjJGzBK6zXMOUqppxDrXDjDDI0kra2CHdpYpGVRI00XJNq6boxeF2v9Ie7QCE
 CrIpluozIDWLBBbnkg0szr166X4K7uVaZzaXHtTZITM2J2saiNRMpLkqGIqygHxxXbbbQomJm9
 oDLYPhj/HcCk5XHyg9V32IcrTjqwESQUHLskk0Gt+ggrXM+0VghKL3saiyup4gMv5uruJWVVFj
 wIVJ+a8N8MoleQfH8BkRRnf890HEyaMVP06yVU2kgLY13RmathiT1I0d50C0n7dNW2wPaMsb3o
 dHGyTUJ2GsJd80zU1Dk+TWuT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 18:10:07 -0700
IronPort-SDR: SuK0ny9pMoj7dUmE9WXk1krKZf4uot1MSnzuuSpDIsD5PQ7xlMCdkFeAkhoNWvmUSVVPSbGhG0
 Qh1eKubCtCttGCBxLwV6QIza5pcUnUPry1Vi73pUb+tKRtp/Av6Hvo5y+jfuhfrqCqHktOuLI2
 ACElMOBFk/84c9RQAEbaAF/VOzh350h3mdr06MgX0AzkHmuaOV2wy/34byEL7Hnnn9llYoZABs
 AieTRvMy1ZzjD91SUkKCgIshMw4skpO1hqOJQD2tkaQrhl8Rd6BvBMh9Zz9MEbNHPruv9g9nfM
 EOw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 18:34:32 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Hb6Mq64Jyz1SGYP
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 18:34:31 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634866470; x=1637458471; bh=nQmD8tz0siK/3ewe7e
 S/wMF3ydoICuJwawIePzDCHFY=; b=tLk+rTVIC+Uq1QqJ4u9+meYj1Sqse67rFB
 lzPQXFcCX5AlQ9T0rfHt8GxkLNNIhZe0E1d7fIttsCNVZ1WKKzUltid82ELIu83L
 7FUQojkmrgpDEPoh8liZluWRESkddQWFlECw9iImdcOJ4IWI6ASGmQ8SLm10UgnM
 z4LOVAgmoBpPwe+K+on88LkbJJsxluCvMjx6KwHTmnHY5MffsfKCr56e5laiLxpu
 psBKn35ZuDcnOGbOk7q0/2b8DGE+2eNMhdfOcdX6fyrf8avLMnVOxG1lDmMZ+r1D
 y0w1qqoyZkJ0e8+U4dtENa8MFmOSGWLxcdNhG14lMQNfXXJKGuug==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id ovPuPKNtrsLS for <linux-riscv@lists.infradead.org>;
 Thu, 21 Oct 2021 18:34:30 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Hb6MZ4H63z1RwtM;
 Thu, 21 Oct 2021 18:34:17 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: dvhart@infradead.org, tglx@linutronix.de,
 alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org,
 mingo@redhat.com, atish.patra@wdc.com, linux-kernel@vger.kernel.org,
 arnd@arndb.de, alistair23@gmail.com, mark.rutland@arm.com, acme@kernel.org,
 peterz@infradead.org, dave@stgolabs.net,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 3/4] selftests: futex: Call the futex syscall from a
 function
Date: Fri, 22 Oct 2021 11:33:42 +1000
Message-Id: <20211022013343.2262938-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022013343.2262938-1-alistair.francis@opensource.wdc.com>
References: <20211022013343.2262938-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_183434_121581_6416344F 
X-CRM114-Status: GOOD (  17.42  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Alistair Francis <alistair.francis@wdc.com>

Call the futex syscall from a function

In preparation for a more complex futex() function let's convert the
current macro into two functions. We need two functions to avoid
compiler failures as the macro is overloaded.

This will allow us to include pre-processor conditionals in the futex
syscall functions.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../selftests/futex/include/futextest.h       | 59 +++++++++++--------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/futex/include/futextest.h b/tools/testing/selftests/futex/include/futextest.h
index ddbcfc9b7bac4..c786fffecb8a5 100644
--- a/tools/testing/selftests/futex/include/futextest.h
+++ b/tools/testing/selftests/futex/include/futextest.h
@@ -48,7 +48,7 @@ typedef volatile u_int32_t futex_t;
 #endif
 
 /**
- * futex() - SYS_futex syscall wrapper
+ * futex_syscall() - SYS_futex syscall wrapper
  * @uaddr:	address of first futex
  * @op:		futex op code
  * @val:	typically expected value of uaddr, but varies by op
@@ -58,17 +58,26 @@ typedef volatile u_int32_t futex_t;
  * @val3:	varies by op
  * @opflags:	flags to be bitwise OR'd with op, such as FUTEX_PRIVATE_FLAG
  *
- * futex() is used by all the following futex op wrappers. It can also be
+ * futex_syscall() is used by all the following futex op wrappers. It can also be
  * used for misuse and abuse testing. Generally, the specific op wrappers
- * should be used instead. It is a macro instead of an static inline function as
- * some of the types over overloaded (timeout is used for nr_requeue for
- * example).
+ * should be used instead.
  *
  * These argument descriptions are the defaults for all
  * like-named arguments in the following wrappers except where noted below.
  */
-#define futex(uaddr, op, val, timeout, uaddr2, val3, opflags) \
-	syscall(SYS_futex, uaddr, op | opflags, val, timeout, uaddr2, val3)
+static inline int
+futex_syscall(volatile u_int32_t *uaddr, int op, u_int32_t val, struct timespec *timeout,
+	      volatile u_int32_t *uaddr2, int val3, int opflags)
+{
+	return syscall(SYS_futex, uaddr, op | opflags, val, timeout, uaddr2, val3);
+}
+
+static inline int
+futex_syscall_nr_requeue(volatile u_int32_t *uaddr, int op, u_int32_t val, int nr_requeue,
+			 volatile u_int32_t *uaddr2, int val3, int opflags)
+{
+	return syscall(SYS_futex, uaddr, op | opflags, val, nr_requeue, uaddr2, val3);
+}
 
 /**
  * futex_wait() - block on uaddr with optional timeout
@@ -77,7 +86,7 @@ typedef volatile u_int32_t futex_t;
 static inline int
 futex_wait(futex_t *uaddr, futex_t val, struct timespec *timeout, int opflags)
 {
-	return futex(uaddr, FUTEX_WAIT, val, timeout, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_WAIT, val, timeout, NULL, 0, opflags);
 }
 
 /**
@@ -87,7 +96,7 @@ futex_wait(futex_t *uaddr, futex_t val, struct timespec *timeout, int opflags)
 static inline int
 futex_wake(futex_t *uaddr, int nr_wake, int opflags)
 {
-	return futex(uaddr, FUTEX_WAKE, nr_wake, NULL, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_WAKE, nr_wake, NULL, NULL, 0, opflags);
 }
 
 /**
@@ -98,8 +107,8 @@ static inline int
 futex_wait_bitset(futex_t *uaddr, futex_t val, struct timespec *timeout,
 		  u_int32_t bitset, int opflags)
 {
-	return futex(uaddr, FUTEX_WAIT_BITSET, val, timeout, NULL, bitset,
-		     opflags);
+	return futex_syscall(uaddr, FUTEX_WAIT_BITSET, val, timeout, NULL, bitset,
+			     opflags);
 }
 
 /**
@@ -109,8 +118,8 @@ futex_wait_bitset(futex_t *uaddr, futex_t val, struct timespec *timeout,
 static inline int
 futex_wake_bitset(futex_t *uaddr, int nr_wake, u_int32_t bitset, int opflags)
 {
-	return futex(uaddr, FUTEX_WAKE_BITSET, nr_wake, NULL, NULL, bitset,
-		     opflags);
+	return futex_syscall(uaddr, FUTEX_WAKE_BITSET, nr_wake, NULL, NULL, bitset,
+			     opflags);
 }
 
 /**
@@ -121,7 +130,7 @@ static inline int
 futex_lock_pi(futex_t *uaddr, struct timespec *timeout, int detect,
 	      int opflags)
 {
-	return futex(uaddr, FUTEX_LOCK_PI, detect, timeout, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_LOCK_PI, detect, timeout, NULL, 0, opflags);
 }
 
 /**
@@ -130,7 +139,7 @@ futex_lock_pi(futex_t *uaddr, struct timespec *timeout, int detect,
 static inline int
 futex_unlock_pi(futex_t *uaddr, int opflags)
 {
-	return futex(uaddr, FUTEX_UNLOCK_PI, 0, NULL, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_UNLOCK_PI, 0, NULL, NULL, 0, opflags);
 }
 
 /**
@@ -140,8 +149,8 @@ static inline int
 futex_wake_op(futex_t *uaddr, futex_t *uaddr2, int nr_wake, int nr_wake2,
 	      int wake_op, int opflags)
 {
-	return futex(uaddr, FUTEX_WAKE_OP, nr_wake, nr_wake2, uaddr2, wake_op,
-		     opflags);
+	return futex_syscall_nr_requeue(uaddr, FUTEX_WAKE_OP, nr_wake, nr_wake2, uaddr2, wake_op,
+					opflags);
 }
 
 /**
@@ -156,8 +165,8 @@ static inline int
 futex_requeue(futex_t *uaddr, futex_t *uaddr2, int nr_wake, int nr_requeue,
 	      int opflags)
 {
-	return futex(uaddr, FUTEX_REQUEUE, nr_wake, nr_requeue, uaddr2, 0,
-		     opflags);
+	return futex_syscall_nr_requeue(uaddr, FUTEX_REQUEUE, nr_wake, nr_requeue, uaddr2, 0,
+					opflags);
 }
 
 /**
@@ -169,8 +178,8 @@ static inline int
 futex_cmp_requeue(futex_t *uaddr, futex_t val, futex_t *uaddr2, int nr_wake,
 		  int nr_requeue, int opflags)
 {
-	return futex(uaddr, FUTEX_CMP_REQUEUE, nr_wake, nr_requeue, uaddr2,
-		     val, opflags);
+	return futex_syscall_nr_requeue(uaddr, FUTEX_CMP_REQUEUE, nr_wake, nr_requeue, uaddr2,
+					val, opflags);
 }
 
 /**
@@ -185,8 +194,8 @@ static inline int
 futex_wait_requeue_pi(futex_t *uaddr, futex_t val, futex_t *uaddr2,
 		      struct timespec *timeout, int opflags)
 {
-	return futex(uaddr, FUTEX_WAIT_REQUEUE_PI, val, timeout, uaddr2, 0,
-		     opflags);
+	return futex_syscall(uaddr, FUTEX_WAIT_REQUEUE_PI, val, timeout, uaddr2, 0,
+			     opflags);
 }
 
 /**
@@ -200,8 +209,8 @@ static inline int
 futex_cmp_requeue_pi(futex_t *uaddr, futex_t val, futex_t *uaddr2, int nr_wake,
 		     int nr_requeue, int opflags)
 {
-	return futex(uaddr, FUTEX_CMP_REQUEUE_PI, nr_wake, nr_requeue, uaddr2,
-		     val, opflags);
+	return futex_syscall_nr_requeue(uaddr, FUTEX_CMP_REQUEUE_PI, nr_wake, nr_requeue, uaddr2,
+					val, opflags);
 }
 
 /**
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
