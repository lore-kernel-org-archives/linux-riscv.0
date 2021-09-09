Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4F4C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 04:26:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D93161100
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 04:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D93161100
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nNvLA4WYGyHKBDT9Z894F+xP9ZrirG3OxHo391EUyMU=; b=unx6OJke7BsqdG
	Iu02hWPLw7dA4uEWiT9bGhKDfEvCO0/no8W2/vFc8+YJqfWySgdoXsfFAD8xIOECsKJo5QFAOWNqA
	4TYdXzT7lwcLFBFQHxwOCu9zQT6Oi/g7agg6A2V0G+r2NCIEGZOZk/Rba1oeLPHbsSxLTJDLwYjyM
	6NfWfOKf3p9hfWSdyXejULSQ9SiIatz2dUoHwKdBj60DSG+HguklpYL59Y2Xzx/45CARreI/W8N3X
	yeZQ66GZIWAusBmwITFxlZhdIDuGFnWO5zMDlT68soLixcYOVI4fhXkzKZtUgefUHxDLGV/AeDqYi
	WWOMBGxamA7Cek+8NRFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOBdY-008Bdw-5m; Thu, 09 Sep 2021 04:26:08 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOBdU-008BdU-HR
 for linux-riscv@lists.infradead.org; Thu, 09 Sep 2021 04:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631161564; x=1662697564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uTJ4YViqTBigsFNPfbDCcZNwNeuUciwbhlEYLs8SL54=;
 b=nGmSDfH5Ieew0yhUGKQsWjss/s/sdoHVRxxNeq0BromPevOybp6zPD9m
 sUkdWK04utXhGNXWRJ+oGQA87qAXOYiXPyB90OMfu96Ce1O/tZNyvguDl
 VIsCyq8/9I0F/z5FJpvkkc6FX4Fs+mGeE4ZV85ZwyUNQ1FbUfGQ8tA1v8
 HZjvFKONUrqvlRsIdbw6YppD3NE+pYwX196DHI75QuLsNQklkhfH//hEe
 3zo5xGttb9DVDwG80RNQMedUF65B3zglkOOx00CqOHFlPBkgO6RQX7Fu6
 muyOQM5VOS+A/Tday1SO5Cfro0u0UDfsROluYYZV27rrj2/ineHxVTLc5 w==;
X-IronPort-AV: E=Sophos;i="5.85,279,1624291200"; d="scan'208";a="178635128"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Sep 2021 12:26:01 +0800
IronPort-SDR: 2B8RajjU8nwLzBLEJ2c3uYnQ2K0oNpyVm5aFJN9rDf48ziJVcD1LlLogj2LYZdlwKLK7ggJav1
 My8wHpKUpIcD9AM6jsdg/YzlqoJB0LpoCvU+4jII45lt2amj12nfc/boqj4OOXeYUpRX3yhwXl
 0E8cDyv0J6w+4oYf8Fj1NnA/peLWk0ol/H9UDFlJN3SOUwvj2wg03XfTRgd9Qpj3eJjGSYktch
 w2zYlSk2QVCnst5T0PA2i8pTf7+ucjbhsPhYZj0sEtTRgE3ZmC4AAhhB8bf18/wH86IMUOX8vP
 nCgoIG2T8T0WxII/QoqCSnu6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 21:00:57 -0700
IronPort-SDR: Xl7StVq36f+C90bbf9NXaXOUsnclVazR0TXpS9BqqxC2RWTsT/r4E+tiZd/iXRgabe+UqvK/+Z
 e663byChulpGxesP4v3Hsoy+HaXYRqqcCBpOZ1jPT/JIG/Zp+PZXHFqcOBhndaCa15rK4HGtKv
 I7bBpV4qHcabvOMCqRZtsB7tPNuNwqKf6/we+mLDX236WrsNOA9Y6q4uTVvdGxuSIezSrOuUwD
 gifeL5kFknxuZEWDn3yj9XmZmmfXieyO0ztn/dfwfXnxnf6mbUHoRJMh2+dJ6gqCNCofqi6EiW
 ytU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 21:26:01 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H4mCX6YJJz1Rvlb
 for <linux-riscv@lists.infradead.org>; Wed,  8 Sep 2021 21:26:00 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1631161560;
 x=1633753561; bh=uTJ4YViqTBigsFNPfbDCcZNwNeuUciwbhlEYLs8SL54=; b=
 mVDC65s1mtlUa3zeFnC3SdKgS4EZo5AXwLCmb+tT5FqI4VLj7Fsm200/ZqLpr0FR
 rZFBcWL5BHfRoEjrPLjyniEV4Hqr5FlKazrcntVhuwLGnJXM3muUWJYUrazAxCee
 ByZ8vTOrLZBnplWG05M97Fv04tvUlWloIkIbI7PvkOeCgsH3FTsQokUHqkQ94iEV
 6b/+iFVIbSo9zJhSNzOegTWyH8Cxa5FS3lsn4VvRxK38FD6sx5xn17dwmz6V5CNA
 Qd60H3Ax3axx2SloglCTYzTH68lX1TAU+ZDsfgnmh8Y/f306lfR5MU7VEU9m9t4n
 +vnCUE9hXW6kaKKl6mHrDg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id lc4mGJ7gMn_6 for <linux-riscv@lists.infradead.org>;
 Wed,  8 Sep 2021 21:26:00 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.20])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H4mCL597Fz1RvlP;
 Wed,  8 Sep 2021 21:25:50 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, alistair23@gmail.com, namhyung@kernel.org,
 jolsa@redhat.com, alexander.shishkin@linux.intel.com, mark.rutland@arm.com,
 acme@kernel.org, dave@stgolabs.net, dvhart@infradead.org,
 peterz@infradead.org, mingo@redhat.com, tglx@linutronix.de,
 atish.patra@wdc.com, arnd@arndb.de,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] perf bench: Add support for 32-bit systems with 64-bit time_t
Date: Thu,  9 Sep 2021 14:25:43 +1000
Message-Id: <20210909042543.1982893-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_212604_741104_283D87E5 
X-CRM114-Status: GOOD (  13.92  )
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

This patch does not attempt to gracefully allow 32-bit architectures
with both SYS_futex and SYS_futex_time64 to support a 64-bit time_t.
This patch only applies to 32-bit architectures with a 64-bit time_t.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tools/perf/bench/futex.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
index b3853aac3021..912342d7f594 100644
--- a/tools/perf/bench/futex.h
+++ b/tools/perf/bench/futex.h
@@ -27,6 +27,17 @@ struct bench_futex_parameters {
 	unsigned int nrequeue;
 };
 
+/**
+ * Some newer 32-bit architectures (such as RISC-V 32-bit) don't have
+ * the SYS_futex syscall and instead only have the SYS_futex_time64 call.
+ * Let's ensure that those still compile and run by just using the
+ * SYS_futex_time64 syscall. On these systems `struct timespec` will use a
+ * 64-bit time_t so the SYS_futex_time64 call will work.
+ */
+#if !defined(SYS_futex) && defined(SYS_futex_time64)
+ #define SYS_futex SYS_futex_time64
+#endif
+
 /**
  * futex() - SYS_futex syscall wrapper
  * @uaddr:	address of first futex
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
