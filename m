Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15481C25B06
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 14:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RuC3o8JpD9FkJok4jNHRrZvrkV+8uEERQ7QiqTWMdrs=; b=U8nlQ5g3tCfqJh
	hgm56DPnO2VLjGvTVaJWVKls4UF26SIHLN48fFh5iJsJltgDAPEOat03rqw6uXKGQpumhxCFyoXeC
	nw4Z22sjmpNhk7Qvepfc0JfJAAJoQlEobQ2RlCToMksyue77d54pHfMJ3NPnMfB89wq03rEI+Ch8Q
	7jS9OIrJjEVLULj1IQaxSvuKyXbkzxENLuup6p9TiEeTtQYjcFcWR/HEFS6PuJBZqffe3QL7rBe3h
	SZq0heQwryxuAlCuvnfYvQQcjwQlWpwYXHv46t8GvDYqyPKXPsvBJyx5A4iL2ACVOQKF0H11EKGro
	DRthTTVMrnEHMhU2DtFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNEMW-0070du-R1; Sun, 14 Aug 2022 14:13:08 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNEMK-0070T6-8q
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 14:12:58 +0000
Received: by mail-wr1-x42e.google.com with SMTP id j1so6369888wrw.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Aug 2022 07:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=pPv0l6vD5WlLpI1nTN7zzV3sMR7lS/dRIy37KSKLV6k=;
        b=HMMTLU/p8YLEHSGr0JdrSHHzL+KPSzr/2SbHVIYZPefUDLh0i6BEpVFmoM7PonqAQu
         XHK1xmVw1UBg2BPE8d6h3iPvrE+h3Ms+3mRmDMA9Wb50IKTeWvZ0qIOlXZ1ZkoUbFGHE
         0mUhMOI5/9Bp3r2iu5qSOoF2uZw6OohSrtuVWL1610+z/NlAO6QENPP2PWA5I1CD3+Ng
         euh7jve2sSLkFojItamUEEE3h9vElikeXBeEWacM1nyspNJDM6MQj9pdpf6uA3YdvvbX
         JHdWK+memg4nFTSgdmc6BoFrjCm7SFf/6eVZhXMvj+kHJE/DRuNDbHBIhxDKgeNhP0WF
         Scrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=pPv0l6vD5WlLpI1nTN7zzV3sMR7lS/dRIy37KSKLV6k=;
        b=64f4GkxYiczY362FOgPtNQvUHAIxiB07riEieSFdh9qvbYyi4kE2uX4F4AaAoehnrb
         Wam9+qfUm3xem6zFqYBIO0rE2cMOwIOyOeTJAp39/UvPSfEFHoT/Jbx7nORsmuxOLWLC
         IobFnCfmpXI7u15uEylur7KhOXiracOP2+JQwlx7XsFslRI/ez6UIYL8+oUJ9gHoybvo
         rHanJvlUfV++4GmqTpZNDVMithC28RR5LkfyWIaE8uNeLqPnR9hN1UUyjT5fqCwUUid2
         CHx7JTl2Rsn/nF5NAMuEanan95qH/HMvCq8SiMR6Wz0NdzH4K84Qmut7aoaBBcU5uQOc
         TUpw==
X-Gm-Message-State: ACgBeo1zZAurXwqKjYsJ2UrGJJO7LT9wU9VZRoSOkgZfJ0cojPUYkQK6
	UpSKkXSjTUpSqgse/TDqAIrFuA==
X-Google-Smtp-Source: AA6agR6BPhLCEYbGHWwFtW7IA0BVcNy4nXrlbW7af92IxkgTrJMJnNk9uz1mkz0iwWDTuJ1TmfrDbA==
X-Received: by 2002:a5d:4705:0:b0:21f:3890:8619 with SMTP id y5-20020a5d4705000000b0021f38908619mr6285685wrq.104.1660486374334;
        Sun, 14 Aug 2022 07:12:54 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id b8-20020adfde08000000b0021db7b0162esm4625419wrm.105.2022.08.14.07.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 07:12:53 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Tong Tiangen <tongtiangen@huawei.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] riscv: signal: fix missing prototype warning
Date: Sun, 14 Aug 2022 15:12:37 +0100
Message-Id: <20220814141237.493457-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220814141237.493457-1-mail@conchuod.ie>
References: <20220814141237.493457-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_071256_495882_DDD838BC 
X-CRM114-Status: GOOD (  11.83  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Fix the warning:
arch/riscv/kernel/signal.c:316:27: warning: no previous prototype for function 'do_notify_resume' [-Wmissing-prototypes]
asmlinkage __visible void do_notify_resume(struct pt_regs *regs,

All other functions in the file are static & none of the existing
headers stood out as an obvious location. Create signal.h to hold the
declaration.

Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/signal.h | 12 ++++++++++++
 arch/riscv/kernel/signal.c      |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 arch/riscv/include/asm/signal.h

diff --git a/arch/riscv/include/asm/signal.h b/arch/riscv/include/asm/signal.h
new file mode 100644
index 000000000000..532c29ef0376
--- /dev/null
+++ b/arch/riscv/include/asm/signal.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_SIGNAL_H
+#define __ASM_SIGNAL_H
+
+#include <uapi/asm/signal.h>
+#include <uapi/asm/ptrace.h>
+
+asmlinkage __visible
+void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags);
+
+#endif
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 38b05ca6fe66..5a2de6b6f882 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -15,6 +15,7 @@
 
 #include <asm/ucontext.h>
 #include <asm/vdso.h>
+#include <asm/signal.h>
 #include <asm/signal32.h>
 #include <asm/switch_to.h>
 #include <asm/csr.h>
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
