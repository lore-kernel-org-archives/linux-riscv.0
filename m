Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993D5CED242
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 02:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8w9Ffecrnz3fqbOKbdauz4gvqPesaTHw4/EGkUiaQSs=; b=F/aQNuPGtJ2k0I
	djj2LsonnT0px9VqV5MsdOs2FVlBBHb8dB8PsXhQNkOZfgjJx68YClYEx6V9FN3PmTDJ9sTA4djTI
	2RcDkUV9RTLMQwiqPi1NjRU85V7w5YdApXgtI5JYYi1wyfPOO/cX8FS7c9KMyWL77Tc92yCltu0Pm
	mXe8PwQwqA6ntUcKzyTSyU0yChqOn2+YZXmPu4bJ5aKd8ZAZ26z/3HqbxOP7ab9lXlGOVQ+Lj61a7
	ijIl1WPm6RSdGvuzawA4XxWhkFAFs34i9fB/ahb2ly04TKC/ro6R1xB/ig/IcnxGE5TIphYKoecTK
	dOws/MGr1EMPGUOoxobQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBo2-0000000HFVI-0SmO;
	Tue, 18 Nov 2025 02:50:58 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBo0-0000000HFTT-0WqE
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 02:50:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-29568d93e87so44863815ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 18:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763434255; x=1764039055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yk19cubzYI59vS2m7ARmuI6dwPXbjagJNzaP0UWxsjY=;
        b=jnhC9rwnHxoHPh/5B6vSWkDKhSUIbpaB8Pu3vv4ID60IwFs1VxIZQ86/RIcJfTtlQ+
         AcitfzcmqVGW3+qhfvOdD7ZF0Y+Jb3+HIkEMvZ/l9p1jgp3Dmmx/Fxbi0PbvucUNfFI8
         XjQw4vWWbK4/35XVixddr+kkIh+x0nEEwKCDQdsKvIFJW7jDl91uHWKVLIwteHGV41GV
         1Q3xq0jW8C4vkwdj5RNgM4yXDL2dWCfdnKep9IyuLX352YbFXedYdnKm14p1dH5qTsbb
         FBPhqtaNlj4ckJLuxB5VQYI8s49FpgX4DjAbXt3I1cNw1G9XVUqxQyJpxOUQsE+YGa0V
         VeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434255; x=1764039055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yk19cubzYI59vS2m7ARmuI6dwPXbjagJNzaP0UWxsjY=;
        b=wcK9gefVxRL8yhXKL7Z5u3t0RYOjym1uIjKctUWqFv4gjtqKea1jY49pUf4X1gplne
         WKyjAEl/qY7qg+qp8Aj14in7QRD8dYzfGOGI/CmNSh8DQUbf8/W/Z1J/zUneuAzAkeHL
         JbujzaRXm9I2gF2O8R3wKBB0YtV++RPmVOUr0ZQIeNr6VhyLZ6c/SpRX4liwQXJlpg/Q
         2TXW09hFOMX/Zdm09zTqdbNHaGU2+NlFwKjfJe9rx11AL5XQl3FRvsy6oGDZeSdPb31w
         X930RRCqCJ+l2Cuo6YOkTFR3qKJ1PHnvGQOZCxWI9b0IiYi98Q8bVFdvK3hlQfx4KvvG
         vyqA==
X-Forwarded-Encrypted: i=1; AJvYcCX66MZ1Re9lCEUDpeYuTU71BLPEGnkV0Tp8rTe0IDgk8C3kYeSVkrkuqiGMZxLgfw0CQHWdtBzfsoZ2TQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxeu2spc1Tv+ZgzGoUYEAkSuj/4kN+j/oR3H3tV394LaYaZNVtR
	IqNGcarCy1zmoB4g6VENhqpdoKOx0H5I6cQichAMYvsJ1llBtUNVxibW+TWRsF35LiI=
X-Gm-Gg: ASbGncs8KaeoZjEcUwbYyfHLU4Y3SxWtDRTeVxphBvBdywbBYMbrKFXbyIW2+5+78hg
	uXy7mFovaP3xyFvcRQy7YuvLE3TWMY2Oz8MFPlFmbJAMU/LdIint9fyHNgTAj5YzpmiYscJsefD
	dqfuEMQvuVaH2NfBm3IXZGgCG7gxwihhofQCfqLJfysBUd2vMWWfvAE7ARq8zs6kSvkrFzD0TYo
	dt+gyOQjfktY91DJ/JhpyWTMiYPDaF9Q3DAdIALzy6AWRj8XWZu8SC5mLdSjz03Y6dWGBucmjop
	XciFlm2LLbWILSk3MCJbH4GZEAXM0tXxU27tANCh+yXmqos2W1z1QwRKykLr5u88oOCzHGQTXc4
	trUQ1aPIYVBrUIz2JN0r7K9UQwerNsyec01frpfPOxMvjkeBm3vh/Cju71/rpn9bKI04/YZS11M
	0sjsgyMsIM7MpZq/bHQ0gTgExVrttLWg7ccw==
X-Google-Smtp-Source: AGHT+IGDZAMo0ZQv0dHXusB9vvga1W8EiCZHdD/dMDMq4XG4NK+75rIo7LnojyDw0hkA9sDDjE1JTA==
X-Received: by 2002:a17:903:4b07:b0:295:9627:8cbd with SMTP id d9443c01a7336-2986a73b6bamr160750285ad.33.1763434255050;
        Mon, 17 Nov 2025 18:50:55 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234809sm156022065ad.19.2025.11.17.18.50.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 18:50:54 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	arnd@arndb.de,
	kees@kernel.org,
	tglx@linutronix.de,
	viresh.kumar@linaro.org,
	boqun.feng@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	cleger@rivosinc.com,
	atishp@rivosinc.com,
	ajones@ventanamicro.com
Subject: [PATCH v2 3/8] smp: move num_other_online_cpus() into smp.h
Date: Tue, 18 Nov 2025 10:50:10 +0800
Message-Id: <20251118025015.42491-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251118025015.42491-1-cuiyunhui@bytedance.com>
References: <20251118025015.42491-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_185056_168006_B839C20E 
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

Remove duplicate definitions from arm64/riscv, add unified
implementation in smp.h.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/arm64/kernel/smp.c | 11 -----------
 arch/riscv/kernel/smp.c | 11 -----------
 include/linux/smp.h     | 11 +++++++++++
 3 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 68cea3a4a35ca..2d1e7839dc9b0 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -1171,17 +1171,6 @@ void tick_broadcast(const struct cpumask *mask)
 }
 #endif
 
-/*
- * The number of CPUs online, not counting this CPU (which may not be
- * fully online and so not counted in num_online_cpus()).
- */
-static inline unsigned int num_other_online_cpus(void)
-{
-	unsigned int this_cpu_online = cpu_online(smp_processor_id());
-
-	return num_online_cpus() - this_cpu_online;
-}
-
 void smp_send_stop(void)
 {
 	static unsigned long stop_in_progress;
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 9dbcb9a06a96d..669325e68a21a 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -272,17 +272,6 @@ void smp_send_stop(void)
 }
 
 #ifdef CONFIG_KEXEC_CORE
-/*
- * The number of CPUs online, not counting this CPU (which may not be
- * fully online and so not counted in num_online_cpus()).
- */
-static inline unsigned int num_other_online_cpus(void)
-{
-	unsigned int this_cpu_online = cpu_online(smp_processor_id());
-
-	return num_online_cpus() - this_cpu_online;
-}
-
 void crash_smp_send_stop(void)
 {
 	static int cpus_stopped;
diff --git a/include/linux/smp.h b/include/linux/smp.h
index 18e9c918325e5..5300c5c14232b 100644
--- a/include/linux/smp.h
+++ b/include/linux/smp.h
@@ -275,6 +275,17 @@ static inline int get_boot_cpu_id(void)
 #define get_cpu()		({ preempt_disable(); __smp_processor_id(); })
 #define put_cpu()		preempt_enable()
 
+/*
+ * The number of CPUs online, not counting this CPU (which may not be
+ * fully online and so not counted in num_online_cpus()).
+ */
+static inline unsigned int num_other_online_cpus(void)
+{
+	unsigned int this_cpu_online = cpu_online(smp_processor_id());
+
+	return num_online_cpus() - this_cpu_online;
+}
+
 /*
  * Callback to arch code if there's nosmp or maxcpus=0 on the
  * boot command line:
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
