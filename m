Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230E4C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 22:40:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7DBA6121E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 22:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7DBA6121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+3y7okKu37aRb0mh8lFTff2hEW1sz9YVJXGsl2vquUc=; b=KOrJqfGxyXF1es
	24bElS2AZFwsY53lnmoLCMWqlrz/g69D1urigzrS1mQBpcRJEbsoBFszDWcAwRhcqM7YkPQmHxsod
	CdTPyySYbGvHjF8TWJMxNyyDcMEdpPbTJEyIqNCmBWvTu3X9ojQHKNuRe8NCkTENnDkkU9YjDU9ja
	603GqB+7yFfgS4dRU+8p1iKZBqlyLdeR7xzS3q6aWkLtUF9DZ7WP2bKmweV/qiPY2tiXGQXjFRB0s
	FNB1+HcbNkpSf5EseViATmYFfJpFbRe0FHf7VMmY1/UtsUs8hqN8FyOG/zA7NCXC+Wq3IlOZWYCnX
	dZk/OriN5NZKfbWOk0ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdKFb-005vau-S2; Wed, 20 Oct 2021 22:39:59 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdKFY-005vZy-9N
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 22:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634769596; x=1666305596;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ANjv7oA9MTzC+HqX2lqEYQUduo9FaGOUFrImo55vutA=;
 b=SYzw0x3PoBkaXHPOThc19HXWfsH8cL1PYT85PIfC7BiJeH5Tm8hjd5Ws
 yyJc+remTUFyuiQDC7p0MsBzGgA/waYKtomCe3i5h53LfW/rXBDLyOqbP
 G1O/YLmv0hznF5nQpEiihst9ayVc6XXjic2QyLbGM6GJbw7NlefZfBsSX
 RoAcorGO18G81M0ZJ8xIuYsL9YoCPoE3y3elcv8IE4Q1ZGyvCtl/OayyA
 CdmGh+xwA2rwYZJ0HYpa0k86lOePMfMrfr9eEDW2mVHoQYE9ViXGpG/5D
 DL1/+xHJZ8MTcVNziTFhzG5RSK/0ia0JsvnwaYU/wFsBnkNDiRyUp4MDP w==;
X-IronPort-AV: E=Sophos;i="5.87,168,1631548800"; d="scan'208";a="184393885"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Oct 2021 06:39:53 +0800
IronPort-SDR: v/ppFAPVa2Ljt7Ddv+dXLBno/AkngsLmMPk449Z9wso/6oVNRSPH7faJTZWmp5gF5i0iiXUQgq
 uYoR/8ASNgjH9H0QV81nRvteozAgfX/EzbJqvyz1ClTiFXWpDB4K0Y6bXwjiRLrh6k34MLL7AV
 UCmaD96txe0G+YT1C+EH95jWs7khekZQRRa+CZZcndO3duYKEearEHxvVXWhCGDgdZ5R90E2kc
 XCz93la+D0cLz9FWUfhIPNN2/T7XbQdSxUNh/DGAwWJzIT/uvIsUq//OsHiDntDlkxoD2gx+GP
 NUm+M8W0BuFxKh6NYfZxKZnK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 15:13:57 -0700
IronPort-SDR: 0jqCao8G4H0ulgb5TIMV+pZ2jKhQhrfS3mrFVQHqZNNKx+gVWa8cM7Ns/VGn5j/xFMnxFjsW6O
 kZfj7xgBYZX0kUCSND775YrV3XMeNUriZG3/VxrrmAcVDFIPbp8xHBQPRS6d5TKtoOUrg0Qi5C
 d6SWDb/dRUhjZgPQKtN+Zi/I0YRjdaqMeSMfvfZZ5K2MtDAihDJJuA8JgtPARTMSQO2OPvw32K
 5Ekgu00rr8c21SsG7EoKZy6NlMwyrJLN6Dz2AEgRNE2kl4ZLvZ2zXLp+AtNsEF6DrjVtUED/tq
 SYk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 15:39:53 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HZQXm3Mvzz1RvmD
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 15:39:52 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1634769591;
 x=1637361592; bh=ANjv7oA9MTzC+HqX2lqEYQUduo9FaGOUFrImo55vutA=; b=
 X9TwTCOQ94NxxhOefoN/fIhIrHZwm1iNqhhb9gWxJ6aSbhisi5DHoio1udM/okBE
 rHE5HDsw9oUQFz710JePfeK2UVswIj89DYHzpOng3P2L4F6gFRzzqLSjylih4Eac
 K69A9xVUI4OLTBX1N8dpzcAL9wA+VeuFtfSeaMMMUyT/uYoUKDqXiJfoU1ZdNict
 wMpl90/VIW1Wy1I+KcxplJSQRyOya5TNu0v+u9QC8nOvSy0tZ0dWXju9iw0E81DT
 3bl060zvopLgg4ZH3LDcJHNHR4i2evTnb6oCB+GnBJenHmRivxncZtMIorb1A2FB
 WJbulokE2PWNGg7m+lciMQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id irSqMvXvb2Ij for <linux-riscv@lists.infradead.org>;
 Wed, 20 Oct 2021 15:39:51 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HZQXV2XHlz1RvlZ;
 Wed, 20 Oct 2021 15:39:37 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, alistair23@gmail.com, namhyung@kernel.org,
 jolsa@redhat.com, alexander.shishkin@linux.intel.com, mark.rutland@arm.com,
 acme@kernel.org, dave@stgolabs.net, dvhart@infradead.org,
 peterz@infradead.org, mingo@redhat.com, tglx@linutronix.de,
 atish.patra@wdc.com, arnd@arndb.de,
 Alistair Francis <alistair.francis@wdc.com>,
 Davidlohr Bueso <dbueso@suse.de>
Subject: [PATCH v4 1/4] perf bench futex: Call the futex syscall from a
 function
Date: Thu, 21 Oct 2021 08:39:17 +1000
Message-Id: <20211020223920.2810727-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_153956_421294_9F3A705F 
X-CRM114-Status: GOOD (  19.05  )
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

In preparation for a more complex futex() function let's convert the
current macro into two functions. We need two functions to avoid
compiler failures as the macro is overloaded.

This will allow us to include pre-processor conditionals in the futex
syscall functions.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Davidlohr Bueso <dbueso@suse.de>
---
 tools/perf/bench/futex.h | 43 ++++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
index b3853aac3021c..b97a343e7ec66 100644
--- a/tools/perf/bench/futex.h
+++ b/tools/perf/bench/futex.h
@@ -28,7 +28,7 @@ struct bench_futex_parameters {
 };
 
 /**
- * futex() - SYS_futex syscall wrapper
+ * futex_syscall() - SYS_futex syscall wrapper
  * @uaddr:	address of first futex
  * @op:		futex op code
  * @val:	typically expected value of uaddr, but varies by op
@@ -38,17 +38,26 @@ struct bench_futex_parameters {
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
+	return syscall(SYS_futex, uaddr, op | opflags, val, ts32, uaddr2, val3);
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
@@ -57,7 +66,7 @@ struct bench_futex_parameters {
 static inline int
 futex_wait(u_int32_t *uaddr, u_int32_t val, struct timespec *timeout, int opflags)
 {
-	return futex(uaddr, FUTEX_WAIT, val, timeout, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_WAIT, val, timeout, NULL, 0, opflags);
 }
 
 /**
@@ -67,7 +76,7 @@ futex_wait(u_int32_t *uaddr, u_int32_t val, struct timespec *timeout, int opflag
 static inline int
 futex_wake(u_int32_t *uaddr, int nr_wake, int opflags)
 {
-	return futex(uaddr, FUTEX_WAKE, nr_wake, NULL, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_WAKE, nr_wake, NULL, NULL, 0, opflags);
 }
 
 /**
@@ -76,7 +85,7 @@ futex_wake(u_int32_t *uaddr, int nr_wake, int opflags)
 static inline int
 futex_lock_pi(u_int32_t *uaddr, struct timespec *timeout, int opflags)
 {
-	return futex(uaddr, FUTEX_LOCK_PI, 0, timeout, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_LOCK_PI, 0, timeout, NULL, 0, opflags);
 }
 
 /**
@@ -85,7 +94,7 @@ futex_lock_pi(u_int32_t *uaddr, struct timespec *timeout, int opflags)
 static inline int
 futex_unlock_pi(u_int32_t *uaddr, int opflags)
 {
-	return futex(uaddr, FUTEX_UNLOCK_PI, 0, NULL, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_UNLOCK_PI, 0, NULL, NULL, 0, opflags);
 }
 
 /**
@@ -97,8 +106,8 @@ static inline int
 futex_cmp_requeue(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2, int nr_wake,
 		 int nr_requeue, int opflags)
 {
-	return futex(uaddr, FUTEX_CMP_REQUEUE, nr_wake, nr_requeue, uaddr2,
-		 val, opflags);
+	return futex_syscall_nr_requeue(uaddr, FUTEX_CMP_REQUEUE, nr_wake, nr_requeue, uaddr2,
+					val, opflags);
 }
 
 /**
@@ -113,8 +122,8 @@ static inline int
 futex_wait_requeue_pi(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2,
 		      struct timespec *timeout, int opflags)
 {
-	return futex(uaddr, FUTEX_WAIT_REQUEUE_PI, val, timeout, uaddr2, 0,
-		     opflags);
+	return futex_syscall(uaddr, FUTEX_WAIT_REQUEUE_PI, val, timeout, uaddr2, 0,
+			     opflags);
 }
 
 /**
@@ -130,8 +139,8 @@ static inline int
 futex_cmp_requeue_pi(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2,
 		     int nr_requeue, int opflags)
 {
-	return futex(uaddr, FUTEX_CMP_REQUEUE_PI, 1, nr_requeue, uaddr2,
-		     val, opflags);
+	return futex_syscall_nr_requeue(uaddr, FUTEX_CMP_REQUEUE_PI, 1, nr_requeue, uaddr2,
+					val, opflags);
 }
 
 #endif /* _FUTEX_H */
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
