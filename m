Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34973C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 22:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6vzn3h93VGD2lm0Lfcd8S9aSRr8xZLjjRKja7g4x0HU=; b=iV5kkoHQsQ2TBswvXFjXsuACiN
	46NlB4NeU3yF3XvgdGwrpBprurvmlyxTVZ5L839Rjuv+sGY2tIBNuw8rkVLWIt1SkWGw68XWSUjUz
	xuCwEX3cVctW1aU19rNRAatof80apf32eVzanjFLiyGx6nUycWqNpva/0V+/2yOwwTukCBftLYy9C
	g7Tss4m0nPycZ3BboCpBdH3ob720cPgZbLN9d0aPm1hdV3aUd61iSDudcICHQzdgetKCqLAHF3leY
	rNUlTwsHl1tFjYqeH3oz1DAByWdwm+qkxqrhPPcgUbou3RM7APPmsx2zN+dLIzA0X1LLJubgn+uHj
	P26GCQ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra1Qx-0000000B6Xp-2Jzk;
	Tue, 13 Feb 2024 22:39:23 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra1Qs-0000000B6Vz-33Ui
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 22:39:20 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dcd94cc48a1so965571276.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 14:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707863957; x=1708468757; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f+XclenF7edwwSVr3OOR82CqqLoH3szu5C7L/BS0M2Y=;
        b=KmWkdOw7Yzl9jJdl6GBTLIwROuFfWrHSTNv3RdekAHLXH3ixUuBKhjv2/40LwKo+CZ
         mFyaH1PY1HQ9pjcJWDIxZzzHsURtSfXuahXm0wumBIhoupS/Zr5sVoAqrRZSY8tAo46d
         TWZ9p3dz+nNujxF1ZTNzDEzgXUbzFumd06xhZgE4vPVuGNFXctlZlCsUI+mgXwlkfy8J
         TgYZCS2xrIbCJBYttJewaPCmOUXtaYckGfoFb2DZNb6p6gtYhsXDqPJFC+0BjaGkOrSU
         bXVQM8lefRLflV8L/zPXyypzeJXwmgwu5RKG6udE3Cn7PUH5whYcwjnQxXvlQppfrp+j
         fVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707863957; x=1708468757;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+XclenF7edwwSVr3OOR82CqqLoH3szu5C7L/BS0M2Y=;
        b=ZP9diq8woxkbkZ9VxzDfpPYBbxq9RBKvsoyQhAePJfdliY8qT2Z0gJLOCnT2xaVB71
         6mfPj+SiGlNbuCqGxBEAQbRBqLe6FNYCgYYnJ01BaZUwfukX3E7RbTrdk7jmr6AFR3h8
         N3wxpKAP3kOy1111mLie8OxCnvFAHgImV7m25Bp7IvJ126Q7QBnmneIHgKv+a1tUD8ij
         jJULMoqWYHiu4/eCsVrGULCWF3MNu+4RBbgJ/4jA8hLxhIP7KshCPLrbVphf7FzlHbCM
         fRRtsLoh3POuLpfZ/ofH1BkbLWTdl5v9rwzSOEsChzO5htiZ3kCJQL64hKocEkXJgZbj
         6M7g==
X-Gm-Message-State: AOJu0YyYcX2LInOiT0FRWj7poXcyzF9RLhGS/ePWYsDcVfbPOKnOAWmm
	0AVWZz23bqkH7bGu4KM9v3H2l9yXeeDG94au/IJ3TpAdOEl3/Fd/cxxKUJNFtRwAxHcDAFgxZSV
	Bu9zPa3uh1CtbFGF4RA==
X-Google-Smtp-Source: AGHT+IEcc9zr27PaqvdbS3eM06FWNElPCCH1CI70az8q5NCXA70g8DXiOv+Y8BsNy6nYj39BxKXFXZimf3THa0dX
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a25:d842:0:b0:dc6:e8a7:fdba with SMTP
 id p63-20020a25d842000000b00dc6e8a7fdbamr161224ybg.4.1707863957363; Tue, 13
 Feb 2024 14:39:17 -0800 (PST)
Date: Tue, 13 Feb 2024 22:39:09 +0000
In-Reply-To: <20240213223810.2595804-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20240213223810.2595804-1-ericchancf@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213223909.2596587-1-ericchancf@google.com>
Subject: [PATCH v5 1/4] riscv/barrier: Define __{mb,rmb,wmb}
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_143918_870556_5FDCFD96 
X-CRM114-Status: UNSURE (   8.33  )
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

Introduce __{mb,rmb,wmb}, and rely on the generic definitions for
{mb,rmb,wmb}. Although KCSAN is not yet support, it can be made more
consistent with generic instrumentation.

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
