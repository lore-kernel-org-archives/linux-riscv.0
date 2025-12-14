Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B1AD5B174
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 16:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+C6bDv1YInSv5PjcCXdOL6To6qmxXYqbSlQUnDJKko=; b=1KjzohA5WoA4S+
	oqb2W4mOLarsD3MKyMip241Rrz3l8WkkunM+xM1he5a6z6fct4P6wmuzeHNQ4TnoDX60qKcTyvuh8
	pVwbVEL2e7JcLrCLIyLQBPzoofAK+1pQNl6ErDinFWQAS+U7yjA2cLGnM6SfZNyJ0m0HwNA7tuAdy
	oQfhahkAo26qhn67B8FbX/3apzJ2ZSU/ZFNez5VC5pCt4m/S8g5NP6orajJfA0RJOSIqTofyhdsDi
	gVyT76eLbFxgIbQHMNRzqXdqLCm8af3wYIIOcFDxKavkM323Um35yfOgJcQ+OfdCn0cmW1ivtStBU
	fs1BGJJGNnPjuZHe0bmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4f-00000002aEw-0Ldy;
	Sun, 14 Dec 2025 16:35:57 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4Z-00000002aDR-0IDv
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 16:35:55 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-597de27b241so3377422e87.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 08:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765730148; x=1766334948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLn4MNRkDT1IUgV60n0qo0HeUjZmH78SLEbhEVR7tyI=;
        b=Xx1YB3/E6ika8bF6/QbLKFP4YKHi7IvH8fketdYZR6grpBkoBWUq3MT1L7PJ9mydeZ
         Gx67tcUcXKEKGMYflNzqgz11P40YRlvz0bc6neDEfx4cxSy7ygSbxt69oAbTDLxi0tuz
         dzYf9K4P6l90U/BKhIENKzVW5d4xjQxyqQFhaBjHWe4CxPJQYkUAUtLA4wgjMuJNVAq7
         rI3I9PuphpgV34C0WFAHpGrIA0Lgl95sAC5JTKamaLD+xxB+A37ePLJjgUmzhTLqYL1i
         PTG7z1n7hYvpX0DpGQTdmh34KCPIIhwPrmz4bOTzlUztUwkxykMCV8bLnNNlE8Ms1S2L
         My8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765730148; x=1766334948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dLn4MNRkDT1IUgV60n0qo0HeUjZmH78SLEbhEVR7tyI=;
        b=Gxcek9TU4JR64MiMRftnd5kjKXmnDdRZ87oWLLboxvsLyuH0MZ97AM3kDtWbBcHsLP
         AbmSCO8Hwf6+82yMxFeZoNe4wO5wq6PKcVFDL+GVdO9Le2YOyOSCfnTMOzW5F0eJ+nhg
         aUIi5vemnIVo53McVs/9S/9e5r74iNjXd28kqt3NM9qfvNxF/yMzUCva0edyxCdALu4q
         8+aDI6H0I7rulvG/r686Z22uMH0zof5wreroYsPr1lCbffalUVDmE9OutFOkzwWWi/pL
         WS9vV8YIPpO6enBigvIo6yi7+GRz9ssQHYDASOqnzQmjSY2b0uHbCiKmC0o+QupwVw/Q
         XMkg==
X-Gm-Message-State: AOJu0YzaX21TfMh1VG7vujj1pFc5olMLSKzKfr2aVNB45RihVJP5ydSt
	vksoSx6EYzFU7pq1NwgjfQB925VDjtkpAM2vnMIigfO0DR5h7zNld1VSMXs7FkGy
X-Gm-Gg: AY/fxX7wWGaSdkfFwH+8ooOmCuFIvZt8f/Sir0HLq6UEeoFChhaiVP+npgoM2VxkIw2
	J+quZoEtMTy8DFRkLRIWZvu94niF7tPK/ZaYJlRNMRRTjV8SO1c3M8qRvS+T7gcH9hds2TEwbLy
	M7SihUW9t2LJUNj84/uY81IMP/8XT0DAFlT5BrCU3Je6rb0SbEGR1WmLE2lSDqU4JSXhidV0yAa
	3b4mVnQh9uL6mWZ1fwqgO5Mo9GZUnpvE08ChUwZP8DHEYKtXLFVf9tSvKNUxNyy+STUiIJ2RIhG
	vrYFq24qYysZ2+iK418wMBAHwtFycnPEr427n+DfgnG+N9tXjCCP/VM5iBKONFAI1sK7snswaV3
	YdMtVhpBbNk/C/PDEOf9CaqLxIK+Dv/KQ4sZYmE0Rz5rD1shmfTpZxtVUspIzczln2TcfaWiabH
	LK8cLt19bYeLA4
X-Google-Smtp-Source: AGHT+IFh1nTDiB6bfb+d32bUKdxI+dMGC8og7D8jELF0KQuXTZE0v1XUdZ2F7715E8gk3xNrCq+2AA==
X-Received: by 2002:ac2:4c47:0:b0:595:7f1c:29bb with SMTP id 2adb3069b0e04-598faa36a70mr2545740e87.22.1765730148316;
        Sun, 14 Dec 2025 08:35:48 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-598f7717b79sm3789618e87.60.2025.12.14.08.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 08:35:47 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Joel Granados <joel.granados@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v5 2/9] riscv: vector: init vector context with proper vlenb
Date: Sun, 14 Dec 2025 19:35:06 +0300
Message-ID: <20251214163537.1054292-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214163537.1054292-1-geomatsi@gmail.com>
References: <20251214163537.1054292-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_083551_431987_75225669 
X-CRM114-Status: GOOD (  11.71  )
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

The vstate in thread_struct is zeroed when the vector context is
initialized. That includes read-only register vlenb, which holds
the vector register length in bytes. Zeroed state persists until
mstatus.VS becomes 'dirty' and a context switch saves the actual
hardware values.

This can expose the zero vlenb value to the user-space in early
debug scenarios, e.g. when ptrace attaches to a traced process
early, before any vector instruction except the first one was
executed.

Fix this by specifying proper vlenb on vector context init.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 arch/riscv/kernel/vector.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 3ed071dab9d8..b112166d51e9 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -111,8 +111,8 @@ bool insn_is_vector(u32 insn_buf)
 	return false;
 }
 
-static int riscv_v_thread_zalloc(struct kmem_cache *cache,
-				 struct __riscv_v_ext_state *ctx)
+static int riscv_v_thread_ctx_alloc(struct kmem_cache *cache,
+				    struct __riscv_v_ext_state *ctx)
 {
 	void *datap;
 
@@ -122,13 +122,15 @@ static int riscv_v_thread_zalloc(struct kmem_cache *cache,
 
 	ctx->datap = datap;
 	memset(ctx, 0, offsetof(struct __riscv_v_ext_state, datap));
+	ctx->vlenb = riscv_v_vsize / 32;
+
 	return 0;
 }
 
 void riscv_v_thread_alloc(struct task_struct *tsk)
 {
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
-	riscv_v_thread_zalloc(riscv_v_kernel_cachep, &tsk->thread.kernel_vstate);
+	riscv_v_thread_ctx_alloc(riscv_v_kernel_cachep, &tsk->thread.kernel_vstate);
 #endif
 }
 
@@ -214,12 +216,14 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 	 * context where VS has been off. So, try to allocate the user's V
 	 * context and resume execution.
 	 */
-	if (riscv_v_thread_zalloc(riscv_v_user_cachep, &current->thread.vstate)) {
+	if (riscv_v_thread_ctx_alloc(riscv_v_user_cachep, &current->thread.vstate)) {
 		force_sig(SIGBUS);
 		return true;
 	}
+
 	riscv_v_vstate_on(regs);
 	riscv_v_vstate_set_restore(current, regs);
+
 	return true;
 }
 
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
