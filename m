Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45025C25B50
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 10:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3RtriPOaHwev1X9RT/YsOQzIwmTohgG2/MixUGSd4mU=; b=XoX9jm661HZbMq
	WiQKX+GE+nVTGsHSXgmwOZjfYP+WK26vpUEvzVOEW2Tu1XI0Y02a1TVD7gSXNjlyrYuIWf8qp6cLD
	sRxcE+fTCdw/SgY7imVgYuP55ChxD6fPDovqGCSmVvXHRbSs9PaLxJfSt66dHK6cLDiKi7O8zZi9V
	8Iu7A7P1qc6aAPH54oYaXwMdGWnjW32tItQ0TJ7QmG5Vn5TfZOR+X2pmop5Ny8U7Ni3OuXR6PFygo
	TxF+j+mXrSpMxDDOoyXc7Fw/07IZKSgsTFDD4hQCYiK9GKpG9FxTBmMpvoEyTFSOuij7DAi68j/36
	T0d4gS9L2dXAUpB8JjJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJu1r-00GoC1-36; Mon, 23 Jan 2023 10:26:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtox-00GiYQ-EH
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 10:13:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso8131070wms.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 02:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzLCWkEIOjhYvr7p7s7uKUj96vyQiWAZD9+xORl+Fd4=;
        b=HXc8RqVoAlQiZ3SA2JFj/Ss1Z4kvlhRCjc8xe2vvhQs7MG+eiCGYHpoDvfBnNdp6Dv
         Y+fbxkiIx0qH1+5beUgDgVbZyHqwPhWfOkZqdoa4CcpkVYSA0pZvsCX2zfNOiyF0W3cv
         4mMCvCoCb2pEnyD09346WX82nautOUHabcg/bg44jXDHHJktQS+ON0lo+MK/rA0Fiw1I
         AGldKNHzkoVZEX4z40MQ6jBTw8p2d4QBPzbcxGy6ZIOlBimIexgg9m3K+mX/N1rKyLMR
         NiGOQW6gZ9Wkk7a8E4iI6icfKgXRhrCfDsYYxtffTahQDSRzS2nEths/z8JtQIf3Yryb
         jVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzLCWkEIOjhYvr7p7s7uKUj96vyQiWAZD9+xORl+Fd4=;
        b=wOyrR3SsoJwsrANffA1Lz2GTwfHMcUR+bNxcKJNZgN625U2xzbcDGdPaeWia+/XmAU
         aQqBUX+J2NrWH+6ulvQmnSc3p7giYzx0kxStJ2I7RUZzV6V9JAIimX+VKgXaNiX+fJK1
         P0+ZK09/+H83ApYE0lHqmFlRrMEuvZUwDYmCV2isWANc8nVXXyiMHHhtb2bhtFm1SHFo
         KaTjJ46FN5mRaXTzl99YuLekOcMH9hQanRgfEHBqFsP00uZWd6Y3JYMOrwb2f6w5VsOL
         yrdu7uj5ySJm3gjp68meUCYK6wFHS8B14ORCkfbpt9wYGMhIe/cWDVxKDvBhzicZbLo1
         xjSw==
X-Gm-Message-State: AFqh2kp1R/e9OzjCNYdc8JMKabNExSb7DHx63N7+l6XoKMnmwgfnbS+o
	qfDHa+7663gTLQ1J0zPZcGr7Y6SKg9Z/tQ5u
X-Google-Smtp-Source: AMrXdXv+bjpVA33KRbsI7GGQQ6TP8aToqcfzuFxT6KcEnBDPOEnT0+96sEUxMPkf/KM0d7bIPhR22Q==
X-Received: by 2002:a05:600c:1c83:b0:3db:27b3:a654 with SMTP id k3-20020a05600c1c8300b003db27b3a654mr14875103wms.26.1674468776649;
        Mon, 23 Jan 2023 02:12:56 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id d19-20020a05600c34d300b003a6125562e1sm10375823wmq.46.2023.01.23.02.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:12:56 -0800 (PST)
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
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 3/6] riscv: Move DTB_EARLY_BASE_VA to the kernel address space
Date: Mon, 23 Jan 2023 11:09:48 +0100
Message-Id: <20230123100951.810807-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230123100951.810807-1-alexghiti@rivosinc.com>
References: <20230123100951.810807-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_021259_517528_88E47089 
X-CRM114-Status: GOOD (  10.83  )
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
