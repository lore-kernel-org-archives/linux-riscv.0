Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB9BC44501
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 17:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ExJunlPhywHKVUX9yJtu7/Q/uAyDA7rGOecM5cfOP3k=; b=0xdphZf5uyPLGD
	RVu7R7BK0bJ+UAE94ez86Pv+wdklvOiOdZmd60/MK1mApYKzZcL+VRCLFFDD0I6mIQOa3OcttRdBi
	ll5VOMIykGaZARE825lHzZi3gTAR/obOKi2uSgzrLDF5DntCI5cGR/AfXPe5RSJK3kCWUQTKTKuBB
	O9OKdhR4DsmqKJjKRmca0OU1+RWJut8tIF9fafXsKt/SpZCXeaMOqq8bqEwwhnbf24yE1eaQ/NiUa
	twalFf9j0J56yz8zNioi7AF+ii+qB82O/Ppp00lpIlXUY5q9JBXZSseB/8jtj5qLLMH6n+i1BV5ph
	fXb5hfOq9lpaqc8p6z/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVk0-000000003Jb-0LaL;
	Wed, 08 Jul 2026 17:07:20 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVjv-000000003Gl-3fYa
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 17:07:18 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8484f229529so468239b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jul 2026 10:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530435; x=1784135235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cm8S7fxMLu6TlkbuGaHjv8eWStidNKhc6ejgToCRJ4U=;
        b=SJrCH6FHDOmhq8BVv+KRcl6xJwVquH5oK1K+voZWOHKEc4+I1mH3mDkZRWf4alo4sE
         lZ4i14uQvqYOxhePLwm0zOt4j16fNEZVS8ysvEea8Ifxn0uwrsp66vrLfO1rPZEurNCF
         Rvnfndqb4VMKUDsiJyhNoduUDyxBLqquxHmI+I7PjjuBtbddAnnw719jipsbVA0K04X/
         z2AI7iuNNvGZi6dRzOjsy0GtDhUiWvL7HnCCb2q3AuihpQlnQhrDs11j9q24k8KK3rr6
         s3e9XRjGHTNXu3Sg+R4eeoMcA4Sku+ykIFrubnUO/j/OZ6aE9Ts8DskVCGdr4BvFpzMD
         MICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530435; x=1784135235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cm8S7fxMLu6TlkbuGaHjv8eWStidNKhc6ejgToCRJ4U=;
        b=qB8CE6if5ingvrw96WgeTWVyJeJExXboJT+TAPbAv4lqoGlLUaXF9Du4HBolZt4DKI
         BRhQc1Y4UldUtRrJV5japiy6MtIROAXNHZMc0UKHRvmuBtBKspQQltPj8KCzLAcvai6N
         YyUiwTyoJfiP4Iy2izH8PDyKFCXycKMmdGyUz0b9tB2tCy79svDylPl0s1tO2qqAzJK5
         hbyf0B0k7DX6uDbWW7u9ObR9TqGkUcQvN8PmC6gncHL2zEDElM8BiI173+9zgA7+M6UJ
         buUc3Iz4FJTMfz9j2ZjHx4quVLU5BywNUfLm/3BqT0JAOX1i5dXcWgW1cXuhPya8aZLf
         ihRA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+HWul263i/s7cUEtmD2l+MZtoRHb8iPQRylw9q5EqeDL9oSHz9mzMqvwa2+fjG+33uwEgqFQmpolnww==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys99LcrwPIbV8d6IBsuzDCO7dDFGADVCXp6oaXdzCGPweZC/Bq
	PzDdpLprHhf7z8leqmZD5BzOOYAnsP9pzZHxCNqWVbnzJilnpwB3w8Mj
X-Gm-Gg: AfdE7cnk2gFsjvs0AC8158m0YN/nwHr/0c0HfqE5UfU5DhGBDFizPD4HjBQtPZ+kpnY
	7x3WNp50Lodh+i1DqowA2veyJmJFlOvdOVOJ9Srcvt60klzxMxwr3KH+pPZLNOmFYlFsjBQustH
	Bs2kx0U3lsfFFMSir0KBFSP8wUdMLt4/beXSVAYWKxeHI9YF1/QRnd6JS0A0s5f97s7T37Y9wgJ
	LGmeJBnVI0bMzY9bznkcky0QfObZ0Xz+rdxUbUu/XOuVtHX+7Bi4iEnervKzDQWY3bnnxX8aE+/
	4z2r34CwsraTe14u8mBqV+ccc56mhlnaoU3m5jHr/4vYRkpyEJSzpTLNzpYo6scbP86qigOVSdL
	UfE5UmkvnxnIgYBZHGXD0JO6PqJuO9teB6MtRINDF12I9R9U0wrTqUGTWZuyAb4863CTL7VLzoE
	C+kzykVq5fLgpbvWltkw==
X-Received: by 2002:a05:6a00:6f0d:b0:848:438d:3665 with SMTP id d2e1a72fcca58-848438d3bb1mr2984905b3a.41.1783530435052;
        Wed, 08 Jul 2026 10:07:15 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm1119528b3a.22.2026.07.08.10.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:07:14 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: akpm@linux-foundation.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	David Hildenbrand <david@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] arm64: remove early_ioremap_reset() call and __late_* macros
Date: Thu,  9 Jul 2026 02:06:47 +0900
Message-ID: <20260708170647.362562-4-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708170647.362562-1-ekffu200098@gmail.com>
References: <20260708170647.362562-1-ekffu200098@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_100715_916871_BEB23B7D 
X-CRM114-Status: UNSURE (   9.90  )
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

On arm64, __early_set_fixmap(), __late_set_fixmap() and
__late_clear_fixmap() are all __set_fixmap(). Calling
early_ioremap_reset() changes nothing. So remove the call and the
macros.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/arm64/include/asm/fixmap.h | 3 ---
 arch/arm64/kernel/setup.c       | 2 --
 2 files changed, 5 deletions(-)

diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
index 65555284446e..abd9800aabf7 100644
--- a/arch/arm64/include/asm/fixmap.h
+++ b/arch/arm64/include/asm/fixmap.h
@@ -110,9 +110,6 @@ void __init early_fixmap_init(void);
 
 #define __early_set_fixmap __set_fixmap
 
-#define __late_set_fixmap __set_fixmap
-#define __late_clear_fixmap(idx) __set_fixmap((idx), 0, FIXMAP_PAGE_CLEAR)
-
 extern void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot);
 
 #include <asm-generic/fixmap.h>
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 23c05dc7a8f2..29c6100f0c50 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -347,8 +347,6 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 
 	request_standard_resources();
 
-	early_ioremap_reset();
-
 	if (acpi_disabled)
 		psci_dt_init();
 	else
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
