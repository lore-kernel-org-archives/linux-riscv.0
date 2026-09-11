Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B3DC88E50
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 12:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TrOUR0Y3KZ/jGKhZ48XCbddD6cLJv1hhD+Y5XSnwmw=; b=KPQiKuusEzwdL8
	GkDzfldPbrBjHuy67usNmJo4+tPuLlAXAWkg0I+GgcNS6ZIbkFC3jdHlICNxbG7mTkxROFVdNsBVW
	GHe31UqYy+Giv9k6o6Jpgr7uJuWIKKDIx6eU13Db+0LKdbglLbfiQ9jR0+afIhIlzymXE+XZrzLfW
	IIiMUIzZbZhkW4E0R9Sq9pNNrvGO75DG72XOxt98yZOOtMCFAV8BpCPlex5NK34dZGm3ZNbRpShH3
	kYBUX6tXfnrvKJA8fHzkLPC5+7FJhufFt6QGm3RnSDi6XmR0Ib/aUA+AkcXjOssw0DLizU29SmaSU
	SbYpQmUdkFt7AjdHHBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50By-0000000GbNc-34mS;
	Fri, 11 Sep 2026 12:17:18 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50Bt-0000000GbJY-2iZa
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 12:17:17 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so797275a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 05:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789129033; x=1789733833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0eHZBxWOds1UYdEnuOhccIJeDRWzv84kT8tp0myDIA=;
        b=KEdsDunTd4FJ3YtKk3jS1xGccwJ94vhpSIMbjVslPd9qKVwhR1fulHqBV3thuc4VZm
         4yZPGT8Ago4TJsS6/Wo3r1xBguZQQtYUAYwxR0sLmSyE+GEM/Ul4YT9HDL/tUyufHnlU
         Nl3hop35ODb0lmHV3wAp0U7O/0YEMI5vQ69CiMLTEmCPysvB2q/PdmffUJO9LJc56fC+
         +MOleLZu3F4hTPz4+Vzmn8IhFzczOAytdWNpGSmOajquUQEOMzk/XzRvDtD7dbTayOlC
         bUVNmsoy9iWNhXA4uwC0FljSi6llNZGpUA82MyiaQe47oWEP+91aoJcD2duvwVGOX2zk
         Ol/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129033; x=1789733833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0eHZBxWOds1UYdEnuOhccIJeDRWzv84kT8tp0myDIA=;
        b=LCqeGA1ExPeBXvD/WsSEcOva/OLr8fVa+wrlCoSo1NEYaRbkuimpupB/0HbA6yBGwR
         uQnXIXl56qIa54EyAcSkZmYjfGDx3zkzVgI9wqxzCg5h891vlW2FZCRu0FKZz8m7eue7
         3LFNygAt7N6zIpTWRQNIrItBfifW2pR4mL5bMVMQLB3VFY91N372xCEBg5UB18U8Om0f
         RP4qKyfPUBFpWPsjhz3xXaLTAnBBHK8sV8PfxgK0TKODvGbH1bX+WryoIfxdYFUfqF1q
         mTQzwduek710u0pBlZofQ5G3kdSMOyuMzDw4BMD34IibnfYubHGW+RtV/hZ0e3ErQbkd
         OPBA==
X-Forwarded-Encrypted: i=1; AKwUvBy0HN+VhvQe2bwWWvzBXaSAhcH5TUuggrHrQ6l0TN0WT+932hSl6OUrh9xvveBM93ouflkCEFRzGx4YVw==@lists.infradead.org
X-Gm-Message-State: AFuF++mHt65WVNx+OMRLHbubGM06YkmQP3MOiKd1nZs5oHssAsFUrtzf
	k9XDsmYynIpOQvKE8315npAcnZQhUjkuYADx1NRH8MbwR3DPHFS4LEJW2urE5cM+Zgo=
X-Gm-Gg: AYBFou33l7V2FXGPYUH2nfxPdELvwRD6fmqCj0V1yCxaDfSE3Fg8QFkDVOWCi90Igja
	FEsPWyTAuZwcoARsmf0IpD9PGq9S1REgLRKec2VJtKAyZ83QCeeHJ39ktGPSEWtS7P3+qj/qHpQ
	Xd2KF53s4HwQm1imclNEm5XbXl4pHCMZMZ4NeOZYsHEpdp9E5i+KoD+BXkxQyJl/NFxcxubflVk
	XiAF51aBhZrA4t+MOIOxxe8INUZEgT8nxg2SuvYgh+xtm379vKpjFjK4vFf/0Xnp+4xOju7+uJx
	Dxgiawjrpr62B3WWpn2GZ0r9qBfX09rhcmiMmX2mzynzsVOEdnNlOBUNikWLnB2KvDCRqdCKksq
	uW78b5vzbrAMTUy3CTL/xjWIdH3W4PhZtApC8ib4tD3XLuiWm9Xff8/8g6PK5fDf0lzt2PwF3In
	reVFzPvRy51U/Xsk4SRpwhbR3/qZZpSt6eLnv8OrhLwSs1murkMhLsV/yxbWruHhixqPA6IAu+Y
	ItvSLDQaidL5rcouqJFGuNEuRpRuJWiEbnkr83BVEbXA+cqVXUS
X-Received: by 2002:a17:90b:270e:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39d9c1fe880mr7597131a91.17.1789129032846;
        Fri, 11 Sep 2026 05:17:12 -0700 (PDT)
Received: from FJ7FR2JRQ3 ([2409:8a28:f48:3091:908c:b537:572a:4db0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm3178278eec.8.2026.09.11.05.16.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 05:17:12 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuanzhu <yuanzhu@bytedance.com>,
	Yicong Yang <yang.yicong@picoheart.com>,
	Susheng Yang <yang.susheng@zte.com.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v10 5/9] riscv: mm: avoid enabling interrupts for nofault page faults
Date: Fri, 11 Sep 2026 20:14:52 +0800
Message-ID: <20260911121456.33223-6-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_051713_718127_3C971D57 
X-CRM114-Status: GOOD (  12.79  )
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

RISC-V enables interrupts in handle_page_fault() before checking whether
the fault occurred with fault handling disabled. A nofault access from an
atomic context can therefore run tracepoints and open an interrupt window
before reaching the exception-table fixup.

Handle an exception-table entry before entering the generic fault path when
fault handling is disabled. Also keep interrupts disabled until such a
fault has been resolved.

This makes RISC-V consistent with the expectation that an in-atomic
nofault access does not enter the normal fault-handling path. It also
removes one source of re-entry when perf sampling is delivered through an
SBI Supervisor Software Event (SSE).

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/mm/fault.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 04ed6f8acae4..520495420462 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -294,6 +294,13 @@ void handle_page_fault(struct pt_regs *regs)
 	if (kprobe_page_fault(regs, cause))
 		return;
 
+	/*
+	 * Nofault accesses must be resolved through the exception table before
+	 * entering the generic fault path or enabling interrupts.
+	 */
+	if (unlikely(faulthandler_disabled()) && fixup_exception(regs))
+		return;
+
 	if (user_mode(regs))
 		trace_page_fault_user(addr, regs, cause);
 	else
@@ -314,8 +321,8 @@ void handle_page_fault(struct pt_regs *regs)
 		return;
 	}
 
-	/* Enable interrupts if they were enabled in the parent context. */
-	if (!regs_irqs_disabled(regs))
+	/* Do not open an interrupt window before a nofault fixup completes. */
+	if (!regs_irqs_disabled(regs) && !faulthandler_disabled())
 		local_irq_enable();
 
 	/*
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
