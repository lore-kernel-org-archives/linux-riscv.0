Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1791AC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 01:34:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3B4B610D0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 01:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3B4B610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dYE7eGaeJQyz0Ci1KSB/74sHwc8VNrLQ4dlDVYwPHUM=; b=F26vLM7ZxYgCUY
	VpjHls0kgja+t/K70OL2SSBEoJhoSCB7swa2TrHoHDNYGfgF4EnPjS9QdVb3Zpsz4TvUigc7pfIQz
	HUCtxJSzhhjptAf4EVQoFwkKzYjvHVB+oKfaTlmFpnD+jHCP8EZR7wp7yMNv/o8GOaJP1hxNFIIcY
	cyCSWWRlsjHFn+PaF0/KMfvbg03N9wK8THhN5NlkjnX25gj3JblTtUJvsLwOfLIoQ1sbpiMMWfq6j
	+6E3WbNXtofL/IPi2MIfzKVj55dF2ByCggU/M0TusXv+DibEbboxrZoKm8KP4LbwBS0lOUfzjgZ+L
	W804HkwwtTB40B1ij0JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdjRj-009QPb-P3; Fri, 22 Oct 2021 01:34:11 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdjRh-009QOj-2m
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 01:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634866448; x=1666402448;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m97MnHAZ25lH2gTLkW56Y00NrpnkCF1Bb4DbwT8g/50=;
 b=L6XsUq4ozC+tiPzeWlr/sfDOGoBcFsFC1HBCpfsceSFhJfk82usoyu8U
 yFe/FNf/r+matOYUS6PdgKYbHWsUiaR21s6cbBFzHO+aQf2ft14iu1UE7
 miRXIEDotqBrDh27ua6haZf/WE3pgmNqIuIBOPOBA3AQvUcEdEwP98M6P
 Qx3o5LAY8AoPBjV6/XPF8xUAMUVCi0JAzOfVHzsxMfPCyfDF+Ejj7McTY
 6ME3VA8+tbobjHiLG777J+LIKUNWczVOt11+VZC0f9T5hQFberig8CINA
 GTfE57brFRklI/EqicmPplt0ZaFr4Ag9wm8Zax253NU2R7kYlO8tuicUm w==;
X-IronPort-AV: E=Sophos;i="5.87,171,1631548800"; d="scan'208";a="287445369"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 09:34:06 +0800
IronPort-SDR: XEVwV2Ne3481X9DfxyPQTaeGfDo8l19hiHtMosI+c+H+n0J1l8Q1RFX8OeJq1RPawIZUc8bq3B
 Zq6GOqypo6bU42QXOVfIbIcmDlXrbYFNBlOcBa5zVVE0vTjDqDTWO+in2VB9jgw3cW4q95wmxD
 i0q+Lyl2qb2TWgzB88/tQI/YeUphr+/UmF1NhFGrVMPlGFhHv1TJlRw25mbhvC2mdIGmm0JQf4
 x4gYm9QOcm4ldfENSVo9tdZYEXHYwgrqSqzUQlTzVqLgVZkHQPduuRPpcDQHUGrXXs9WPTF2Em
 LQbGiR2gWaRndPyCqhd3G86K
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 18:09:41 -0700
IronPort-SDR: dEDX4n8gk6+yTyRI89rxQEJdpQetQZ9qyacPLdpRMOPupz8QJaCsEXoXj/vRyBtqiAdstt3sxk
 uD2oUEvotFUEV5nWfvSOm8EkiZVuD89go4n0QQy5t58qG750bmhcFcmSg0JlP4wgjjBncHWj2f
 YXjUr/k9MNHQbWn6T+RMDn1tLgHurKi7mXOWAQ98UvPQvldY/WgVQy1hm3SeRvYAQz8Elv3jOX
 dShyy8HovD25xzc36Yl87MTqOSSvUy5RM4EPYfZk6YDv1zyumLZXdYqwECXr3REZneqFnWnLvD
 7X0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 18:34:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Hb6MK4G9kz1SGYN
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 18:34:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1634866444;
 x=1637458445; bh=m97MnHAZ25lH2gTLkW56Y00NrpnkCF1Bb4DbwT8g/50=; b=
 Hl+HmMG70w0gT7rLNv7TyC7bez2Wy3hlf3tLx0jqMV+BhM5ywmIhpjJzIz/1RHhG
 HD+R8Pq4sJGaN+sKzCq84eFJHJMna/ygU59CUtve6mZltjoJRbILFCbm6rCWiAqB
 YP8uLnN7oLYSjdjjP5zmwmm021qtLbNVMdyIGcbQjBbRkqjjvE700Pv9N7I55obO
 K1t0582OlwEt/UWXOZrXDVyM0rwf5VER4bCM2CUGufiAzYNk/GNN54urjh6O1ljl
 qQiSMeHiCvJzZ3FfJdoH9T2u+QbC/rgDTRkXrnEodohI7KIOgeZ6Ek/ZSiCJ3WeP
 9oN760y8b+WAFN07IiU6KQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id K-y-ZSisbcm8 for <linux-riscv@lists.infradead.org>;
 Thu, 21 Oct 2021 18:34:04 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Hb6M32PPzz1RvTm;
 Thu, 21 Oct 2021 18:33:50 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: dvhart@infradead.org, tglx@linutronix.de,
 alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org,
 mingo@redhat.com, atish.patra@wdc.com, linux-kernel@vger.kernel.org,
 arnd@arndb.de, alistair23@gmail.com, mark.rutland@arm.com, acme@kernel.org,
 peterz@infradead.org, dave@stgolabs.net,
 Alistair Francis <alistair.francis@wdc.com>,
 Davidlohr Bueso <dbueso@suse.de>
Subject: [PATCH v5 1/4] perf bench futex: Call the futex syscall from a
 function
Date: Fri, 22 Oct 2021 11:33:40 +1000
Message-Id: <20211022013343.2262938-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_183409_279480_DD66EA1C 
X-CRM114-Status: GOOD (  17.92  )
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
index b3853aac3021c..ebdc2b032afc1 100644
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
