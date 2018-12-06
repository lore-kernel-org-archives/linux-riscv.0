Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A58EC04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 15:02:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E72F320700
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 15:02:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rpmeKofO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoWoU9KD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E72F320700
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6EKmTv6ttJ1L1pitkhujBw7mcWVN2UT7IPmbyu07A+E=; b=rpmeKofO21BN9w
	vhgBGzaFfSshmzdofRRiKAoBL9dALz2xoDiawSWGyV7JHQ5cevsd6yRoila6oKsdXZKaY3FSsRm6L
	YL9AFuiqxyZmVkIYfM1AgJCR5DhpeHQknpOpNH1aCLXFn8Qpkzg/KopatLq5O5e8gB9TAJa8FCtqt
	8+ngsc+MTHg/1CAaVni2xwtqcd0eYPPPvpHObL4708DsjQmHbSK7y7kpmzFkqexGry0+RrKj7PJzU
	KYVlPWt+mHSXjlYYhQJJMQzU5UwZYa9kVT8jUzSz9rCrH6DOOjtskY5MyeaYil0oX2EUQijVO8sc3
	SSU3+A91q957PUdpPyzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUvAe-0000nu-7q; Thu, 06 Dec 2018 15:02:32 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUvAZ-0000iQ-Do
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 15:02:29 +0000
Received: by mail-wr1-x441.google.com with SMTP id l9so755097wrt.13
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 07:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4m+VGxXWqzzk+UmYyKJAtJtNfco3vK/6BU20MncbTSg=;
 b=AoWoU9KDHDQYaQPWpw5KuLwv/1GAQqp+BrIM+YLMxWKoGXYVNalfOqHXDkpSNclk5j
 7YhG2uss3UxJnsAAcJSMGY4julk0/gX8cimiVcrP70qjWuwCXNlpnL3+urPOQZ6bsFSa
 eTprO4juwSxg3iKj5RFcYwHLkd2NkEs9MsFowWn2+dJphT1qunRjXeOV0chp+fbuNPPr
 AjriJ2VQXcmu26wNn+eBy6dBtX4mVkW6Omg4R2V1mcCNJUdlwO8YGhP0S8TqhCNGO+hy
 XrTydIM0esFYvi5/kfaXEEB30PiOsTAza5xB3mazRBgUSbXpNSdLP5fkzDUOUWHQNklo
 ZuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4m+VGxXWqzzk+UmYyKJAtJtNfco3vK/6BU20MncbTSg=;
 b=ozSQOXF2IiHViyre6dLdr/+oGP40Btj91EL5qb6+vEYz6Ssiq3NCgQEgslQBfr/7JF
 znWgL7a1SbLN/WWg0cnWv8Ccw9WumkiTDa5o5e5sR/Tu8NaBKestoe0ueta83pyiWxxq
 wXAb9vvNx/cQABLMPGRse7w4UVp+vMfMVzNO7RgWJpEbeLNAEFm2Rryu43ooOrFUDLl7
 eg1YTcKelF8b1cA7/b0LxewbVuIyBfDDd9TjQAkzEfCqIpnQzaLNXwMVwy0BiLdda3UN
 xbw/dppAmkYmrTJqD4WZl3epQvsE4yccxB1rwVrs59SBObjPNRprvx6j8thPS+AGCWua
 mOiw==
X-Gm-Message-State: AA+aEWaz6mL2CZPTxW4OiWuqflvx5tEJ5xKkMtrSiXPNfptvTaWrI8nO
 Ob6jS9mB159W3Uq+fqQEZC6QHyFD9ZY=
X-Google-Smtp-Source: AFSGD/V4wxlb4lUV4iD4GJ0BinuooVz6UZLecT0zr/Gat1pDne/3gAwpAYc9Vojf4SOci/RplLDXlA==
X-Received: by 2002:a05:6000:12c4:: with SMTP id
 l4mr24658040wrx.134.1544108535714; 
 Thu, 06 Dec 2018 07:02:15 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id 14sm1629981wmv.36.2018.12.06.07.02.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 07:02:15 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, keescook@chromium.org,
 luto@amacapital.net, wad@chromium.org, green.hu@gmail.com,
 deanbo422@gmail.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] riscv: fix syscall_{get,set}_arguments
Date: Thu,  6 Dec 2018 16:01:56 +0100
Message-Id: <20181206150156.28210-3-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181206150156.28210-1-david.abdurachmanov@gmail.com>
References: <20181206150156.28210-1-david.abdurachmanov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_070227_524293_211E39C7 
X-CRM114-Status: GOOD (  13.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Testing with libseccomp master branch revealed that testcases with
filters on syscall arguments were failing due to wrong values. Seccomp
uses syscall_get_argumentsi() to copy syscall arguments, and there is a
bug in pointer arithmetics in memcpy() call.

Two alternative implementation were tested: the one in this patch and
another one based on while-break loop. Both delivered the same results.

This implementation is also used in arm, arm64 and nds32 arches.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/include/asm/syscall.h | 42 ++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index bba3da6ef157..26ceb434a433 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -70,19 +70,32 @@ static inline void syscall_set_return_value(struct task_struct *task,
 	regs->a0 = (long) error ?: val;
 }
 
+#define SYSCALL_MAX_ARGS 6
+
 static inline void syscall_get_arguments(struct task_struct *task,
 					 struct pt_regs *regs,
 					 unsigned int i, unsigned int n,
 					 unsigned long *args)
 {
-	BUG_ON(i + n > 6);
+	if (n == 0)
+		return;
+
+	if (i + n > SYSCALL_MAX_ARGS) {
+		unsigned long *args_bad = args + SYSCALL_MAX_ARGS - i;
+		unsigned int n_bad = n + i - SYSCALL_MAX_ARGS;
+		pr_warning("%s called with max args %d, handling only %d\n",
+			__func__, i + n, SYSCALL_MAX_ARGS);
+		memset(args_bad, 0, n_bad * sizeof(args[0]));
+	}
+
 	if (i == 0) {
 		args[0] = regs->orig_a0;
 		args++;
 		i++;
 		n--;
 	}
-	memcpy(args, &regs->a1 + i * sizeof(regs->a1), n * sizeof(args[0]));
+
+	memcpy(args, &regs->a0 + i, n * sizeof(args[0]));
 }
 
 static inline void syscall_set_arguments(struct task_struct *task,
@@ -90,14 +103,23 @@ static inline void syscall_set_arguments(struct task_struct *task,
 					 unsigned int i, unsigned int n,
 					 const unsigned long *args)
 {
-	BUG_ON(i + n > 6);
-        if (i == 0) {
-                regs->orig_a0 = args[0];
-                args++;
-                i++;
-                n--;
-        }
-	memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
+	if (n == 0)
+		return;
+
+	if (i + n > SYSCALL_MAX_ARGS) {
+		pr_warning("%s called with max args %d, handling only %d\n",
+			__func__, i + n, SYSCALL_MAX_ARGS);
+		n = SYSCALL_MAX_ARGS - i;
+	}
+
+	if (i == 0) {
+		regs->orig_a0 = args[0];
+		args++;
+		i++;
+		n--;
+	}
+
+	memcpy(&regs->a0 + i, args, n * sizeof(args[0]));
 }
 
 static inline int syscall_get_arch(void)
-- 
2.19.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
