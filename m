Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E97CCFA1A
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 19:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Td11QA/VQa1hb5XymAEIXVlh3bj4uD3jxegButagbs=; b=1r2OcQqu3e7S5z
	hfQ5h+9RC6Wr7DDyclWovduLDI6UJxR/TVRSuSAWLX59FKyQavQOiOAgJs3AELTUosKdBXIDs/W2w
	YHmfB7dn2ohwuQ9Zr/M/BMoHVU+U+SsWgDLHqyU6HEwUAaggLNrASV2fAJCryfSsQkndtZF63F1aX
	YcdSE1EjxkGdK7mnXgy2b5gzx7JYVfcolz2HCJnmBgOvCjXm+RhZnQnvFJN9tddcVVRV+MMRFYHCl
	M7LNCf6kIBTzrzoDTZgxIGIwjHM5iLCHRGQl5KH6cgZKIGiRNYIrRldIFjtdEh3MQ0pBjULXqoh+q
	0sqHzoeh3S/4p/K7HIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopX-00000003OtN-06HO;
	Sat, 08 Nov 2025 19:42:35 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopU-00000003Osf-2Y6e
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 19:42:33 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3737d09d123so22088241fa.2
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 11:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762630950; x=1763235750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2IQTBuXBoLRQZMsUEB0GbuKpDZXigWMmDpUz8gyE1g=;
        b=B5jrN5nfHuDRhjv8fLU4ZetMzqjik+8lkiJ8OEDYhn68l5snQUk9X5wom+DZuanXAw
         /HKdOOLkqT+bh+zRMzty791MKqohRMy6xdbs9IRdAeZP1p0aFYx+mPZGd0l2h7VSCFtI
         GbrqevuCyw2VP4B3qJ7o0+bWWfLaJ7eRYCguZkIS36qwvQDQgg4p4tHj5XewkjZZ63fn
         bBcWvyFwhZVrmmUHm4l888cZ6JQ9VZ+y9JiytpD6csnoEvRkZtb+yucdy2Yl1VVsUOJ2
         BbGeRg+apk8tCxRQyL+nbs4x4mXi4616n2mkZuDc+3aqD1i2uzwHWsiLUtiqyvsFCy2U
         3O6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762630950; x=1763235750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J2IQTBuXBoLRQZMsUEB0GbuKpDZXigWMmDpUz8gyE1g=;
        b=t0YImZ+Ml7jEvzrgkoGIN8T9lZGDPHk0Uh8c2CkZgujNdXExTCYRZWHkqgVp4hVPiO
         PripVfQZkIJ/8i2kpX03VZcisgweX9l512Pjug7zMY2fe1cEq1Ue8GpJIMXP6fs4D+6x
         uzBXGtOmplQpJzG2A940MBdf76wgEdc3pVacGgM/0rJ+AGJpb1qeYW72L56xyr61NXMA
         I3mDTZXSH5DUi+l6gL37G2mxQLNuNsni51JL10sq8lNuv8OMvpo+sV05Fo+Eelz4klS2
         isxSAbeZLLLg++1m27/vdlZt+VI+c4wKa6td0Yc8GvnrNyde8yuhsPDKsznOiYFBiUC9
         swJQ==
X-Gm-Message-State: AOJu0YxX/gt83NTtGG1nb+CF/L01rjZ7jv8eS3f8nEjaKgPMfSIpP7Uf
	7TyOpoFUjBGx07MQN9FyP+OL+D0H77y4JM0zy3c3vJQ6oL8m/YVttiC3b2gJP220c6c=
X-Gm-Gg: ASbGncvh0CFKGbVrvUUU6ZCZ5YZjmloKPzJyqjvMG+oruV1mFzO7apZ/RYGd8pNKgCG
	bvzXvtm0hY9AJyaLX4vrCbLnSvTFbqWQ0KDpZCzMCAUmTiJcMs5fZqVp4IVStKl1DszDCvP7wse
	EiC/v3w/vJN3/OKuwYpZu82mN9WSJKRDEtgh/Ulr/iLHc3EGOSd295T4R40ZPwqbwzTw4HnZldo
	EF/3EVT5TzLoysXLRHF7Fyd17m21RVgdNrHlXHmlFyRgZ8ksYD8GOMwJP3nD9ys8A1MEgADiE8y
	2/dm6vBFzSfBy3pkxL3adBmucCmEcsEfP97y7alinMpAn7VyChakSm7nVzpfUUgR4YotnfuQzEh
	CwhuTwBhNnT9ZtVsnTpSJ7jBZp9Gjjc854sptR38IPehs6zDW4MiCD53eQX0TAnl4YVMg6/jcdF
	ydY45lY/IZUea2
X-Google-Smtp-Source: AGHT+IFf6dK7lptakI4133tJJcZvJ7D5ljXgoiEFcd+YznP8qQqw2s3Ui5u0H2YIH/FT8lwi1hx0Gw==
X-Received: by 2002:a2e:8a96:0:b0:37a:2dca:cfb6 with SMTP id 38308e7fff4ca-37a7b1bede2mr8423251fa.21.1762630950197;
        Sat, 08 Nov 2025 11:42:30 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-37a5f0edac3sm22115421fa.38.2025.11.08.11.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:42:28 -0800 (PST)
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
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v4 4/9] riscv: vector: init vector context with proper vlenb
Date: Sat,  8 Nov 2025 22:41:43 +0300
Message-ID: <20251108194207.1257866-5-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108194207.1257866-1-geomatsi@gmail.com>
References: <20251108194207.1257866-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_114232_668087_7B79ED2D 
X-CRM114-Status: GOOD (  12.66  )
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
