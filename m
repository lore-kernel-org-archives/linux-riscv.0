Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7262DFF493F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 04:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aFblYvJEQO9nDF7Ody7bwB/yusu1YIUwzS6NZht2yCY=; b=Yr4h28pUnv/fJL
	2W777+WXhCI3fsIPjhHG7pCOwsBpf+0CKEc0qUzUfQxaA1NLI6YskuMZM5BiqfdfipAKwCia5em8O
	+RUO04s7qwwZqFMjdd4DvXoKlX/43wrJtGRl1BW+RtUZSjctESPDmAvpSovFvYjuaupIwuiPxgxxR
	982y+k5H1Ga3FyMYj03a1GXof9lmRtU2y3X1Ml3JJjfxcmz1RKal5CP3MR1FT52dFLSXap6FVdRG+
	7NnwBONnzJpMZTQCVLnOOtuDIj5AA2nHtobcC8YWBtQwHiyuhD7ndXoYkuoIaTjEDoiSQLJfSxrmp
	DsAGElElOdzsbSNnZG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w74Ky-0000000AbY9-0gUI;
	Mon, 30 Mar 2026 04:34:52 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w74Kv-0000000AbXj-2YuX
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 04:34:50 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-82c20f1e890so2809717b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 29 Mar 2026 21:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774845288; x=1775450088; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Jh8RjPwPB56bdE2HifgsXtOaKLdHd9fm9iG5LMOIb4=;
        b=LqbVvyYMivJLZOH3ss8HN7/4lW8hZYDerRAcwWmv89KrQwpMq/6OoIj8nJH+kXc9sK
         HadQW9EFYT3ZvR5pIB09XmemTtcCx9Vvx9kmTK1zwLdVW//siOT5Yc/cke/W4IPHBM2L
         ClAOlOXrhnSVt1o6GFuhyR2/fK8kOKW5Y/v/VfUomMxqHLUnR4cf183hp7PH71SCcCrl
         5qDvujPLyOEkEErQ8x/gx87UBbnF/ASFRAwc7GUQoQcb5XPZidh3U8wMmPGvL7PP3pu8
         LPKlBzEWRFi7K/JxP3bRuf7zE0D4STTsGR6oJLWB2e3JUTzfO7eWs+UrY9zTXZFi0Ncc
         4zeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774845288; x=1775450088;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Jh8RjPwPB56bdE2HifgsXtOaKLdHd9fm9iG5LMOIb4=;
        b=U1aEyOSVZNMDirEzkct78HZUr5AP7d4iaxx0wTHiORjkzQZyA6mpVQm58dvwWFg8v+
         k0WfMSy0SAUL6dv6sPzRNFWaONBYfBkDP6E1AfHqtQVifc0TQpxEK5vgFdXVfWOLgTAe
         r+dNf/i4HdLViYV0G36ATcJYvoDheXngyxCKklDum6kdU8v9RSUWppZs6ejvUl/VP7Q8
         9aodWYG4V/VMkI89VEMp2M/isORjsaaIX4BisJZYRifr1lmqp2Lm1Bu1tJQUC7yWtTIX
         9X5MQDCQudErdMFzrNYC+SWyR7+COlLXISXRmmc4MLKSM+vImsTsvsmAP+JuFtGLbTg5
         B6ug==
X-Gm-Message-State: AOJu0Yy3RJ/1jZjvymVu5PEYITclntJTqYnxRiwm9QmAfh0lgLJZeb7q
	dsjtOhzXZRCDojwGItCt5NwqETNfWGWOUv7oIWtZTeRRolVGq8rzg7Hw
X-Gm-Gg: ATEYQzwoP0Vyi0a4WxES6speLGX+z8h4fYV+uZ6iIVgsmkCEIJJFq6X/dXk8cyM6+y4
	afa6pNlAhjBuDeR/wQgXK+xdSmDgWgRaS0n36NkbE/hnwMzqAVRMkokvvwz4JYjVNyopw+EyVEq
	qK4mgtUNhLjBXXGbGifK/ewxTRlfvsAexU4QufA5GP1TyZ1VeooIQ4vuhsWCdrEz7AKTxh0ddEA
	XvlHpzVONsXMsZXaHfxbI58CV7UViEZPq6BNx58N1sizEOGwUExGiC6KQy+x7NONdUv0543F8Ud
	uYL54Bnn1quJjCyoS79j2uY4OBh+C27wTFoXvTtkExiRD3DPdvIjHG8ZdNcT3vnOjgSCrzX2mzn
	xw/wxLcGAdLrAU5WbDIA6Mzatyvyvv4itGFb2mKRhRtkVo9Wqaox38fSybpmBi+2fSm8uoQuENh
	8GEtgcdVpLtq4KBsZUcLONSnXv9Kv0BsSgsgaSpB8=
X-Received: by 2002:a05:6a00:bc93:b0:82a:17ee:3c1a with SMTP id d2e1a72fcca58-82c9604fcccmr10472534b3a.53.1774845287982;
        Sun, 29 Mar 2026 21:34:47 -0700 (PDT)
Received: from adminpc-PowerEdge-R7525 ([27.122.242.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8628f44sm5857160b3a.57.2026.03.29.21.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 21:34:47 -0700 (PDT)
Date: Mon, 30 Mar 2026 13:34:42 +0900
From: Austin Kim <austindh.kim@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	austindh.kim@gmail.com
Subject: [PATCH] riscv: signal: refactor debug logging to use macros
Message-ID: <acn9Yha4JufGcQah@adminpc-PowerEdge-R7525>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_213449_651538_7A0A8885 
X-CRM114-Status: GOOD (  10.40  )
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

From: Austin Kim <austin.kim@lge.com>

Replace manual #if DEBUG_SIG blocks with a unified DEBUGP macro.
This will improve code readability.

Signed-off-by: Austin Kim <austin.kim@lge.com>
---
 arch/riscv/kernel/compat_signal.c | 10 ++++++----
 arch/riscv/kernel/signal.c        | 10 ++++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/compat_signal.c b/arch/riscv/kernel/compat_signal.c
index 6ec4e3425..c82235be7 100644
--- a/arch/riscv/kernel/compat_signal.c
+++ b/arch/riscv/kernel/compat_signal.c
@@ -12,7 +12,11 @@
 #include <asm/ucontext.h>
 #include <asm/vdso.h>
 
-#define COMPAT_DEBUG_SIG 0
+#ifdef DEBUG_SIG
+#  define DEBUGP(fmt, args...) pr_info("%s: " fmt, __func__, ##args)
+#else
+#  define DEBUGP(fmt, args...)
+#endif
 
 struct compat_sigcontext {
 	struct compat_user_regs_struct sc_regs;
@@ -233,11 +237,9 @@ int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	regs->a1 = (unsigned long)(&frame->info); /* a1: siginfo pointer */
 	regs->a2 = (unsigned long)(&frame->uc);   /* a2: ucontext pointer */
 
-#if COMPAT_DEBUG_SIG
-	pr_info("SIG deliver (%s:%d): sig=%d pc=%p ra=%p sp=%p\n",
+	DEBUGP("SIG deliver (%s:%d): sig=%d pc=%p ra=%p sp=%p\n",
 		current->comm, task_pid_nr(current), ksig->sig,
 		(void *)regs->epc, (void *)regs->ra, frame);
-#endif
 
 	return 0;
 }
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 59784dc11..1d7fddcff 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -30,7 +30,11 @@ extern u32 __user_rt_sigreturn[2];
 static size_t riscv_v_sc_size __ro_after_init;
 static size_t riscv_zicfiss_sc_size __ro_after_init;
 
-#define DEBUG_SIG 0
+#ifdef DEBUG_SIG
+#  define DEBUGP(fmt, args...) pr_info("%s: " fmt, __func__, ##args)
+#else
+#  define DEBUGP(fmt, args...)
+#endif
 
 struct rt_sigframe {
 	struct siginfo info;
@@ -471,11 +475,9 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	regs->a1 = (unsigned long)(&frame->info); /* a1: siginfo pointer */
 	regs->a2 = (unsigned long)(&frame->uc);   /* a2: ucontext pointer */
 
-#if DEBUG_SIG
-	pr_info("SIG deliver (%s:%d): sig=%d pc=%p ra=%p sp=%p\n",
+	DEBUGP("SIG deliver (%s:%d): sig=%d pc=%p ra=%p sp=%p\n",
 		current->comm, task_pid_nr(current), ksig->sig,
 		(void *)regs->epc, (void *)regs->ra, frame);
-#endif
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
