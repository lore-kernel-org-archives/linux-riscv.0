Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A434C27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 08:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3RtriPOaHwev1X9RT/YsOQzIwmTohgG2/MixUGSd4mU=; b=bPRZVvwuIl3LuY
	ACAvZmPdoAIsYBXeVTK/LkGGA7oIx42Wq6YhmNEIG/mHwo7Hakz9aYDHK/HGDHEQu8dT6rshyBKr2
	BQIysZRimIVyNsGflI3riHQqUItF/lLxgmGNRitJv0XC03FpxeobmK4KUjtFVj3mIE7A6D+AyKxiy
	QJPdmdwvGB6EMzsL9F/eJC36/BAvifOvkL7XFrBHi1TNkMf2+iOImwlNWRw5Dgh+6fFM3dA/1ECOV
	2mZBDJ4ra+npn1kfSJuFj6S62X109q9Q+y869wyUrfvw5EB6kfUZknXhcDbNY4UhvQIiLDXpBWD/N
	YKEjIFfqty22J1e2tRlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKb7K-006PEr-Ao; Wed, 25 Jan 2023 08:26:50 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKb7H-006PCs-D5
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 08:26:48 +0000
Received: by mail-wr1-x42c.google.com with SMTP id b7so16233026wrt.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 00:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzLCWkEIOjhYvr7p7s7uKUj96vyQiWAZD9+xORl+Fd4=;
        b=43RnMhlzKC6isB+BlsuHH7/tEBHZ1/bP4D7/o9SX9jlnxONu6iV1jkJOq5Vco+FsjF
         oc3Hes7m3q8HaFo/WO2xQ9PKljtIXAx8WGirVA4cJgPmfTo4fuuVRXs/ByFS06lGVxsM
         aPVdiKVcLMSZU2ya9AX7nM6w1F193qIHtA+X2HYhctV/J3yNtCrUi49ldHzCr4Tgyv8z
         QEcVCXQq53AbqUCsokpzY0ocyF2O/vnz0nXJ83Aj2BzFFIedwu6jWWtyDVNm5mSD+BM8
         5g5MyXnPkGvD0+aEr27K9HaXKLlKTYtlvNLQLgbe83xUzGiSajRWLdyP3DOzWCgd4L4z
         4xIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzLCWkEIOjhYvr7p7s7uKUj96vyQiWAZD9+xORl+Fd4=;
        b=n1lNfc0zZkUNTULQxwL8klF7rU2Dzyxio2A/PR6GsPjN5ZEs1LpcHsSxabaLmIgsrA
         1QffRh81J2sWlALsTdiYxw//ujdXTjyXvCPvkOl2j+z4MEE1OTqp8Dbo3ZxLeTC3L8wL
         KsGq8BsMI6WwegW8T5hRHkbRwApLe7AltxFCnr5t10R+jPXvr4NAM+mjhqsbgF7hWkpr
         BFvE1PyVToLGRZBWc7tSY5Lc5P2cv41lQaiD2zzCqphVLrP3KUcdehTs1lB9P6+cBo+M
         ijMgcq0y+2lkEOeYcmPEnyxu+BbazgQSw2RZ56RX/pdM+f6NNeKXhB4z65cj0x/fsS6X
         ENig==
X-Gm-Message-State: AO0yUKXoZ/HAvD5F+ExHRhdzpFYmyPRD6X3ijvYnODUVqh6/rc5CSkCS
	ru7aeh40SD7tE3ZmK005/6Po/w==
X-Google-Smtp-Source: AK7set90qFk1AY8kITr+4giuot8FT/Zyed3RBEfVvXtqS/ror/yZ4ozUkMAIncHs+g4uhizQZJhL9w==
X-Received: by 2002:a5d:4536:0:b0:2bf:b1a1:efc2 with SMTP id j22-20020a5d4536000000b002bfb1a1efc2mr4073913wra.18.1674635206045;
        Wed, 25 Jan 2023 00:26:46 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id j14-20020a5d452e000000b002bfb6b9f55bsm1607974wra.16.2023.01.25.00.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:26:45 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 3/6] riscv: Move DTB_EARLY_BASE_VA to the kernel address space
Date: Wed, 25 Jan 2023 09:23:30 +0100
Message-Id: <20230125082333.1577572-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230125082333.1577572-1-alexghiti@rivosinc.com>
References: <20230125082333.1577572-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_002647_479685_18F944C9 
X-CRM114-Status: GOOD (  11.01  )
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

The early virtual address should lie in the kernel address space for
inline kasan instrumentation to succeed, otherwise kasan tries to
dereference an address that does not exist in the address space (since
kasan only maps *kernel* address space, not the userspace).

Simply use the very first address of the kernel address space for the
early fdt mapping.

It allowed an Ubuntu kernel to boot successfully with inline
instrumentation.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 478d6763a01a..87f6a5d475a6 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -57,7 +57,7 @@ unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
 EXPORT_SYMBOL(empty_zero_page);
 
 extern char _start[];
-#define DTB_EARLY_BASE_VA      PGDIR_SIZE
+#define DTB_EARLY_BASE_VA      (ADDRESS_SPACE_END - (PTRS_PER_PGD / 2 * PGDIR_SIZE) + 1)
 void *_dtb_early_va __initdata;
 uintptr_t _dtb_early_pa __initdata;
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
