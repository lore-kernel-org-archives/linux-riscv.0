Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE31C55196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 21:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4gwVI0ybqd944jvxCdpKwrtxe5qFcIZDg5S2VyNnYQ=; b=GyHaMMnlB4/IsF
	LOuaJNUv7UIN3rGdxfMqUNbs4DAUaYyf9MscUWIW0jC2gQXkMBJHHVFMJJaNA/1eRgX0SNqhmyFBv
	ZMmwoVipNSxixFyQN6v8qz0TXBJJcOtT+o6/nViRsJEDWYAVUyfQaIa2QeATGd26CU7klgApb3O0z
	fOgeujqD0W6mvjQ1DIaARrHTebpt3AV5PFBR4V4o+7DXtGDh7NBOwF+wC+IK7vDXBTC97xIbhrlCX
	d6i/oCrdwk3jczm/4a2A4MdE7VNxHO3o0FHFmvrPuEsBN9htFWQzJYJN1+loVVg9QQCz8y9DVpsJE
	poaO1jdckSHk2vOy+lLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0ay-00000000Yhn-3Gml;
	Mon, 03 Aug 2026 21:53:16 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0ax-00000000Ygd-0hb8
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 21:53:16 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so2466691a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 14:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1785793994; x=1786398794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhanRwh7zvnbA5tn7sDwLMiOA0lv2Dx4b1vq2Go0n2s=;
        b=D5LB0ir8sKxFV7RHZo4W/Q9pcwAil5p7faVsOFIGgUvOiNfKleh4NEAciLdNqoirIw
         nAcY+Kj4ealggItoo4f3G3cETmn46TA7RS4JSf71OOGwZLAeBBRiqRDKnzjx4rNETNW0
         ivY/XLajkwg1SRUd9S/Lm1Ei4BCDQXy9K61QFVSqJaXCXIsZodPNYMZWvJ2WWZkdvxkv
         y3iRBYg1Tk3dDK2Q5oZGMP3dQY6fmJoIk16H9ngfnX0+Lt0Vdu2oii9fXFo6P8XjKWi1
         y3bluW32fFlpqzLAq/026m11wis5cC/dq9PSfNChO9h/FCPI8+5IwRlKHOM4j/VTH8p+
         yJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785793994; x=1786398794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhanRwh7zvnbA5tn7sDwLMiOA0lv2Dx4b1vq2Go0n2s=;
        b=ef37k3s3WlJn3mikENHkIBZzTUKKSByuhzQKc3WfE2Z1qAEGMZ997y3PdpNlHE9h5H
         DYcNSgl2aodyjnQ8bNBfhnfiT2HvnqXqJv0pzooynTEJZrFJ+EKDk70dMZmtoelKRWwR
         Y7FGcqFGvhRcOr5wEqGA8MnUklQ/hM92qE4TY/gyl+NOr9leFeAuXEkdJXBWKdi9HgBH
         Kdq1FLzIAvPyn9AHikPlcwBk1qXwDDoKAfEwW86FRaCdpv/0/tcoTk+9B9JYTkAUgd02
         uHVQ3GEL0t6v5yJRT8KqzzmHjDQLcyuf6ht7JKcMEI5faGvfSE78ZXpRSAtIMAcctInc
         aQ7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrwwPQu8+VrpmvCGCwvcrWYFx6k25BB/oxC3YCs4/FZlN/MkCrosj9QYvlvJdwa61bnV1iA/Ejnw/3N1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZzcxZ4HIeAhQ+K3OH4f/vWueYeoqsmBfXu8LPdFgxIQJp9FOQ
	Iua0iKvCzeF6X8Z2esZDsdymEhu3L092s/xBuOxarU4e0GpeqalbDpZqqcHks9spNRw=
X-Gm-Gg: AR+sD13OxcgAsqJBFmBqZy5ixbRT/N68MXyATrmWu7Zio1UkHLjGOZhND8MHBl6LzGY
	0hVsz33bnAuPTi7cBlcGywoUQZMt2d9DYBTa7ONIh7cuLTpqYcdVwjqsmrIbMsWW8DFHcgpkEOL
	I/3jgJT+o4yDDjO0hmU6Os0iiLqpUbMGZtjHRwI+jSOKZjGkpPonOrttDgS68Mg8M3YUp47JRYf
	4SzEJZQ9Xd6wyNrqWHu4jwmlPHCFaCWrcMFtPEOfuTKfh5VS7/mzed6gGkLvPr7s8zWv0PM54bK
	ENoSlp4ZenC02Hi1gvceuZCdauzk9mBtJ8apvT3BwieGjowNPvNPaqg2CXcYwejdZrJh1xv2c/M
	tTEAnEvlc7T7bQQUOjLpYyMJppCfORUO32fLXgR9QoWKtcZr0nO9mhTv1Jx+VnLHf0KOmmkLZYS
	VEk38IAvuPEQqLIGGPbb7MUAYNacDWlJbElczGLAB8tKCAjUOQ6f0grPJf4yW5RBwn5V4uwpEwW
	2Gksm1bzRNOBaYKOmGUq0ZSkTM=
X-Received: by 2002:a05:6808:1a27:b0:486:560d:aa91 with SMTP id 5614622812f47-4af5e2c78b6mr17292705b6e.19.1785793994126;
        Mon, 03 Aug 2026 14:53:14 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58e9551dsm7403958b6e.11.2026.08.03.14.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 14:53:13 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: kvm-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	andybnac@gmail.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v5 1/3] riscv: vector: refactor riscv_v_start_kernel_context
Date: Mon,  3 Aug 2026 16:52:40 -0500
Message-ID: <20260803215250.824417-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803215250.824417-1-tchiu@tenstorrent.com>
References: <20260803215250.824417-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_145315_202911_261ED65B 
X-CRM114-Status: GOOD (  11.17  )
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

Refactor riscv_v_start_kernel_context() to drop `is_nested` variable and
simplify the logic.

This introduces no functional change and works as a preparatory patch for
the kernel-mode vector fix.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
 arch/riscv/kernel/kernel_mode_vector.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 99972a48e86b..307ac369c3d4 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -121,7 +121,7 @@ static int riscv_v_stop_kernel_context(void)
 	return 0;
 }
 
-static int riscv_v_start_kernel_context(bool *is_nested)
+static int riscv_v_start_kernel_context(void)
 {
 	struct __riscv_v_ext_state *kvstate, *uvstate;
 
@@ -131,7 +131,6 @@ static int riscv_v_start_kernel_context(bool *is_nested)
 
 	if (riscv_preempt_v_started(current)) {
 		WARN_ON(riscv_v_ctx_get_depth() == 0);
-		*is_nested = true;
 		get_cpu_vector_context();
 		if (riscv_preempt_v_dirty(current)) {
 			__riscv_v_vstate_save(kvstate, kvstate->datap);
@@ -148,6 +147,7 @@ static int riscv_v_start_kernel_context(bool *is_nested)
 		__riscv_v_vstate_save(uvstate, uvstate->datap);
 	}
 	riscv_preempt_v_clear_dirty(current);
+	riscv_v_vstate_set_restore(current, task_pt_regs(current));
 	return 0;
 }
 
@@ -187,7 +187,7 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs)
 	}
 }
 #else
-#define riscv_v_start_kernel_context(nested)	(-ENOENT)
+#define riscv_v_start_kernel_context()		(-ENOENT)
 #define riscv_v_stop_kernel_context()		(-ENOENT)
 #endif /* CONFIG_RISCV_ISA_V_PREEMPTIVE */
 
@@ -206,20 +206,16 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs)
  */
 void kernel_vector_begin(void)
 {
-	bool nested = false;
-
 	if (WARN_ON(!(has_vector() || has_xtheadvector())))
 		return;
 
 	BUG_ON(!may_use_simd());
 
-	if (riscv_v_start_kernel_context(&nested)) {
+	if (riscv_v_start_kernel_context()) {
 		get_cpu_vector_context();
 		riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
-	}
-
-	if (!nested)
 		riscv_v_vstate_set_restore(current, task_pt_regs(current));
+	}
 
 	riscv_v_enable();
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
