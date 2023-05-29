Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CDAC77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 19:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UoJClE4LMDkbAwqGjaYiImP+IkLmCWRDJc1vgjB89IQ=; b=xmG6hwAS9doL5+
	dlmOjEBqP7HMpoLnEiEGWhcSZc349Fp0DvfDvJlBBklkiOYNGSDYhpZzBwpO1zK7e/1UT9tLco5A5
	fIyxi3gAUYKWUCEoRjDS6DOmE0zKtgTr+nweWYSjfAF6NSKbPEc0VztUsEmktaANpObT+fTChPrR4
	61ezX8t6DW0D1a4tYx6JJ5ByMC0Rtt4g8+ZHvcKb0yw8y1U2R6lFJsrF/CL8F8Sur1HpSspuD4ED6
	Po2mXOODXvhXa2MTxfTpq+bf7KLXzM5DeZg3yu4Yu31NRffQIRAMHHTcegpl0uniEuYH1NgI+F98d
	htcYEphS1bjUK9UVPffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ivu-00BYut-2V;
	Mon, 29 May 2023 19:53:34 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ivo-00BYtT-1K
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 19:53:30 +0000
X-QQ-mid: bizesmtp87t1685389995t9lfs5qi
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 03:53:14 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: CR3LFp2JE4kuE2cO00Q/1KOi7QfVnxapLBkeSoUSu+aL7k4cNLL5T6EAjWCRL
	qWr+iK9XeavjZJL6SHlw1xJ39WYbVKpn5xi/kAYVRjWTUL0jc2GvhKngTUvjVkB3ZP96t8a
	f6bQH5yJmO7ydx9hHga2PhgYSPsewy6BXmnd6JDH+Ie/uv5PlwLeMbh5hPN9bnBjuf1wI3/
	GX2HxLY2DDBNVjPV+v9pZ+RHjGYrURspNgApsk8t2R447yUh1MyCWXTv37OH8MqQk7xofTe
	afhTgbVNBvAS13Ewbqx3MqxnOl2Za5ZPSVDk9HvB/MNtCFJIf1+Y3Kh+P7RY2QdIZKD4kmW
	uCPOfJoEI2bVSbOW6d9M/0ygbJnGPeXTqMdOiA1LxQIbZHwVtv3xTZEg6CNn28wnViEtzW+
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2371937537439054605
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 06/13] tools/nolibc: add pure 64bit off_t, time_t and blkcnt_t
Date: Tue, 30 May 2023 03:53:00 +0800
Message-Id: <b41f3cb75a71fc7ecb855cc82e85a3a0fbb39318.1685387484.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685387484.git.falcon@tinylab.org>
References: <cover.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_125328_752241_33055FE1 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
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

clean up std.h with include/uapi/linux/posix_types.h

convert time_t to 64bit even in 32bit platforms, for y2038 issue.

align off_t and blkcnt_t with 'struct statx' in include/uapi/linux/stat.h

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-riscv/83ab9f47-e1ed-463c-a717-26aad6bf2b71@app.fastmail.com/
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/std.h | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/tools/include/nolibc/std.h b/tools/include/nolibc/std.h
index 933bc0be7e1c..0f458c1c24de 100644
--- a/tools/include/nolibc/std.h
+++ b/tools/include/nolibc/std.h
@@ -20,17 +20,21 @@
 
 #include "stdint.h"
 
-/* those are commonly provided by sys/types.h */
-typedef unsigned int          dev_t;
-typedef unsigned long         ino_t;
-typedef unsigned int         mode_t;
-typedef   signed int          pid_t;
-typedef unsigned int          uid_t;
-typedef unsigned int          gid_t;
-typedef unsigned long       nlink_t;
-typedef   signed long         off_t;
-typedef   signed long     blksize_t;
-typedef   signed long      blkcnt_t;
-typedef   signed long        time_t;
+#include <linux/posix_types.h>
+
+/* based on linux/types.h */
+typedef uint32_t __kernel_dev_t;
+
+typedef __kernel_dev_t          dev_t;
+typedef __kernel_ulong_t        ino_t;
+typedef __kernel_mode_t         mode_t;
+typedef __kernel_pid_t          pid_t;
+typedef __kernel_uid32_t        uid_t;
+typedef __kernel_gid32_t        gid_t;
+typedef __kernel_loff_t         off_t;
+typedef __kernel_time64_t       time_t;
+typedef uint32_t                nlink_t;
+typedef uint32_t                blksize_t;
+typedef uint64_t                blkcnt_t;
 
 #endif /* _NOLIBC_STD_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
