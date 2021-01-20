Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F34C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:26:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBDBF23340
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBDBF23340
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tlQcdjnJNQZlj9pjKejdAKpcTVJ4OdM0GFPWz+mr8lU=; b=ukL8wxKX0JSqhziCYBf/rqAYK
	ciN8h77JuvmUyVmOr6Oj1spZCoKpCQlXCd8EB/d48ZbssVNMEKC923CxWdgE3H+tQSIigI+J+5p6V
	ZSzGVkNUlYZmnw19MjrDGVMiHb/wsbvbThfyWbxjtXN29TtWuo81bpTVTMXH492Dubfur4Mqv0iBA
	8z2o+W6ove9RrqB2WcNZGKAyf2YOzIsoLMlUqacD26U7XtqZlHhldBt43nobQT+VZnrgVr3lLT24A
	Cix3xKmdz8KHFmupKFCkoWSNqf8KvR9c91qnRCdIvRls+fv312KqNixTNsc4cPiQ8Uj5yOQbtkCmH
	G5A8YV3mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l22GY-0002nO-MC; Wed, 20 Jan 2021 01:26:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l22GW-0002lp-C4
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 01:26:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5CFA23333;
 Wed, 20 Jan 2021 01:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611105991;
 bh=YRDhHawHPzSnZSitjYPPVI9uapMujMO5D+sYLQsexXk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h4QdNhj+98SxI9yz5M12Cd5mCJQOh8ZEetqbEQE7etc2JYbmYK6NnISEoTvTb4viA
 VTF7EXfXHt7RGOxFVjwMvxSgNoZr8/tSJyCof0FQFnqiAsTm0iS4Pemzp8thPSx4bM
 6Wr8511E0k8LcJZSYtg6ZNhlgtfoqLQxIzSW22vHBIMH27o4m3e7y2hXGK+ffVV6Lc
 YOCusQrrlu+gb0JPxWLMB6+Xs+i5IfAtKx+t5KRbBqdjWDWQpkMDDtaEMNfC3saRjA
 o6tNlCr/o1n8Vbz5nCQScrpU93K0ReAMnHNwV1z1RumXXO54pFVaD8eUC3yhbve6D9
 Tc758MeG9AAsA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 22/45] riscv: cacheinfo: Fix using
 smp_processor_id() in preemptible
Date: Tue, 19 Jan 2021 20:25:39 -0500
Message-Id: <20210120012602.769683-22-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012602.769683-1-sashal@kernel.org>
References: <20210120012602.769683-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_202632_483571_07FABA26 
X-CRM114-Status: GOOD (  11.90  )
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
Cc: Sasha Levin <sashal@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Kefeng Wang <wangkefeng.wang@huawei.com>

[ Upstream commit 80709af7325d179b433817f421c85449f2454046 ]

Use raw_smp_processor_id instead of smp_processor_id() to fix warning,

BUG: using smp_processor_id() in preemptible [00000000] code: init/1
caller is debug_smp_processor_id+0x1c/0x26
CPU: 0 PID: 1 Comm: init Not tainted 5.10.0-rc4 #211
Call Trace:
  walk_stackframe+0x0/0xaa
  show_stack+0x32/0x3e
  dump_stack+0x76/0x90
  check_preemption_disabled+0xaa/0xac
  debug_smp_processor_id+0x1c/0x26
  get_cache_size+0x18/0x68
  load_elf_binary+0x868/0xece
  bprm_execve+0x224/0x498
  kernel_execve+0xdc/0x142
  run_init_process+0x90/0x9e
  try_to_run_init_process+0x12/0x3c
  kernel_init+0xb4/0xf8
  ret_from_exception+0x0/0xc

The issue is found when CONFIG_DEBUG_PREEMPT enabled.

Reviewed-by: Atish Patra <atish.patra@wdc.com>
Tested-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
[Palmer: Added a comment.]
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/cacheinfo.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index de59dd457b415..d867813570442 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -26,7 +26,16 @@ cache_get_priv_group(struct cacheinfo *this_leaf)
 
 static struct cacheinfo *get_cacheinfo(u32 level, enum cache_type type)
 {
-	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(smp_processor_id());
+	/*
+	 * Using raw_smp_processor_id() elides a preemptability check, but this
+	 * is really indicative of a larger problem: the cacheinfo UABI assumes
+	 * that cores have a homonogenous view of the cache hierarchy.  That
+	 * happens to be the case for the current set of RISC-V systems, but
+	 * likely won't be true in general.  Since there's no way to provide
+	 * correct information for these systems via the current UABI we're
+	 * just eliding the check for now.
+	 */
+	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(raw_smp_processor_id());
 	struct cacheinfo *this_leaf;
 	int index;
 
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
