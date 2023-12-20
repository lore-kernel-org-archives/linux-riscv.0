Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B76BC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mNOBbO7xrYr2T9RMrIwKTLd1cTYaaD7MQ/3o8ZQzrKc=; b=ro8+5u3/amf/bG
	qkazG787x+lv/qZlKIAdR7QLW2OUPaewqPy92d0I7toj1+ctHOb/4smig6g3/5GLPBjSrla9r0nta
	5pn0TbUoRyET985G3ZAYNKDL4BfoIxRfjo0Cr6xEui6RpygbOGVIWTG4ZQi+1+RXyAK+nfTnI0plT
	irMBsWOP346Hx4odT8AgKE6Pq6gBdURJ3v/JPuIA+hFZmai+nDwZyggdNr5zsqU9tQ3WX9i1Yl434
	nOcVtj/JkKOa+7Mb+KaRI9WXyX64vZTKDDv5ZrYfI4fkUYlYQ4/qBlNDPKdoZq/yN0hMrJJoPTZZK
	zT9vgS4SQYPSXPGCpWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtuV-00GwZq-06;
	Wed, 20 Dec 2023 10:34:43 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtuR-00GwYd-1h
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 10:34:41 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d3f8af8297so197835ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 02:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1703068477; x=1703673277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFWsnBzn58gm3ZPzcT2FNSYLm3tXrViiUU3720enkpQ=;
        b=j2l7x3PT7AswNXTKhW0iJxSJIbxrnQATf7KvFntbAwIsKM9FAzNoyzU2bdpVS3cQDR
         k/w1Uw3gDXPXEyZIdqnjbgh8GeW7oAD1pLHOKUbCOwZqN8TcoLK6GnC67775fTGyNWS2
         NhqIGEmRBl+aySb35gsrVImKxhhvze9EU5G/kVJLPI7jVnsT91awwO/kYaet2sdxgD/+
         9Yu1JTa1kvf2HXskW09z+WZ97b4I35MOxz7j8OmU7NGQP1Pyh2SF3cdZ8NfM+l4+0meE
         k2qyt/w+R4TIqcC774f/R3mgkYiefVYiRqiIcUCqMoek+jkzFCW8ty6BENcbq94FpZSY
         fuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703068477; x=1703673277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFWsnBzn58gm3ZPzcT2FNSYLm3tXrViiUU3720enkpQ=;
        b=XncqKfrkSKLAuHelap8qkA+NNZPyAhZbL+TqbRPMN03q5e5nnrF+zGYceey9oAcyy7
         OzUbGu2oU2eqSRAQ+pE933fMOjYci5jYXn64Ioir59xfqPctfLyEuNlIGCgrec3vy2CH
         I9xSO+YX4iPUtuzzmh0g3gSsWt5lfTfkSfEB/CG7dMdQjOcjcKZDTxJtxfuu2pUH+yN7
         3ghafRfi+y9hIKUKXL5D737XyJc+SMHnyR+pAaDvM10HErBBsWtq0teQRJGIdXodM+7a
         1QM++YrhequLvOg595XcOgOKufPQpxoLKDFlmlEzGakcdpZp1/bAavzDm1dLURWZvSGm
         a72Q==
X-Gm-Message-State: AOJu0Yy4+EL27buaLNH8euCOo5s62i99A+1BhMoVduI98ltVBYU8M/Ya
	s9S1dDSPdbymKq7eGa3zYdUXFQ==
X-Google-Smtp-Source: AGHT+IHO+ozw4UTv/+0I7mcW0/b1xzuABhT5sLWUu3zVP2een7tUqoHLOb8TRg7oPfm7mfmUlOEPog==
X-Received: by 2002:a17:903:904:b0:1d3:7c0b:d4ca with SMTP id ll4-20020a170903090400b001d37c0bd4camr6996259plb.73.1703068477268;
        Wed, 20 Dec 2023 02:34:37 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id c16-20020a170903235000b001d337b8c0b2sm15525089plh.7.2023.12.20.02.34.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 20 Dec 2023 02:34:36 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	anup@brainfault.org,
	samitolvanen@google.com,
	rppt@kernel.org,
	panqinglin2020@iscas.ac.cn,
	cuiyunhui@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: put va_kernel_xip_pa_offset into CONFIG_XIP_KERNEL
Date: Wed, 20 Dec 2023 18:34:28 +0800
Message-Id: <20231220103428.61758-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_023439_564213_597048D9 
X-CRM114-Status: UNSURE (   7.42  )
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

opitmize the kernel_mapping_pa_to_va() and kernel_mapping_va_to_pa().

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/page.h | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 5488ecc337b6..0d2b479d02cd 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -113,8 +113,8 @@ struct kernel_mapping {
 	unsigned long va_pa_offset;
 	/* Offset between kernel mapping virtual address and kernel load address */
 	unsigned long va_kernel_pa_offset;
-	unsigned long va_kernel_xip_pa_offset;
 #ifdef CONFIG_XIP_KERNEL
+	unsigned long va_kernel_xip_pa_offset;
 	uintptr_t xiprom;
 	uintptr_t xiprom_sz;
 #endif
@@ -134,12 +134,25 @@ extern phys_addr_t phys_ram_base;
 #else
 void *linear_mapping_pa_to_va(unsigned long x);
 #endif
-#define kernel_mapping_pa_to_va(y)	({					\
-	unsigned long _y = (unsigned long)(y);					\
-	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < phys_ram_base) ?			\
-		(void *)(_y + kernel_map.va_kernel_xip_pa_offset) :		\
-		(void *)(_y + kernel_map.va_kernel_pa_offset + XIP_OFFSET);	\
-	})
+
+#ifdef CONFIG_XIP_KERNEL
+#define kernel_mapping_pa_to_va(y)							\
+	(((unsigned long)(y) < phys_ram_base) ?						\
+		(void *)((unsigned long)(y) + kernel_map.va_kernel_xip_pa_offset) :	\
+		(void *)((unsigned long)(y) + kernel_map.va_kernel_pa_offset + XIP_OFFSET))
+
+#define kernel_mapping_va_to_pa(y)						\
+	(((unsigned long)(y) < kernel_map.virt_addr + XIP_OFFSET) ?		\
+		((unsigned long)(y) - kernel_map.va_kernel_xip_pa_offset) :	\
+		((unsigned long)(y) - kernel_map.va_kernel_pa_offset - XIP_OFFSET))
+#else
+#define kernel_mapping_pa_to_va(y)						\
+	((void *)((unsigned long)(y) + kernel_map.va_kernel_pa_offset + XIP_OFFSET))
+
+#define kernel_mapping_va_to_pa(y)						\
+	((unsigned long)(y) - kernel_map.va_kernel_pa_offset - XIP_OFFSET)
+#endif
+
 #define __pa_to_va_nodebug(x)		linear_mapping_pa_to_va(x)
 
 #ifndef CONFIG_DEBUG_VIRTUAL
@@ -147,12 +160,6 @@ void *linear_mapping_pa_to_va(unsigned long x);
 #else
 phys_addr_t linear_mapping_va_to_pa(unsigned long x);
 #endif
-#define kernel_mapping_va_to_pa(y) ({						\
-	unsigned long _y = (unsigned long)(y);					\
-	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ? \
-		(_y - kernel_map.va_kernel_xip_pa_offset) :			\
-		(_y - kernel_map.va_kernel_pa_offset - XIP_OFFSET);		\
-	})
 
 #define __va_to_pa_nodebug(x)	({						\
 	unsigned long _x = x;							\
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
