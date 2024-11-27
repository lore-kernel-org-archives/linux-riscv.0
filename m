Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD670D6ACF7
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 17:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJKDc+ng8onFCrpYuphGkwEaWRH5J63KF6MOcQNkmsI=; b=uM3o1phnZ1WflJ
	o+dKWIYcDzRQF6TXG88PqsqQk1wcdc0Z5AIsI0iymAclGJ5w+QtfTsCOTKiZltR8q1vVZc5SDnamP
	LkUHBcc1moVkCg4MW6kwy7sIzwt98C5GrJJ75uS06al0VhQR4Yd7YpYec5NEza4w6qC7ntx3c2mU7
	kopMQD96UQ9zxScdHFKBu9BD/qOOp+zh45UxHjoxBkIt3sLn0Kpjr6F64qpovndrlh5mGN+HJ3hwj
	LiQuS3NUei6faEHHMjSj+TA0nkk8oMdbh4fg1i4mHtMkWsrbJB1OlvgRKcGedYIRmL+3GArJBYWr/
	5wzb5TpBNdPV4tT+h1Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLre-0000000DkW0-3V7y;
	Wed, 27 Nov 2024 17:30:10 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLrd-0000000DkUT-0V0N
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 17:30:10 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7fbce800ee5so5090805a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 09:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732728608; x=1733333408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJ4wyksNmGKwRpxqsruWC4A8GzGFI32FmHe+iaxPpao=;
        b=TvleQo0LI3ScMpczEyTprgFTFIyYlT24Zq7L2b11MpE98vnyJxbMsTBvTngu3rpGvj
         aYDx7neN4jbuN66dEaMU5S/P13LXZ74LZDPGe21YFQuBHMcICT8xmoZnntcptjUYZHRx
         P5B/dD3f7LxJHimMF4sNQ9UquBapl9gm7JDirYyZhnZTpV4UfmhMh1TzttEK/TaxlD7j
         XtUAP9XmHZwjc/tQ1G+tHb/tYBamG8vY0Fah8gTZb1ij+4p6XqXkNsSbN3jEEkhgp8Cf
         tfiSgPs7rN63aEsiZxa3e7GC+EBewu5Iyxep87U0DnBb75/WmEFpB7CgNK3HQ0Y/daxq
         P7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732728608; x=1733333408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJ4wyksNmGKwRpxqsruWC4A8GzGFI32FmHe+iaxPpao=;
        b=nGSFC7e8sGqPPlovE+AEtThn5df4U7KoBjKtgCozCXj9Tc02jCJmcAor2wd+vo110i
         SuT0C09LSEVLo0c6mE+KOOIbRrQ8wwEwkOrnY3nLyVUw/MvwWnnMm7fJofpP4g64bEMo
         VpjGyRvyQI/CLztN4bli8RSS1loDEmXEw/gFZt/nON03GctVIiycIyumU2j95+4xi5P6
         7g3tajmUH2j5p8bat6PgfJgOjLp533AYjIFAx+nUMugvncQ4L1ihOvBBddq8oNkbW2pp
         sOYjwoZMaGsBliD9N/TylZxSrAXlIgMHPQ4hJ7KL7VdSB5Lk47izQu9ucy3lR1SVuQAM
         t9sg==
X-Forwarded-Encrypted: i=1; AJvYcCVr/xQjMfskFv1zJFFSPon3ZLpevQfX/Gnd3yZrHJYGq7wqIdZ/9DyyFuypkMvSCBhoGrtus0MxlztZmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyalBbH5So5mHCsVetSah9oAHytKNjCBVcBYIOkIYT3KJ7ZO4TO
	xr/gVC6LHm/zcW1yFObZot1aLYelqhcqoS/jREoDRaJfP7GO98fv
X-Gm-Gg: ASbGncs4vWCTxtO2cRZO3Hbi0381sZDhyxCDPI8q8SLLM7jtVrz8ncinIsvhtcpEfvm
	ZefRn1BjIxzrmpyr+JOp1+nnyFQfrwKgrgeRbpxYO7/hg+6Rre6H+Z61yQ4araCeaHfRdLiFWW7
	OsOzqvc8O14B05sQZIcAON/qoO0kUH332eyt/W9oFMkEbuNXVJX9yJ1RM92L2GeVb+cx1Zpn+aZ
	mnMri0j9FYg94RvNcnf8P9k/PW5IMVxP+J87T9yMGL/7RIBv0MV5mvekKzcT9S+7pE/gKamCq5N
	slkeQ7Cvtgkl5uuMU68o1J+98Agg
X-Google-Smtp-Source: AGHT+IF4fq/f76pFPUxSVNMwuLs8cfvtvFw2AwTwF+Xja2556ySDeUDGNdUbpJFYW6y4k7ZnLfhsXg==
X-Received: by 2002:a05:6a20:914b:b0:1e0:d123:7154 with SMTP id adf61e73a8af0-1e0e0ade54cmr5763536637.17.1732728607749;
        Wed, 27 Nov 2024 09:30:07 -0800 (PST)
Received: from localhost.localdomain (1-171-29-17.dynamic-ip.hinet.net. [1.171.29.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e3fdbsm9359582a12.30.2024.11.27.09.30.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Nov 2024 09:30:07 -0800 (PST)
From: Andy Chiu <andybnac@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	alexghiti@rivosinc.com,
	yongxuan.wang@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	tommy.wu@sifive.com,
	eric.lin@sifive.com,
	viccent.chen@sifive.com,
	zong.li@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v3 4/7] riscv: ftrace: do not use stop_machine to update code
Date: Thu, 28 Nov 2024 01:29:05 +0800
Message-Id: <20241127172908.17149-5-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241127172908.17149-1-andybnac@gmail.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_093009_157042_A66B853C 
X-CRM114-Status: GOOD (  13.95  )
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

From: Andy Chiu <andy.chiu@sifive.com>

Now it is safe to remove dependency from stop_machine() for us to patch
code in ftrace.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/ftrace.c | 53 +++-----------------------------------
 1 file changed, 4 insertions(+), 49 deletions(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 5ebe412280ef..57a6558e212e 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -13,23 +13,13 @@
 #include <asm/patch.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-void ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
+void arch_ftrace_update_code(int command)
 {
 	mutex_lock(&text_mutex);
-
-	/*
-	 * The code sequences we use for ftrace can't be patched while the
-	 * kernel is running, so we need to use stop_machine() to modify them
-	 * for now.  This doesn't play nice with text_mutex, we use this flag
-	 * to elide the check.
-	 */
-	riscv_patch_in_stop_machine = true;
-}
-
-void ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
-{
-	riscv_patch_in_stop_machine = false;
+	command |= FTRACE_MAY_SLEEP;
+	ftrace_modify_all_code(command);
 	mutex_unlock(&text_mutex);
+	flush_icache_all();
 }
 
 static int ftrace_check_current_call(unsigned long hook_pos,
@@ -155,41 +145,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	return __ftrace_modify_call_site(&ftrace_call_dest, func, true);
 }
 
-struct ftrace_modify_param {
-	int command;
-	atomic_t cpu_count;
-};
-
-static int __ftrace_modify_code(void *data)
-{
-	struct ftrace_modify_param *param = data;
-
-	if (atomic_inc_return(&param->cpu_count) == num_online_cpus()) {
-		ftrace_modify_all_code(param->command);
-		/*
-		 * Make sure the patching store is effective *before* we
-		 * increment the counter which releases all waiting CPUs
-		 * by using the release variant of atomic increment. The
-		 * release pairs with the call to local_flush_icache_all()
-		 * on the waiting CPU.
-		 */
-		atomic_inc_return_release(&param->cpu_count);
-	} else {
-		while (atomic_read(&param->cpu_count) <= num_online_cpus())
-			cpu_relax();
-
-		local_flush_icache_all();
-	}
-
-	return 0;
-}
-
-void arch_ftrace_update_code(int command)
-{
-	struct ftrace_modify_param param = { command, ATOMIC_INIT(0) };
-
-	stop_machine(__ftrace_modify_code, &param, cpu_online_mask);
-}
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
-- 
2.39.3 (Apple Git-145)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
