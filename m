Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46312E77173
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSCrIVHIkIicTGt5aIuWR1aSRV1M6PPm9zVXzGwPA3E=; b=XXc4BuY+bsf3ew
	PHFJrZVGbKXRcdJA2tpSrVf4e/+KO6pW7+wbZWDyHvoxD7GYGgL7xTp/t4gpF4+6UrTTE83HNi8yK
	w5bFSE8xW1uqD/wK+r6TubY4Sw+SYNGEVLYXsilvbwMnuMTuEpSgNJ/ONhllg+JRUNDSlLwdOrjcu
	aTme1z6WE4hVHX04wIBVewamSFBUXUVasknEHWc1+I810ZOjmxbcSnJqWxFeFEUeDc2bqOb087rK2
	mwGa6tF2Exe+MB41brq83/3QMY1+z2mBd0KB3uKwSJfYUVvqy5kCtTd0z4HcJaon5j7a4E66NmxoZ
	rF1TKbC7YMoyJeHIyesg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9M5-0000000Fanp-37kP;
	Thu, 05 Dec 2024 10:45:09 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9GD-0000000FYUr-0ATV
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:39:06 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7fcf59a41ddso474622a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395144; x=1733999944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDBjWSESYKBIcxm/6NEJ0fQX3zIek6Dl7/vbsKDZ5GU=;
        b=e4cbb3//rN8pfSGJdbp6Z7lLbB27L+mq7YblVtFcbS5O2uvPbQ1DV+YRZmyhc++7hf
         xb5XxW1y7kd8soqzY4sD7otOx8HfXH9OkwQOkFSATSleGY8DSt6k2nPkU0uAhOMHuf2i
         iSfufSXL2mIdTkk2W+cb1byaYkJVS2oha8MvylpxOp6bWgkJ/j5eDcceXyOr6gy4D6xm
         fC2cR3BgW+K/zJymyXqPw8C5NHkAMGFnSExrc3d2tepDJXTSIXfFhZXXWrYU7yut0C4O
         o9/b9kZMKuJjia/mQw9KeR7hjKBwF+t59Vi5YaIX3WTn20chv+itOPJ9G4dElifqlr1b
         BdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395144; x=1733999944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDBjWSESYKBIcxm/6NEJ0fQX3zIek6Dl7/vbsKDZ5GU=;
        b=F1fFAnabQY0D3s/UoB5RYXXokZsynPS/FlcNdOABR/BeYho1eT8NmJOvelfJviohnu
         TOfk2RPENjgk9sIb3n+xdGMum7y32q/1O3JNWONiwhk4P7OfxxGHvyx5iT1Zo4dIQ6xS
         SFfegIuaJHQ4HyRZsqqoSUiGHOY9LlEicZDMAqD9s/2eqRbf742fRJFpOhZU8L2U8yIb
         wPCwMVdtEuqxcv5GEfpsUbACQCWToI7wAj72EcqsHpl8tgkJCsmXg5+VmLNV4e09PZkg
         bupZI0td+2Kv/1NxW59YwdWHnjGzmKUtb+kUc2hoFB48aafW45vnK/8pvXjdz75VsL5g
         dafg==
X-Forwarded-Encrypted: i=1; AJvYcCW8ImFTOlyTMhCGKEOQweAtzuEZ5vCx1FLi9CsKdiUSRQInxxVVUkvLuibuhSko/DQLjIt40yigE4Riig==@lists.infradead.org
X-Gm-Message-State: AOJu0YykCcWaZDCVNwucqzpLlpbi9ECOaNophll4H61/Sk7REM/2wVAD
	+bBc+ZkAqaX5fednTnVaX/JIBo0BB6V1caOJJJN76ejiLQBVJM9Lo7SKuwux7SE=
X-Gm-Gg: ASbGncvcUHrVEVyXdMyqWVbOyTb7OTK4ftmX1/6jZdgOV8N5D8AOz5KG2xWpID9j+QE
	UUr0W8/UbXZWZkjduO7Jy4iB+BWffWZiZ9UMPjptsGolQdqBERSghkzBoTx451gmfCE6k/kqxGu
	FD3ynH1MlMwdWsOlpLUHL/IUcT1bqaqdhrH1Qg85odCtLgBI3bpZRUQJ+y6gM5Jd6woLqR0owez
	mnexOS5psNNdwLUZ3IFNVHSRytB9dDZoB10h1UWnghtvvL/J0PMxID1L8O03pF2eP21viLWFY54
	OloLaj5lg8PuoCCNr0ugofsb3CSowFhi
X-Google-Smtp-Source: AGHT+IHKuqD7zayvSRrPEZJa2a5jeQV4cpoc2Wz2fLw8d8qFILc/CQ/vzSdEu/3MiaJEA8awaTzYNQ==
X-Received: by 2002:a05:6a20:3d87:b0:1db:d8a5:7c82 with SMTP id adf61e73a8af0-1e16539f381mr15601577637.5.1733395144181;
        Thu, 05 Dec 2024 02:39:04 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.39.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:39:03 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 21/21] riscv: mm: Update EXEC_PAGESIZE for 64K Page
Date: Thu,  5 Dec 2024 18:37:29 +0800
Message-Id: <20241205103729.14798-22-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023905_077484_DD2BAA5B 
X-CRM114-Status: GOOD (  12.19  )
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

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/uapi/asm/param.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 arch/riscv/include/uapi/asm/param.h

diff --git a/arch/riscv/include/uapi/asm/param.h b/arch/riscv/include/uapi/asm/param.h
new file mode 100644
index 000000000000..1221e570a077
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/param.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2024 RISCV Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef __ASM_PARAM_H
+#define __ASM_PARAM_H
+
+#define EXEC_PAGESIZE	65536
+
+#include <asm-generic/param.h>
+
+#endif
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
