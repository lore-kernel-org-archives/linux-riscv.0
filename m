Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1B8C5DF81
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 18:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62K9PoFzVyP3FwjdA189peHRH9YAS0XmAYsPDjYYRDc=; b=HZcWllD46DIeqg
	TkAXd9oloX+cFol2QhSxXlCuXuyhJH92r/oJ0s1o0KVqYKTi3XNnkQzaDvxfZ60NU2IL4+kreRwWH
	6zJcmEppTZXYechNa7uwUPp5piMfYQ1irO6JBaSDsxVLAxK67nIM8PwZTsajjj6197+bVTZ/aqp6K
	KsLGDuWADcpI+wHhT3N/dA7xFK4kH2u8ak51iajLZTjxYSFA8NSSb3W3Rk3LFjK0lRpuDetN9bjrq
	1ZL/owWuKlJjUuJahBfGW9rISEmPrYnhE7QQbwG6VEpsQ3CV6zdSVpl6YT0L7K8SUCwPanX11MHhi
	pofKtkUmxQa/Alk8caNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkql-0000000ALeC-3qqz;
	Wed, 19 Aug 2026 18:17:19 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkqj-0000000ALbe-2t1Q
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 18:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=47xAFsvg306prpgVajo74hEldqY7N4ca2VW9wdN3GaU=; b=AfLsSoBTiH5F9ZSQRAuAXOY1fp
	bb0y3sYHYFgwyVE6oEAVALFM3R21RF1jwvNv0UbRizwinPs4PkbEA5Rwkx0SFbcYbFbgb45B8Nzmz
	/3rOV3BebiA2wdR8Pl7X9CtORxSnoQiycjNEWBt2c4r2W4kmZ75rQPKk+CJLpai4v9s1afAAGD8nU
	oUO/5t+8EtcAglBFC75PabhKO74r0T6Ja5AveNM6odcKjOovuoslzTOHtsK66tGS52ArovowVe+Vm
	YQjbA+FgflQbpRMbn/6ufY5Scz8/w+WYVUq1cSDUtubabcsEQEF9rzRHM5xPmZEw87jFoyBWwoSK2
	+N2sZ4aQ==;
Received: from 186-249-147-181.shared.desktop.com.br ([186.249.147.181] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwkqY-006ENH-QS; Wed, 19 Aug 2026 20:17:07 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Wed, 19 Aug 2026 15:16:24 -0300
Subject: [PATCH RFC v3 11/13] sysctl: unrandomize struct ctl_table.procname
MIME-Version: 1.0
Message-Id: <20260819-sysctl-module-aliases-v3-11-aab90569365d@igalia.com>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
In-Reply-To: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
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
X-CRM114-CacheID: sfid-20260819_111717_739492_15EDE1CA 
X-CRM114-Status: GOOD (  10.97  )
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
index b808fbc1d964f453db8e354825fd8800db1eecd3..ccc77bb918614b1de1e44fbef70471c85fb55c09 100644
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
