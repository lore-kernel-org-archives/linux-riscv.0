Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23DCECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 10:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CAXG1JWXDh55q6k/09m3bMXsjRwL1lG0JexJMOhQZzs=; b=B4h5cLihGM2dJR
	VrecxlYkVOtwJtF8jO1t1wLIQnJv7+vAIvGQlpXVDgSQ9GXHTWcLWPzS8ItPCtqElUjKnRTaMG6Ah
	PYLriI/7jDMjv0+hfegRbkDW4UjYxpYA0fHXxYUQmyZkmSF5IZpQtrtC6zouSXSAY4btgKCNx8/Qu
	Fs0RWki6RP4rsjvbtmXAdClWSRg7B7h8fwK4hhP4YnASUSIS362vIi7WTWQiQcU28CD0b+twqFtxk
	vLq8OAEk5PNGLRvhMy6KL9VaupuU6ryyP4TGfHGrFS3jaovgX3FHpMAgHLUKy+n1sVqi3+MVbaw0x
	zPBTDUy4x7PO7GYSWcgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMFE-00GWwO-Rw; Fri, 28 Oct 2022 10:05:44 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooM72-00GTXU-9G
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 09:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1666951036; x=1698487036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ukg2qTmNSbfxQotuwWTieHEmVg4/tjCtE5mHopxUMgk=;
  b=YvzNXw/i/lv7iO8qEhP8q94e4XsyKevzTExkY4l7PIYg9tlVNwlcrQOw
   A1Q/Oae+5/S7tl6Kt0N/YsZ+UVbdFa3xRlWDUl88M7SqG/uw3HqtT2hwk
   iNUuQwRZhvAaQXs+7rJRep1NfWnS/r7kIPRkQCp3pbWwT0DlTFsDkJ9Up
   udr2Gmi9vUTJBqMUAtQRJoYQweF8fu23NcVuBHOJAVGZZcz2cbWr2db8t
   Y6f9Wq1rSkKRmFOZz2nkmVoBNP8a67Ro6ZncvS15WUIcCWoBUs+L6yakw
   +/kU/sHctNAjGBONS89BDyj4tocujZ3MwpQRADm3WXtybHAyw3xdUFX/a
   g==;
X-IronPort-AV: E=Sophos;i="5.95,220,1661788800"; 
   d="scan'208";a="215317989"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2022 17:57:14 +0800
IronPort-SDR: Xea2NtP8s8A+1tXJ8IjgFabjb45D9wcyJ4+8EyVzxPklfh55FUy2H+Ia9+3o81vVQoDjtjFw7d
 ue3rqenPZpPzwhsjRT3C6icKHw86zaioJBEMwNDb2Jw/Pkn5RoyM5wMzB4dbd7D4GCT78RqzQm
 5o+CxrUJNaWVWzeevrXyWGC4C5cMnCsKBrqzyu7yPBg6brIb2xHKIGpXHYObWAWn9X8o0MuVq4
 sIUfgEpFnkYOrzyhSUvIFP4dfzW0D917PDD5fI3AwRKeTK2cPwamTuBAw0pv56GOzAjW+vAI6i
 qJLguNZeS3xgwxeDrrt6tJS3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Oct 2022 02:16:34 -0700
IronPort-SDR: 8FbO6fyTzzBXZdR9XN2GexFHpakj+SyN4QKczgHj1uS8+5VxzorqhS5fpHDIMInQoFTubfDO6f
 5QGWe9xaKXFl4tRLiY8wjf09WN9XuYAkN2fSfn0xDr7Y8jRHvJqdDsZZ1aDEOOZvZIGw4VXUvJ
 hYWRWY5YLQASIDTaFQ5AS9nXmgFh2p2/s2/oh0B1Pn1TLB19SgtS+NnmRskvXiX3OdL+k54FWC
 VbNnm1/FgDSQWhjBWc/pn5E3eJbotdbwQbjeOR3BXeB0I6tFpmv8cGMxDsgsFd8XT4bQz8rJNZ
 UjA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Oct 2022 02:57:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MzHyd1y2cz1SHkN
	for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 02:57:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:mime-version
	:references:in-reply-to:x-mailer:message-id:date:subject:to
	:from; s=dkim; t=1666951031; x=1669543032; bh=Ukg2qTmNSbfxQotuwW
	TieHEmVg4/tjCtE5mHopxUMgk=; b=XoCXBRwRjUVW20Iyiw7Ncz9qA6Y7jOuo8m
	w/G8osTW19FFlzpKM22INyC6m+ZqsW/n1Ch9ryyHlArDTWw5GB0zrU+ZQfljy2oX
	c9kEp9TUbpGba2sWPxxEeX04baDMcX8URqB8BANKiB3LEOlMACM6C+z8GOgLLVIa
	/V6DhcV2n/hnsi6JusbOgc3btLu+n4nNjIEykuu50qKj159tB4KpJoa3tfqyAm3D
	DqQeycQan6SOtNMyUmwhPpoAp6kasc30qw80a32RT+WEeDcCrXkj2xlvU+VWpoeK
	inkUSTGoxo1PxL6eKckIQhzvoCrVaSXMkHLfOi24JRTGYzJ3FhXg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8w7G-d3_pnDX for <linux-riscv@lists.infradead.org>;
	Fri, 28 Oct 2022 02:57:11 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.50])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MzHyS2SsTz1RvTp;
	Fri, 28 Oct 2022 02:57:03 -0700 (PDT)
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
Subject: [PATCH 3/6] uapi: futex: Add a futex syscall
Date: Fri, 28 Oct 2022 19:56:29 +1000
Message-Id: <20221028095632.1081262-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028095632.1081262-1-alistair.francis@opensource.wdc.com>
References: <20221028095632.1081262-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_025716_455028_7535FB09 
X-CRM114-Status: GOOD (  19.89  )
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

This commit adds two futex syscall wrappers that are exposed to
userspace.

Neither the kernel or glibc currently expose a futex wrapper, so
userspace is left performing raw syscalls. This has mostly been because
the overloading of one of the arguments makes it impossible to provide a
single type safe function.

Until recently the single syscall has worked fine. With the introduction
of a 64-bit time_t futex call on 32-bit architectures, this has become
more complex. The logic of handling the two possible futex syscalls is
complex and often implemented incorrectly.

This patch adds two futex syscall functions that correctly handle the
time_t complexity for userspace.

This idea is based on previous discussions:
https://lore.kernel.org/lkml/CAK8P3a3x_EyCiPDpMK54y=Rtm-Wb08ym2TNiuAZgXhYrThcWTw@mail.gmail.com/

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211209235857.423773-3-alistair.francis@opensource.wdc.com>
---
 include/uapi/linux/futex_syscall.h | 92 ++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 include/uapi/linux/futex_syscall.h

diff --git a/include/uapi/linux/futex_syscall.h b/include/uapi/linux/futex_syscall.h
new file mode 100644
index 000000000000..bac621eb319c
--- /dev/null
+++ b/include/uapi/linux/futex_syscall.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Futex syscall helper functions
+ *
+ * Copyright (C) 2021 Western Digital.  All Rights Reserved.
+ *
+ * Author: Alistair Francis <alistair.francis@wdc.com>
+ */
+#ifndef _UAPI_LINUX_FUTEX_SYSCALL_H
+#define _UAPI_LINUX_FUTEX_SYSCALL_H
+
+#include <unistd.h>
+#include <errno.h>
+#include <linux/futex.h>
+#include <linux/types.h>
+#include <linux/time_types.h>
+#include <stdint.h>
+#include <sys/syscall.h>
+#include <sys/types.h>
+#include <time.h>
+
+/**
+ * __kernel_futex_syscall_timeout() - __NR_futex/__NR_futex_time64 syscall wrapper
+ * @uaddr:  address of first futex
+ * @op:   futex op code
+ * @val:  typically expected value of uaddr, but varies by op
+ * @timeout:  an absolute struct timespec
+ * @uaddr2: address of second futex for some ops
+ * @val3: varies by op
+ */
+static inline int
+__kernel_futex_syscall_timeout(volatile uint32_t *uaddr, int op, uint32_t val,
+		      struct timespec *timeout, volatile uint32_t *uaddr2, int val3)
+{
+#if defined(__NR_futex_time64)
+	if (sizeof(*timeout) != sizeof(struct __kernel_old_timespec)) {
+		int ret = syscall(__NR_futex_time64, uaddr, op, val, timeout, uaddr2, val3);
+
+		if (ret == 0 || errno != ENOSYS)
+			return ret;
+	}
+#endif
+
+#if defined(__NR_futex)
+	if (sizeof(*timeout) == sizeof(struct __kernel_old_timespec))
+		return syscall(__NR_futex, uaddr, op, val, timeout, uaddr2, val3);
+
+	if (timeout && timeout->tv_sec == (long)timeout->tv_sec) {
+		struct __kernel_old_timespec ts_old;
+
+		ts_old.tv_sec = (__kernel_long_t) timeout->tv_sec;
+		ts_old.tv_nsec = (__kernel_long_t) timeout->tv_nsec;
+
+		return syscall(__NR_futex, uaddr, op, val, &ts_old, uaddr2, val3);
+	} else if (!timeout) {
+		return syscall(__NR_futex, uaddr, op, val, NULL, uaddr2, val3);
+	}
+#endif
+
+	errno = ENOSYS;
+	return -1;
+}
+
+/**
+ * __kernel_futex_syscall_nr_requeue() - __NR_futex/__NR_futex_time64 syscall wrapper
+ * @uaddr:  address of first futex
+ * @op:   futex op code
+ * @val:  typically expected value of uaddr, but varies by op
+ * @nr_requeue:  an op specific meaning
+ * @uaddr2: address of second futex for some ops
+ * @val3: varies by op
+ */
+static inline int
+__kernel_futex_syscall_nr_requeue(volatile uint32_t *uaddr, int op, uint32_t val,
+			 uint32_t nr_requeue, volatile uint32_t *uaddr2, int val3)
+{
+#if defined(__NR_futex_time64)
+	int ret =  syscall(__NR_futex_time64, uaddr, op, val, nr_requeue, uaddr2, val3);
+
+	if (ret == 0 || errno != ENOSYS)
+		return ret;
+#endif
+
+#if defined(__NR_futex)
+	return syscall(__NR_futex, uaddr, op, val, nr_requeue, uaddr2, val3);
+#endif
+
+	errno = ENOSYS;
+	return -1;
+}
+
+#endif /* _UAPI_LINUX_FUTEX_SYSCALL_H */
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
