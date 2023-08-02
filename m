Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943E1C001E0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 00:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=xVCkGNXAxmLEMuCZexFs9KIw/PApkWgeOQ/gMUzBnbI=; b=cCn
	FuoiBvgeD079dX8mlEuARnjeUtxNup12Qs/xcMk/2ZyQxPshVe+se1M0uT1NKwsF8gNDpr4LgsqeN
	7QPVCP/5vKwydbwwNzbFZd45/5g7QqfVrlalw+Oo2Tjz7txEFGtU5ZT1bcsao7QWiKRyD4LO3JpbI
	TgpSxAgWK/wg+hv6zUhmggSCuYEcbMATOzSndvDmeeckOlGDzeHzM7cz+EhwuQzclJ2mGreJZYIkW
	r7Zp+p5pP+ClgAHtxCgzj/SQwsmYl/QA5ou2GkAGFl7rLmEUWy2iQ2uC65UZJrU/rwUAihYgJ4AtK
	bLASAmhlc79Qef8n5eSeIGRM1hXhJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQzcu-003bGo-18;
	Wed, 02 Aug 2023 00:22:08 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQzcs-003bGI-16
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 00:22:07 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-6b9d3ce1a56so11545662a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 17:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690935724; x=1691540524;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KilSXJK2MVD2AnPm9S8tYLf7mVOFKVkH/54xfLNRqRA=;
        b=OH8wphWtMmg60OnMDGFBbF7ujCNGPfgd2hbBYp4SVBYlFKrjyQu3OyqQGskdp6nUx0
         zrZQow/qzsJWNWHEmuV3V2qPKIKMA9s5C7cY/R7IaT/DqJ6oRdyQY2b82z5poBpUR27F
         du+pXzKwbNL4p7SmBwzwQkAIr0EraF+KpipRtx/9CfQdlWuxFUre1Z5oDrSL9dfERZ8Z
         Ew5uf/pjeNaDEYFWcjMiEED9VgKAfpBYhKT2+HnffFuA0R6qzLEBFB96EoqyguDp8xX8
         3hd9790NAi7zG25zuNBEJP/3LXIyAhUPtDDFV6dHiirHEEXFpZqC04f5xPep+Ptk6QbE
         7/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690935724; x=1691540524;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KilSXJK2MVD2AnPm9S8tYLf7mVOFKVkH/54xfLNRqRA=;
        b=eYrjhMh1UBWJOGiacOL8meQdpKkGDQgJcnhqOqDiR/hfcfMCiEDIJNVMhqs2ru0bds
         bp9eY7fVLTsHjes9xCooCoQ+V/dwO0FB2USDinjowMPuJ/Qo5E1dIi+U1kcvUo9WV7DQ
         lmIY4/OoHUdqRzsWh1A6mJqtp6GQDnXpFs392pzTzdPwFPMshZvfMlJ+GMgl+mmvpxkM
         kBAknfEXgCiNAF1g1TjQ3uPEJdD20d22kc4RVk8YdswLXyec5TjuSaukr/sO4EE2ynV7
         KsGUn93A4YwFaQUkDKnHXoiBopC72Pz9o5R4cTSvS4pkgrJeHf0kPE543YdNXQ80qhQH
         kbtg==
X-Gm-Message-State: ABy/qLYe3WVkapeAmEAcDSQZwtkV29Qz/WHKWXotNhVJPNvIKnQS8J16
	LcmKLSXsNhz6wjYuiGKq0nLZ5QTLjEpm/qdQkQ==
X-Google-Smtp-Source: APBJJlE6hQQSIqZLj/BmT+qswU4s+FzGwFzE/FiZyI/8dUSztNts5afzNmPqF9G3rBrPkMhq6NyTiD2qAN7/Qj9lhg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a9d:7f0f:0:b0:6b9:6ef7:72f3 with SMTP
 id j15-20020a9d7f0f000000b006b96ef772f3mr15098160otq.0.1690935723801; Tue, 01
 Aug 2023 17:22:03 -0700 (PDT)
Date: Wed, 02 Aug 2023 00:21:58 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKWhyWQC/32NQQ6CMBBFr0Jm7Zi2ECSuvIdhAcMAE5GSqWk0p
 He3cgCX7yX//R0Cq3CAa7GDcpQgfs3gTgXQ3K0TowyZwRlXmsZY7JRmVAkU8cG68oK26kzVENV VfYG825RHeR/Ne5t5lvDy+jkuov3Zf7Vo0aLry9ENZHqq7W3yflr4TP4JbUrpCzEeraazAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690935722; l=1734;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=D6hZsVI6Tg/cS4gcm5zBne5/wTMEFngDX9MakiPlN9c=; b=BFamEJKVk9qr4ymm+TIZ9Pu636D4xvSUp89XThBbJXvRx+VpNnfLVUV6Vf6elstDWbOXogA6B
 CRRIKYBa1mlBCWmpuuUH5qNbPrKKy1Gn0mQyZbapFhj08hVrY2pqzkp
X-Mailer: b4 0.12.3
Message-ID: <20230802-arch-riscv-kernel-v2-1-24266e85bc96@google.com>
Subject: [PATCH v2] RISC-V: cpu: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_172206_379432_F5DE9D99 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

Favor not copying strings onto stack and instead use strings directly.
This avoids hard-coding sizes and buffer lengths all together.

Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Suggested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- Use strings directly instead of copying onto stack with `strscpy` (thanks Kees)
- Link to v1: https://lore.kernel.org/r/20230801-arch-riscv-kernel-v1-1-2b3f2dc0bc61@google.com
---
 arch/riscv/kernel/cpu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..872fa7a47d68 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -271,21 +271,21 @@ static void print_isa(struct seq_file *f, const char *isa)
 
 static void print_mmu(struct seq_file *f)
 {
-	char sv_type[16];
+	const char *sv_type;
 
 #ifdef CONFIG_MMU
 #if defined(CONFIG_32BIT)
-	strncpy(sv_type, "sv32", 5);
+	sv_type = "sv32";
 #elif defined(CONFIG_64BIT)
 	if (pgtable_l5_enabled)
-		strncpy(sv_type, "sv57", 5);
+		sv_type = "sv57";
 	else if (pgtable_l4_enabled)
-		strncpy(sv_type, "sv48", 5);
+		sv_type = "sv48";
 	else
-		strncpy(sv_type, "sv39", 5);
+		sv_type = "sv39";
 #endif
 #else
-	strncpy(sv_type, "none", 5);
+	sv_type = "none";
 #endif /* CONFIG_MMU */
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }

---
base-commit: 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
change-id: 20230801-arch-riscv-kernel-14a048cc6467

Best regards,
--
Justin Stitt <justinstitt@google.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
