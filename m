Return-Path: <SRS0=+8gn=2G=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF192C2D0BF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2019 09:14:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C45FA207FF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2019 09:14:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cb9+EJVC";
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BckQdlsi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C45FA207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qigMm4EqiyANinCkFguk39Cl6HfqkkQUc4cgfeXf+Bk=; b=cb9+EJVCVj6BAu
	Y99k4Qe9K0xCEl86+bzHwBcOhBFTUp/7hMuNCP2gSZo14PAfaSAe5IegqW9OM6RKoj9vXdST2uGgI
	I412vwMivDLAp9lXcPXV8yTolBctgj0TixIfDs2qAoTf6d7NDF5QlWcYOemp5smaQfpk7TobpR/FF
	hJLKUgakG0Ss+GqOnAhdDHL2VH4HmdhTHvuNpQewSpYDnME1BDYeLujZwAKIOfWo2/k8gthG4CfL2
	mrAoZkco11S0jTQ0uDA79+ItjuleIPcg1FLfJ6B4LgisFds8nPZ2gDpfNtIPnsZ8JI1skVjkyxP3r
	hqNxFHw3DRMhVZQkqvAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igmSP-0003oT-KP; Mon, 16 Dec 2019 09:14:25 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igmSE-0003bR-JY
 for linux-riscv@lists.infradead.org; Mon, 16 Dec 2019 09:14:15 +0000
Received: by mail-pl1-x644.google.com with SMTP id z3so2663993plk.6
 for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2019 01:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qigMm4EqiyANinCkFguk39Cl6HfqkkQUc4cgfeXf+Bk=;
 b=BckQdlsi9Dt8xH9pgrko9rHI855k7PWdnlZrhPLcQy1knWeDRCLkG4wmWQGrD3H9cl
 DTETfafa7A/GSj+Gt8KZfmw4HoHFjPhXHz/y7pWqTG0IGvA7h7Mx6PGpkYImGk/ItzsS
 bcVjB9HDw1w6xoHheeRZxgBzmmVjntrQWxIXykYzH3nGVQUFJzWRSz6wwW5JGRwxR+Jm
 pJ+ehcrStwAelXTioCm+lwQPBh9B+w34pAXtkbWD6vv8IKhncG2t/jDtjWKVKB93XLi9
 OM4noU82f6UvjevNGfYkH9Ts/L4ck85HkMgQVjH6cKPjiizKKGgBVO5hpaNT62ZyDdsd
 nHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qigMm4EqiyANinCkFguk39Cl6HfqkkQUc4cgfeXf+Bk=;
 b=DKVt0onAbpfkmymv7LEmC6U3+WJYTU5hCcYPF3VhVe65D65ovahmgZEmAYLhqBGqpB
 RTiYonAlG4UfZfcqy7V1jbZ/GsXzEMHVoiR5W4NnLbSRIP4fi44SBcmLMQVDbSrw+rbY
 QWGjpEKhVKl0BdgwevoRq3aAISL1rc81XgFIsSJi1jV842zW9cskm4LJj4lKVd7vseaI
 7ApX0S8yG9FCxQTnFkCSU08e7q1asiOMAbc7XvCWfb0Fh1JuD1nd3XzEs2YIRCFwUx94
 auvamPs/CLsV8MfF5xV3qF/p7HlSjxavtxrvPWNC50wWOUsYSb8765FiiwUEDO2gXWhv
 /bHw==
X-Gm-Message-State: APjAAAXGmadB9KZkxcbXo7vakbXaMzBuQ/yiYPlIlQwkemaRBr2j4DiT
 GpehMloEVU5/H9fuRDarvA43N1zWzeA=
X-Google-Smtp-Source: APXvYqxYqrVllDXaRnxxFZ6SRKc2DpVooTXs1XkSRJUyLVLcEMZa21+AMT6rkirvRyXtPMIQO7C7OQ==
X-Received: by 2002:a17:90b:30c4:: with SMTP id
 hi4mr16752987pjb.62.1576487653507; 
 Mon, 16 Dec 2019 01:14:13 -0800 (PST)
Received: from btopel-mobl.ger.intel.com (fmdmzpr04-ext.fm.intel.com.
 [192.55.55.39])
 by smtp.gmail.com with ESMTPSA id x21sm12505033pfn.164.2019.12.16.01.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 01:14:13 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: daniel@iogearbox.net,
	ast@kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH bpf-next v2 8/9] riscv,
 bpf: add missing uapi header for BPF_PROG_TYPE_PERF_EVENT programs
Date: Mon, 16 Dec 2019 10:13:42 +0100
Message-Id: <20191216091343.23260-9-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216091343.23260-1-bjorn.topel@gmail.com>
References: <20191216091343.23260-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_011414_649851_58DD1B0B 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add missing uapi header the BPF_PROG_TYPE_PERF_EVENT programs by
exporting struct user_regs_struct instead of struct pt_regs which is
in-kernel only.

Signed-off-by: Björn Töpel <bjorn.topel@gmail.com>
---
 arch/riscv/include/uapi/asm/bpf_perf_event.h | 9 +++++++++
 tools/include/uapi/asm/bpf_perf_event.h      | 2 ++
 2 files changed, 11 insertions(+)
 create mode 100644 arch/riscv/include/uapi/asm/bpf_perf_event.h

diff --git a/arch/riscv/include/uapi/asm/bpf_perf_event.h b/arch/riscv/include/uapi/asm/bpf_perf_event.h
new file mode 100644
index 000000000000..6cb1c2823288
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/bpf_perf_event.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI__ASM_BPF_PERF_EVENT_H__
+#define _UAPI__ASM_BPF_PERF_EVENT_H__
+
+#include <asm/ptrace.h>
+
+typedef struct user_regs_struct bpf_user_pt_regs_t;
+
+#endif /* _UAPI__ASM_BPF_PERF_EVENT_H__ */
diff --git a/tools/include/uapi/asm/bpf_perf_event.h b/tools/include/uapi/asm/bpf_perf_event.h
index 13a58531e6fa..39acc149d843 100644
--- a/tools/include/uapi/asm/bpf_perf_event.h
+++ b/tools/include/uapi/asm/bpf_perf_event.h
@@ -2,6 +2,8 @@
 #include "../../arch/arm64/include/uapi/asm/bpf_perf_event.h"
 #elif defined(__s390__)
 #include "../../arch/s390/include/uapi/asm/bpf_perf_event.h"
+#elif defined(__riscv)
+#include "../../arch/riscv/include/uapi/asm/bpf_perf_event.h"
 #else
 #include <uapi/asm-generic/bpf_perf_event.h>
 #endif
-- 
2.20.1


