Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AB5C8303C
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 08:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KcyeUztFQWGxbATwHDLkN0a3mQWZfpkYJTgP64u0Lcg=; b=j6T/NmUZ4pLnCy
	wQvciQhKSf5+rbnrYSFvmACBsBiyL4KQ5BYNZPpPxaDZ7O5aJ9Jeu5fImobP47JWCBjKyG8WPINrB
	APuHiAGM7dTUJ38j7WhsZlcI5uBk0zAWvasHFBS8gkJgKINacUSm9kp4AaGOk30eEjcbFMAvbP1SM
	p1zc99/pzjEaykpaxdfs+nn/OWOcx9VUmB2cgBxvf/Oo9eeTakgFShjhwGnd6V0UJ1ivqLWoWd+Mx
	4KMLxr3eY8GQzB2+eP9MXUIeJaa2k7hRpaNn/U6oMMTlL2+RCm7eg7DDpuVf8St24L8TEPzL9oPGp
	OI6HbN/Fk8wtsrBL3u1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8fz-0000000E3Wr-1BsO;
	Fri, 11 Jul 2025 08:00:11 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8Lz-0000000E0GJ-2Zuo
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 07:39:33 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-74931666cbcso1492558b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 00:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752219571; x=1752824371; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=icGySjDU0odmX/U7ekk4ZfpCmBZqh0luwzxQdlarWuA=;
        b=xFLuxIFUxPKMejR6EsQgPOJBs1u+MWDYyrw+wuqEU3bNDSNQ1KfrfUN7z0BQlofp65
         ZeZcA3APjOv/rr1egtgPcKCIE9l28JZB7iBfcoMK6VpwLMMr3Vb6V3lKh/ULqBHXKMES
         9dsBmcJ/wG+JoM/0QNU/4SzNAOd8qikfBckKpSQRXTP3I2GtwH4+2opGUZAxl0jyoiYR
         KXcvyZ1dQBgRy4Q3q08m1nn8g9p1af9VeH12f2f2oPU1yitZcgeraunXnkqy4Xu0lcbt
         62cYWqD43sh8QAIuO9wKoOhrghh2i7QKAEjpjRo1VEVmeh69uE4vEPdk/Noic0/qZg5B
         iv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752219571; x=1752824371;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icGySjDU0odmX/U7ekk4ZfpCmBZqh0luwzxQdlarWuA=;
        b=MKcaUqoImxslVV1s86WsJ7Q5SwdghRsSIS+3E/A0OEyRVt8F1g1jetQeLRewMpBrRG
         gd0JoK4vN8S5g7konAi7oao7rJX9P3xXl8yP6oze3q9oE7fCAZAi+4xTYGdmMKbSq+9N
         Xk+pX5Iv6xrHdncEJf1BWRepHZvRfJCdswxAu14zUho6bLQPKmwTB295UeuLqqHIU+0Z
         SVTteIWNN6NL4POJkdth7kXPbQ9dUSd5U486+6kQ6pZMWbhmUaqbunCoq8vujMo14M51
         Ooy6O3NuRkCMQXc69sFqO3jDZYltGpC9opmEaiKVwxiAvl43SmEdHiFckAuDiZzJVehS
         jOLg==
X-Forwarded-Encrypted: i=1; AJvYcCWTWNn3/CGr/tsWOI8YDuHzwDYRZLuDRCCkL+s6AH/l9o1LkBgMXKOqWmXVuHoxvJfncVYxQw06UqaOZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHJ+TyTfkyEl8LkJiag4t9zLAfk+TGRmrnHUH6VH+QXobszGBP
	niLMIKr79HRDAr/up+o6qpN/+rudXNEYojP+0vKtFdICazuoyp6intUhXO4WPiK4se4=
X-Gm-Gg: ASbGnct4nIsZ20EAAG83mvD1yrEDn2BTBfGQrvUuUzQQWn4WHccbucBoAoJhjCdzRR7
	0Wd/2LiDuPO/rfOUopLgOj8tgVhlD8OdKaGoAC/bGTV374soEpB/o37KPAjkxWx+de+6PkxAzKn
	soL0iwRaBHH2NmzHRjH0ofYlBXuiqTiVaxskEJwum9r+5j3SO4j/vnRuCZgBckfiHL6isM+t7cH
	Ls8HRAH6StuFBU2lDHnB21px+mft3wcmr/CpxdOMiR7BzPJ7aR2TgfDZYHtqeDYiuH0z1BWWW3k
	dsU+92io/Jx4jUSm1OnLEH8CdMghI1TbY62/w3xFLohoNmRUrJErZ5vfrHALSHRjtPrAUo/jpAk
	POs/YinWvTQflu2KQVi6ApelrOp6SXxZCr+E6DxAi+kfuJEKcKKqPkLHqZm0uVZFeDKYipw==
X-Google-Smtp-Source: AGHT+IGAD1oYswz2b5g5yjNWYTA4pStllZFKTjpeoy3Rj2V0QGXl8jH1O0ZouUKD9usbWZFWXN0Etg==
X-Received: by 2002:a05:6a00:1945:b0:746:3040:4da2 with SMTP id d2e1a72fcca58-74ee109a194mr3200497b3a.8.1752219570837;
        Fri, 11 Jul 2025 00:39:30 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4d3fbsm4597588b3a.127.2025.07.11.00.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 00:39:30 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 11 Jul 2025 07:38:38 +0000
Subject: [PATCH v2] riscv: ftrace: Properly acquire text_mutex to fix a
 race condition
MIME-Version: 1.0
Message-Id: <20250711-alex-fixes-v2-1-d85a5438da6c@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAH2/cGgC/22MTQ7CIBBGr9LMWgxQm4Ir72G6aGGwk2hpGENqG
 u4udu3yfT9vB8ZEyHBtdkiYiSkuFfSpATePywMF+cqgpe5kL40Yn7iJQBuyUNgrO1ljbWihHta
 ER1H396HyTPyO6XO4s/qlfzVZCSW6SUrj23Dx0t0S5ci0uLOLLxhKKV/fgXqQpwAAAA==
X-Change-ID: 20250708-alex-fixes-1e719b9899f3
To: Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2543;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=rf1z35LuFpIcwwrdg0a0joiQZY/6t6ATU32MYjjFF8g=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDIK9q9TPuVvfPhXjiC3ZHXzlNTb7uesORRlJFdUrX18N
 eLSHhmLjlIWBjEOBlkxRRYF84SuFvuz9bP/XHoPM4eVCWQIAxenAExEOZDhf9W34x+dMxbEXPBd
 z/Rk/cylV0WU3+yKYbIJVpuZW3bNlIHhf6HdJbe7H+98mFR8WEf1CPOP63zPjom77no6efak3D/
 fzNgB
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_003931_764173_E9A639F4 
X-CRM114-Status: GOOD (  10.88  )
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

As reported by lockdep, some patching was done without acquiring
text_mutex, so there could be a race when mapping the page to patch
since we use the same fixmap entry.

Reported-by: Han Gao <rabenda.cn@gmail.com>
Reported-by: Vivian Wang <wangruikang@iscas.ac.cn>
Reported-by: Yao Zi <ziyao@disroot.org>
Closes: https://lore.kernel.org/linux-riscv/aGODMpq7TGINddzM@pie.lan/
Tested-by: Yao Zi <ziyao@disroot.org>
Tested-by: Han Gao <rabenda.cn@gmail.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
Changes in v2:
- Add __acquires/__releases annotations (Masami)
- Add TB/RB (Masami, Han)
- Link to v1: https://lore.kernel.org/r/20250708-alex-fixes-v1-1-5b008d3f4d0c@rivosinc.com
---
 arch/riscv/kernel/ftrace.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 4c6c24380cfd9d6c51f0e4340cd674160b83a610..8d18d6727f0fc8fa17d8f651b9e3a00c779cec85 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -14,6 +14,18 @@
 #include <asm/text-patching.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
+void ftrace_arch_code_modify_prepare(void)
+	__acquires(&text_mutex)
+{
+	mutex_lock(&text_mutex);
+}
+
+void ftrace_arch_code_modify_post_process(void)
+	__releases(&text_mutex)
+{
+	mutex_unlock(&text_mutex);
+}
+
 unsigned long ftrace_call_adjust(unsigned long addr)
 {
 	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
@@ -29,10 +41,8 @@ unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
 
 void arch_ftrace_update_code(int command)
 {
-	mutex_lock(&text_mutex);
 	command |= FTRACE_MAY_SLEEP;
 	ftrace_modify_all_code(command);
-	mutex_unlock(&text_mutex);
 	flush_icache_all();
 }
 
@@ -149,6 +159,8 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	unsigned int nops[2], offset;
 	int ret;
 
+	guard(mutex)(&text_mutex);
+
 	ret = ftrace_rec_set_nop_ops(rec);
 	if (ret)
 		return ret;
@@ -157,9 +169,7 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	nops[0] = to_auipc_t0(offset);
 	nops[1] = RISCV_INSN_NOP4;
 
-	mutex_lock(&text_mutex);
 	ret = patch_insn_write((void *)pc, nops, 2 * MCOUNT_INSN_SIZE);
-	mutex_unlock(&text_mutex);
 
 	return ret;
 }

---
base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
change-id: 20250708-alex-fixes-1e719b9899f3

Best regards,
-- 
Alexandre Ghiti <alexghiti@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
