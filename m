Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A22BC25B77
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ULTpNDQMnt8XjAX7lfFTHxbfpCcrAifK5CNF6dAoZ7o=; b=h8uN2Serhw/bszEedFHk64VdSM
	daTpLqlcWJJdGArFhH2wvWpJsMzICCaAWTjqiIYi0ILgTQilozEQyqTEeR4driSNjJwCRJHCgHO19
	cVUbe21CUaE9VIOYhEAGWsoghAd3cihO89FfDyBQ7tZJ41FQIPCoWfLhlFyQGeuGrI0uBaothVmwu
	+fLJb+FsTVRQqTqyTAhw09c13Xh9gtqCm7vqXDGqxqYkKzy/GFTLU6u54dbh24TrN3JkBf9GGVqnO
	r5+1gq9fIW3D9XhkbFFhPtj1fJh4fvWMHll1SQ0dn7d4Sh4ScStwtkjgUrhQvbigzyEKoypk5XDQl
	DlFgSV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Esz-00000003arV-0crl;
	Fri, 10 May 2024 01:17:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqm-00000003Nlr-0iyv
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KMQ2PFOkkCGjwZmSJUxDk+cI1yM0H7SNzHpWSNYBTw0=; b=L74tA8ilcJ8cL9n5woHC5uEeJM
	O7SdWgAr4QfBZSvlWMtLKGOdbsprKpYf3IQsrgisVtoWjGUrX1rvTLReL7JV4Ot1Yv+0M3gbx3ztJ
	kBSO8Wcm94iG8B7RDujOHMnALQVjTG0B+Gre8Ih0/x/QxwesjhCaTDMH9vlHG6B65bTBqMtgYq4Ck
	OO8SnTNxmPGw+kcm8ZJEWyxI9cruRwVaLrih4cGWclWoNziBkXJ5Rp9VRaoRkQ4eT9VM+qsH0C9aJ
	1mikElwZzWwSX6lP5ZD9aFC+KIldbNl0OVukn5Mr9C9Axrcq9DP08spoLNQJ9M5K7elpCVbN7WMlK
	DA9YQHfQ==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqf-000000036AP-1z1c
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:57 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6f474d5a8dfso1009379b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299848; x=1715904648; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KMQ2PFOkkCGjwZmSJUxDk+cI1yM0H7SNzHpWSNYBTw0=;
        b=E+Q8lS4jqWzDf7FF7Ah4fcoctg1EBbZD1xMMx4VP5rrffaFgbmmAB31KtABYJaj9fa
         mOGUqXwB/e9e1oH7Ho17s4kaOUaWTF5P3LYcaI1CSMRozm7a+eACC0Ydw3mwbqqcFC2+
         2j+mHhYQTdW0lUUeKvOS9LhUC/NFsjGzjHjABBTxpI6NxFYjKnUPm/UYl0IeQAwoXcoa
         B8ue8pg0kObCXl1x/DI/wXfnmXxcYlAOqsR08AMiLgqIwd1yjRz5MNCV3gcyP7LFwDK5
         MRhWd/z8ha1A/zR8Qzb6VxQsn5sz556wyqQ8DHPynLThHFaY3xDvmfe2DVS2bHHRRblF
         cXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299848; x=1715904648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMQ2PFOkkCGjwZmSJUxDk+cI1yM0H7SNzHpWSNYBTw0=;
        b=ANcDkZJcXMvJxl60vdZcaaLWJimVjlrqKAMjPPXL1p86oaWVaW1SZdZVi4qPlrpbPB
         a+WRsVgd7cmWqJhU5NBXXJ4N9IjsVlXZvOumldUsT7dE6+0OsUoi6dcMBPNUghCk/Jb2
         /lb2N3I4uFWZdEFOsM1F7xIAnfjNzDHjia+68Pmmn3H1w7e2xiOdodZ7vEaQ+ZUH0jxb
         6MtULCOGIuRYwEpuA7ZkiQzDfpdeH/lAO4mTMAcMhOTGDyz04p9SHKJxTqTi44zz3Ymh
         xRuaf4kZ+vPdor4L8s1Smu+ghuMKjQ4PqICSo0M1u91nAEgZScWu1Agfj6rOXX5t7Gev
         e+Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWeAxGw8S96m1FAa0S4YPpI77H1tKHJ6H1Q4iq4/KoZ+24hKO2FB7METCJ2LaJ7G8grKLoiJM/W+Kc85EzGKLgrwjd56gQInMemK9m+syop
X-Gm-Message-State: AOJu0Ywu5KwLE5MHJt0l0AQrEOPrtE6ONuoUvskysWV8T+wu7cFrkDv+
	IzC6O+AVITQGxYw7rVxUGGGvqIJ8MA1Kh5HW5oBJaqUJOjBCtK6rRd0FoDUYWbq9XXdLQjYRL76
	uqg==
X-Google-Smtp-Source: AGHT+IHbZKSbVDdpBEU510OKj2JCHsz5cuHLt7SmgRGUAAcgsYuTr1tSkG+dfLOejCpVrDPRQiu3Zr3RX50=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:14c5:b0:6ec:f5d2:f7f8 with SMTP id
 d2e1a72fcca58-6f4e02aae81mr62954b3a.2.1715299847595; Thu, 09 May 2024
 17:10:47 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:52 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-36-edliaw@google.com>
Subject: [PATCH v4 35/66] selftests/net: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Jozsef Kadlecsik <kadlec@netfilter.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	mptcp@lists.linux.dev, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011053_790162_8BD1B4CB 
X-CRM114-Status: GOOD (  13.40  )
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/net/af_unix/diag_uid.c               | 2 --
 tools/testing/selftests/net/af_unix/scm_pidfd.c              | 1 -
 tools/testing/selftests/net/af_unix/scm_rights.c             | 1 -
 tools/testing/selftests/net/af_unix/unix_connect.c           | 2 --
 tools/testing/selftests/net/csum.c                           | 3 ---
 tools/testing/selftests/net/gro.c                            | 3 ---
 tools/testing/selftests/net/ip_defrag.c                      | 3 ---
 tools/testing/selftests/net/ipsec.c                          | 3 ---
 tools/testing/selftests/net/ipv6_flowlabel.c                 | 3 ---
 tools/testing/selftests/net/ipv6_flowlabel_mgr.c             | 3 ---
 tools/testing/selftests/net/mptcp/mptcp_connect.c            | 3 ---
 tools/testing/selftests/net/mptcp/mptcp_inq.c                | 3 ---
 tools/testing/selftests/net/mptcp/mptcp_sockopt.c            | 3 ---
 tools/testing/selftests/net/msg_zerocopy.c                   | 3 ---
 tools/testing/selftests/net/netfilter/audit_logread.c        | 2 --
 tools/testing/selftests/net/netfilter/conntrack_dump_flush.c | 3 ---
 tools/testing/selftests/net/nettest.c                        | 2 --
 tools/testing/selftests/net/psock_fanout.c                   | 3 ---
 tools/testing/selftests/net/psock_snd.c                      | 3 ---
 tools/testing/selftests/net/reuseport_addr_any.c             | 3 ---
 tools/testing/selftests/net/reuseport_bpf_cpu.c              | 3 ---
 tools/testing/selftests/net/reuseport_bpf_numa.c             | 3 ---
 tools/testing/selftests/net/reuseport_dualstack.c            | 3 ---
 tools/testing/selftests/net/so_incoming_cpu.c                | 1 -
 tools/testing/selftests/net/so_netns_cookie.c                | 1 -
 tools/testing/selftests/net/so_txtime.c                      | 3 ---
 tools/testing/selftests/net/tap.c                            | 3 ---
 tools/testing/selftests/net/tcp_fastopen_backup_key.c        | 1 -
 tools/testing/selftests/net/tcp_inq.c                        | 2 --
 tools/testing/selftests/net/tcp_mmap.c                       | 1 -
 tools/testing/selftests/net/tls.c                            | 3 ---
 tools/testing/selftests/net/toeplitz.c                       | 3 ---
 tools/testing/selftests/net/tun.c                            | 3 ---
 tools/testing/selftests/net/txring_overwrite.c               | 3 ---
 tools/testing/selftests/net/txtimestamp.c                    | 3 ---
 tools/testing/selftests/net/udpgso.c                         | 3 ---
 tools/testing/selftests/net/udpgso_bench_rx.c                | 3 ---
 tools/testing/selftests/net/udpgso_bench_tx.c                | 3 ---
 38 files changed, 97 deletions(-)

diff --git a/tools/testing/selftests/net/af_unix/diag_uid.c b/tools/testing/selftests/net/af_unix/diag_uid.c
index 79a3dd75590e..279d0c5f70d3 100644
--- a/tools/testing/selftests/net/af_unix/diag_uid.c
+++ b/tools/testing/selftests/net/af_unix/diag_uid.c
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright Amazon.com Inc. or its affiliates. */
-
-#define _GNU_SOURCE
 #include <sched.h>
 
 #include <unistd.h>
diff --git a/tools/testing/selftests/net/af_unix/scm_pidfd.c b/tools/testing/selftests/net/af_unix/scm_pidfd.c
index 7e534594167e..2986b8cd0418 100644
--- a/tools/testing/selftests/net/af_unix/scm_pidfd.c
+++ b/tools/testing/selftests/net/af_unix/scm_pidfd.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
-#define _GNU_SOURCE
 #include <error.h>
 #include <limits.h>
 #include <stddef.h>
diff --git a/tools/testing/selftests/net/af_unix/scm_rights.c b/tools/testing/selftests/net/af_unix/scm_rights.c
index bab606c9f1eb..146a8d7a8cd9 100644
--- a/tools/testing/selftests/net/af_unix/scm_rights.c
+++ b/tools/testing/selftests/net/af_unix/scm_rights.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright Amazon.com Inc. or its affiliates. */
-#define _GNU_SOURCE
 #include <sched.h>
 
 #include <stdio.h>
diff --git a/tools/testing/selftests/net/af_unix/unix_connect.c b/tools/testing/selftests/net/af_unix/unix_connect.c
index d799fd8f5c7c..34e816862cc7 100644
--- a/tools/testing/selftests/net/af_unix/unix_connect.c
+++ b/tools/testing/selftests/net/af_unix/unix_connect.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <sched.h>
 
 #include <stddef.h>
diff --git a/tools/testing/selftests/net/csum.c b/tools/testing/selftests/net/csum.c
index b9f3fc3c3426..28f8241b8567 100644
--- a/tools/testing/selftests/net/csum.c
+++ b/tools/testing/selftests/net/csum.c
@@ -58,9 +58,6 @@
  * different seed for each run (and logs this for reproducibility). It
  * is advised to enable this for extra coverage in continuous testing.
  */
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <asm/byteorder.h>
 #include <errno.h>
diff --git a/tools/testing/selftests/net/gro.c b/tools/testing/selftests/net/gro.c
index 6038b96ecee8..dd370c88af1e 100644
--- a/tools/testing/selftests/net/gro.c
+++ b/tools/testing/selftests/net/gro.c
@@ -34,9 +34,6 @@
  * flakiness is to be expected.
  *
  */
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <errno.h>
 #include <error.h>
diff --git a/tools/testing/selftests/net/ip_defrag.c b/tools/testing/selftests/net/ip_defrag.c
index f9ed749fd8c7..80c9e567a3d8 100644
--- a/tools/testing/selftests/net/ip_defrag.c
+++ b/tools/testing/selftests/net/ip_defrag.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <errno.h>
 #include <error.h>
diff --git a/tools/testing/selftests/net/ipsec.c b/tools/testing/selftests/net/ipsec.c
index be4a30a0d02a..04aa06d26b09 100644
--- a/tools/testing/selftests/net/ipsec.c
+++ b/tools/testing/selftests/net/ipsec.c
@@ -3,9 +3,6 @@
  * ipsec.c - Check xfrm on veth inside a net-ns.
  * Copyright (c) 2018 Dmitry Safonov
  */
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <asm/types.h>
 #include <errno.h>
diff --git a/tools/testing/selftests/net/ipv6_flowlabel.c b/tools/testing/selftests/net/ipv6_flowlabel.c
index 708a9822259d..b7e0c3c02e20 100644
--- a/tools/testing/selftests/net/ipv6_flowlabel.c
+++ b/tools/testing/selftests/net/ipv6_flowlabel.c
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Test IPV6_FLOWINFO cmsg on send and recv */
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <asm/byteorder.h>
 #include <error.h>
diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
index af95b48acea9..ebd219ba386e 100644
--- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
+++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Test IPV6_FLOWINFO_MGR */
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <error.h>
 #include <errno.h>
diff --git a/tools/testing/selftests/net/mptcp/mptcp_connect.c b/tools/testing/selftests/net/mptcp/mptcp_connect.c
index d2043ec3bf6d..ea93030ed3ec 100644
--- a/tools/testing/selftests/net/mptcp/mptcp_connect.c
+++ b/tools/testing/selftests/net/mptcp/mptcp_connect.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <limits.h>
 #include <fcntl.h>
diff --git a/tools/testing/selftests/net/mptcp/mptcp_inq.c b/tools/testing/selftests/net/mptcp/mptcp_inq.c
index 218aac467321..c5bf873d76c2 100644
--- a/tools/testing/selftests/net/mptcp/mptcp_inq.c
+++ b/tools/testing/selftests/net/mptcp/mptcp_inq.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <assert.h>
 #include <errno.h>
 #include <fcntl.h>
diff --git a/tools/testing/selftests/net/mptcp/mptcp_sockopt.c b/tools/testing/selftests/net/mptcp/mptcp_sockopt.c
index 926b0be87c99..7203ca9900e9 100644
--- a/tools/testing/selftests/net/mptcp/mptcp_sockopt.c
+++ b/tools/testing/selftests/net/mptcp/mptcp_sockopt.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <assert.h>
 #include <errno.h>
 #include <fcntl.h>
diff --git a/tools/testing/selftests/net/msg_zerocopy.c b/tools/testing/selftests/net/msg_zerocopy.c
index bdc03a2097e8..9278bf585c80 100644
--- a/tools/testing/selftests/net/msg_zerocopy.c
+++ b/tools/testing/selftests/net/msg_zerocopy.c
@@ -24,9 +24,6 @@
  * the kernel queues completions on the error queue for all zerocopy
  * transfers.
  */
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <error.h>
 #include <errno.h>
diff --git a/tools/testing/selftests/net/netfilter/audit_logread.c b/tools/testing/selftests/net/netfilter/audit_logread.c
index a0a880fc2d9d..0b3dddab1c52 100644
--- a/tools/testing/selftests/net/netfilter/audit_logread.c
+++ b/tools/testing/selftests/net/netfilter/audit_logread.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <poll.h>
diff --git a/tools/testing/selftests/net/netfilter/conntrack_dump_flush.c b/tools/testing/selftests/net/netfilter/conntrack_dump_flush.c
index bd9317bf5ada..fb6c5d1b6f63 100644
--- a/tools/testing/selftests/net/netfilter/conntrack_dump_flush.c
+++ b/tools/testing/selftests/net/netfilter/conntrack_dump_flush.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <time.h>
 #include <libmnl/libmnl.h>
 #include <netinet/ip.h>
diff --git a/tools/testing/selftests/net/nettest.c b/tools/testing/selftests/net/nettest.c
index cd8a58097448..88e1d3b2ddf1 100644
--- a/tools/testing/selftests/net/nettest.c
+++ b/tools/testing/selftests/net/nettest.c
@@ -3,8 +3,6 @@
  *
  * Copyright (c) 2013-2019 David Ahern <dsahern@gmail.com>. All rights reserved.
  */
-
-#define _GNU_SOURCE
 #include <features.h>
 #include <sys/types.h>
 #include <sys/ioctl.h>
diff --git a/tools/testing/selftests/net/psock_fanout.c b/tools/testing/selftests/net/psock_fanout.c
index 1a736f700be4..5b2d34440ae9 100644
--- a/tools/testing/selftests/net/psock_fanout.c
+++ b/tools/testing/selftests/net/psock_fanout.c
@@ -26,9 +26,6 @@
  * Todo:
  * - functionality: PACKET_FANOUT_FLAG_DEFRAG
  */
-
-#define _GNU_SOURCE		/* for sched_setaffinity */
-
 #include <arpa/inet.h>
 #include <errno.h>
 #include <fcntl.h>
diff --git a/tools/testing/selftests/net/psock_snd.c b/tools/testing/selftests/net/psock_snd.c
index edf1e6f80d41..2f29b513e18f 100644
--- a/tools/testing/selftests/net/psock_snd.c
+++ b/tools/testing/selftests/net/psock_snd.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <errno.h>
 #include <error.h>
diff --git a/tools/testing/selftests/net/reuseport_addr_any.c b/tools/testing/selftests/net/reuseport_addr_any.c
index b8475cb29be7..9ee6ece52865 100644
--- a/tools/testing/selftests/net/reuseport_addr_any.c
+++ b/tools/testing/selftests/net/reuseport_addr_any.c
@@ -3,9 +3,6 @@
 /* Test that sockets listening on a specific address are preferred
  * over sockets listening on addr_any.
  */
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <errno.h>
 #include <error.h>
diff --git a/tools/testing/selftests/net/reuseport_bpf_cpu.c b/tools/testing/selftests/net/reuseport_bpf_cpu.c
index 2d646174729f..e93e38cfb2a8 100644
--- a/tools/testing/selftests/net/reuseport_bpf_cpu.c
+++ b/tools/testing/selftests/net/reuseport_bpf_cpu.c
@@ -11,9 +11,6 @@
  * This entire process is done for several different core id permutations
  * and for each IPv4/IPv6 and TCP/UDP combination.
  */
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <errno.h>
 #include <error.h>
diff --git a/tools/testing/selftests/net/reuseport_bpf_numa.c b/tools/testing/selftests/net/reuseport_bpf_numa.c
index c9ba36aa688e..502fdb9ce770 100644
--- a/tools/testing/selftests/net/reuseport_bpf_numa.c
+++ b/tools/testing/selftests/net/reuseport_bpf_numa.c
@@ -3,9 +3,6 @@
  * Test functionality of BPF filters with SO_REUSEPORT. Same test as
  * in reuseport_bpf_cpu, only as one socket per NUMA node.
  */
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <errno.h>
 #include <error.h>
diff --git a/tools/testing/selftests/net/reuseport_dualstack.c b/tools/testing/selftests/net/reuseport_dualstack.c
index fb7a59ed759e..d3c3d3f39f8f 100644
--- a/tools/testing/selftests/net/reuseport_dualstack.c
+++ b/tools/testing/selftests/net/reuseport_dualstack.c
@@ -10,9 +10,6 @@
  * This test creates these mixed AF_INET/AF_INET6 sockets and asserts the
  * AF_INET preference for v4 packets.
  */
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <errno.h>
 #include <error.h>
diff --git a/tools/testing/selftests/net/so_incoming_cpu.c b/tools/testing/selftests/net/so_incoming_cpu.c
index e9fa14e10732..95bd0cdc3253 100644
--- a/tools/testing/selftests/net/so_incoming_cpu.c
+++ b/tools/testing/selftests/net/so_incoming_cpu.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright Amazon.com Inc. or its affiliates. */
-#define _GNU_SOURCE
 #include <sched.h>
 
 #include <fcntl.h>
diff --git a/tools/testing/selftests/net/so_netns_cookie.c b/tools/testing/selftests/net/so_netns_cookie.c
index b39e87e967cd..18532d564f79 100644
--- a/tools/testing/selftests/net/so_netns_cookie.c
+++ b/tools/testing/selftests/net/so_netns_cookie.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <sched.h>
 #include <unistd.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/net/so_txtime.c b/tools/testing/selftests/net/so_txtime.c
index 8457b7ccbc09..011a24af9786 100644
--- a/tools/testing/selftests/net/so_txtime.c
+++ b/tools/testing/selftests/net/so_txtime.c
@@ -9,9 +9,6 @@
  * the expected stream. Sender will read transmit timestamps from the error
  * queue. The streams can differ due to out-of-order delivery and drops.
  */
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <error.h>
 #include <errno.h>
diff --git a/tools/testing/selftests/net/tap.c b/tools/testing/selftests/net/tap.c
index 247c3b3ac1c9..fa78b92d9740 100644
--- a/tools/testing/selftests/net/tap.c
+++ b/tools/testing/selftests/net/tap.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <fcntl.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/net/tcp_fastopen_backup_key.c b/tools/testing/selftests/net/tcp_fastopen_backup_key.c
index c1cb0c75156a..d30f89bb944c 100644
--- a/tools/testing/selftests/net/tcp_fastopen_backup_key.c
+++ b/tools/testing/selftests/net/tcp_fastopen_backup_key.c
@@ -12,7 +12,6 @@
  * there are no cases in which a cookie is not accepted by verifying
  * that TcpExtTCPFastOpenPassiveFail remains 0.
  */
-#define _GNU_SOURCE
 #include <arpa/inet.h>
 #include <errno.h>
 #include <error.h>
diff --git a/tools/testing/selftests/net/tcp_inq.c b/tools/testing/selftests/net/tcp_inq.c
index bd6a9c7a3e8a..71ee145f151e 100644
--- a/tools/testing/selftests/net/tcp_inq.c
+++ b/tools/testing/selftests/net/tcp_inq.c
@@ -5,8 +5,6 @@
  *
  * Simple example on how to use TCP_INQ and TCP_CM_INQ.
  */
-#define _GNU_SOURCE
-
 #include <error.h>
 #include <netinet/in.h>
 #include <netinet/tcp.h>
diff --git a/tools/testing/selftests/net/tcp_mmap.c b/tools/testing/selftests/net/tcp_mmap.c
index 4fcce5150850..72d5f1207ee0 100644
--- a/tools/testing/selftests/net/tcp_mmap.c
+++ b/tools/testing/selftests/net/tcp_mmap.c
@@ -46,7 +46,6 @@
  * received 32768 MB (99.9939 % mmap'ed) in 7.43764 s, 36.9577 Gbit
  *   cpu usage user:0.035 sys:3.467, 106.873 usec per MB, 65530 c-switches
  */
-#define _GNU_SOURCE
 #include <pthread.h>
 #include <sys/types.h>
 #include <fcntl.h>
diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index f27a12d2a2c9..6dbad97d1d0a 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <errno.h>
 #include <error.h>
diff --git a/tools/testing/selftests/net/toeplitz.c b/tools/testing/selftests/net/toeplitz.c
index 9ba03164d73a..e2d739892ce4 100644
--- a/tools/testing/selftests/net/toeplitz.c
+++ b/tools/testing/selftests/net/toeplitz.c
@@ -20,9 +20,6 @@
  * 5. Compute the cpu that RPS should select based on rx_hash and $rps_bitmap
  * 6. Compare the cpus from 4 and 5
  */
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <errno.h>
 #include <error.h>
diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index fa83918b62d1..a64dcfb242c1 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <fcntl.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/net/txring_overwrite.c b/tools/testing/selftests/net/txring_overwrite.c
index 7d9ea039450a..96972e0110a0 100644
--- a/tools/testing/selftests/net/txring_overwrite.c
+++ b/tools/testing/selftests/net/txring_overwrite.c
@@ -4,9 +4,6 @@
  * Verify that consecutive sends over packet tx_ring are mirrored
  * with their original content intact.
  */
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <assert.h>
 #include <error.h>
diff --git a/tools/testing/selftests/net/txtimestamp.c b/tools/testing/selftests/net/txtimestamp.c
index ec60a16c9307..33dba9e90dea 100644
--- a/tools/testing/selftests/net/txtimestamp.c
+++ b/tools/testing/selftests/net/txtimestamp.c
@@ -16,9 +16,6 @@
  * This test requires a dummy TCP server.
  * A simple `nc6 [-u] -l -p $DESTPORT` will do
  */
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <asm/types.h>
 #include <error.h>
diff --git a/tools/testing/selftests/net/udpgso.c b/tools/testing/selftests/net/udpgso.c
index 85b3baa3f7f3..9dc1026a033a 100644
--- a/tools/testing/selftests/net/udpgso.c
+++ b/tools/testing/selftests/net/udpgso.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <stddef.h>
 #include <arpa/inet.h>
 #include <error.h>
diff --git a/tools/testing/selftests/net/udpgso_bench_rx.c b/tools/testing/selftests/net/udpgso_bench_rx.c
index 1cbadd267c96..999df1236320 100644
--- a/tools/testing/selftests/net/udpgso_bench_rx.c
+++ b/tools/testing/selftests/net/udpgso_bench_rx.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <error.h>
 #include <errno.h>
diff --git a/tools/testing/selftests/net/udpgso_bench_tx.c b/tools/testing/selftests/net/udpgso_bench_tx.c
index 477392715a9a..d7632993b354 100644
--- a/tools/testing/selftests/net/udpgso_bench_tx.c
+++ b/tools/testing/selftests/net/udpgso_bench_tx.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <arpa/inet.h>
 #include <errno.h>
 #include <error.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
