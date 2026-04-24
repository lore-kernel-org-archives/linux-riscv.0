Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8711EFB44BB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 06:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gIkM1d+5MNuJnjz9Nj8bsIBfjnV2dyCoio/PzgnuHFw=; b=HMKrRr3wYiMn9X
	VHvXCgYIhNazbQnhO/PqtbPoHP6aTTSzBhMlXYIWkyauTnk1mwMipXbU+NBjA0mcF4Imp58cDkI1T
	wdKakEDTeyl2L8zAqIQxUXXA1LNbgUDuGwmtNGyhU4wZCw0wDGWcV3kTt8DhX5lPnhBvkR6DxYWTX
	kiQDxXDbUkEacRzSomjrxAM4ioKYmCKBUffv1wuvXiegI94mSPKeM0HURaufZCKjqWkPDcMFgOoZ0
	/NU/dB3NWrwX2RHy0I8gXQPJiUrzrWQ8dYNPnDqw/65SFcZElfaJXz3pF1U0ZLxShzqhZBmqrPvxv
	WJBGlN+6QLzre+if4OUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAS3-0000000Ckg7-44AZ;
	Fri, 24 Apr 2026 06:55:47 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAS1-0000000Ckfk-2sfP
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 06:55:46 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-12c19d23b19so9711213c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Apr 2026 23:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1777013744; x=1777618544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wlChXpy0nN0oSk3hgPhIo49rDQ+oIcHvjI/gnEjTyQ4=;
        b=MZAw4pMVzGqvFmHXrek9m1BzJbCl1dg50AjsGo/dOdCEDrRx2HPglwjkWlmG1YN0/+
         z/pEDK1QBf6ynT0iYE7FR2jL71U/XYEhF2H5SGrhLpQAlRN67ZU2XltwJ6oXPYYOkLIh
         ghC9wyUI/BNgGQ1cwiRzHVaWzDDGUnOagzTRrU2fCvc2uEGqkpI066TWnmJgKWd8QCkk
         QgskZHoF3n+x5yMxySlx34HNMh9eRHFWCLGPOFdMQ503YlsEmI6L/qJhd3yGz4Ez1f/q
         JcPhUJ3gRqPj+kpfSaSF/77bb8Qx/fkQfeqbTOy90EfU9pDy4FB48mP9Iw9H+R11f/35
         UQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777013744; x=1777618544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlChXpy0nN0oSk3hgPhIo49rDQ+oIcHvjI/gnEjTyQ4=;
        b=sEzF7VEUBWhpy41fyt+kuWV6Dv43p9GKYaZkoDuDhgfx5CQIbdorlkKmulx3BrZyZ9
         Ile1WZ2+K+ZnId1QsKqzYwj+79lwvkUGVEgTGCh+VLhKPl+Duyw5V7EZEoJLoEA+5nYR
         Sf/sCPRSkIVeqEkMyTN1rYkL5MSztmw6HAOInV2l9GuRpKdKVGjAXodPROafMy49hJaE
         MMCkC1GCWAu67oH/jbfuvHM7mAdbQpWyDEUtgJhwmKUQM85VfabvYiiyZeNUI97wMfPu
         16CxX0s+xq5CvWR+WOcjZxghCveBE72ibngqfUGLyiP51STkPRw4uDiFl6x+SxVxSo/1
         nfNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8r0YPJmrUT2U59PToxYN10Un6X6R5dhkjulclfEUEjmNLwiZtlxcoBpC9K3axE94I47eGpkoPhWKYFbA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9t02VMwdFE7pYm/rCcsoXR3lVVkRjPN0OAU4fME4lexufZRLw
	9ZP2CGS/kYqYJuNP8ZHPCTlKVcNoSzc0MiX1l/ffKsJEmHwjmwZ3cXhrahUgkrsRhFE=
X-Gm-Gg: AeBDiev7jJhmO1qeZOGSEoi7uIIISdg/QeXOvhjIR5lGG8Pv/GkU6A5R5ZWzKf0vW+y
	hVjiaOP4cO6no26Raf9etPDnPs1fPORhr6Du9A8sLmjCVGDbXx+rurZhxMQ6CjgKmonkT2S8qkl
	Y2MoVgyzDXdlW2L48rmW11ZvH1yO7Gz//6YcgRuF0SgnJLUwcjjKn5w8cLpaCcQ3wthWUHwkH8v
	JNwbD/OulXkel98lfCKGvgWorBraxlyOcL1yEG62fkc6BH6osOk4bbd8Eem2ebKu+2ssQCNEXkR
	hl8G3/AxqDQYZ8xDwOVTIjv0loGZ0lh5ufkYFtOqvh+i7TJam03ZGukadnmkFA1YonifVFEMNDg
	JlbVjP1iYDcbs0FaHQleIIpMAuJ9JmkBmEEIOtu/E3TpLWWAulFUiJO4s4eTikCKrkWCt5jWMBs
	L46hW7hOjKXQ330+cuOuyFc9M5FiIw/mlMbus9xQrKQbTMzaxjvVymFFYH
X-Received: by 2002:a05:7022:79e:b0:12b:ec15:69d3 with SMTP id a92af1059eb24-12c73f99c8amr16945900c88.19.1777013744478;
        Thu, 23 Apr 2026 23:55:44 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm39271101c88.14.2026.04.23.23.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 23:55:43 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	debug@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH] riscv: cif: reduce shadow stack size limit from 4GB to 2GB
Date: Thu, 23 Apr 2026 23:55:40 -0700
Message-ID: <20260424065540.3480755-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_235545_742000_D1ED882C 
X-CRM114-Status: GOOD (  12.00  )
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

Follow the ARM64 GCS (Guarded Control Stack) implementation approach
by reducing the shadow stack size allocation from min(RLIMIT_STACK, 4GB)
to min(RLIMIT_STACK/2, 2GB). see commit '506496bcbb42 "arm64/gcs: Ensure
that new threads have a GCS")'

Rationale:

1. Shadow stacks only store return addresses (8 bytes per entry), not
   local variables, function parameters, or saved registers. A 2GB
   shadow stack is far more than sufficient for any practical
   application, even with extremely deep recursion. Using half the size
   maintains adequate while being more resource-efficient margin

2. On memory-constrained systems (e.g., platforms with only 4GB of
   physical memory, which is a common configuration), allocating 4GB
   of virtual address space for shadow stack per process/thread can
   lead to virtual memory allocation failures when the overcommit mode
   is set to OVERCOMMIT_GUESS or OVERCOMMIT_NEVER:
   Error: "__vm_enough_memory: not enough memory for the allocation"

This reduces virtual address space consumption by 50% while maintaining
more than adequate space for return address storage.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/kernel/usercfi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 6eaa0d94fdfe..4a48dd28d113 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -109,15 +109,16 @@ void set_indir_lp_lock(struct task_struct *task, bool lock)
 	task->thread_info.user_cfi_state.ufcfi_locked = lock;
 }
 /*
- * If size is 0, then to be compatible with regular stack we want it to be as big as
- * regular stack. Else PAGE_ALIGN it and return back
+ * The shadow stack only stores the return address and not any variables
+ * this should be more than sufficient for most applications.
+ * Else PAGE_ALIGN it and return back
  */
 static unsigned long calc_shstk_size(unsigned long size)
 {
 	if (size)
 		return PAGE_ALIGN(size);
 
-	return PAGE_ALIGN(min_t(unsigned long long, rlimit(RLIMIT_STACK), SZ_4G));
+	return PAGE_ALIGN(min_t(unsigned long long, rlimit(RLIMIT_STACK) / 2, SZ_2G));
 }
 
 /*
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
