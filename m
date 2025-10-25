Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13417CCF9EB
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 21:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Td11QA/VQa1hb5XymAEIXVlh3bj4uD3jxegButagbs=; b=oSy56MikhW3nkb
	yfCikugoKADBeWPTHITWW5ipx9spAr1XDTFaomANFzWk796ZATUaPieUClDF2LgF57lyxyj/5DHFU
	pzVcrp+cRttZgacZ6qAG76u2Rk5rLGqjHlG2oKf+0KtIChFjNga5py57GGqV0nk/5hJ23nLkTupwh
	wY82YnU1bBreWk6xaoA893/cLdXwwqnkH2ApE6CZPLd1nsamePDW5cn5kaUfxgmP1rzRONp7U39wi
	AEQwfEws8VAO061TqVC8z1p9vp7gEqlQyJJx0afkG4cQ5fECioB8IykwSn6S4Lh3Urq0igcz6nzgF
	3FYdySaxd0rZiieVCG8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClTu-0000000BlA0-0EZS;
	Sat, 25 Oct 2025 21:07:22 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClTr-0000000Bl8x-3V16
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 21:07:20 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-591eb980286so3448364e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 14:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761426437; x=1762031237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2IQTBuXBoLRQZMsUEB0GbuKpDZXigWMmDpUz8gyE1g=;
        b=hCdJOr/GuPjW3rgI9AwYoMTSSKz41YwaJs2tJMmZ+LuUhgAb2bbSptC0Cb7M6OceKk
         Nzoppq/qUoGtnyYewQpdNQrTPYW+CKIQTv7Kfq9udOK+G32aXatQqkV9cZgmX3esZsFY
         mF/wzIHciRA7yN2M1xdMvbPMxRrZf+fL2uCHr1OhhTLyPSUDz6Vv1R8aEy7sGi42fLLW
         jsmIY5K+dpwQ7vP/tB/QjdiFT/yZm7cAIAAGVWae7KrB4g6rPLGqsqDmJBB/j6sxi9PP
         OiVkIbIRQfDL0pH5rXgugi7vMF5P71ZGgO4EAdRYtgWi6HSythQBZrf8M9cVIlPbmV+P
         k5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761426437; x=1762031237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2IQTBuXBoLRQZMsUEB0GbuKpDZXigWMmDpUz8gyE1g=;
        b=C61eOvnCdHSwiblNRjzh8tQ4f5EhrpJIiihA2PhAYCliNnjPtFM3lEY9siJFUImN0a
         fyxGy9n9RmjHAzmNskkACNgIbjMyllkpYJ9npKKKAubNq4k5beueZJKAX3Jw0yc2B0UA
         32Biq6cjjQ22JF92vhr6NSgiCbaYx2bJ1yICl1kJYelP6xYAiO8xdog1hSI/P7m6jNmV
         al2n30Um4rYAe7ZDDLFkRzGjizHrHmjsANNM6pyjk5lETX4K5Q7PM7dby97RRGjBnMYk
         bFhO8LlnHTYJYBFrfpLfbQc7R7Lo8P6kzN6G1fArsXcttNZyYpVKTEcWBSZzznUsqNxI
         3f/w==
X-Gm-Message-State: AOJu0Yyrxv3XLRLXIQdFfl3ZTOQyiN6R8esXb5nAmlvo7GfoORyN4Qfp
	+jc7eWLYxafhnjKFzCDF8vOA/kpoY2Sh0orf64AowTHXvkyFefB75N5BG202YEuWj2s=
X-Gm-Gg: ASbGnct8IS0j18jbe6TpZY+XZoSLZxJhjLKy8yUjRM6mBza3lP80+j8PZYFhRu4kiLK
	yb4Weh/+gFX33FaR7QJLUKZ6LGOApNOkQg9Nl5gopqdclTPhcHyNeOrC2jW/tT0iaeADeKPxkfd
	JlN7/7gPFxhaLa3kG+5DLWS2rE88lTSh4n6y6AaSkqvkW7CXj7aEpsY3OxL5xVy63KZXxqsSdZV
	Aj6pqCNiS5uULMAjyBaVo8OGMqtAFzgHbxwFLyViGNaBPGoziWnIK3ABHiLy6KBNeEnVVF4q5x0
	OzsoxwW0ZgltoLAhvubRowYMtGePfCHKiFQGzzRJzpziVOGLbp5soKus0ANX3gLvdBfKSMs6YyZ
	4vsOSvdlh2WoS7CEOcnoa5ilcyNE0+ZFWXfAbwZQQhQq4327cRRIsxmSZmM4TRHvGm7gamHo+qQ
	QdYg==
X-Google-Smtp-Source: AGHT+IEUMnm6G8NC9y9eteA74dxGa6AyRrosugAI0qpbfbFsUo0z/KPL8oVjRjeuVyceOpVmnGq0AA==
X-Received: by 2002:a05:6512:318b:b0:57d:6fca:f208 with SMTP id 2adb3069b0e04-591d856642dmr11260648e87.45.1761426437336;
        Sat, 25 Oct 2025 14:07:17 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59301f840dfsm953644e87.104.2025.10.25.14.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 14:07:15 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v3 4/9] riscv: vector: init vector context with proper vlenb
Date: Sun, 26 Oct 2025 00:06:37 +0300
Message-ID: <20251025210655.43099-5-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025210655.43099-1-geomatsi@gmail.com>
References: <20251025210655.43099-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_140719_892227_C44C620B 
X-CRM114-Status: GOOD (  12.38  )
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
the vector register length in bytes. This zeroed state persists
until mstatus.VS becomes 'dirty' and a context switch saves the
actual hardware values.

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
index 901e67adf576..34048c4c26dc 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -109,8 +109,8 @@ bool insn_is_vector(u32 insn_buf)
 	return false;
 }
 
-static int riscv_v_thread_zalloc(struct kmem_cache *cache,
-				 struct __riscv_v_ext_state *ctx)
+static int riscv_v_thread_ctx_alloc(struct kmem_cache *cache,
+				    struct __riscv_v_ext_state *ctx)
 {
 	void *datap;
 
@@ -120,13 +120,15 @@ static int riscv_v_thread_zalloc(struct kmem_cache *cache,
 
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
 
@@ -212,12 +214,14 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
