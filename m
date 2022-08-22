Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B12C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 02:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AWXSSt+gXkhyddkp8d9+rBxeGlE1Jv0hcc9SKNVKA0=; b=W7iDSxfhWLsOo3
	jrqODvQjgbt0daOykM8gZth7IUvZSS4TDcKWwP/aeXshZGhUE8eFoX78Y3Dwpko+GMRvVAr5FZm5L
	nCuHj9uXPeIf0ql3kQuDFlLEItOiVLXuBxwkLKR1fAY/blCjFTTsXoiH/TgbO0T90aEVrznzYU+Yl
	E5ICf03qh3Etud6P0LMCGxNMbA8/Ofs09Y6yzDO5RsB2D/wDjgdHrPNj0sxbCQtZvlm3mLrrvmeOp
	3L3M/N1MOkfwDGHTqqt4eWnCTH1FazsgKuZWoT8ngBWrTVv7ryTkVyB/sAr6C4Qp+IzfjlrHbrRP9
	TkRo599MKKc2HL3hACnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPwzo-003ls7-1h; Mon, 22 Aug 2022 02:16:56 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPwz1-003l8x-Js; Mon, 22 Aug 2022 02:16:10 +0000
Received: by mail-pg1-x535.google.com with SMTP id v4so8164299pgi.10;
        Sun, 21 Aug 2022 19:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=xSWHQT0Gh+ASwqDbuftZ9hOwt+7ZpIdbcTfHZLJUjew=;
        b=drdEGnn6bSG1bQXrr6SCO9vL8sEJJnSyNh0s4SAbgA50zj3osmvGAr+RilNPSGW7tp
         KAfFuc5fnb/IN3BmLw8Lx1KUVaemwzWMqg+7fGeE+qpb2RuR+Kib91bE6zeP6pdAU+Iv
         rHPp+ANtA230uW3x89/bKkqo7TORCuWAHvqz4rYuwfwa0RHsGIPHziXZEfrA5sbdna54
         tQSSr4N/VaS9RF7zANbJqRDu+IaNTN4xu3gRYTJ/+K+ZA/pY1IFky9Y0+JvCObZ18NYD
         vzacLfpll9SGbrBMx+pDubr0qCbwovinLpHj7a49H5uO4QvUDuMrSrN+nvwfBoxvGTK5
         Cm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=xSWHQT0Gh+ASwqDbuftZ9hOwt+7ZpIdbcTfHZLJUjew=;
        b=FXghNO9xmt4HbVo97uNW8okrVNi4qRWz5Z/u6YeiPyAS7cdcmphJYtg0s1oc8aLj3e
         al8QVK/zMGufaj5qgUrBozJmM3NY40hVKuZZw/POcZmnz//8Ug1avALF8QcePU5Wu71u
         Xg9gvYDxSt1nvaVFACMFSSlUxkVw3i2IB4FwDy5DJaRlyLVV3yJ71H6VlkCU5inVDecP
         gmIbPArTeOoHN3h1znQ/ZEcqLT3oRvJuiBMpBaT7Wihpws7dAehhkNvo8yP1mevxTPSL
         eEAnsSiDKn6OOduFSDsmaSnPSu/qVdbTQy20fio54gjZt9+HfFfMwHPyYcfGesUBFd57
         DwWQ==
X-Gm-Message-State: ACgBeo2TMLBXneFMQxUuN1jVH2vwZYnN9O25RaL1MparAucmhKuoZS4f
	m7uYmAimvA48aILK6A8y6+Jr3k7YQQ==
X-Google-Smtp-Source: AA6agR7KljxZ9kbPwullzRTYyS9R74MZRULUzSQZWPtq0VQwcgMNVf0XgsbzpqwnU5ffstdl5YcXvw==
X-Received: by 2002:a63:c1f:0:b0:41a:9b73:a89e with SMTP id b31-20020a630c1f000000b0041a9b73a89emr14967609pgl.342.1661134566121;
        Sun, 21 Aug 2022 19:16:06 -0700 (PDT)
Received: from piliu.users.ipa.redhat.com ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id k3-20020aa79723000000b005321340753fsm7312139pfg.103.2022.08.21.19.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 19:16:05 -0700 (PDT)
From: Pingfan Liu <kernelfans@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pingfan Liu <kernelfans@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Steven Price <steven.price@arm.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>
Subject: [RFC 04/10] cpu/hotplug: Check the capability of kexec quick reboot
Date: Mon, 22 Aug 2022 10:15:14 +0800
Message-Id: <20220822021520.6996-5-kernelfans@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220822021520.6996-1-kernelfans@gmail.com>
References: <20220822021520.6996-1-kernelfans@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_191607_821173_4099B6E9 
X-CRM114-Status: GOOD (  17.51  )
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

The kexec quick reboot needs each involved cpuhp_step to run in
parallel.

There are lots of teardown cpuhp_step, but not all of them belong to
arm/arm64/riscv kexec reboot path. So introducing a member
'support_kexec_parallel' in the struct cpuhp_step to signal whether the
teardown supports parallel or not. If a cpuhp_step is used in kexec
reboot, then it needs to support parallel to enable the quick reboot.

The function check_quick_reboot() checks all teardown cpuhp_steps and
report those unsupported if any.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Steven Price <steven.price@arm.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>
To: linux-arm-kernel@lists.infradead.org
To: linux-ia64@vger.kernel.org
To: linux-riscv@lists.infradead.org
To: linux-kernel@vger.kernel.org
---
 include/linux/cpuhotplug.h |  2 ++
 kernel/cpu.c               | 28 +++++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index f61447913db9..73093fc15aec 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -374,6 +374,8 @@ static inline int cpuhp_setup_state_multi(enum cpuhp_state state,
 				   (void *) teardown, true);
 }
 
+void cpuhp_set_step_parallel(enum cpuhp_state state);
+
 int __cpuhp_state_add_instance(enum cpuhp_state state, struct hlist_node *node,
 			       bool invoke);
 int __cpuhp_state_add_instance_cpuslocked(enum cpuhp_state state,
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 94ab2727d6bb..1261c3f3be51 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -137,6 +137,9 @@ struct cpuhp_step {
 	/* public: */
 	bool			cant_stop;
 	bool			multi_instance;
+#ifdef CONFIG_SHUTDOWN_NONBOOT_CPUS
+	bool			support_kexec_parallel;
+#endif
 };
 
 static DEFINE_MUTEX(cpuhp_state_mutex);
@@ -147,6 +150,14 @@ static struct cpuhp_step *cpuhp_get_step(enum cpuhp_state state)
 	return cpuhp_hp_states + state;
 }
 
+#ifdef CONFIG_SHUTDOWN_NONBOOT_CPUS
+void cpuhp_set_step_parallel(enum cpuhp_state state)
+{
+	cpuhp_hp_states[state].support_kexec_parallel = true;
+}
+EXPORT_SYMBOL(cpuhp_set_step_parallel);
+#endif
+
 static bool cpuhp_step_empty(bool bringup, struct cpuhp_step *step)
 {
 	return bringup ? !step->startup.single : !step->teardown.single;
@@ -1347,7 +1358,22 @@ static void takedown_cpus_no_rollback(struct cpumask *cpus)
 
 static bool check_quick_reboot(void)
 {
-	return false;
+	struct cpuhp_step *step;
+	enum cpuhp_state state;
+	bool ret = true;
+
+	for (state = CPUHP_ONLINE; state >= CPUHP_AP_OFFLINE; state--) {
+		step = cpuhp_get_step(state);
+		if (step->teardown.single == NULL)
+			continue;
+		if (step->support_kexec_parallel == false) {
+			pr_info("cpuhp state:%d, %s, does not support cpudown in parallel\n",
+					state, step->name);
+			ret = false;
+		}
+	}
+
+	return ret;
 }
 
 static struct cpumask kexec_ap_map;
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
