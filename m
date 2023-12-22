Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC537C46CD4
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 07:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZSlH7+ulBLaHhcNIbQiwPJ4j9ORU7RyiqHWZdOKpWfQ=; b=e1bcy3fCrl+MEQ
	4OlglaPXepz8Cn3ZAG+S2HjyfHeBE3NAeSuS35/HXnyXmr0up6R3BwBm/DqvfUIHIdrmqqkQ99VQC
	BlELg/vvFhdC0Ksval/+iHhYiQbbAiGZTL+7iqlFtcwyAf1s2URvGqKwwobElHhgqHzjM1dyr6CjP
	K23TmFukjscP914YI2e+YI6C6u0crRUPvx9kL7w6FJ7zwQX7K8ybeuZBwRklzXeMI0ii1jm/6NwEQ
	5zITNOlFc5BpJUXcrz339BvZhmuGialpx3a1EGcRarzb7zrJJHJqjK1LalsPZAHmiV6TapvXvtImG
	2gMccU1n5Ik3KMvStQ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGaF6-005DFi-05;
	Fri, 22 Dec 2023 07:46:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGaF3-005DEO-2z
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 07:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703231205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fChu8SySxAk9bR4FCWD8rViiukJB4FWPqrqCbBPM0wY=;
	b=JkclaATlqcDTBMl3lET/EcIBS0BqVnmX764h8/53EVuTGRhYDzmKirkp44P8uWYGmBRvHV
	32rABgyuocvKtRV/BaGvKqOhO2fuHfyoFaNZBTmFpIuUZWIcHTxJpSGOWDWCRE21h+5pBq
	CbrZTL2nY37orpLLcLfEgnLchS+x/vo=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-j7NxmmnhOtOnKzEVaRSsFQ-1; Fri, 22 Dec 2023 02:46:43 -0500
X-MC-Unique: j7NxmmnhOtOnKzEVaRSsFQ-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3b9fe1a9f16so1729913b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 23:46:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703231202; x=1703836002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fChu8SySxAk9bR4FCWD8rViiukJB4FWPqrqCbBPM0wY=;
        b=iKDJh/8+5l5jV6OEAM7nxa9X35I9N2HDJe/WmZKA501hbN9GKhBc+71lhins7OfPEt
         LLMQqXrMiSKXnVCTmIKaMdBrR2B45RyfDVDjJdaDeDgb/Co9Q7KNUJnJruhL6xSVtscs
         Wgsrsmoz5exmyKYBwAFx+a4wgWThZJi8Eojqsx/2lA0OVa+ERfw9r1sUpWxzTn0L2iSs
         SE3/IfitEmtG55I3zklhE8oUmhm95xUBrjgh7ZYKSLAyfyjYVCB2RYUnNbCiGa/T8U1Y
         kH7twAeAQPxn8UfVTX3GjD+8DPjwDJvvU1YSmQQ6bjyiaoMXzwdtqwF5g5HaXGkAYDnx
         mp+g==
X-Gm-Message-State: AOJu0Yyzcy4o3tPTjn94gBjWoeyBRuZ5b/4GtIfKb3nBXrvf0j2PC5ca
	iDS5EIR19K2PmQCuYpBJVlwuMgOxiArJPuJJV2WBeNJot32bUqvF8iJhTBahpzRmLOvt1HXLmkh
	82lirjszhdqIM643Ap9E6PyJLIFz97x9QGM80
X-Received: by 2002:a05:6808:199e:b0:3af:9838:8494 with SMTP id bj30-20020a056808199e00b003af98388494mr1174160oib.20.1703231202607;
        Thu, 21 Dec 2023 23:46:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfty2NP0/+vK/Z37DtQxU8NTNsz0hOUOMzPkaafOkXIkbGg41CPwcD8fDjKPqNGVFT8AzCRw==
X-Received: by 2002:a05:6808:199e:b0:3af:9838:8494 with SMTP id bj30-20020a056808199e00b003af98388494mr1174135oib.20.1703231202376;
        Thu, 21 Dec 2023 23:46:42 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id m2-20020a62f202000000b006d97eaba6cesm1527015pfh.21.2023.12.21.23.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 23:46:41 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greg Ungerer <gerg@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 2/4] riscv: add compile-time test into is_compat_task()
Date: Fri, 22 Dec 2023 04:46:02 -0300
Message-ID: <20231222074605.452452-3-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222074605.452452-1-leobras@redhat.com>
References: <20231222074605.452452-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_234646_038249_7E600B4F 
X-CRM114-Status: GOOD (  18.30  )
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

Currently several places will test for CONFIG_COMPAT before testing
is_compat_task(), probably in order to avoid a run-time test into the task
structure.

Since is_compat_task() is an inlined function, it would be helpful to add a
compile-time test of CONFIG_COMPAT, making sure it always returns zero when
the option is not enabled during the kernel build.

With this, the compiler is able to understand in build-time that
is_compat_task() will always return 0, and optimize-out some of the extra
code introduced by the option.

This will also allow removing a lot #ifdefs that were introduced, and make
the code more clean.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/compat.h    | 3 +++
 arch/riscv/include/asm/elf.h       | 4 ----
 arch/riscv/include/asm/pgtable.h   | 6 ------
 arch/riscv/include/asm/processor.h | 4 ++--
 4 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/compat.h b/arch/riscv/include/asm/compat.h
index 2ac955b51148f..91517b51b8e27 100644
--- a/arch/riscv/include/asm/compat.h
+++ b/arch/riscv/include/asm/compat.h
@@ -14,6 +14,9 @@
 
 static inline int is_compat_task(void)
 {
+	if (!IS_ENABLED(CONFIG_COMPAT))
+		return 0;
+
 	return test_thread_flag(TIF_32BIT);
 }
 
diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 59a08367fddd7..2e88257cafaea 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -53,13 +53,9 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
 #define ELF_ET_DYN_BASE		((DEFAULT_MAP_WINDOW / 3) * 2)
 
 #ifdef CONFIG_64BIT
-#ifdef CONFIG_COMPAT
 #define STACK_RND_MASK		(is_compat_task() ? \
 				 0x7ff >> (PAGE_SHIFT - 12) : \
 				 0x3ffff >> (PAGE_SHIFT - 12))
-#else
-#define STACK_RND_MASK		(0x3ffff >> (PAGE_SHIFT - 12))
-#endif
 #endif
 
 /*
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 1d472b31e0cfe..ea5b269be223a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -127,16 +127,10 @@
 #define VA_USER_SV48 (UL(1) << (VA_BITS_SV48 - 1))
 #define VA_USER_SV57 (UL(1) << (VA_BITS_SV57 - 1))
 
-#ifdef CONFIG_COMPAT
 #define MMAP_VA_BITS_64 ((VA_BITS >= VA_BITS_SV48) ? VA_BITS_SV48 : VA_BITS)
 #define MMAP_MIN_VA_BITS_64 (VA_BITS_SV39)
 #define MMAP_VA_BITS (is_compat_task() ? VA_BITS_SV32 : MMAP_VA_BITS_64)
 #define MMAP_MIN_VA_BITS (is_compat_task() ? VA_BITS_SV32 : MMAP_MIN_VA_BITS_64)
-#else
-#define MMAP_VA_BITS ((VA_BITS >= VA_BITS_SV48) ? VA_BITS_SV48 : VA_BITS)
-#define MMAP_MIN_VA_BITS (VA_BITS_SV39)
-#endif /* CONFIG_COMPAT */
-
 #else
 #include <asm/pgtable-32.h>
 #endif /* CONFIG_64BIT */
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f19f861cda549..ed32e53e55999 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -22,7 +22,7 @@
 ({								\
 	unsigned long mmap_end;					\
 	typeof(addr) _addr = (addr);				\
-	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
+	if ((_addr) == 0 || is_compat_task())			\
 		mmap_end = STACK_TOP_MAX;			\
 	else if ((_addr) >= VA_USER_SV57)			\
 		mmap_end = STACK_TOP_MAX;			\
@@ -39,7 +39,7 @@
 	typeof(addr) _addr = (addr);				\
 	typeof(base) _base = (base);				\
 	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
-	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
+	if ((_addr) == 0 || is_compat_task())			\
 		mmap_base = (_base);				\
 	else if (((_addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57)) \
 		mmap_base = VA_USER_SV57 - rnd_gap;		\
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
