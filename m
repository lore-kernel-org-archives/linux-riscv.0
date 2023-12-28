Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D17C3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 03:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VuxgBAQ0Hk5aEKIhFp3BB9sNxx0o7Srp2WUpTaYhReM=; b=CnfORkTnstksfP
	0/00HIkG6/nsttmP2wZaAwcLyjyH9+t7ZDXXWUHEuTT+PmLBn0XTD8YrC4k77ffmJr5LS8XuM741o
	zIL9pCj6tgIh5135Z5VavRWMMLRqyrDvKo/SZXqMMnRVjGbil/dYa1ucsWSdgIZhCTD5klYuMNUkT
	MvoOg0nm+fid3wzQuim3ImKG7xmCqK2Hy09RNosYaBHxQ85qbDL7gIM6ZHfAwlg1eBbUaxkCBeKCf
	O50DDbRO2UuetJAoAcq2jdYJTk3qOjh/y+L1vcDtMFqGgC9svDJnC7VYW8OK6daiVg7UB5Aq/F/UD
	aqC9TrXdgYtTEaWcMqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIhL7-00G3Oj-0D;
	Thu, 28 Dec 2023 03:45:45 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfPs-00Frph-2X
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 01:42:38 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3bbce1202ebso337409b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 17:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727751; x=1704332551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+RheApEuJN9kaaLRvICyPNbTjOVIvY5kEzb7DbTZjA=;
        b=gYq0zGHBDiwWm+J5Ja7/TOhF7zN1DqO8hhpKANKzIMxAjehe4zdaMKJD7qWNjhnxHT
         qzDQMnoiye7lG/OhlHcaB2zdqwIDy91eel4ZxSKonAsxNUx0J/+EiG5rHghtYL/8tGqe
         dyNIkRS7l66fgaU92FJrkbJjQlj+CL9EOOCMpAGmSGFVny2vgSz/obcEZ4YJX29TDQN+
         Q7kihQp0VX+akE/M4/j8kt4PM5MABOX1zgL8nCWAoArG5bmE16kdJxj02O86rLa6MUnK
         GVNZWfGum4J+mv1STRv2PZPVeDxE4gxwSe/BqBPJBejpwW+HlcSmpLRl9yRUEvwT4zVE
         L7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727751; x=1704332551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+RheApEuJN9kaaLRvICyPNbTjOVIvY5kEzb7DbTZjA=;
        b=EyWzzaEWW2mALz8kBTLSlIWdVW5338xWAxvHvXum0zV4HfQI/7hkH19FtRc7BrqRay
         USJXThOu5etfmUDQ5Ltm4pnJ1aVSkZG9zgQsIVkfB9O3NLrYF5A/BMRyyjnSxAkn0x9C
         yy2cxkLW2cQSrxqPUtOFs9IOKNAUMfJ886EM5QpsQYNZcc9Rtuy9eDJvoMI+9ZsImp/R
         bYqBNGG/0PssnfgFs+N4opDiJuXLgYzTHCnvuR6l4flpGo0lXyJC3CgLK3Il6bqnqT37
         MjiR6ewzRCa1qk0X1xQirLWCLX3xjJ6PiJ4JrHpo3r62RgRvrlGR3a2YSY4JRX5n9VLh
         Ld3w==
X-Gm-Message-State: AOJu0YwFT2yXAynoCcU8RGqiF8ez1EvYgaVZOhmulVYmfMAElG8NhRSE
	qyu/jIhcqqhvJXJLHbyrdVIaiMitFwlTmA==
X-Google-Smtp-Source: AGHT+IFlYg0OgNqHd1istrtt2UTcBedE87vqCIVNtp3f0Z5ptnzM2zYPRY9OCADmqV6QIO1pVX8ZnQ==
X-Received: by 2002:a05:6808:6544:b0:3bb:b063:1afe with SMTP id fn4-20020a056808654400b003bbb0631afemr7698441oib.113.1703727751522;
        Wed, 27 Dec 2023 17:42:31 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:31 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v2 07/14] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Dec 2023 17:41:57 -0800
Message-ID: <20231228014220.3562640-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_174232_833070_FF2507A3 
X-CRM114-Status: GOOD (  10.54  )
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

LoongArch already provides kernel_fpu_begin() and kernel_fpu_end() in
asm/fpu.h, so it only needs to add kernel_fpu_available() and export
the CFLAGS adjustments.

Acked-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/loongarch/Kconfig           | 1 +
 arch/loongarch/Makefile          | 5 ++++-
 arch/loongarch/include/asm/fpu.h | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index ee123820a476..65d4475565b8 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -15,6 +15,7 @@ config LOONGARCH
 	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if CPU_HAS_FPU
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 4ba8d67ddb09..1afe28feaba5 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -25,6 +25,9 @@ endif
 32bit-emul		= elf32loongarch
 64bit-emul		= elf64loongarch
 
+CC_FLAGS_FPU		:= -mfpu=64
+CC_FLAGS_NO_FPU		:= -msoft-float
+
 ifdef CONFIG_DYNAMIC_FTRACE
 KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
 CC_FLAGS_FTRACE := -fpatchable-function-entry=2
@@ -46,7 +49,7 @@ ld-emul			= $(64bit-emul)
 cflags-y		+= -mabi=lp64s
 endif
 
-cflags-y			+= -pipe -msoft-float
+cflags-y			+= -pipe $(CC_FLAGS_NO_FPU)
 LDFLAGS_vmlinux			+= -static -n -nostdlib
 
 # When the assembler supports explicit relocation hint, we must use it.
diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/asm/fpu.h
index c2d8962fda00..3177674228f8 100644
--- a/arch/loongarch/include/asm/fpu.h
+++ b/arch/loongarch/include/asm/fpu.h
@@ -21,6 +21,7 @@
 
 struct sigcontext;
 
+#define kernel_fpu_available() cpu_has_fpu
 extern void kernel_fpu_begin(void);
 extern void kernel_fpu_end(void);
 
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
