Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED602C4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 22:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wihAL48mzw+K+/RXXjwa+0Zim3G+Dy0HI4dYTulfC8g=; b=WBmK75O5mcZXhnjSBxYXyGoLFo
	TAAN9VZaYOJoJ/0XERmhpRLd6uQ0Ni+84lQWHr462iBajpZlBiK6Hp6ysvTPikYG9nTUBxYkeWf20
	C8hqUAxlp1SQrvcqf6lfHTyAyTyRLsJ9rG8vYhnRs/ojoXY6KQ3TRG8b+OYBekyqVSSKCF5DMkGDR
	zV3m6BncBjVRgn23QcWxF7tc5um4GnC2akQlni9BDj8cH40R59wTEdNdWwyPLEwrd8o6InSV80oIi
	ZkSzhcTXaM3ARR0lQzGbdevrQJnOdElZJ7lao3fCyBzNex4zOzad0HYyHvoO2Oz/U/zWgt5an7djU
	hYoLu18g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra1Rh-0000000B6pw-3NOA;
	Tue, 13 Feb 2024 22:40:09 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra1Rf-0000000B6oY-0vTY
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 22:40:08 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-604832bcbd0so105980307b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 14:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707864006; x=1708468806; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RC2T9SgmWwA0L5LQ8BYxxpjFIKV4b3AtrMRzB+GqR24=;
        b=0ioaq77lcDglXjpVvTYA9qYTLn9S5v8dzv5i/qrd3UrNEp0OQHVqDRBCiXkqWayzWG
         uwTNJL1DJcIZQ3rxwcPUQ5JTn7DiX+AQA/54d0fIvfqzxGEJHxeP8svrOL/NZehcA6n6
         zkvWFwok6gXbV96PwbBxpI5VZxJC2F2Wtl78ngstrLDwG/HzF1BmiOyZZodqcMpg6jQH
         ccAS0SFuFSb4avQCiz1YvFpJzIN7TzLYS9q2ISKJMTio+UXDsk3OCBqaRyWmnGUpqsVK
         JjDWs+8VY4G6/Q29H1DkNx4cvtzY8PP725HxMDlHl+OjycB/NpzZTz6o6e1pbJTBbC11
         DGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707864006; x=1708468806;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RC2T9SgmWwA0L5LQ8BYxxpjFIKV4b3AtrMRzB+GqR24=;
        b=p+NtVYIl2pOxvc5T675be1pHf6u0x7D9aZyTYz+zqeAUUW9HdqKPGSvfp1U4cuyUZC
         jiXQ+fL7j6Mp995lSiWYfhKH8pjA7LQ7XjAAMSY7FWDJl1RFDI3IowljYM6smeay4jn6
         gV844/2fBSRNhjTaaJbTjdDM/bqprVyXO5gVfPguWZw+VLZ5OIm0FtGlwiIXE+WXR5L6
         wB4Bt3vsZtxWW6UK1dhnWhRuBafdI/F1B/nbka2NtgZctun8F+KibVvqo39ypI5xLAXt
         J891JdEO0mTTnOLW1GJb+m2nbb26Vbyz6bjNuailVtfpFxq7C78EQGnPg0MZGzpB8cIk
         Fnkw==
X-Gm-Message-State: AOJu0Yz0/fB/7+KMjkm59e547nfGxwoihUp2o9I6EnyNeq+zCbfJCCzm
	LA3eDsEzNj/TJ6IjlrA0QtKTASjleFwEb4u6vrePkbiCWY6QSknwwEv/gIK7pOJA9p0kANdQNtM
	pfkV+ssknQGsznX0V9w==
X-Google-Smtp-Source: AGHT+IFspyNz8AOxJhdBQBLPS6L7jDJPIOEu9cDDZN8mFfZR975IQ17DOmZb+TMd+r0yCCes1icpgAHegnssHbv/
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a05:6902:114d:b0:dc6:d2c8:6e50 with
 SMTP id p13-20020a056902114d00b00dc6d2c86e50mr105619ybu.7.1707864006063; Tue,
 13 Feb 2024 14:40:06 -0800 (PST)
Date: Tue, 13 Feb 2024 22:40:00 +0000
In-Reply-To: <20240213223810.2595804-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20240213223810.2595804-1-ericchancf@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213224000.2597959-1-ericchancf@google.com>
Subject: [PATCH v5 4/4] riscv/barrier: Resolve checkpatch.pl error
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_144007_319974_0321452F 
X-CRM114-Status: UNSURE (   9.37  )
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
