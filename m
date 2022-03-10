Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5A1C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 04:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hQ6R7A3/pouxDlNQpgg9l36NiXPanzcNhsT/HOboSJ8=; b=4GzRkknp4TIVwx
	Gt7MKhmLC42/fNKHTgIBZ5iB0tkTDR7WWiYBydOyzs7PGudyO5bI5Js0vxbdYjwZrHTvYsNt/Nw/e
	tKSO4xhxtgLPDQ2AI1ot6uBAHZRQyJamG9mxcxNPuB3OBCoC7z34ZiaWqmDI9HN7ayB+Zh8FlbGAg
	GJi77EOSfkhFjwLpPkiHp6Lni0GVXIgOy/KNj482CvTBHRbcwnvnlTH9iWcYmKVQ6NGjipKkYFq0n
	D2hYLp7uxNYVxHlFZviQ5wwPf+A4oMdOYta8j/VVmM3KKQd7fSkMqKoNW5/E7fAk9HLh+9UtLtRxq
	K3fv5wGOoWcx5MieM3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSApS-00BRVc-2R; Thu, 10 Mar 2022 04:55:10 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSApP-00BRVH-JD
 for linux-riscv@lists.infradead.org; Thu, 10 Mar 2022 04:55:08 +0000
Received: by mail-qv1-xf30.google.com with SMTP id kl20so3698839qvb.10
 for <linux-riscv@lists.infradead.org>; Wed, 09 Mar 2022 20:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7DpcR7BbS2KJBWXW5bKxdKwq/AyT8/ycEETpvFi3+q4=;
 b=eHo0ZYmR1wKXLCCdmUZtW/7DX5+UeImzDfDPkasTpU+zdcCiIqOKzNtRp31z+lmomD
 Tlxb1qCglzN1bk1clJ72tSdy6IXiWdF3x8mAez+wENMikz94fayDsUea78MfbonFMcc2
 3jbycTJHZJ42mzjZG/7KBTkRIFrXSgF0e/jdrlW6QDPPc1d3nwQHFOW6gBXVimvpoFvr
 C3PztTW6MxRUc3Xc/UOF6rFn7+GvDfVagbuZU6PoyKylTMHHbsJ9ckBuej9rE9X1tVKn
 f23yeyyJJ6Jstb4Fz04+RPvDZx6FfjxpCe/TtjuuD2l6+qPtmkONHiZc+wGEdAPU9ISt
 gOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7DpcR7BbS2KJBWXW5bKxdKwq/AyT8/ycEETpvFi3+q4=;
 b=7YH+cLxKo/+fS1uxcDn0fg1upq5fSIsF1OdXSOq7tWVNWvTFx3+LeMXbvnAEtHb3bl
 Rt+FmgV1sS1zUQ0l+HMiB/7SFZVOf/nS7mW9+SwinYMYC8gNPfxxqMhDoYoJ9FwvmbOr
 YkTx/09ljBhXofKxreX4UxZTd7UTLx31JqZZUxNxZ1OgHi7Dj2pUChAY6mcyR+Qfr/LM
 FgGh9oQN8cxFDSWvIWzqTEUQkGj9OC98J7FKKM00dp8n6jbj4SnX8yhNUF/y+0HikO9u
 epG0PA76/tgM1qSyDYYv+Y4YOT+nNFf67PLZApPboSdEDitWlDIoDazeD2ky9G92ehhd
 petw==
X-Gm-Message-State: AOAM5313uU80c00GYcFQ06WjwC3+AjK4yD2/b8xOx+I0d0Begs+CDQLM
 kyC03xZpAa3GxAvCet1dY6vhR4w/Ijs2Mr4j
X-Google-Smtp-Source: ABdhPJxgmBJMeeB/xbBPvS98wubJqB33GyOxMmJTV+7zR/TCbgXuo6wBQevETyckwBSXaY01DUR/mQ==
X-Received: by 2002:ad4:5941:0:b0:433:75f:8627 with SMTP id
 eo1-20020ad45941000000b00433075f8627mr2397754qvb.122.1646888105521; 
 Wed, 09 Mar 2022 20:55:05 -0800 (PST)
Received: from vultr.guest ([207.246.89.135]) by smtp.gmail.com with ESMTPSA id
 c18-20020ac87dd2000000b002dd53a5563dsm2747749qte.25.2022.03.09.20.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 20:55:05 -0800 (PST)
From: Changbin Du <changbin.du@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Changbin Du <changbin.du@gmail.com>
Subject: [PATCH] riscv: ftrace: no need to acquire text_mutex when executed in
 stop_machine
Date: Thu, 10 Mar 2022 12:54:54 +0800
Message-Id: <20220310045454.672097-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_205507_670069_61F979FF 
X-CRM114-Status: GOOD (  12.77  )
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

It's safe to patch text segment in stop_machine. No race is possible here.
Besides, there is a false positive for the lock assertion in
patch_insn_write() since the lock is not held by cpu migration thread.

So we actually don't need our ftrace_arch_code_modify_prepare/post(). And
the lock assertion in patch_insn_write() should be removed to avoid
producing lots of false positive warnings.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 arch/riscv/kernel/ftrace.c | 16 ++--------------
 arch/riscv/kernel/patch.c  | 12 +++++-------
 2 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 4716f4cdc038..381ecdae4ea5 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -12,18 +12,6 @@
 #include <asm/patch.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
-{
-	mutex_lock(&text_mutex);
-	return 0;
-}
-
-int ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
-{
-	mutex_unlock(&text_mutex);
-	return 0;
-}
-
 static int ftrace_check_current_call(unsigned long hook_pos,
 				     unsigned int *expected)
 {
@@ -136,9 +124,9 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 {
 	int out;
 
-	ftrace_arch_code_modify_prepare();
+	mutex_lock(&text_mutex);
 	out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
-	ftrace_arch_code_modify_post_process();
+	mutex_unlock(&text_mutex);
 
 	return out;
 }
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 0b552873a577..b7c5dea70924 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -49,19 +49,17 @@ static void patch_unmap(int fixmap)
 }
 NOKPROBE_SYMBOL(patch_unmap);
 
+/*
+ * Before reaching here, unless executed by stop_machine, it was
+ * expected to lock the text_mutex already which could ensure that
+ * it was safe between each cores.
+ */
 static int patch_insn_write(void *addr, const void *insn, size_t len)
 {
 	void *waddr = addr;
 	bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
 	int ret;
 
-	/*
-	 * Before reaching here, it was expected to lock the text_mutex
-	 * already, so we don't need to give another lock here and could
-	 * ensure that it was safe between each cores.
-	 */
-	lockdep_assert_held(&text_mutex);
-
 	if (across_pages)
 		patch_map(addr + len, FIX_TEXT_POKE1);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
