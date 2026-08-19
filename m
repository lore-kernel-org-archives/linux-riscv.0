Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDA8C5DF81
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 02:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lkfNjLup5jNPT2mKKfq7ki8tadBxZ07RD8o0Oh2y7A=; b=O2N5MSvLpfcApJ
	HyzFS/gXvUHpVEdDf6rt0yWmvQ9rN72YwIK2saz1k3nRmfERB8CRVv2Z1oBy7vvur9qEUumV/JgoP
	mUwwqivsU68o3yGQi64dwTI+cmuWoTCWQjgCFE+ddI+uNT14GBSq4eI8WMk+AkSuikd2lkf88pGEK
	NOaG/tJ28Qg+o3/2Ioh25SQGDpNnXWyH5tGDFpyCr6lBMghUj66+QjBFnG/5/sweFk3BIDsqLsgPf
	ODBsFtrL6R15kjA8ch7QfjYITrEG4rY3Jg7k/Ek6At4YQuG/CHrqwDpRryTrNiBAWeXTkdzXMf/jS
	uYZG8OSZAYWv6nTIZ8AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwW4X-00000008scd-1u5t;
	Wed, 19 Aug 2026 02:30:33 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwW4Q-00000008sVy-1UH5
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 02:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=jcWdQbXP/kHWb1xcpo26FcJ2qHm9uH6N5DjjZNrZnS8=; b=BEOtuYvkZx34qtwPCbyxsdAsY6
	wt1vEcZkneUIRDRvOjlvxWGKMLwGz4LB5AulnRi+hi2VF/YgQJMigWj0G6OcRTrnRRPIc+u6lHxVh
	99019UvHalg7deeX6cY5LcGi0gXIBYrLkTjmdTrJYnpVZT9fHkcr9vwcCQC2P5RHnhEyleMv/iMRE
	0b5a0cSslBLc+6mj05KF9pvvh0jLjS6JdJY9ktYVFg09l74rRgKv9MJ3cLq153lIfP3dnq0tPLyfe
	T/8v3hIBd+X+5ToJ4s7UaHrOB4QhkU3y7ZFvMM++E59w9yj7Vl+gJa2tbVAEv9aYQeGp+IdxQEzSj
	5vaLg+wQ==;
Received: from 186-249-144-28.shared.desktop.com.br ([186.249.144.28] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwW4I-005tfG-44; Wed, 19 Aug 2026 04:30:18 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Tue, 18 Aug 2026 23:28:10 -0300
Subject: [PATCH RFC v2 11/13] sysctl: unrandomize struct ctl_table.procname
MIME-Version: 1.0
Message-Id: <20260818-sysctl-module-aliases-v2-11-d5a69dae5798@igalia.com>
References: <20260818-sysctl-module-aliases-v2-0-d5a69dae5798@igalia.com>
In-Reply-To: <20260818-sysctl-module-aliases-v2-0-d5a69dae5798@igalia.com>
To: Kees Cook <kees@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: kernel-dev@igalia.com, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, fsverity@lists.linux.dev, 
 keyrings@vger.kernel.org, bpf@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 netdev@vger.kernel.org, linux-wpan@vger.kernel.org, 
 lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
 coreteam@netfilter.org, linux-sctp@vger.kernel.org, 
 linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org, 
 bridge@lists.linux.dev, mptcp@lists.linux.dev, rds-devel@oss.oracle.com, 
 virtualization@lists.linux.dev, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_193027_036835_E0CEF7F9 
X-CRM114-Status: GOOD (  11.05  )
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

The 'struct ctl_table.procname' field (sysctl filename) cannot be accessed
by scripts since it is defined in kernel headers (see "don't include kernel
headers into userspace" in file2alias.c) and its offset may be randomized.

Unrandomize '.procname' as the first field so its offset is always zero and
match the 'struct ctl_table' symbol address, which can be found by scripts.

Originally-by: Mauricio Faria de Oliveira <mfo@canonical.com>
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 include/linux/sysctl.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index 7e05fafd5544e1c4a3283dc13b0692f39515d01e..120c0f05bd083e08d8104ff05136138f2e8cdb07 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -220,7 +220,14 @@ static inline void *proc_sys_poll_event(struct ctl_table_poll *poll)
 
 /* A sysctl table is an array of struct ctl_table: */
 struct ctl_table {
+
+	/* This must be the first field for module aliases (file2alias.c) */
 	const char *procname;		/* Text ID for /proc/sys */
+
+#ifdef CONFIG_SYSCTL_MODULE_ALIASES
+	/* This begins the randomizable portion of the struct. */
+	randomized_struct_fields_start
+#endif
 	void *data;
 	int maxlen;
 	umode_t mode;
@@ -228,7 +235,14 @@ struct ctl_table {
 	struct ctl_table_poll *poll;
 	void *extra1;
 	void *extra2;
+#ifdef CONFIG_SYSCTL_MODULE_ALIASES
+	/* New fields go above here, so they are in the randomized portion. */
+	randomized_struct_fields_end
+};
+static_assert(offsetof(const struct ctl_table, procname) == 0);
+#else
 } __randomize_layout;
+#endif
 
 struct ctl_node {
 	struct rb_node node;

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
