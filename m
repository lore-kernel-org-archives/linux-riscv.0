Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4FCE7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 14:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9T7xhf8/e/IR1ozR427FJGthCDnxkA08GcwcStjBJk=; b=EMAO9ga8chyVuI
	45GyfskwdJliDrzrbvJgMFm2bylcwQIQm82ok3cA9c8slH+Vji4ZP/Yqi390iWCzjWGtfMB/SwLP3
	6cvwVkcqbBOBe1F89iAzjQTWcJl97Gjfwz/9CJiqd3KUGfu21H64ku2Wq63gEQzYa28dTHHk5hxs5
	ZnejKLs8mjIQQ32RKAxLKbpRmQRXdOWRZpl18DvB6M9nR7oun1ARuh0m7cqtTmm2zEqrma86Dfd/e
	yNfCr7LQod8bPkSzsZoY1gGVPBXGHyODIKSAb2Mxwky5P/ocCrsNAwbOKMfgCRpM9IeA+D7Mh7HJ3
	VLvZngco2zDwpsXYdQ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Q1-0000000BoCM-0E74;
	Tue, 10 Dec 2024 14:40:57 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL19r-0000000BkCD-43n2
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 14:24:17 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ef89dbd8eeso2081411a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Dec 2024 06:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1733840655; x=1734445455; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K5qH0MfXKfA82FtJGAtiD9e44kpeNSF59qHyzqUktew=;
        b=iJQzriXYEGU1HkAcU7XrZ6TlnEf1ef9+2orhzR2WN/Y0nIdcV/WftgNWzwzHie+9C5
         HAjb86M1bHa6oDgA+iJc6BGIUGpXF4E+W4dcOcjSunejRQ5+kjmETXGV56a9KmPu2aZI
         UA1OGCkQgMalAMWLDZP5ng5y8L91HSti80bPYN4txltxLYl0UybVViNQQrvpcY52eZv5
         jC7JqqLiYf4H283Uc+A4RFDOagrqIyCSd8D+FlxmUbiW/79N4cTTKga5zhgsQboN12d/
         ozsELJH8e1dLbtTGw3WHAtgypNFLhnLte3rl1VStiTv4IacM8Vr4JWjXoTPsfozDB/OM
         W/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733840655; x=1734445455;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K5qH0MfXKfA82FtJGAtiD9e44kpeNSF59qHyzqUktew=;
        b=OHY2p3MmFq9qD0PkKKD1Oj5l0ksMhgs3eu1QKh20mWHKibQpWeITE8rUmyHbknlPw1
         nJyNDRSfDXsDg/Iyf8vy1KyWvSZUfLqnTtTV2fzRPmOFBp79Yp8eXSyh8cjLs+U/suOE
         I7Iy6hK19MjmVoA+3WIapu4bqV3DbZWAbI5bqwr2ngLLf5VSdHC7QqZKq9Jfe6xvpzwt
         2k6G3Cg8YFgIEItuoiwtBHTWavUO4GwG61lax2UsGm6bdQWUyqFQmBdHecvBzrUE2Bw0
         RNx6439BNeM74KSADOxtjnEHt3Yn54zRdRsE4Oh655t9zZmg+V4B7UKNi3s+jiqMc9jf
         NbcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr5YJWj8V5B2mOpn1qE6Bo7xTta3o/ZBpFLFyhPluRizHUVhQA2JbIkj+Dmr0t3F6HMfQPr8CqApaBDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+burZbg1WO3PD0/HJa2mwYLx+Vqqk4lNXnh9aYi6E7uMCSfjc
	Skbuqzetf3kyTQn+O4H9Lf5AkLXENKfkvQT+s+1fju07oXLHUrIVxsTfgCxNjpw=
X-Gm-Gg: ASbGncvLwixdJ8SwVP/8oF4AvTgiTHqGVf+jNkUDr4SVeelfcazfwIXDGBqUsUJeEFD
	Ovb/s4scYf6fR+XR0qWoSNlrl2pQtF7Armdj81aqPsiH56ZtGppep1OG7YAHfB3I2LRnLE5LOFP
	mvcVvOBD2HOnG1u2Vfs7JzTELXRjeWpvRCiVk8BLDuQTNEXyggBbuOSw9DJGpROer9peUwwJ5bN
	um/kroBrP7rr18uqbY5wyB6dbD0WjF2uLgbF/W8/RSChGm6PBzLGJing3Bk7Jn5HW06m7p/2S4G
	/c1meB8C
X-Google-Smtp-Source: AGHT+IE4HixJrIDtqZonmKGjORacp6uNTwKs9GuvdA/FUm9KmXGsasElmICG8/zrqS2NRhVFZTIRCA==
X-Received: by 2002:a17:90b:52d0:b0:2ee:741c:e9f4 with SMTP id 98e67ed59e1d1-2ef69fffa77mr23841080a91.11.1733840654766;
        Tue, 10 Dec 2024 06:24:14 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef7315fd3asm7538444a91.44.2024.12.10.06.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 06:24:14 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andybnac@gmail.com>,
	Zong Li <zong.li@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Zhongqiu Han <quic_zhonhan@quicinc.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/2] riscv: signal: fix signal_minsigstksz
Date: Tue, 10 Dec 2024 22:23:50 +0800
Message-Id: <20241210142353.6457-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241210142353.6457-1-yongxuan.wang@sifive.com>
References: <20241210142353.6457-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_062416_003261_13ED17BF 
X-CRM114-Status: GOOD (  16.86  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The init_rt_signal_env() funciton is called before the alternative patch
is applied, so using the alternative-related API to check the availability
of an extension within this function doesn't have the intended effect.
Instead, the riscv_isa bitmap should be used to properly check whether
given extension is available. This patch also refactors the estimation of
signal_minsigstksz by extracting it from the get_rt_frame_size() funciton.

Fixes: e92f469b0771 ("riscv: signal: Report signal frame size to userspace via auxv")
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/kernel/signal.c | 40 ++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index c3c517b9eee5..85eac84719e9 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -203,22 +203,18 @@ static long restore_sigcontext(struct pt_regs *regs,
 	return err;
 }
 
-static size_t get_rt_frame_size(bool cal_all)
+static size_t get_rt_frame_size(struct pt_regs *regs)
 {
 	struct rt_sigframe __user *frame;
-	size_t frame_size;
+	size_t frame_size = sizeof(*frame);
 	size_t total_context_size = 0;
 
-	frame_size = sizeof(*frame);
-
-	if (has_vector()) {
-		if (cal_all || riscv_v_vstate_query(task_pt_regs(current)))
-			total_context_size += riscv_v_sc_size;
-	}
+	if (has_vector() && riscv_v_vstate_query(regs))
+		total_context_size += riscv_v_sc_size;
 
 	frame_size += total_context_size;
-
 	frame_size = round_up(frame_size, 16);
+
 	return frame_size;
 }
 
@@ -228,7 +224,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	struct rt_sigframe __user *frame;
 	struct task_struct *task;
 	sigset_t set;
-	size_t frame_size = get_rt_frame_size(false);
+	size_t frame_size = get_rt_frame_size(regs);
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
@@ -318,7 +314,7 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	struct rt_sigframe __user *frame;
 	long err = 0;
 	unsigned long __maybe_unused addr;
-	size_t frame_size = get_rt_frame_size(false);
+	size_t frame_size = get_rt_frame_size(regs);
 
 	frame = get_sigframe(ksig, regs, frame_size);
 	if (!access_ok(frame, frame_size))
@@ -465,19 +461,33 @@ void arch_do_signal_or_restart(struct pt_regs *regs)
 void init_rt_signal_env(void);
 void __init init_rt_signal_env(void)
 {
-	riscv_v_sc_size = sizeof(struct __riscv_ctx_hdr) +
-			  sizeof(struct __sc_riscv_v_state) + riscv_v_vsize;
+	struct rt_sigframe __user *frame;
+	size_t frame_size = sizeof(*frame);
+
+	/*
+	 * init_rt_signal_env() is called before applying alternative patch. Do not use
+	 * __riscv_has_extension_likely()/__riscv_has_extension_unlikely() to check the
+	 * availiablity of an extension in this function.
+	 */
+	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_v)) {
+		riscv_v_sc_size = sizeof(struct __riscv_ctx_hdr) +
+				  sizeof(struct __sc_riscv_v_state) + riscv_v_vsize;
+		frame_size += riscv_v_sc_size;
+	}
+
+	frame_size = round_up(frame_size, 16);
+
 	/*
 	 * Determine the stack space required for guaranteed signal delivery.
 	 * The signal_minsigstksz will be populated into the AT_MINSIGSTKSZ entry
 	 * in the auxiliary array at process startup.
 	 */
-	signal_minsigstksz = get_rt_frame_size(true);
+	signal_minsigstksz = frame_size;
 }
 
 #ifdef CONFIG_DYNAMIC_SIGFRAME
 bool sigaltstack_size_valid(size_t ss_size)
 {
-	return ss_size > get_rt_frame_size(false);
+	return ss_size > get_rt_frame_size(current_pt_regs());
 }
 #endif /* CONFIG_DYNAMIC_SIGFRAME */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
