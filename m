Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2AFC48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 20:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OaRLZJw0zaU4CEZoO8KF2WxjGxLt6jT3dWXyrBSlaes=; b=ZlMIDJhpcLpbLe3bJuo4x0CtbL
	ihe6i4VEG9TscQpZJdS/w2LmbqoSxUrYvjNmeiXHSQfXyrUf7y2YzTjN8210EZOMI3nNIvkNU/DMH
	IoZunsS79jknTWT1N8VfcmUhBmkb4t/w/AgW1ENmkrdbB2i3W/8qpf3A5B1+YOLxz1CbqjdvXGmcW
	KlsZKzXGkWSv/7LNo/DGGGVejx7th0cVyW6G2RSmyN2eIG2gHUcUr45sESZETX4kKrehff8UnyiC+
	wcv/M+48yKRYwZoJ5ewl/nhTXNljkFF3UpuabeldY92awvs4uUd1zq7JTCM+zkeNxuubPCsdct9ui
	e/0cuY3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZz8p-0000000Aag4-34DY;
	Tue, 13 Feb 2024 20:12:31 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZz8m-0000000AadE-3Otm
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 20:12:30 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-60790eb0f8fso14436767b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 12:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707855147; x=1708459947; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RC2T9SgmWwA0L5LQ8BYxxpjFIKV4b3AtrMRzB+GqR24=;
        b=LoCsCNJbqWqGQxaK1/HuXTzgsVOoYkUfNJIqX8vD7oA4rjqb4dfEcI5q+jHJmMMscg
         zJhQAk2K4xvaA9CAfSFaKmgKcTNYFuzmi6ZtQULQSnYDN50SS+MzeH6qDYci9w3HFOSV
         8yIL8zfR82pnfUsUwlZzYxhogEPe1ge+IUVd0x1+dU1G2xw+G4wsI1p6dYYVks7gTJ60
         FKhdd0qTcl8+5LCwmLaIN8bnummy66TV7xqzi/JGPSlKy/wUHdssIsGh8zw4VBJrkfnN
         Aym2U5SfXXSXCQMQY5ePXaLs3c/dz7UEbQLiibV0GfOZlBLTgoFd16YbcwyH7KxzhN+v
         8K4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707855147; x=1708459947;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RC2T9SgmWwA0L5LQ8BYxxpjFIKV4b3AtrMRzB+GqR24=;
        b=jC/9e0K6KETp3MX5vR7nAOtuhMULGIUU2Qp9DCsA0B2lrKbcRS7mBL/NXJXem4iD8u
         mmsKTdql+Ez4n2gPHd3TikcC9J/BNGQHcvFKvRQUDVAbzldUEkbmDOO2zK/f2t+pevbp
         ndjO79BBzEdSsnbX3myAD3j8oLWBZ6MQ1f1Ekueb0cs7IeKs2oRN5IqhU0WuYskEd43W
         VjJER1uIj+BcjUGeZG/Am9vkXq6jJ+frznLI/Akcqo4cdwCdQxv9lwLaYeJ2qUXmP/E4
         kEcCHQ5dQK6/tcDY+ZwJxwqjvI/cIuhlJPVgYc15DhGCaVhu3+LODM5uellFkGab0Mj3
         1sAQ==
X-Gm-Message-State: AOJu0YzmkvmHQuiT3m2Q3dGBGzS6HWpClQNjLJQxFWsnbLbT+FxwDNbV
	gI98yb0fcTFzFa6ops9nHYzy6s7evrFoWoagHAmRHrTy2SDxoY2E3VqJ+aWdTwkXA2C3UXmvK8Y
	uHHBarGSmKPr0zGhhfA==
X-Google-Smtp-Source: AGHT+IH3IQ/mT0lIUZt3b8aZuEy7cWkvdU0smiGeBheUVDNMUPfGxC78Td9jrmYMFkkzwF7GIe3mlZek3QW6+7nr
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a0d:d752:0:b0:5ff:6623:be27 with SMTP
 id z79-20020a0dd752000000b005ff6623be27mr93462ywd.3.1707855147567; Tue, 13
 Feb 2024 12:12:27 -0800 (PST)
Date: Tue, 13 Feb 2024 20:12:21 +0000
In-Reply-To: <20240213200923.2547570-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20240213200923.2547570-1-ericchancf@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213201221.2549924-1-ericchancf@google.com>
Subject: [PATCH v4 4/4] riscv/barrier: Resolve checkpatch.pl error
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_121228_934395_F8DE62F8 
X-CRM114-Status: UNSURE (   9.47  )
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

The past form of RISCV_FENCE would cause checkpatch.pl to issue
error messages, the example is as follows:
ERROR: space required after that ',' (ctx:VxV)
+#define __atomic_acquire_fence()       RISCV_FENCE(r,rw)
                                                     ^
fix the remaining of RISCV_FENCE.

Signed-off-by: Eric Chan <ericchancf@google.com>
---
 arch/riscv/include/asm/barrier.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 4f4743d7440d..880b56d8480d 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -19,19 +19,19 @@


 /* These barriers need to enforce ordering on both devices or memory. */
-#define __mb()		RISCV_FENCE(iorw,iorw)
-#define __rmb()		RISCV_FENCE(ir,ir)
-#define __wmb()		RISCV_FENCE(ow,ow)
+#define __mb()		RISCV_FENCE(iorw, iorw)
+#define __rmb()		RISCV_FENCE(ir, ir)
+#define __wmb()		RISCV_FENCE(ow, ow)

 /* These barriers do not need to enforce ordering on devices, just memory. */
-#define __smp_mb()	RISCV_FENCE(rw,rw)
-#define __smp_rmb()	RISCV_FENCE(r,r)
-#define __smp_wmb()	RISCV_FENCE(w,w)
+#define __smp_mb()	RISCV_FENCE(rw, rw)
+#define __smp_rmb()	RISCV_FENCE(r, r)
+#define __smp_wmb()	RISCV_FENCE(w, w)

 #define __smp_store_release(p, v)					\
 do {									\
 	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(rw,w);						\
+	RISCV_FENCE(rw, w);						\
 	WRITE_ONCE(*p, v);						\
 } while (0)

@@ -39,7 +39,7 @@ do {									\
 ({									\
 	typeof(*p) ___p1 = READ_ONCE(*p);				\
 	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(r,rw);						\
+	RISCV_FENCE(r, rw);						\
 	___p1;								\
 })

@@ -68,7 +68,7 @@ do {									\
  * instances the scheduler pairs this with an mb(), so nothing is necessary on
  * the new hart.
  */
-#define smp_mb__after_spinlock()	RISCV_FENCE(iorw,iorw)
+#define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)

 #include <asm-generic/barrier.h>

--
2.43.0.687.g38aa6559b0-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
