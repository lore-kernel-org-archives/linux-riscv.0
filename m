Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A7DD17159
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 02:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G9LawshEgGECAB7BBSg+rr5kZDt9hXm5iCKZOa6q5sk=; b=BJGBmE8LJTI7ai
	d/otIssufbA3GZ6HmgJZSen3igFJtonolGZx+VING6WY84EP2VkCg+xnMmBoHxzkh7xBwsN2xuulP
	uf7PZasK368AoovzjKkFkzrp7KjrUjGVnnbt8QRlExR/LFHp8tM5dJuHiW2iJOm8ktJF8IFTB5by6
	WQ8XHIkRWiDkBY2KhzrvJlspYgyMqEjNNovH0tmEZol3NJrM1yJTu6UKUPzXLc9wnBuv2DYIrXqpV
	EtPI+nypZsZ1y+jIsZ8yRAqb+RpsFy3/tRM4iwjBU8lLx8ErEMmCJ8rY3X/Lk3R+ke9yzX8SaXCl9
	iFzXyGMQj5lK3zKqLi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t34HY-00000009HTe-39xN;
	Tue, 22 Oct 2024 02:06:00 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t34BC-00000009Fpg-1xB3
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 01:59:30 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-28854674160so2183061fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 18:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562365; x=1730167165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpfVj+cCklKKT0meu9E3X+82meKkLqCR+uZsOKWdYis=;
        b=jCEEWbD+pBmj/uOGMfuv0a8K+j5ICzpIS/uqQ4INYdwT0THATDzH7LS5pxNOjUQ56N
         IQ6T5Bt+YHECRommxvBNb4LDuG0/MZf41725nhVzjLYYUQkTO/StNcRGeo7NkVhJpa0+
         O7KWdhWuF6C+Ny9apF3XliwXeqgyE/alSPu/kAYPbv2B1YrJV+GOt26a/NLVy/xT9R1v
         4DiylQKiKV7dR+HqwPfbfc74RvkztHQAXm6Cnfptmv10ywShAqtzxWAFcv6JypRuM3VK
         4jaAw95CvOAMAHka9KqevNcu9mIpFIUHY+fEU0+Jk8jw4rUxLFIEXrkhsPD7mAQvK6xu
         LP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562365; x=1730167165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpfVj+cCklKKT0meu9E3X+82meKkLqCR+uZsOKWdYis=;
        b=iFK7t5UBPhv3nklopbLWWVcCfd3TQ4Oo6Tfkjy3q3U3WdQeBLkj1UGMnj40oeNOfrG
         gYAhDUBKpvYsGjm1kbaYjiA/dp4QRJzYsmSTb4xXJJfYQaNuHl5AxESCPvLzFYTTD9xa
         hcdeSN+7vU5/aaGsm7lpwjSxEAkQw9EOLKrWTdK9JPjErbIbn7DqehOpe8Rhk5wGAcX2
         rr6rDNsZAn+wG+5z6YB8KJEz4ZcCDwkJQoKe57gemxmIZmy0M73G3cNDThdycoBHRhqr
         CREsZTAVMdJVLgplGGdopGebUn556Q/Lz2uJan05fw7CWHp4W4Z0ijdY6wSMLdGaMkmm
         n/5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUk1JJTde03ss0CTNx2Qq2Z0XdA+u+bwQJY7D0ThSYBY9Qo1aXgw7q8S7+TYJ0CuYVT+iBTMJur0TkN/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdN9uTT6aaRa4SnCj10/y4GxP3/QXaQ9efZgSUTh8cTT09edfY
	LWaAJek5qHYEyRjc79BED7QOxwhCb5IGXVqs5DTmXHHUMMo+fq2egD1bTjko+So=
X-Google-Smtp-Source: AGHT+IF8mODh9IAJs797PRe4iXy3b/dNIvInfpWpmRrPkiuy4gHecBRUAsqzv6T0/gnC7v7yNiNl4Q==
X-Received: by 2002:a05:6870:148f:b0:27b:61df:2160 with SMTP id 586e51a60fabf-28cb010575fmr1017968fac.31.1729562365145;
        Mon, 21 Oct 2024 18:59:25 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:24 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 5/9] riscv: mm: Log potential KASAN shadow alias
Date: Mon, 21 Oct 2024 18:57:13 -0700
Message-ID: <20241022015913.3524425-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_185926_721151_7EF59601 
X-CRM114-Status: GOOD (  11.73  )
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

When KASAN is enabled, shadow memory is allocated and mapped for all
legitimate kernel addresses, but not for the entire address space. As a
result, the kernel can fault when accessing a shadow address computed
from a bogus pointer. This can be confusing, because the shadow address
computed for (e.g.) NULL looks nothing like a NULL pointer. To assist
debugging, if the faulting address might be the result of a KASAN shadow
memory address computation, report the range of original memory
addresses that would map to the faulting address.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 arch/riscv/mm/fault.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index a9f2b4af8f3f..dae1131221b7 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -8,6 +8,7 @@
 
 
 #include <linux/mm.h>
+#include <linux/kasan.h>
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
 #include <linux/perf_event.h>
@@ -30,6 +31,8 @@ static void die_kernel_fault(const char *msg, unsigned long addr,
 	pr_alert("Unable to handle kernel %s at virtual address " REG_FMT "\n", msg,
 		addr);
 
+	kasan_non_canonical_hook(addr);
+
 	bust_spinlocks(0);
 	die(regs, "Oops");
 	make_task_dead(SIGKILL);
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
