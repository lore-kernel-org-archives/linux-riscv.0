Return-Path: <SRS0=c0nt=XS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B52C3A5A6
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2019 00:45:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9833520830
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2019 00:45:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h7tAfqqp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hXoD43kB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9833520830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t1W3S7HCu7xvDZuAQQaCQj0IopBxzKxLc6WQWZFAikA=; b=h7tAfqqpM0rP9Z+E20yS0bxyJI
	PGk6WLQOYOstajAkVs2GQyRwuuG0K330abugy+AyZm+m2prOR4jD7o734FLrwmlvffwGk18iq0OlP
	YwrPckL7jgp/sl6VP0VwKQZsLEDGVS3rGqhu7Jl+v6TwBMoLhZQ7h8eEyBf2IfOJGNcHRmJMtiSpa
	NrjLar9wWXfzK5zwwMpGGvWoOi4MV59Zge6zpm1zgJpxh7/XyxrNOymwm7CQlJStE64HZTheWmo8E
	6FEDOAJ4IWBikHBww4TzoCTQdcPwWpYdtN6bVc0arBcr+W075wneGwIyKp6i3RJtb2QRNkH0+HXuk
	kc0mx9sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCCU6-0003CK-UJ; Mon, 23 Sep 2019 00:45:47 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCCU3-00037v-PV
 for linux-riscv@lists.infradead.org; Mon, 23 Sep 2019 00:45:45 +0000
Received: by mail-pf1-x443.google.com with SMTP id h195so8038491pfe.5
 for <linux-riscv@lists.infradead.org>; Sun, 22 Sep 2019 17:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UolwQ0cu1AA/iqmfvkDUCTBOg9ROKFLAkl4FEYmNIH4=;
 b=hXoD43kBut3QYuGcML4svtO79QqkxZYAVBXnKO/MGgHR7hUFpdqDHXUJGqyaVrLgy8
 DV7LV4TDe25ilVZwic5rdkCoG36xzbvnsyDAcZsmn3TF8Zo8azceRpEYc5ClD3aIxN2/
 JunGFRWlnM9kuuljFmHzGYIxjGlCFWRkpdYwwhybOYG5dEcM6CeW40BlGLSIy7ueA3mr
 WFUDYTk7xrOAoLiYIzMoYVBFKibNFwTQOmi2eQeKfo/t5Kj85U18yRcW+yBMTolXDtwa
 ZkDjGGuWYQyeY7/xz4KVbi0dPEV/JWJPsHWL8R85YWjsh1Zl+7xwEExciAZIgcFImdvk
 r9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UolwQ0cu1AA/iqmfvkDUCTBOg9ROKFLAkl4FEYmNIH4=;
 b=WVJUMY49XKksHJFELlNI6bfvpFttBIg6wKFeL3MlgEm82LTwjy1f+QQ18G1GAybvl7
 +ZW6RPxGK3KOQq6vWuqKswoOgSyU6O4Rl8UuITqzdx+zqJuh+NwfM3W2y4sxa4VjLsyc
 Wa6p61ln39Q61xwrgJOtNqrPtrehrkpxTyA532/+Z1eAS6u4lKDhwgy/G0MyHkHKKXUV
 zM3peFjJXdEXPL2zHCzY5adR/Lc0zsrN8coo75HuOXgiq4psD+rAkA+JLQktyKyrECVy
 ZJVJKXa5C+U45JopOTeXlAdEZPsRz6a2eV8hbfhzV8chSZP0zmKFl+5ZnDXzroNiAmb6
 8gtA==
X-Gm-Message-State: APjAAAVDDPqSCMpvSDQT52jmBXX2cu2aWbfIQaJaUyzKAVQ7Vzdr0W24
 xOiTi4D4r6UP+72AtayH0XfqP/NTJ4M=
X-Google-Smtp-Source: APXvYqxgCsJWq73K4bZZuZ4ncyptKJaUKhytI6kBAarKqVdUsqYNrPKgHKP33BPUTwHvpg2aedoTFQ==
X-Received: by 2002:a65:5a84:: with SMTP id c4mr26598583pgt.261.1569199543088; 
 Sun, 22 Sep 2019 17:45:43 -0700 (PDT)
Received: from localhost.localdomain (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id l7sm9139392pjy.12.2019.09.22.17.45.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 22 Sep 2019 17:45:42 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 4/4] riscv: remove the switch statement in do_trap_break()
Date: Mon, 23 Sep 2019 08:45:17 +0800
Message-Id: <1569199517-5884-5-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569199517-5884-1-git-send-email-vincent.chen@sifive.com>
References: <1569199517-5884-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190922_174543_878243_87AE510E 
X-CRM114-Status: GOOD (  11.43  )
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
Cc: vincent.chen@sifive.com, palmer@sifive.com, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

To make the code more straightforward, replacing the switch statement
with if statement.

Suggested-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/kernel/traps.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index dd13bc90aeb6..1ac75f7d0bff 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -124,23 +124,24 @@ static inline unsigned long get_break_insn_length(unsigned long pc)
 
 asmlinkage void do_trap_break(struct pt_regs *regs)
 {
-	if (!user_mode(regs)) {
+	if (user_mode(regs)) {
+		force_sig_fault(SIGTRAP, TRAP_BRKPT,
+				(void __user *)(regs->sepc));
+		return;
+	}
+#ifdef CONFIG_GENERIC_BUG
+	{
 		enum bug_trap_type type;
 
 		type = report_bug(regs->sepc, regs);
-		switch (type) {
-#ifdef CONFIG_GENERIC_BUG
-		case BUG_TRAP_TYPE_WARN:
+		if (type == BUG_TRAP_TYPE_WARN) {
 			regs->sepc += get_break_insn_length(regs->sepc);
 			return;
-		case BUG_TRAP_TYPE_BUG:
-#endif /* CONFIG_GENERIC_BUG */
-		default:
-			die(regs, "Kernel BUG");
 		}
-	} else
-		force_sig_fault(SIGTRAP, TRAP_BRKPT,
-				(void __user *)(regs->sepc));
+	}
+#endif /* CONFIG_GENERIC_BUG */
+
+	die(regs, "Kernel BUG");
 }
 
 #ifdef CONFIG_GENERIC_BUG
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
