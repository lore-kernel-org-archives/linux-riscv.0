Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63FB606A684
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 06:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LODmEbnM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=QtNp33Xa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=izL1u1RJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=r3HKp1PyTEFwu8dMeNqQ5ZKX5GkjBvT1+SjThYKYEvg=; b=LODmEbnMJcWngL8cd8xL/ZSaXU
	zWbvm0mt+kdV9s2cmLuuyaP3eoZJWVY6zEB6RUvzMih+adUZXJPs0gBfctzRe4s8BHrn2xaD5UQdH
	H0t9W3tee1JB66GGxb3zMCLn0sjRA5oXIspdTf55hH18BOEm2Cxgl1TkXMcIT2fkDg+sa+2khDrxk
	2TL/FDDuYZVFpThybCfc8Ai77lcKwOOfl7T33YDUBncEo8iyJHq9f2ykp4RWN9wmfxpKxq7sieH9i
	dSCU4ctRdc3cenHYesK1v2/WrCZ0Tu3Tm1a4Iz+Z+fVSVUV/VXgttwOI6VtM0Dair6Hm58TxuB5ra
	INHCvuVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Kx-00000008bup-46zw;
	Wed, 25 Nov 2026 06:18:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JI-00000008ZCz-0aB8
	for linux-riscv@bombadil.infradead.org;
	Wed, 25 Nov 2026 06:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+QmErJox492f/cV643DmQCmOGVVcvGNSWKULs52mChM=; b=QtNp33XaJjDXJalrz7Z+Sp5e+A
	vCFHZfGpxSGzQXWaf9qpm490jtpAmgIPVZzlfAn0uLmHagUkBZuFunwH0qEkkMqfd1y6efA/Kb+yL
	NrijIOy2QAsu0E1LRj5pP7r9HuL0R8Rx1xtMgTTCIiOHepNKfm3XNQ+ZclOJtX5UcEjiLKI8U8524
	TO5oZkX1S4eVImaUR1m3G0lsU/htk6/6ahxhbhG4WDjmd6CYrLKtZsaIidNgq+znr9Wfi9UM0VChk
	9p1IbE0ZkkQt9nPRwrK3hxaNHA6qLjg0W4GGM6BGnIHgEr1z3gH4cnNkos4gqyOf83KsUjCcO0wPF
	yif4lGtw==;
Received: from mail-dy1-x1348.google.com ([2607:f8b0:4864:20::1348])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JB-00000004u35-3jwT
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 06:16:48 +0000
Received: by mail-dy1-x1348.google.com with SMTP id 5a478bee46e88-38355b03cb8so5261818eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 22:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587403; x=1796192203; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+QmErJox492f/cV643DmQCmOGVVcvGNSWKULs52mChM=;
        b=izL1u1RJezqwOBjWnhQbg35gB8FuJkErG9o1/vbwwzKcP0wzHDIkQZ6HePzy8uk3yI
         nnlGYEZKS9tehvvpUEzORJfqQLp+m6Q0uIrZ4MqKR9i3en7N4xwrKUciOTCNx4OeK+f0
         Tsq7f0co5OY0jpb5uRZXtRjG4sXmrByouStYVO080VrqnUArNdBvhRvFaai5plMuoIs/
         XDdRWZ8DjJJU09nsSGP5IlKX+HVmZF9g1rwlojZ8Us3/2p6+Qi8ZOKd9i3ariakbu2x7
         di2KLZgQ0ewOn5JPPY89mvRWgA+Wm6HDGJjcsbHIIYUqDZg7aIzcmgzE+mws//F/ccqn
         iA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587403; x=1796192203;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QmErJox492f/cV643DmQCmOGVVcvGNSWKULs52mChM=;
        b=2B1rCiACvHr8UbbsaRugVLzVTrqcWre+S8kHZXE0aVRM5ZBnCdSPJ+sMa7gRn5xP3M
         OVFQcgL/kZ0IfoDghMvIBA1SSOEsbiB9akj7590uHg8W7I1xMgKQGLGu+z4kKypWgYeI
         IkExCNTu49VIBqntTwmqf1GFC16T+Koli5v1o2kiMD+ZtxbCtSdJK2IuWnafPrA+flq0
         UWUuvPLqugG/54F82SSs83UXB5rlp0esrfwbOqyUx6FQtIh/McogRQGWOSme0iZ9dNlZ
         n6MMTOjXX9wUnhCRiKCdXIKRKttOZUY5eflyBHBaDQR+Gi7W0b/q5dzF/bA2Lk+KG561
         p0kA==
X-Forwarded-Encrypted: i=1; AL+hErEEGcIIj0MF61dzJ+9T3OwgtG7dwqJoriqnE4Dh9ICPApeMLZ3N7Ud37itjyO9d9aQ+T93JXw16HH8YfQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9yjOi4ngvI3q3vfvXJaCbrA9WiywAYcK8o5NWVcUigO7fBoswb
	O4e6Sq0BfsxNDAAQADfTgnPTrouH4u0zQ7eRUhgGnmxcTP1lFgdyquN2iQzT8p4nl8nXucScOgr
	AkbQ/AJ+O/g==
X-Received: from dycnm7.prod.google.com ([2002:a05:7300:d187:b0:383:6d6a:6b7a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1505:b0:384:df31:6a07
 with SMTP id 5a478bee46e88-386a87efea0mr9863448eec.30.1795587402758; Tue, 24
 Nov 2026 22:16:42 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:16 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-24-irogers@google.com>
Subject: [RFC PATCH v2 23/30] tools headers: Add linux/nospec.h copy from the
 kernel sources
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_061645_870964_09382B09 
X-CRM114-Status: GOOD (  19.94  )
X-Spam-Score: -7.6 (-------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Copy include/linux/nospec.h to tools/include/linux/nospec.h (using the
standard /* ... */ header SPDX comment style), include
<asm-generic/bitsperlong.h> in tools/include/linux/kernel.h for
BITS_PER_LONG, and register linux/nospec.h in
tools/perf/check-headers.sh.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/linux/kernel.h |  1 +
 tools/include/linux/nospec.h | 74 ++++++++++++++++++++++++++++++++++++
 tools/perf/check-headers.sh  |  1 +
 3 files changed, 76 insertions(+)
 create mode 100644 tools/include/linux/nospec.h

diff --git a/tools/include/linux/kernel.h b/tools/include/linux/kernel.h
index c8c18d3908a9..e0108edc2251 100644
--- a/tools/include/linux/kernel.h
+++ b/tools/include/linux/kernel.h
@@ -11,6 +11,7 @@
 #include <linux/panic.h>
 #include <endian.h>
 #include <byteswap.h>
+#include <asm-generic/bitsperlong.h>
 #include <linux/container_of.h>
 
 #ifndef UINT_MAX
diff --git a/tools/include/linux/nospec.h b/tools/include/linux/nospec.h
new file mode 100644
index 000000000000..464a9a9e16ba
--- /dev/null
+++ b/tools/include/linux/nospec.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// Copyright(c) 2018 Linus Torvalds. All rights reserved.
+// Copyright(c) 2018 Alexei Starovoitov. All rights reserved.
+// Copyright(c) 2018 Intel Corporation. All rights reserved.
+
+#ifndef _LINUX_NOSPEC_H
+#define _LINUX_NOSPEC_H
+
+#include <linux/compiler.h>
+#include <asm/barrier.h>
+
+struct task_struct;
+
+#ifndef barrier_nospec
+# define barrier_nospec() do { } while (0)
+#endif
+
+/**
+ * array_index_mask_nospec() - generate a ~0 mask when index < size, 0 otherwise
+ * @index: array element index
+ * @size: number of elements in array
+ *
+ * When @index is out of bounds (@index >= @size), the sign bit will be
+ * set.  Extend the sign bit to all bits and invert, giving a result of
+ * zero for an out of bounds index, or ~0 if within bounds [0, @size).
+ */
+#ifndef array_index_mask_nospec
+static inline unsigned long array_index_mask_nospec(unsigned long index,
+						    unsigned long size)
+{
+	/*
+	 * Always calculate and emit the mask even if the compiler
+	 * thinks the mask is not needed. The compiler does not take
+	 * into account the value of @index under speculation.
+	 */
+	OPTIMIZER_HIDE_VAR(index);
+	return ~(long)(index | (size - 1UL - index)) >> (BITS_PER_LONG - 1);
+}
+#endif
+
+/*
+ * array_index_nospec - sanitize an array index after a bounds check
+ *
+ * For a code sequence like:
+ *
+ *     if (index < size) {
+ *         index = array_index_nospec(index, size);
+ *         val = array[index];
+ *     }
+ *
+ * ...if the CPU speculates past the bounds check then
+ * array_index_nospec() will clamp the index within the range of [0,
+ * size).
+ */
+#define array_index_nospec(index, size)					\
+({									\
+	typeof(index) _i = (index);					\
+	typeof(size) _s = (size);					\
+	unsigned long _mask = array_index_mask_nospec(_i, _s);		\
+									\
+	BUILD_BUG_ON(sizeof(_i) > sizeof(long));			\
+	BUILD_BUG_ON(sizeof(_s) > sizeof(long));			\
+									\
+	(typeof(_i)) (_i & _mask);					\
+})
+
+/* Speculation control prctl */
+int arch_prctl_spec_ctrl_get(struct task_struct *task, unsigned long which);
+int arch_prctl_spec_ctrl_set(struct task_struct *task, unsigned long which,
+			     unsigned long ctrl);
+/* Speculation control for seccomp enforced mitigation */
+void arch_seccomp_spec_mitigate(struct task_struct *task);
+
+#endif /* _LINUX_NOSPEC_H */
diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index 76fc6e20096c..3e684c851a86 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -193,6 +193,7 @@ check include/uapi/asm-generic/mman.h '-I "^#include <\(uapi/\)*asm-generic/mman
 check include/uapi/linux/mman.h       '-I "^#include <\(uapi/\)*asm/mman.h>"'
 check include/linux/build_bug.h       '-I "^#\(ifndef\|endif\)\( \/\/\)* static_assert$"'
 check include/linux/ctype.h	      '-I "isdigit("'
+check include/linux/nospec.h	      '-I "^.*[S]PDX-License-Identifier:"'
 check lib/ctype.c		      '-I "^EXPORT_SYMBOL" -I "^#include <linux/export.h>" -B'
 
 # diff non-symmetric files
-- 
2.56.1.831.g720f3f5937-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
