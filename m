Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9D1C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=51qao2Xhqd0CKJt0s0+9dbr+BUH1r4Kg9vt7hqfIT50=; b=oUE58kl4cx8JqHjK04cqR/2b7W
	eJF6pYy1Nu9fTfW1FwTNpuEV0SKQSGwrEZiZdwp5FsBsQOnCVLDgnqOJ2orA9hlSirdLpLv8sGhPK
	XvN6KuFt1csOPOXa4CwoV4kh6wZ+ih8cJcOeS2GtAQZsolt5Nkq4ltmZSHtlB+Wsk/odJq/uNHpkj
	4A/teO3tAlQ7JQKs2j0n9Xhpz357CvxbGCHK7jAPRBd004KmL5/CdAyr5J1SW+9nSoU9TLac5lATM
	XaKDeYlIP7Dm6ay0M21JdWNfho/fqYvNDdoLBvMdHXH7o/lQuUyLow2O0ZeNnF3CghSsHXGGfTuRK
	4YqyUL5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtn8-00000009W46-0Q6M;
	Tue, 13 Feb 2024 14:29:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtmX-00000009Vuy-0QTj
	for linux-riscv@bombadil.infradead.org;
	Tue, 13 Feb 2024 14:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eGMdDRwTTa13t5SlPIuZSJHa36hYXdnKoaK7iYV4TM8=; b=mlp9aYrhUBqMlF/5BjXBgBUaFS
	QCh+rur6YnfI0kRy0vQ7Lh2KGj12Yr0AdrZ4jQaXfyz7jcfjK4s//G1i1wpBhsMf4Iw+mJCIxoKEh
	3dka0UeMAxRSFX8jUncYxnyka0TwSZj3PWpMDt2MkmQ+QdwdBMuqvewLpdAZ1oSh7+uCrO2pSMlos
	WG7ln2uxcyKJ/qE1EfIHRGk2jar3REWhpEJKfZfbqy1pGz5X+2uKMPb2hxr1TN0+CWUv4d55sYxr2
	KF7oPeu/xz7y+A044Nz7zZA3o5Mqch1TnNJqHS3yVMOva7bv+A+ZHi/tKq2Wek7yWZpPdQWVocmbC
	He05yttw==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtmT-0000000Fm62-3S3z
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 14:29:07 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-60753c3fab9so24957717b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 06:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707834542; x=1708439342; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGMdDRwTTa13t5SlPIuZSJHa36hYXdnKoaK7iYV4TM8=;
        b=MeEuQ57deraAv5+28QawUWBqei9zqWjdoOO1Oxp2UCiR5S6Ndl+f2j4jW1SbvMf9Ry
         pY6IEeTTsqoiBobd/51ayKiB1jGxJnBBdQCvJOlXJ1j/JsLil9w5WIIewPPfZWtMirtw
         /m0hMZejSohzp9NhSm6ecOrJM/GsUidDJ6uyYsrFXg75MafV35W0qPemCU/6MaJlh4RV
         UGslFCIZBjnu0uBDLvnqVOaOKsHaYZgN2ATmvRwv/IxYPyf66saUAoPQzYCVUX2gRTIO
         +DagDfyrbjB3Grb0v14GMNBXFZ+wojKCJ9THsfbHUaEcC/76R9L0XA1+fo8mdilIvXtC
         BKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834542; x=1708439342;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGMdDRwTTa13t5SlPIuZSJHa36hYXdnKoaK7iYV4TM8=;
        b=qObJLQKlqaQ3O4hFCwMWsOF5/AHcvsNUicmvBAvoBX8nsLMldlQIYC/lQ748Gz4RKc
         gpJNZTJ4w7eh5we3BgfzgjHVAkAr4hmS77X9TyP/uhP64LsUroXPQoRgNNSW6Vv7TAS+
         OCFJRIrrPf6XhjAdk8Ddc/9yi0ECdMhvoAqpnf2uW+oRsD4JiQ7QrenmN4f32rN4kbgK
         7mV9uEpvbVnWoSxbHnBOFA7B2IXvzjWpkzKt+6uKDzSl3naV623w8etGWCs0ufp1kcL7
         2oQyojQVMclvjYlwbtL96QRFQmoJzvrpwBmlLMRScpu3Ig8HNS+A9/IChskL3/IZqwqx
         6H0A==
X-Gm-Message-State: AOJu0YyzvnHzc9OAf8bzv2nxIb1NBmDFzKs1SAAQgLKDG+BC/t5EFXXT
	IRhWFozXi14EUmOm+AjAHSNMlOK6GdQP20mfibEqaJ55O3J4LN9fKpzRMCkUpdeUEmVLPbFlQqP
	llwG4VywaV/Z0QVIELw==
X-Google-Smtp-Source: AGHT+IEjRJkAWZBtGKgOvWcIgZrlfSHYWUmdK6a6QAGG5yPvxwXI45ku3lc1Z4IJzt1ZqVxJm+1omyh4oxPsoQYL
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a81:920c:0:b0:5ff:6ec3:b8da with SMTP
 id j12-20020a81920c000000b005ff6ec3b8damr564874ywg.1.1707834542765; Tue, 13
 Feb 2024 06:29:02 -0800 (PST)
Date: Tue, 13 Feb 2024 14:28:56 +0000
In-Reply-To: <20240213142632.2415127-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20240213142632.2415127-1-ericchancf@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213142856.2416073-1-ericchancf@google.com>
Subject: [PATCH v3 1/4] riscv/barrier: Define __{mb,rmb,wmb}
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_142906_188280_F7659274 
X-CRM114-Status: UNSURE (   8.49  )
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

Introduce __{mb,rmb,wmb}, and rely on the generic definitions
for {mb,rmb,wmb}.
Although KCSAN is not yet support,
it can be made more consistent with generic instrumentation.

Signed-off-by: Eric Chan <ericchancf@google.com>
---
 arch/riscv/include/asm/barrier.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 110752594228..4c49a8ff2c68 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -20,9 +20,9 @@
 	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
 
 /* These barriers need to enforce ordering on both devices or memory. */
-#define mb()		RISCV_FENCE(iorw,iorw)
-#define rmb()		RISCV_FENCE(ir,ir)
-#define wmb()		RISCV_FENCE(ow,ow)
+#define __mb()		RISCV_FENCE(iorw,iorw)
+#define __rmb()		RISCV_FENCE(ir,ir)
+#define __wmb()		RISCV_FENCE(ow,ow)
 
 /* These barriers do not need to enforce ordering on devices, just memory. */
 #define __smp_mb()	RISCV_FENCE(rw,rw)
-- 
2.43.0.687.g38aa6559b0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
