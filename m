Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D22DC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 06:20:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDB5E61447
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 06:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDB5E61447
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=14FwXEsymijrSnCBUgEuqb9F2cONnNV7ppRDAlZd3Ak=; b=HcoGhAMaHONHec2U+4U/uUDFhe
	R4oyy+9u7HKRCUqiygXZsf+XN7Ghyy8M+Z5EDcGxX5ixXcl/gx1/5u5rd2oGXNiacHtXsx/LYYLut
	UwmQAyeI1HI3yAbqOe2G/wXjRxP5r5OmIz6fGQifnB6r+OdynTIbAtsS+Ci4DTzbfruFsF5Sdw/Yq
	JFkTo7vfrHijL7HxauNnH7HRpXW69mlMlkkaXz3uGG30dg4+/qjSE2nSDTWvQHbpQpdyqnjl2g7Ou
	rIZYhI6f9jFAHGps0I6jWttLVQOyvfQ3kkwgvEXpEXXJl5DqRk4g3S8rB6BcW8A9gZlh0MyLcU4Bg
	50Uo+7bA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc02J-0052ne-IB; Thu, 29 Apr 2021 06:20:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc02F-0052gl-9N
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 06:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=To:From:Cc:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=8b3IKfTAHchSA8Kg2o6JAtVdRWR5diw6ByIr64wbCtY=; b=EORjvIYu7rli/C64xxTJUo4Bl3
 BnnJVFRQC9F8ZblDHhINNeaWkVl4fFlaHAlh3LZ9VYsg+es1GKPHdmQ5VucMX15SK6jmzw/fhshTi
 6lZnK5lo93Q4Zri8+OjqXNNX/8DosWopL+grjCcJb3FcgWcvcPQHdFQzUa+UdHg8hzQHlQ1SrEhaZ
 ik+JGKh9MJGOo1Tt9l6tP4A4J/vUsAUU8PeJi5bKw1gMsXaFW1iaQos90ZidEw00gtub81D6mfkRb
 BFbmEP4nZd6hr7vTfAGMTnODykcLNbZrsDNtGOgHAozR+VlIlE9ypEOz2VRhRWh4j6ZlHiuGyaiqs
 T/fEEEfw==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc02C-000P88-Lv
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 06:20:26 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so10335626pjh.1
 for <linux-riscv@lists.infradead.org>; Wed, 28 Apr 2021 23:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=8b3IKfTAHchSA8Kg2o6JAtVdRWR5diw6ByIr64wbCtY=;
 b=X6TFxKy4+tEl+6wwelMT/v40t6YoPtLIxqUx1PRDUVD94h6teFZOSZMc2Zn8NP5MaL
 fAkNmgtmpdY9gErwaJPtLHrDi/YRDp2sLphzska9oAx64jaZnrqcSJS8vizSqa197OhS
 gHmGkOxFw6labMnPsxyBG7oiQONVuS+8xOTpUOtctDdKTC5AGM3HXtHlOq75E0ZyKbAo
 AsdtxquJ23wdGOrs81Lh7EleIjn+CiVUZ2QekUWzrfh9p3JCuRYIMex5+wiz33ives5D
 nVVz9yJreqa06B9be9PAxRP3EVsCqpMPbL01gdDANW+06qXrjvJA1maLpyIODJyIJZ12
 DBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=8b3IKfTAHchSA8Kg2o6JAtVdRWR5diw6ByIr64wbCtY=;
 b=cAqRnsSj0dNAkJ9jHpoW/s1WEMQ1LC48JrGYgVzca/+HOXhOeJFwOg92xNyuDTXwua
 4x4Kb6lB3Psfz8Fx5tTs9jScVut9PVlNs236I0RRXV5axBYaTUMagH1nxq2iELYU/yfg
 aPG7oIpeaUM6Vo6Q54qI6rczJX+g3agYc6gB4NCmIDUQQWRynUbjwbNSzdhX5nyfvNOc
 XRsTgpLk7eacoRTYNsNHEAOpcPaxSEUan+8wZkeVEX8Uk2Ue9XNBQfBtEvrRGn/y9MPM
 AmzFmItcaIlkBWvfMBBZc9y/EVHaE4F3+qGK8I5DLxl422n+2n3Ut1Cf3/qMw8ENimVC
 7m/w==
X-Gm-Message-State: AOAM533e85k19vgJlHtdaKKiBfiYH7yaDR354/0ASkPXluqm8Z4rroB5
 z79Gt1qEgCDSdTNfd74+U7vUTA==
X-Google-Smtp-Source: ABdhPJwH27db/OIQrKWCFQjxIUzJnwXLZ4eKMAYxpE6kf50hIv9EHWkL4Sobf+Fd4sBbitfoWmIjAQ==
X-Received: by 2002:a17:90a:cf10:: with SMTP id
 h16mr10477666pju.49.1619677222725; 
 Wed, 28 Apr 2021 23:20:22 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id ga1sm1288336pjb.5.2021.04.28.23.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 23:20:22 -0700 (PDT)
Subject: [PATCH] RISC-V: insn: Use a raw spinlock to protect TEXT_POKE*
Date: Wed, 28 Apr 2021 23:17:13 -0700
Message-Id: <20210429061713.783628-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, peterz@infradead.org, jpoimboe@redhat.com,
 jbaron@akamai.com, 
 rostedt@goodmis.org, ardb@kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Anup Patel <Anup.Patel@wdc.com>, akpm@linux-foundation.org, rppt@kernel.org,
 mhiramat@kernel.org, 
 zong.li@sifive.com, guoren@linux.alibaba.com, wangkefeng.wang@huawei.com,
 0x7f454c46@gmail.com, 
 chenhuang5@huawei.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>,
 Changbin Du <changbin.du@gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_232024_749502_16303315 
X-CRM114-Status: GOOD (  18.88  )
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

We currently use text_mutex to protect the fixmap sections from
concurrent callers.  This is convienent for kprobes as the generic code
already holds text_mutex, but ftrace doesn't which triggers a lockdep
assertion.  We could take text_mutex for ftrace, but the jump label
implementation (which is currently taking text_mutex) isn't explicitly
listed as being sleepable and it's called from enough places it seems
safer to just avoid sleeping.

arm64 and parisc, the other two TEXT_POKE-style patching
implemnetations, already use raw spinlocks.  abffa6f3b157 ("arm64:
convert patch_lock to raw lock") lays out the case for a raw spinlock as
opposed to a regular spinlock, and while I don't know of anyone using rt
on RISC-V I'm sure it'll eventually show up and I don't see any reason
to wait.

Fixes: ebc00dde8a97 ("riscv: Add jump-label implementation")
Reported-by: Changbin Du <changbin.du@gmail.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/fixmap.h |  3 +++
 arch/riscv/kernel/jump_label.c  |  2 --
 arch/riscv/kernel/patch.c       | 13 +++++++++----
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 54cbf07fb4e9..d1c0a1f123cf 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -24,8 +24,11 @@ enum fixed_addresses {
 	FIX_HOLE,
 	FIX_PTE,
 	FIX_PMD,
+
+	/* Only used in kernel/insn.c */
 	FIX_TEXT_POKE1,
 	FIX_TEXT_POKE0,
+
 	FIX_EARLYCON_MEM_BASE,
 
 	__end_of_permanent_fixed_addresses,
diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
index 20e09056d141..45bb32f91b5c 100644
--- a/arch/riscv/kernel/jump_label.c
+++ b/arch/riscv/kernel/jump_label.c
@@ -35,9 +35,7 @@ void arch_jump_label_transform(struct jump_entry *entry,
 		insn = RISCV_INSN_NOP;
 	}
 
-	mutex_lock(&text_mutex);
 	patch_text_nosync(addr, &insn, sizeof(insn));
-	mutex_unlock(&text_mutex);
 }
 
 void arch_jump_label_transform_static(struct jump_entry *entry,
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 0b552873a577..dfa7ee8eb63f 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -19,6 +19,8 @@ struct patch_insn {
 	atomic_t cpu_count;
 };
 
+static DEFINE_RAW_SPINLOCK(patch_lock);
+
 #ifdef CONFIG_MMU
 /*
  * The fix_to_virt(, idx) needs a const value (not a dynamic variable of
@@ -54,13 +56,14 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
 	void *waddr = addr;
 	bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
 	int ret;
+	unsigned long flags = 0;
 
 	/*
-	 * Before reaching here, it was expected to lock the text_mutex
-	 * already, so we don't need to give another lock here and could
-	 * ensure that it was safe between each cores.
+	 * FIX_TEXT_POKE{0,1} are only used for text patching, but we must
+	 * ensure that concurrent callers do not re-map these before we're done
+	 * with them.
 	 */
-	lockdep_assert_held(&text_mutex);
+	raw_spin_lock_irqsave(&patch_lock, flags);
 
 	if (across_pages)
 		patch_map(addr + len, FIX_TEXT_POKE1);
@@ -74,6 +77,8 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
 	if (across_pages)
 		patch_unmap(FIX_TEXT_POKE1);
 
+	raw_spin_unlock_irqrestore(&patch_lock, flags);
+
 	return ret;
 }
 NOKPROBE_SYMBOL(patch_insn_write);
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
