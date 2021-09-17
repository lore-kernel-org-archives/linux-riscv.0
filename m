Return-Path: <SRS0=snBs=OH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1165AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 06:11:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEA9160F13
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 06:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEA9160F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fF0r7XcJeetQvhcWMz5bhaVEkXbaDTGbGNPVR5Fy82s=; b=1TaXahKv1EoAYV
	SFpUHKIzEY1PTk1VGftJySKfdaqSBT5C+x/pAM2lz9IH1wBr7wj+a3Jb0NMTjsue1NXAcV0nI8vok
	uWTkJAnCRwbGIzhb7qlp2PFDXliXWl91bmP5+IC1lqB+7MoUefhFEmOV23KPNDB23fy4nuSQI5jm0
	B0BcfLQDrHw9jV+KIQTRyu/1UzvcqDSHqczxgZ1K8HQMkj/2NlE2IHAoDGSjGBKIks/MKD3toI9TH
	ZtCkAVido2Ul4KGEkNo1YBaw8oATwlhZHq2LsKohogoDeSpr6FcoPYQJ+gJkRWKiZPi4729hAkLrc
	Fn1vdveEjqvwjaoy4WHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR75a-00DHRB-DJ; Fri, 17 Sep 2021 06:11:10 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR75X-00DHQ6-Cp
 for linux-riscv@lists.infradead.org; Fri, 17 Sep 2021 06:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631859066; x=1663395066;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9y8Ut/ugz/WF4xLl6QXyYdgaBuD43Adc9tbqyoQdLNk=;
 b=Vu9yu8FPgrOMgjUjXSDw/TanSlRp/AnhaQKlI5l9Gq2XgolrbgEfV8di
 z2s6xivJROmUHpFYddqJ6ZQ6ro3vrM+CfBA+jd9abr1VveSEhZmIoxf2m
 YSncesrq8Z6LSPl5nYk+3eu+wpwvcP7pmAB859gXZVGaQ5HW+6wZrViv5
 VC5PfafsLc+fpBhO52Wj4WPdvkxBmjCrwxHwZvUqnKt2kq/G8vHBh3zf5
 ysDC4gK0O/SNiO8G530G6kbfAuxLSIuh8Cix31AX9R4vWhRbNpoIfeyHX
 yY1QO9cJiYRdYulZmgFgSCMFQLhGnYu8kixlCaiv6kB3Q1Vck27t3WZFJ Q==;
X-IronPort-AV: E=Sophos;i="5.85,300,1624291200"; d="scan'208";a="180248168"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 14:11:03 +0800
IronPort-SDR: 55x07/V4ww9Q+TmKxU3v+0k2dK8OdMEfdqATmDPXDY0TjMnLKUpurMu/k0bS7NLYWIljHkk6qK
 ZKKVISwrIrZKNb65LwfavAV1w7WSiYtnivspW2jL9F9gvUlYBKf6LNRsAFx+tJUEF5bMCcTq90
 NF/4rbz5yqPuCs5wEsRlJaAgclm10CIibYKBjKir0zl5HTOsb7W8aDI8rLtPTG1aPhYIA5FnxZ
 Gmdpd/nrjk53h81BSAP/Wavng9Dzf6F01FjGt9a4GgDox7KzSYP31pRgZnHOwMSHHUqD9kKam8
 PBm2dJbDWwAbv/Stz+X/tosV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 22:47:24 -0700
IronPort-SDR: RL7tfbrqrJnbXIypq9jnFi7xo6ciBGCwmHdSXvlIYTjwof1FU98U+HOHRfm3RBOiNWrsomZhE+
 y8zg1MIBokWJEbw+bk8HxnlJCW/woUodzsxZly2iI7yAlYylJy5MAiT4HIo57RNCq1ViQA4mwZ
 aFKE+RKGJkLFpKVcbZEFtdqG3Mg2W9nszB9nEAFHj1MTz1L1ELtMNPKWaAjmoKP+C1sYsw6Rtq
 8bp//ajGemvmGMjyq4ZLERqs+TYpPRvanX9Wbv+4ejVX1RkC1FR2Veh5CT1amDsBq9PXwI1eoq
 izY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 23:11:05 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9k940fldz1RvmK
 for <linux-riscv@lists.infradead.org>; Thu, 16 Sep 2021 23:11:04 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1631859060;
 x=1634451061; bh=9y8Ut/ugz/WF4xLl6QXyYdgaBuD43Adc9tbqyoQdLNk=; b=
 FTpn5lTFFIb7CVyFVdwEZTRODEyp/xPxiNLIytniHNV25YEqe3GBBHORFmhZkn1Z
 qR3HCQG52ChvU2fotwI5V0RCe4ar1n+OQGZSW2dB9qOkb9e9NgHwyPhQ/yB2JYf2
 B1/OB8XVBFJobwj6Fmqwvts/Lpuo8h+0V+mjBx4BprEZMAMbYTmW1LdByZmAy33a
 5rXG6f9Sy+PqjWf6GtHu5fc6g360pbneMvQXFltXRb4kiY58pynvf+Y3hn607BnF
 3f+c1OHT4veuJ6QBGBva+lywRBq4clTcezshHAUYmOgZm2bBCfYEXUUdXJbDX7Js
 3Q01W/o2EseiAQ05zscasg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id kHDYw-Pru0Kp for <linux-riscv@lists.infradead.org>;
 Thu, 16 Sep 2021 23:11:00 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9k8p5NrKz1Rvlb;
 Thu, 16 Sep 2021 23:10:50 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, alistair23@gmail.com, namhyung@kernel.org,
 jolsa@redhat.com, alexander.shishkin@linux.intel.com, mark.rutland@arm.com,
 acme@kernel.org, dave@stgolabs.net, dvhart@infradead.org,
 peterz@infradead.org, mingo@redhat.com, tglx@linutronix.de,
 atish.patra@wdc.com, arnd@arndb.de,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 1/2] perf benchmark: Call the futex syscall from a function
Date: Fri, 17 Sep 2021 16:10:39 +1000
Message-Id: <20210917061040.2270822-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_231107_475718_07049FBE 
X-CRM114-Status: GOOD (  17.12  )
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
---
 tools/perf/bench/futex.h | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
index b3853aac3021c..f80a4759ee79b 100644
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
+futex_syscall(u_int32_t *uaddr, int op, u_int32_t val, struct timespec *timeout,
+	u_int32_t *uaddr2, int val3, int opflags)
+{
+	return syscall(SYS_futex, uaddr, op | opflags, val, ts32, uaddr2, val3);
+}
+
+static inline int
+futex_syscall_nr_requeue(u_int32_t *uaddr, int op, u_int32_t val, int nr_requeue,
+	u_int32_t *uaddr2, int val3, int opflags)
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
@@ -97,7 +106,7 @@ static inline int
 futex_cmp_requeue(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2, int nr_wake,
 		 int nr_requeue, int opflags)
 {
-	return futex(uaddr, FUTEX_CMP_REQUEUE, nr_wake, nr_requeue, uaddr2,
+	return futex_syscall_nr_requeue(uaddr, FUTEX_CMP_REQUEUE, nr_wake, nr_requeue, uaddr2,
 		 val, opflags);
 }
 
@@ -113,7 +122,7 @@ static inline int
 futex_wait_requeue_pi(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2,
 		      struct timespec *timeout, int opflags)
 {
-	return futex(uaddr, FUTEX_WAIT_REQUEUE_PI, val, timeout, uaddr2, 0,
+	return futex_syscall(uaddr, FUTEX_WAIT_REQUEUE_PI, val, timeout, uaddr2, 0,
 		     opflags);
 }
 
@@ -130,7 +139,7 @@ static inline int
 futex_cmp_requeue_pi(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2,
 		     int nr_requeue, int opflags)
 {
-	return futex(uaddr, FUTEX_CMP_REQUEUE_PI, 1, nr_requeue, uaddr2,
+	return futex_syscall_nr_requeue(uaddr, FUTEX_CMP_REQUEUE_PI, 1, nr_requeue, uaddr2,
 		     val, opflags);
 }
 
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
