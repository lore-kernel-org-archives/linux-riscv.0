Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D66DCEBF88
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 03:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHEArWi1LFkCIU/EShDwen/4/vCOfGRwwNf0rhc4duo=; b=gwJyLRKQqOUAgX
	bhYcXl4CjkJmYZ4nSMtetQ6UhvfyGCKVGlJ4XmJ3Njx16Tof1hFWXUywPMgZy5msM44qXk+zBPMCU
	Qvi5jLiXL+WZV/MDeEjwNbSA9kBhblz1RvfVtCdzWPyav7ccuMiSJ7hvDcQxL6XeN37yTQ32BdWTY
	AZXTjELSnbes0zhS/pcP0jNIfHi+zip8hXZk+NxjPG3RYopei7NEH2Ib2OUvJePFRyaic9EYgHG4q
	nmUaJwLAYdYvU+kkLNrtvUiIyqAklFbfCex0rojty8tJCOPkGMY3YQNPObWnAHbeFk2aON2Ha4kWM
	pyJeSxCW5xQ23RHn6Qsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSSGX-0000000CXnx-0joI;
	Mon, 08 Dec 2025 03:50:25 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSSGU-0000000CXna-3J8d
	for linux-riscv@lists.infradead.org;
	Mon, 08 Dec 2025 03:50:23 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-297dd95ffe4so35830455ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 07 Dec 2025 19:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1765165822; x=1765770622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQt8uoJWMBYj/YlVtM/kz+RuiqvE92xrlYMKIfu5C3o=;
        b=Wz756RRyQ1ByPftC4ehpaXD9sQW02xZ5ihVVyuJhmKwaIrZDY8Bq+7GNic8F3wMGCF
         PHyCt7NBnaMZzKcnAbsUgKU76J9ag3LkkaKfKANgRRt1XTRHQb2SFcMKzI9aDU62Vmj4
         1VzVXWDLl7eduu9SLflNWcvUSSHTT4ocBFXuuZ44yAPB4bSL7WZVS4boO3Rm/xN3Adut
         tbCtNpaPWOUxtOlELRJHaGAr9Xm5I9KM/UdwqoKRmGmMf3aYIvfyZ+pM9QRE9eYbQz7S
         TceLF3vGhce5INzKlWvHFRo9YNPRwMvNYxTi/IVAiLaqSN5p6x872W7NHo3ArcAqH9OO
         IL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765165822; x=1765770622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HQt8uoJWMBYj/YlVtM/kz+RuiqvE92xrlYMKIfu5C3o=;
        b=SEyblqt/GhRoakheVnW5Ru68Li8YUKuKRGkVkMcrhvKrtdNy2hgSx4Ude/CXxMNZ6w
         ncM2V4g/snPBKUuDMfwNp+v4T3od03eudJBerXWVkQ5+CHaEr1wbtXhs0HUL9MiuaXdO
         vuYHsjhuUQIQmnSDXrVKKDNbr+osSCu5iepxwvKJ/I53WYR1TDsZrrk+SmPjx/r8wpyT
         bUEcU25D3ARNRWsedTmsb1CMqbZZvBkjhJOOBQdBr9r5mb0uVwkf8eliTa1AjHIy7C2V
         niQUsoR4fzxA8KwF/xRNcLmtPMvY2+k/AeXkxQSVw7S4OtobSi96c/5FMYDhhQCpTqyx
         IA9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoqHlNnHQAnkyWTvmMEdJ37Jyay+OAZ2h88A71j17hu1t47hvi83mYG/MKtjWQwQDwI3ENswfCychsmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzALd1zFzRxyM00seR312pSJ8TtEuVRAt6cbusNpjR9OBrXfRW2
	7dkSLeL2J1Nb2k4N10WD6ghJrxDCrHbgB2Xap1AvNT75Xu6tRGYAK47ilgFLBl4aXzA=
X-Gm-Gg: ASbGnct3mXrfz1/dCZg3SoQOqE3+8T58pkRFd42YYF+b1kLt4/i5PJyyTD8fq+XvVpj
	So8aw/SD2LDSAz5cnjaaB0jWeGaEhSuAYdBQP9H/L9g1+RGSwVGtnN6GYfrbRUMvnraQ88TLRKT
	2ztk4EZpe3/8eLkY8kQ6Goa7t5pfrLNQy+PT6/qko1mYPgtfG+ZMvB3Bu7Jqetk4lM3Xy7w6DTl
	sePWcBC4XUuULdyOrYVpTdvQxCYYIrVskP0B5EwR5y2pu0s7u7BjNOnSJ++VtLNle26UIglEv3V
	t05QJJwzB/sGaNoWYlbkwTOIIBkUH/X2Y6JB/qyivSjCzfL+rpH5Ymgb37U7PjGe6IkQ0MZxuUG
	0z69SQwDGeDJiM29pqHfl7fbBpwSdX7oqklW/u3R7b6wZ1M2YiOTr0MyVtKTfsUWt+6/KHAvBYL
	OsuAy8/vrUgIYwJ5ThBEv8ruK17W8VEd0Zwkx/H1FUXDQn
X-Google-Smtp-Source: AGHT+IG6fRjq+lmQBsuqNIpVk2L76QYaDW/Ee1RxLF8vMbBYaZ5Umod8j+UA/guL3/HnA5D4KRUWHA==
X-Received: by 2002:a17:903:2cb:b0:296:3f23:b910 with SMTP id d9443c01a7336-29df579eb0cmr58912355ad.9.1765165821912;
        Sun, 07 Dec 2025 19:50:21 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae6d96sm108871275ad.102.2025.12.07.19.50.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 07 Dec 2025 19:50:21 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andii@kernel.org,
	andybnac@gmail.com,
	apatel@ventanamicro.com,
	ast@kernel.org,
	ben.dooks@codethink.co.uk,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	charlie@rivosinc.com,
	cl@gentwo.org,
	conor.dooley@microchip.com,
	cuiyunhui@bytedance.com,
	cyrilbur@tenstorrent.com,
	daniel@iogearbox.net,
	debug@rivosinc.com,
	dennis@kernel.org,
	eddyz87@gmail.com,
	haoluo@google.com,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux@rasmusvillemoes.dk,
	martin.lau@linux.dev,
	palmer@dabbelt.com,
	pjw@kernel.org,
	puranjay@kernel.org,
	pulehui@huawei.com,
	ruanjinjie@huawei.com,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	sdf@fomichev.me,
	song@kernel.org,
	tglx@linutronix.de,
	tj@kernel.org,
	thuth@redhat.com,
	yonghong.song@linux.dev,
	yury.norov@gmail.com,
	zong.li@sifive.com
Subject: [PATCH v2 1/3] riscv: remove irqflags.h inclusion in asm/bitops.h
Date: Mon,  8 Dec 2025 11:49:42 +0800
Message-Id: <20251208034944.73113-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251208034944.73113-1-cuiyunhui@bytedance.com>
References: <20251208034944.73113-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_195022_841669_D5397B05 
X-CRM114-Status: UNSURE (   8.41  )
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

The arch/riscv/include/asm/bitops.h does not functionally require
including /linux/irqflags.h. Additionally, adding
arch/riscv/include/asm/percpu.h causes a circular inclusion:
kernel/bounds.c
->include/linux/log2.h
->include/linux/bitops.h
->arch/riscv/include/asm/bitops.h
->include/linux/irqflags.h
->include/linux/find.h
->return val ? __ffs(val) : size;
->arch/riscv/include/asm/bitops.h

The compilation log is as follows:
CC      kernel/bounds.s
In file included from ./include/linux/bitmap.h:11,
               from ./include/linux/cpumask.h:12,
               from ./arch/riscv/include/asm/processor.h:55,
               from ./arch/riscv/include/asm/thread_info.h:42,
               from ./include/linux/thread_info.h:60,
               from ./include/asm-generic/preempt.h:5,
               from ./arch/riscv/include/generated/asm/preempt.h:1,
               from ./include/linux/preempt.h:79,
               from ./arch/riscv/include/asm/percpu.h:8,
               from ./include/linux/irqflags.h:19,
               from ./arch/riscv/include/asm/bitops.h:14,
               from ./include/linux/bitops.h:68,
               from ./include/linux/log2.h:12,
               from kernel/bounds.c:13:
./include/linux/find.h: In function 'find_next_bit':
./include/linux/find.h:66:30: error: implicit declaration of function '__ffs' [-Wimplicit-function-declaration]
   66 |                 return val ? __ffs(val) : size;
      |                              ^~~~~

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/bitops.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index 238092125c118..3c1a15be54d80 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -11,7 +11,6 @@
 #endif /* _LINUX_BITOPS_H */
 
 #include <linux/compiler.h>
-#include <linux/irqflags.h>
 #include <asm/barrier.h>
 #include <asm/bitsperlong.h>
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
