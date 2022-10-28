Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3D4C38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 10:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JIwEECF207/SDQasfTpqBI4NB67YvceiSEO7Mpgwnk4=; b=TAVmd4DT7AWJzs
	knmg3cTgcLCQrOshhBUttw2HBIRDmp6ODXc5oY3e5kEtDFe4qHMhLv1qbAskGQ6obiAIeCWkEOuWo
	Q2/LIVDbbjgSOFDPyG751clpTpd99IV9lWZ7hDEbnST8P8gHgv2DGeclGvhXadMfj4n1d5JX6miVB
	/dSXPRm/TwVXvLE4zTwFfWm3oDVnnmRdAlSrrSerDZXloqRZYL97IJOIMUf9qCp8woRQdhCo/7ZJk
	GnAEw2rPCXxtTJE1legcq+qKnetXcUuJUtuNdodbdeRSVY9ds/YJQAXPJqrxbyG/K8KEx/Vnu7DPy
	kDsL6HjsjfkYq4BMgFYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMFm-00GXC2-FA; Fri, 28 Oct 2022 10:06:19 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooM7I-00GTfM-Sy
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 09:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1666951052; x=1698487052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5sXdRpXoL8fKMHadmBmTH5z4Y4mbuNPDkZAxHvAj8lU=;
  b=oXDiouemYkNz3V1T1KwN2AgmAXQyq+B4+Fw8JPNeVVGfErvf1ZQJ/MAV
   0pEIJwNts4GepmiZnHY4aMEqrIDezziMmPhYW/yoS7vRnbAsMr1r18/6f
   TctDLw+JKx4Btu/NQ61ag+wSWAa2kymHS2voXc2K4M9bQpvhiZugiXvYp
   aToCCjyR5q7WlvjpZrKC5dbz5/DjrRpidHq76Y5BS0U0cXDSyv0BcNzKj
   b6SFdKJfVz+NGE9EZ53na5PgtMh/4i4FM/AVzzdfddfRGTtKYNauEUTKu
   IalnWGmk+8NL5/C+ehZbe2E366fQDnFWQJPms+B2YUR/FcYovimIyy224
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,220,1661788800"; 
   d="scan'208";a="213258417"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2022 17:57:31 +0800
IronPort-SDR: O/ubV0l6WyNKKIR9Df/lwC1IHUnmABtCjVjNsXPcbBXkc/gi0o57DieaIGp8QMsEmPTQS8u9ma
 El4Vp3UyDcbUIJ/hv+0s2403husl7rDjWfKUaVVWGGKnY3KCC4tEs1F3W3+KgaFxbzLolpnJqd
 NoNgDCNtyzowPcn5NvG1eYmGBuUuXwZVqi6k2h+TJqi839koMb1AkuG/92hni63Dh9OpGXVLjU
 Kf2lX5AhkYSwexQy4JBMb9BkYiRMW/OCzBKMqZHeKgAxUE3f6QZ92ZENiD1zEjNy+5zKM/k5Tp
 98RI40ziuAM/Tb6d9zQasbLs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Oct 2022 02:16:52 -0700
IronPort-SDR: AwpmRz02gecJQlWs/qd/IpcLfsgfyB5fijb1jx5uBO3FSN5xMe3Vj5j1qTNA6uE8lNSN+4jCZq
 Xr90gDpV3EWVKBDEhkKOXxRIMh63vp/bFY34Qgrsjs3sXP7389HENvFYV2HfxOsVw1Qg4edQw1
 jGixq6bnbA4MCn2RQGXY1PNknHRK7TPcipBaOgbJaldQvSYEUao4TAS9BIqDZUojeDSSZx/PMh
 QDTj1FG0DYYVNL6Bq4AR3btXZNE+KMhFZnJHAxwjZTBWJgKJGdEvApo6wMgsiPSVIlyLQNMvdg
 Nc4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Oct 2022 02:57:33 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MzHyz09Nqz1RWxq
	for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 02:57:30 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:mime-version
	:references:in-reply-to:x-mailer:message-id:date:subject:to
	:from; s=dkim; t=1666951049; x=1669543050; bh=5sXdRpXoL8fKMHadmB
	mTH5z4Y4mbuNPDkZAxHvAj8lU=; b=i4/10uIu5RyP75V/f5ENBFGxGBQsJdPxTT
	e+kzdLy8o7BJq2hv9WGbJcPNne4tQPPnn2Acj2woZm2Xyp4Jhw3LAI8A/HAIFFwl
	NNiTQBR4Zf4diFyhwtRhDQRyV4eUz8AhcYUH6bk+kk/ew6Ih3Lw2hZlN3MeFCtWq
	yg8I5LQk6DPR8peBUxhVIrW2l/B00G4BReNrsIqnEJFmkQSIk0ZyB2BKx8Y9ZjZH
	HMMi3VYWfIYEbXeJU5BkIuewRNqpBMfAqUzDKolPa5HPPj05XT48eQ9Y3LRbuUoe
	1dKOqJ/YCh/NfdcW9YftXy/87Oq4Y/lmphJilXOocMvsDc8RgHXw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id r5G7vh9n7NmV for <linux-riscv@lists.infradead.org>;
	Fri, 28 Oct 2022 02:57:29 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.50])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MzHyn26b8z1RwtC;
	Fri, 28 Oct 2022 02:57:20 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-kernel@vger.kernel.org
Cc: acme@kernel.org,
	dave@stgolabs.net,
	alexander.shishkin@linux.intel.com,
	tglx@linutronix.de,
	namhyung@kernel.org,
	jolsa@redhat.com,
	linux-perf-users@vger.kernel.org,
	acme@redhat.com,
	dvhart@infradead.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	arnd@arndb.de,
	alistair23@gmail.com,
	linux-riscv@lists.infradead.org,
	mingo@redhat.com,
	alistair.francis@wdc.com,
	atish.patra@wdc.com
Subject: [PATCH 5/6] uapi: futex: Add a futex waitv syscall
Date: Fri, 28 Oct 2022 19:56:31 +1000
Message-Id: <20221028095632.1081262-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028095632.1081262-1-alistair.francis@opensource.wdc.com>
References: <20221028095632.1081262-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_025733_055121_90EC571B 
X-CRM114-Status: GOOD (  15.64  )
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

This commit adds a futex waitv syscall wrapper that is exposed to
userspace.

Neither the kernel or glibc currently expose a futex wrapper, so
userspace is left performing raw syscalls. As the futex_waitv syscall
always expects a 64-bit time_t this can be tricky for 32-bit systems to
get correct.

In order to avoid userspace incorrectly passing the wrong timeouts let's
expose a public helper function that ensures the kernel is passed the
correct timeout struct.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Message-Id: <20211209235857.423773-5-alistair.francis@opensource.wdc.com>
---
 include/uapi/linux/futex_syscall.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/uapi/linux/futex_syscall.h b/include/uapi/linux/futex_syscall.h
index bac621eb319c..f637f05a3be0 100644
--- a/include/uapi/linux/futex_syscall.h
+++ b/include/uapi/linux/futex_syscall.h
@@ -89,4 +89,31 @@ __kernel_futex_syscall_nr_requeue(volatile uint32_t *uaddr, int op, uint32_t val
 	return -1;
 }
 
+/**
+ * __kernel_futex_syscall_waitv - Wait at multiple futexes, wake on any
+ * @waiters:    Array of waiters
+ * @nr_waiters: Length of waiters array
+ * @flags: Operation flags
+ * @timo:  Optional timeout for operation
+ */
+static inline int
+__kernel_futex_syscall_waitv(volatile struct futex_waitv *waiters, unsigned long nr_waiters,
+			      unsigned long flags, struct timespec *timo, clockid_t clockid)
+{
+	/* futex_waitv expects a 64-bit time_t */
+	if (sizeof(*timo) == sizeof(struct __kernel_timespec))
+		return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, timo, clockid);
+
+	/* If the caller supplied a 32-bit time_t, convert it to 64-bit */
+	if (timo) {
+		struct __kernel_timespec ts_new;
+
+		ts_new.tv_sec = timo->tv_sec;
+		ts_new.tv_nsec = timo->tv_nsec;
+
+		return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, &ts_new, clockid);
+	} else
+		return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, NULL, clockid);
+}
+
 #endif /* _UAPI_LINUX_FUTEX_SYSCALL_H */
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
