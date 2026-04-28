Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61384FF8867
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 02:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h7Ktkxn6DAaaP2aFNAZh6JBVaFCRYZezNVoh9WKbETI=; b=snu6oXextFetMt
	XyPaxFneIhPG3ldM+ARKH3yfOW3D0FqjeSLMKFuFkUIyCaO+SA2N70dbsD1RN3YoxL+pifN/H3j2J
	m8tkQvcWM1Kby6q4jpRUy3uLYK8Yonf0xcnigN13uo039WGfUXDHS+jjSi4aNOzgNkjrTS9cGgdsQ
	ZNT3qeUaxa/lf+gv8W5iCVofNd1vMKeqZIgVHyXmgtYfxQ9cW3qkzgoZlV+PjN9JjUlJF3BRH1Ofz
	p/H9IkrJ9fh+bo6XqwcMFZTjGbhqnNtozay2ZFDKXQ/IWsLoBFI97g6VY8YV0lLezBKRD0ICULDXN
	mi0jY8nJ6Fg6G8RcUZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYNr-00000000SR3-2vjm;
	Tue, 28 Apr 2026 02:41:11 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYNp-00000000SQh-2Y2B
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 02:41:10 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2d9916deb14so19259988eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Apr 2026 19:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1777344068; x=1777948868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xBnMRKm4HOrWsem4bfxRVhKbbPsJU4q6tVVLOb0/SDc=;
        b=nSiZsgwkjaqW4vEYsKfCluhbutsNX6lnYK2gatahOjZxFgRySGRoJhB2pLIRwM/yS5
         ygARpMBtqYDMgBDPPK9VePizIyXn5TGtsRPJL33nUaiSvixn0wmHHr78O2PN+O+wbPYk
         SoHDNaA1iT088mCzJyosgDo71IgmFHHWJr3tW5DYQQaWqg/PAtEJYDDMBHrdaxt/Yf44
         MMIau+ZbeF3CNzCznt8PI3ZQMwmFVPVLgxERo0sJKc1GCfKbXYhHpV8/cQ67sPM8fHIS
         X2eeH/GxaKQqWWii8fVvMHZxrmuTQ3sTmvcZEJNvyiXmwwcEs+4EAEZgTy7IY6NPuibD
         Qmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777344068; x=1777948868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBnMRKm4HOrWsem4bfxRVhKbbPsJU4q6tVVLOb0/SDc=;
        b=DGT0PmI7Wu/dDa+HBv5S4GPhvT6VEqbgQupSuqbDtLJDc+IH/tDaSZOB/oBcivyK/e
         ZXDc41aAlR+pmug4VSzgH76d2o+y7RshduFM5bd5W0AI0qHbgFKJPFyROQj8kL30g9d7
         jXZd2KsWU7iVsHE5k2ilYrBhh9C/XJmE0h3wwSymkbTHD8hNP0sxE1F9HlGrn1hIc2ZI
         3oUq06tuX0iiDdZPcSX5NJTekF6H9R42rw5XpDaGM+MRAAQN3zB5QLzmihKHi/yFP3Fr
         alhwOSMjoRgtUyq2xF8VTMEBPKSFDurQtsuOcz698Ml59q8qJtOuGjv3FMbonRR5UR/3
         fKMw==
X-Forwarded-Encrypted: i=1; AFNElJ+HBP+l0gZg+nj0P25dyhj1yoy02KxB3NRjaUxbWElUpIQpzhmUFuvFwtrSdMXQ/NrQbL50HEsjs9zoaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzykTgIpni3gyRPUl807D3jf5y5kQ9ZQETUyealYb5Dp8TVU3G8
	Gu3N6r4OwJymGu8YuQN7IMqyhIadQRFCqMPGsTtewfDr5IqVhptgKSRxs+J/HAXG/a4=
X-Gm-Gg: AeBDietL/bJW91dBesxYAywuZEEKImlDchS4ADmJzqGCXCHMnrI16PfFlwn4p14vnn1
	ebI5NTQB3HjMP1FDITzoT4+F8xkzpwaKGA8ZLQ3TiU6hcweRM+LzZtYyTcKBQkGk3VpNkMNiJmz
	fZmcgEulyboXzZS7jByLREQTv4ohSNKyb8Yrc8T0BsUO8fiCQSnh/lK6NAG60rYYBI6+ZKdE3Bh
	SLqUrrVK98Zz/0b2ny3Hex9vv13JwSUzt4s5ucRobDN9+IurdlEFTFZdGEy4BpPYTvyO1DGto12
	+97koa9JqzijFRnAiCp02kTsXUPnNHj3V+9z3CHgcxOHpFu8XV6glBenlWZLoZD2L7vBtxJwyxI
	d2Cfs1fNLb8u/KQf/2fy05IZOk8IwCCOZIxGyQL3MDKPDcq6yuJQoJfYbijdTW7LqRqbFMnBAZK
	vH/9oYn3tRT3UJnkh9RLHD9iJKqm1F7/bdwJNGJ3bJ2MxIuIIQNMIO7inf
X-Received: by 2002:a05:7301:128d:b0:2e6:4d6e:2cbd with SMTP id 5a478bee46e88-2ed0a03bbbdmr685314eec.8.1777344068469;
        Mon, 27 Apr 2026 19:41:08 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a10678csm1273397eec.24.2026.04.27.19.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 19:41:08 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	debug@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2] riscv: cif: reduce shadow stack size limit from 4GB to 2GB
Date: Mon, 27 Apr 2026 19:41:05 -0700
Message-ID: <20260428024105.645162-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_194109_679077_9FA58303 
X-CRM114-Status: GOOD (  12.54  )
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

Follow the ARM64 GCS (Guarded Control Stack) implementation approach
by reducing the shadow stack size allocation from min(RLIMIT_STACK, 4GB)
to min(RLIMIT_STACK/2, 2GB). see commit '506496bcbb42 "arm64/gcs: Ensure
that new threads have a GCS")'

Rationale:

1. Shadow stacks only store return addresses (8 bytes per entry), not
   local variables, function parameters, or saved registers. A 2GB
   shadow stack is far more than sufficient for any practical
   application, even with extremely deep recursion. Using half the size
   maintains adequate while being more resource-efficient margin

2. On memory-constrained systems (e.g., platforms with only 4GB of
   physical memory, which is a common configuration), allocating 4GB
   of virtual address space for shadow stack per process/thread can
   lead to virtual memory allocation failures when the overcommit mode
   is set to OVERCOMMIT_GUESS or OVERCOMMIT_NEVER:
   Error: "__vm_enough_memory: not enough memory for the allocation"

This reduces virtual address space consumption by 50% while maintaining
more than adequate space for return address storage.

Signed-off-by: Zong Li <zong.li@sifive.com>
---

Changed in v1:
- Use min() instead of min_t(). Suggested by David Laight

 arch/riscv/kernel/usercfi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 6eaa0d94fdfe..cbfb4e495e9f 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -109,15 +109,16 @@ void set_indir_lp_lock(struct task_struct *task, bool lock)
 	task->thread_info.user_cfi_state.ufcfi_locked = lock;
 }
 /*
- * If size is 0, then to be compatible with regular stack we want it to be as big as
- * regular stack. Else PAGE_ALIGN it and return back
+ * The shadow stack only stores the return address and not any variables
+ * this should be more than sufficient for most applications.
+ * Else PAGE_ALIGN it and return back
  */
 static unsigned long calc_shstk_size(unsigned long size)
 {
 	if (size)
 		return PAGE_ALIGN(size);
 
-	return PAGE_ALIGN(min_t(unsigned long long, rlimit(RLIMIT_STACK), SZ_4G));
+	return PAGE_ALIGN(min(rlimit(RLIMIT_STACK) / 2, SZ_2G));
 }
 
 /*
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
