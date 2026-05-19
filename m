Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F600CD4F3C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 07:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5UYGGEk25RtrXwTVD7uBz0mip8JAJ4mOl8xDGzrPqD0=; b=bAIKbSHBr5OIP1
	qvClmS6h7ivm6DlEos6r7QZKoHSgOBP0qHN1WOc+fxtuadVZ+EpVrGsgWekB+qtPjOIJHerfm/M1u
	3B3meG7KZTq7+dPo1xL2PoXFY+2hOe4rMgaA/sJXfOLKEKj6n51I9EJElWWC7/80x6UO43LGQjLH7
	QGNcRAT9/U0pgUiu4YuzLlGgIOA6CeNPautmf98nUjBVQgQ8Et0WB24V/aF/2qZ7xkoov0jMhbGDv
	BCLwRcBeCmEeJXI4zU7gBuXa164Jzr3yFzQ8cSh3qTbroaYnGElz10RBEXOCgbgduFih+FuSzXVvs
	IXhgAZDI7YPnSTUkaGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEf3-00000000S9n-487W;
	Tue, 19 May 2026 07:14:41 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEf2-00000000S9I-0ZhQ
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 07:14:41 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-3025d725a05so9018258eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 00:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779174879; x=1779779679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/v832jg02T0+h3BQvkKwAzJW+pkS6A9rgEMY10zaHwM=;
        b=E4vnBF5NGdN5iCoFEMOJsrol13Teu3V1gOn92+nmgwKkfKuHZGVd5Icx7gO91lZulW
         WqVlBzHU7OKD78Jf85Q6VFyZBM9gqJSGKvgaM6VEEGg9+an8HU8ChAN+0iB5Zl01azEx
         6WYl0uktkEMcaxBieaBzQA/zlImsYvzU+db3u3aMkOg5/okhtLJQ166ShY119JPU+b2m
         kG1ZdJgQjuj6aqG8byEMl77Z3BvSzPlhl4P2VAkNfSsZxAUIrRxDrXF/uNlJfGgCMBrB
         nrT50Qt6+vrPIUiobknu9Q1Vok4mBxcuR8/0uCumFbuEnr1y1avzG0FUwd/FTzr3Cogy
         8ZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779174879; x=1779779679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/v832jg02T0+h3BQvkKwAzJW+pkS6A9rgEMY10zaHwM=;
        b=XJA72kyPwRHORBUi5ABclYQaOyX2liHDcNpHYdNKLKOhhqcluIfxyHxEz9KHD6SueM
         LELlfMZ4IxevFHUVaafHN8nJuO/XicM8c8exjwNrH8V0vuThS3KMwlS5OgLDMKp1xmkf
         WOAECAqp+LrwdZ6dNmAFqDaybKCkwSbLZdNAzigfsWjAN/XHYPkjhqee4dElznpcfxUU
         BmsdzMSkubc479+Ebztdq/sYjo281w6MTMx9N2/oLl20nULiuH/qrxYE2M/BBZbvoAPH
         KReitL/g2vlySLdWQJWVRlIIctc/R7uRtgTTYT/RWINB1DsmUMKZQ7qHySwx2JqQnAq1
         GnIw==
X-Forwarded-Encrypted: i=1; AFNElJ/0RnHmAhVJExhVvnBTaWaodIgtgFRoD12tRTEiMVOe0XKPckBUyRW0W8KHFEjP7MAorMf5HQFnTIHsIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFvFS/mFaGtMce9d9VPTr3a0Vx+qitu55I0LwqN7dM7zwPDB7D
	bs6h6MQTekTjW0cpv6aqYCcZhCv7X4DA/Ck92AzUGtOw9jtAAYmhagAZ95ofc3k0NQX0RDjiV+U
	r4ebwT/NGwg==
X-Gm-Gg: Acq92OFflJ20baMGzoNWIY5t7wKqEGuao5qryeuR+oP/GZqvBjCkfJ5DTWE+yfT2h7A
	YEw7iVIS735tsE4t9xzEz/PzEjai1kmA0dOPQBtsGyOQW5jWg0qgZhfWwA8waIxpn0aysqdrSc3
	r5mp5v18NTbg1FzVhHurJtkAJcFUzuB9I8EM3g2gNnxTNsjmjYuCxhnM3xXu4gb26+BsfJ556i5
	EGmbLCGTyRgG4CVGddErlTY45Ha8y41JCZwGC0VHv7T1gkjfSev5fSh22GxmU5EPHsTZUzzb9QM
	5VJfXqNByHq4fCEryujpnmrcJ5GdYVKsgfbcoKWntCV6QvnC69OFKA8c5jHnQpQ7MWXbh+d7gzU
	UZcmX2FyuBMm5VypC1Hoiez3LtTA2jSs4BJRbzYKyQfK/3D6WwEVhVfudJCH4lFdekadwkIuWnQ
	88n34gxYg4UZpSVqkOkpD29B45md4sYXx3AfI=
X-Received: by 2002:a05:7301:169b:b0:2d9:32c8:2b69 with SMTP id 5a478bee46e88-3039865fe40mr7744836eec.28.1779174879153;
        Tue, 19 May 2026 00:14:39 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294500726sm14733801eec.10.2026.05.19.00.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:14:38 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	debug@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v4] riscv: cif: reduce shadow stack size limit from 4GB to 2GB
Date: Tue, 19 May 2026 00:14:36 -0700
Message-ID: <20260519071436.3821558-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_001440_173987_733CB6A2 
X-CRM114-Status: GOOD (  12.98  )
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

Rationale:

1. Shadow stacks only store return addresses (8 bytes per entry), not
   local variables, function parameters, or saved registers. A 512MB
   shadow stack is far more than sufficient for any practical
   application, even with extremely deep recursion. This size
   maintains adequate while being more resource-efficient margin

2. On memory-constrained systems (e.g., platforms with only 4GB of
   physical memory, which is a common configuration), allocating 4GB
   of virtual address space for shadow stack per process/thread can
   lead to virtual memory allocation failures when the overcommit mode
   is set to OVERCOMMIT_GUESS or OVERCOMMIT_NEVER:
   Error: "__vm_enough_memory: not enough memory for the allocation"

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---

Changed in v3:
- Remove max(). PAGE_ALIGN() already rounds up
- Change stack size to RLIMIT_STACK/8 with SZ_512M cap. Suggested by David Laight

Changed in v2:
- Add max() in case RLIMIT_STACK is smaller than PAGE_SIZE. Suggested by
  Paul Walmsley and Sashiko

Changed in v1:
- Use min() instead of min_t(). Suggested by David Laight

 arch/riscv/kernel/usercfi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 6eaa0d94fdfe..2036918a77db 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -109,15 +109,15 @@ void set_indir_lp_lock(struct task_struct *task, bool lock)
 	task->thread_info.user_cfi_state.ufcfi_locked = lock;
 }
 /*
- * If size is 0, then to be compatible with regular stack we want it to be as big as
- * regular stack. Else PAGE_ALIGN it and return back
+ * The shadow stack only stores the return address and not any variables
+ * 512M should be more than sufficient for most applications.
  */
 static unsigned long calc_shstk_size(unsigned long size)
 {
 	if (size)
 		return PAGE_ALIGN(size);
 
-	return PAGE_ALIGN(min_t(unsigned long long, rlimit(RLIMIT_STACK), SZ_4G));
+	return PAGE_ALIGN(min(rlimit(RLIMIT_STACK) / 8, SZ_512M));
 }
 
 /*
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
