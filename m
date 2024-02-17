Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593EDC48BC4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 13:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dGxGRjn33XraXRl5w6qBP7qBD52MAPQTm8xa9R0lJmU=; b=ntGSBYBjTjxHKUn+1LYZrYCCuI
	XlQRqMQThecSuMKLN7kv4oL+rMQ1Mojr+R5qj716J3prBquKXQSwEjhGdofSI/i7fLOFWSo8Qz9nS
	JcpteALg0/zob6Yc0/DjIzUVmYUeolZ+8K+JhFlK6/+VPMSuIi7Pbnog473pnHt9H3UhH6FEuY4Z1
	PaplUfjx+xMeu8s5kn72CzGmWpYfLeuqhSYt9yCfM4zWnnm7oMKL48fiRnBwjM8GhUZXV98LysUC2
	MjvnjySN4jSbthTvCBEpJcd09fOBxKuKvqvhiZiX0r3zkZhxPk49d68OBS2XvI0pE5jYfi8LAOvFB
	FmqOQWQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKVg-00000005iTa-3pYu;
	Sat, 17 Feb 2024 13:13:40 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKVc-00000005iQP-1S9r
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 13:13:39 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2993035cd15so1581390a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Feb 2024 05:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708175614; x=1708780414; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lyeLrRd9CLe7Hw11wYIs8TpWMeWxDTUtralQA0dQ0yM=;
        b=Mpu+niJBRBRd6qeemZwO+Eq3ma8OUgh4FMGwMx+X+ZaFMbHv6IVnDebIMPQT1jh/00
         mk0vthFDsJ01ojHdw0EoG7qyyvmyHl2fyvidhVYQgoKme2Leamsk8Vd4x/kBVruGz3/8
         PE1b11PGKe6MyVILjtiQaVP8o3T5OVspC6ghKkd12fhs0yxSsVQVwonF0gnTHb65CC5J
         1KhG7GEidBpDAuBVJcMSXJtMMyhG/EtNnZ2FO9crULFzoxK88Gs40/imWsf4kpw6Btqk
         qKoR4L6cMYE8OGHl9yfOzeDzMlT1CLMU4ripEoC1CJmbrCp/iWTpCuYlvO4vmF8r2kk5
         qfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708175614; x=1708780414;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lyeLrRd9CLe7Hw11wYIs8TpWMeWxDTUtralQA0dQ0yM=;
        b=DlqO/gczxs8i5ky6HoATzhQtu4aGxjpPuGHYDE5QByRL6BL5vFZyMhzJGrX0VNSvOy
         wXu/OnqFm70H4WEhx51TjA1wz4udy56PCApL67pglBwhj7o9nPCe5EaodK5i6/fuZ6VO
         lUHCpRtVTePeAhxLqw7UnVejEnoVuzm4vYWEODGUoeXVB5EMRb7vi9GZqdVkN1C6r2sm
         qpgFpz2KlJPuuLHP6HYLOFfyPo5Sp594N2vLv0KA/ETYc/1FDomF52OvzkwpSpsjgIDP
         8kMAGfUXS8jpdTwb2f2rr6ZBV7jQQ5fwUpGnNyzc+b13fIihd3QQg1JkG/hDBhrj6Gg7
         ctjQ==
X-Gm-Message-State: AOJu0YxaXQgjEqsola5j4bSTvB2GOjET0c0QweN8DvymWbA+gFQVCZsP
	oMMCkwQDzce8393Z7Eq7NqOfVOZ+++8lEEtZqJBg2+LnI+YrXKZhzGAFZr0qXYfiqrLnZC+aS84
	RBR/+jnSHL2NpdzdbzQ==
X-Google-Smtp-Source: AGHT+IGcUSK2w2TzNdsgkFOUkK1bgKsf9p0KE7Ve3nXJ/cAI8GO3AnK/s3oB+wJsI9lmgIka5VRKg+dZ3U/FZtlY
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a17:90b:3a4e:b0:298:eacc:658d with SMTP
 id oh14-20020a17090b3a4e00b00298eacc658dmr99799pjb.3.1708175614576; Sat, 17
 Feb 2024 05:13:34 -0800 (PST)
Date: Sat, 17 Feb 2024 13:13:28 +0000
In-Reply-To: <20240217131206.3667544-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20240217131206.3667544-1-ericchancf@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240217131328.3669364-1-ericchancf@google.com>
Subject: [PATCH v6 4/4] riscv/barrier: Add missing space after ','
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com, conor.dooley@microchip.com, parri.andrea@gmail.com, 
	emil.renner.berthing@canonical.com, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_051336_504730_8DABF0C2 
X-CRM114-Status: GOOD (  11.10  )
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
26: FILE: arch/riscv/include/asm/barrier.h:27:
+#define __smp_mb()         RISCV_FENCE(rw,rw)
                                          ^
fix the remaining of RISCV_FENCE.

Signed-off-by: Eric Chan <ericchancf@google.com>
---
v5 -> v6: change the error message example in commit message to make it
more relevant

 arch/riscv/include/asm/barrier.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 15857dbc2279..880b56d8480d 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -24,14 +24,14 @@
 #define __wmb()		RISCV_FENCE(ow, ow)

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
2.44.0.rc0.258.g7320e95886-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
