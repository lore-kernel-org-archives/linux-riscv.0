Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47397C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmaVhwoQusstl6GOC3FsobapoJoWoWafBQQ/L+nH37A=; b=IoZLVOAckodm1v
	CXoEOKlOz6istB5fuVssQxx5BDn3DvnG0rlcbAsi09xXaqyizy5DMnFLss095SyUnioYd5uRNp+6F
	dAUcDasx5RAyEB7rNsvawDAoJRqu2SPZq3WMVm7tJuC2ouzeDXRvrJSa9k4O0O7/XkQq4PhizBuLp
	3frPe5apYvrXw+fPr/l/4t2pcoBQKpv3onb0z92dGrB4wdqt9RqYsDIfhuCxUwAkybUiszKpfzCZU
	XuLhpbE1qMSGzamClPk9/nG5E0YEOVgV2Fs2fduQY+TtFZ11TrsBuvEOFEUlFY3z34IqWQHx8O8jE
	3nh5k41hVlk47IdiiB4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1raE-00000001gLR-31AT;
	Mon, 07 Apr 2025 18:52:34 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1quL-00000001TVL-3h9T
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 18:09:19 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22a976f3131so19101735ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 11:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049357; x=1744654157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9VOOAOCKhHyxTpEvBxwItchQtvdn2LoPZ+ikId4PHc=;
        b=Ad+4AKNIFaiijnelYUqwm5X4PWJefsvAM2U9ypkChZiGMp5F8qBHbfpbQyQonAQMeN
         bpKdM5wLiu6/N4tBfFwDRXE8PZpGmRAZVzu1GXOPh38FWZE1eA4GHCcbVkSH3661L2oI
         zPcCVReLoygbEccxUDXHE3zwsTn9fHSa8/qlvoOhOrUME+HxxQ5LWTLPL4oOjStbm0Vv
         EWOr4otoCUlFk6Ywtr2xwpS9fDyOl1qQUzA8z94wfo8a1HAn8XrhvYhXhHobnwDEbULF
         d4tZjHGO9nXcgtaG/GJ42y4UVmzXdsquCRLR6w5DbsFnaymn2Mus/p97vH6a04Qb/hch
         QKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049357; x=1744654157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9VOOAOCKhHyxTpEvBxwItchQtvdn2LoPZ+ikId4PHc=;
        b=Q41qkvTSJ+y6QiIGfhd+r0NeEzPIBiJQJwXPbHsQFApZ5aEGJq8Lw0i5oSUl12rn1P
         mklBordEr/oHQPpcwkUJ1462DuONH8QtdEeHTIaxo0b4r9ZlJTFXRsuhB/Se7KVWpOgA
         r/0ByzvBQBbUHKCzbLR6dsykpC96L25wz9IGNP4m+h7oSk7hlqJzbce8ZwjP27k3Ag1R
         JgRD+3Sj3C2xtVMdRfdRdFyRYTHbIK409Kqvzbri55v/LbsXoacHTOnI3b+ehzeAfZCO
         UCXgU0VYILpq1hpHmL8lpxXyDqwjQPgufoVP7M3f/S6H7Z46+zecaKJ7D3MCDn5YLRZI
         c8zQ==
X-Gm-Message-State: AOJu0YxkZ6mxTsRXmLBjqXxmfSYOfywmmPEIOSU43M+oV36sc+M5KNsU
	zl58MOwImSSgABmnQlHvdr8gSUJ7RcZMck9Rb4uHaGSSko82kwnRk1MaFXiE
X-Gm-Gg: ASbGnctUEdsQhlSqy0NOFtVNcUoAcuKGazH6UdFQMA9ozPfrAkp94fEW512hZglGdtA
	jTvRR8/BaxbwqPPGW/D4g4GMhocn5XwU9qc+fK8C1b6JqZ/G8e5I7CU9Fc96qggYCOrXMiKMjcV
	lP8vpP4sQ9jnYc+hr3lB4DdDCc2or/NHzHdxt/V3aMu3BjxgMyl0aADVAt6D+Slr+akhnct534+
	97eMHnL7WT0Z0eYEvypVcWTftSZ+3kThxc3/IzZunmzRLpzMaYHRU83YJUj3sPGt8V0XlAdQ+le
	gSoG+27U9nJQl9jqxoIwTq6f1lLcspqPjgFg+7iP0xJXanYfgZpG66BWV4OtbLROXrrOAHXmn78
	vOiaqx6rrx7gbYfXizc2//G8ynbU8kxippg==
X-Google-Smtp-Source: AGHT+IFf6ha6oIioXqe0Dl7spY0xA264EoHLx7/lwi0vWS1NoagPzSr/i5AfZPigVEpWrl+bKtG+9g==
X-Received: by 2002:a17:903:1b2d:b0:216:7926:8d69 with SMTP id d9443c01a7336-22a8a8dd69emr158392105ad.47.1744049356897;
        Mon, 07 Apr 2025 11:09:16 -0700 (PDT)
Received: from localhost.localdomain (118-160-134-247.dynamic-ip.hinet.net. [118.160.134.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e03esm84282455ad.146.2025.04.07.11.09.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 11:09:16 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com,
	palmer@dabbelt.com
Cc: Andy Chiu <andy.chiu@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vicent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com,
	olivia.chu@sifive.com,
	c2232430@gmail.com
Subject: [PATCH v4 06/12] riscv: ftrace: do not use stop_machine to update code
Date: Tue,  8 Apr 2025 02:08:30 +0800
Message-Id: <20250407180838.42877-6-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20250407180838.42877-1-andybnac@gmail.com>
References: <20250407180838.42877-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_110917_921007_9685A8DC 
X-CRM114-Status: GOOD (  16.75  )
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
Changelog v4:
 - assume ftrace_update_ftrace_func is always called with irqs enabled
---
 arch/riscv/kernel/ftrace.c | 64 ++++++--------------------------------
 1 file changed, 10 insertions(+), 54 deletions(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index cf78eef073a0..aca1a322e0aa 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -24,23 +24,13 @@ unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
 }
 
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
 
 static int __ftrace_modify_call(unsigned long source, unsigned long target, bool validate)
@@ -129,51 +119,17 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	 * before the write to function_trace_op later in the generic ftrace.
 	 * If the sequence is not enforced, then an old ftrace_call_dest may
 	 * race loading a new function_trace_op set in ftrace_modify_all_code
-	 *
-	 * If we are in stop_machine, then we don't need to call remote fence
-	 * as there is no concurrent read-side of ftrace_call_dest.
 	 */
 	smp_wmb();
-	if (!irqs_disabled())
-		smp_call_function(ftrace_sync_ipi, NULL, 1);
-	return 0;
-}
-
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
+	/*
+	 * Updating ftrace dpes not take stop_machine path, so irqs should not
+	 * be disabled.
+	 */
+	WARN_ON(irqs_disabled());
+	smp_call_function(ftrace_sync_ipi, NULL, 1);
 	return 0;
 }
 
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
