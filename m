Return-Path: <SRS0=snBs=OH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3287FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 06:11:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF61560F13
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 06:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF61560F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NoOBYplDucQG5xMkUU4f+OHoI8rm3xRAsuybVzs99z4=; b=OH04F2luv0AhpN
	fEyRWUYq1fpABp46NtddT3Rc8CiaNaBopm/ABJWgFngRaV/n7NiLU8cev9LnOLGIYKFFMd8xIuXzj
	TPe4Hh1KLuJ85aB7235aAR6te1mDJwLcSb3WlhUQGwIUWw7EkWuG7+Hz24fH9flxk872oRU00nVmo
	LAz21i6bsJ3Qkai2biIQJwFrOGFUxj+eku+sY3cJkd4zPPymrOlFZvp9AQBg6VTDMkPLvJmK1dFUP
	AzAecq3X5qnJlyWoiG51zLgxyvHSFuocrHuSVzSBhcCADvqFd/XI+0yASbVFJF5rUWnqZ9VxNbx0S
	UAXOLOapxlpd3lvFPAWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR75h-00DHSu-25; Fri, 17 Sep 2021 06:11:17 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR75e-00DHS5-3i
 for linux-riscv@lists.infradead.org; Fri, 17 Sep 2021 06:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631859073; x=1663395073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2XzaRZS9DB+vo3EW82fkFoK8YHkr9HzLbMoUY86sntU=;
 b=B6RjluyWDRTcLhRw3TCe61EtwCF0E5WSbhzRneQAqHSaQEG/ebCP6pB9
 HoJ4vQgrVf9qcU92S5yQ/SPFMigFZUodQBCJxVGbyPZ42t1l4oGjXhGyV
 QEiANlXo2azX7sDT4ZOa5L7hMLaswaNgi/IfQMRe4ARZKfl5w9YSfmvqL
 TdrdllWiia/ZF/RxYoXu2PML6dsEijFFMfghN/QdUvaL5AMs95cK/MKWK
 S8bc7FWmDLh+ZVj9h2UBKlccmqyCUTPhjGQ4j/IUCPhsDAdpTrtQ1dzVM
 S2O2hMSLokalA2cd18eOsghGazXJc5wgJDzJQCgwjfT/uTv8jPsKUgig4 Q==;
X-IronPort-AV: E=Sophos;i="5.85,300,1624291200"; d="scan'208";a="185031394"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 14:11:11 +0800
IronPort-SDR: adEcrmmg+31N/jLPiGH5jLZ/53EoWum96ttwLAVQ2/sfIq4JWNwgPzFzuKNbpk+5gpXaWS9Adq
 VLQ144nmkPd4p3nuCtUanJcmq89Em9CKNi3ckU4D8SfYNoabHOlgltPKN8rrIDh9VgdvnG/sDt
 UEipzhIr9CwSwuN+vDNJdB2JttmJryy1ozk/iUYvkIooXs7aIat0PttcRTFcKWKiYTmoqY6Bng
 c2l6aLZU5PH9+p8YrN7jWnfjTTuWrmRuUeg1YDRSmVnd4X5KJXgUSgRzCLx8JN0VVnZxOKH8u3
 odQhixzZxKndy/X2QHWTzly5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 22:45:58 -0700
IronPort-SDR: AIG6zv5d94S4bvvd90Q1VbfJszoP+aqnc15Ne1i2hYNiLA3hxchKK5g1zozdcHst7dX601JKd6
 NJTIh+bjNOAkobdM5kwK+pRq0kChoYiyZXbNy2j2dfkmxVIsZLSSEkCikZaKZgWw+BpbK9WSNY
 ZbYQUk90bBqjEX0jrKk/T1X0fLE+tsmtza5KnksMyjTBTBYRZ/TrFiT2pCc+NWHMQ3mifrBzsw
 82WKZ6CXYXoazBvPc9wroLvIiNY0R2OdqzONoZtMjN3q5UC7ltEPL41VC65EQmmLmU8D74N3bQ
 jbc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 23:11:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9k9C5f42z1RwsF
 for <linux-riscv@lists.infradead.org>; Thu, 16 Sep 2021 23:11:11 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631859070; x=1634451071; bh=2XzaRZS9DB+vo3EW82
 fkFoK8YHkr9HzLbMoUY86sntU=; b=O+ZCjSVCArB8qXWbzuP3xwIcPXjm2N/jYl
 /JCj9NfTbC6R7os0Aawxi+pihTWL8rxwAJH/+HOCJT25dD/vVs0AxrRUlG3nVyln
 lY1xExn5R33tew9X+vv0KKmf1w5lsaqkildfSfHbom6d6VC/qWlaPphiVEtBTT7A
 JWhbV/gMDFEF3n454dyUgWTAL40VZl7M4lDwHNmT8xLc4oEMcmTaC9hE8OC5OXod
 Mf35S2zUzL4blkvyQzYxhjl0klkx1je2wMUMvQIbsbk26sHNibtY6hOnTvjknkoF
 gCkTeVAr6u9oWmdSZ8a0w9ExFH8rE7BTBdLJTyZuzrpL71EhKgYA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id afizQA5jo6aa for <linux-riscv@lists.infradead.org>;
 Thu, 16 Sep 2021 23:11:10 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9k912H01z1RvmH;
 Thu, 16 Sep 2021 23:11:00 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, alistair23@gmail.com, namhyung@kernel.org,
 jolsa@redhat.com, alexander.shishkin@linux.intel.com, mark.rutland@arm.com,
 acme@kernel.org, dave@stgolabs.net, dvhart@infradead.org,
 peterz@infradead.org, mingo@redhat.com, tglx@linutronix.de,
 atish.patra@wdc.com, arnd@arndb.de,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 2/2] perf bench: Add support for 32-bit systems with 64-bit
 time_t
Date: Fri, 17 Sep 2021 16:10:40 +1000
Message-Id: <20210917061040.2270822-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210917061040.2270822-1-alistair.francis@opensource.wdc.com>
References: <20210917061040.2270822-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_231114_192579_1E3D50C5 
X-CRM114-Status: GOOD (  17.14  )
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

Some 32-bit architectures (such are 32-bit RISC-V) only have a 64-bit
time_t and as such don't have the SYS_futex syscall. This patch will
allow us to use the SYS_futex_time64 syscall on those platforms.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tools/perf/bench/futex.h | 42 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
index f80a4759ee79b..e88b531bed855 100644
--- a/tools/perf/bench/futex.h
+++ b/tools/perf/bench/futex.h
@@ -12,6 +12,7 @@
 #include <sys/syscall.h>
 #include <sys/types.h>
 #include <linux/futex.h>
+#include <linux/time_types.h>
 
 struct bench_futex_parameters {
 	bool silent;
@@ -28,7 +29,7 @@ struct bench_futex_parameters {
 };
 
 /**
- * futex_syscall() - SYS_futex syscall wrapper
+ * futex_syscall() - __NR_futex syscall wrapper
  * @uaddr:	address of first futex
  * @op:		futex op code
  * @val:	typically expected value of uaddr, but varies by op
@@ -49,14 +50,49 @@ static inline int
 futex_syscall(u_int32_t *uaddr, int op, u_int32_t val, struct timespec *timeout,
 	u_int32_t *uaddr2, int val3, int opflags)
 {
-	return syscall(SYS_futex, uaddr, op | opflags, val, ts32, uaddr2, val3);
+#if defined(__NR_futex_time64)
+	if (sizeof(*timeout) != sizeof(struct __kernel_old_timespec)) {
+		int ret =  syscall(__NR_futex_time64, uaddr, op | opflags, val, timeout,
+				   uaddr2, val3);
+	if (ret == 0 || errno != ENOSYS)
+		return ret;
+	}
+#endif
+
+#if defined(__NR_futex)
+	if (sizeof(*timeout) == sizeof(struct __kernel_old_timespec))
+		return syscall(__NR_futex, uaddr, op | opflags, val, timeout, uaddr2, val3);
+
+	if (timeout && timeout->tv_sec == (long)timeout->tv_sec) {
+		struct __kernel_old_timespec ts32;
+
+		ts32.tv_sec = (__kernel_long_t) timeout->tv_sec;
+		ts32.tv_nsec = (__kernel_long_t) timeout->tv_nsec;
+
+		return syscall(__NR_futex, uaddr, op | opflags, val, ts32, uaddr2, val3);
+	} else if (!timeout) {
+		return syscall(__NR_futex, uaddr, op | opflags, val, NULL, uaddr2, val3);
+	}
+#endif
+
+	errno = ENOSYS;
+	return -1;
 }
 
 static inline int
 futex_syscall_nr_requeue(u_int32_t *uaddr, int op, u_int32_t val, int nr_requeue,
 	u_int32_t *uaddr2, int val3, int opflags)
 {
-	return syscall(SYS_futex, uaddr, op | opflags, val, nr_requeue, uaddr2, val3);
+#if defined(__NR_futex_time64)
+	int ret =  syscall(__NR_futex_time64, uaddr, op | opflags, val, nr_requeue,
+			   uaddr2, val3);
+	if (ret == 0 || errno != ENOSYS)
+		return ret;
+#endif
+
+#if defined(__NR_futex)
+	return syscall(__NR_futex, uaddr, op | opflags, val, nr_requeue, uaddr2, val3);
+#endif
 }
 
 /**
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
