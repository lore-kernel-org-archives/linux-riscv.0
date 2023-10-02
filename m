Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F57FE784BB
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 15:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4n+eKpr9g1VEGv6N2v7bOV5Vk7fX2g31usigcMfnbA=; b=Yb2urVkMITKQep
	WzCUAi4gFeFc5QYTc/Ix71M7FAGHx8qcufYJAnkTGgJzD+rCdCqyhVputKhFXZ9QPaBqvGRfT6U9O
	N+oWEbldO8g1zCaCrHtmIi9xprZR96xM/8gqQBrAkwj5HgKJb+4YGPbJ0/9hSMscgEpqb55vT1RFY
	m8S/Vlzdy3zPj/25sKHcBBIuSalNhLLLJvi7z1wFsEzbqLpraD+q2gdWFD27G4q7dc5GCNwUauAM3
	gWTcs28BxvFj61goGKe5e8HWeCfO1uhGkLK336oCr8ttNpG1l7KLOg3N5lPlpXCu1kLlERIVU7B5m
	zSUC2+EWwsjnANj3UexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKcH-00Cxf7-07;
	Mon, 02 Oct 2023 15:13:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKcD-00Cxdh-1S
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 15:13:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40651a72807so43785085e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 08:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696259622; x=1696864422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKlKP5/9RI4UDE4Mv9BGz18R+1865OFX4ZcGb0PXpPY=;
        b=tuJHLdy53WAn5IOXrGYv7TZ5SeBI9z1qBczcdMH4XpHPH+I8beBZWUNuyiQ+KwE47d
         uLJtrpgbXjFa7qsFfwt64mtPKsYT5Gm1iaFm24qpTAPUFVdzsoqem6VGsI/cZqYBuC5x
         2hUbJ15TlsNHLvWCWrG8YeT4aawZtS9nqx8M6oXb9LBJ95t0cVchrbXUWUM6Oz6eqN7C
         rFSUvEWntahhYzEq+9V2tNFh7qQ4hErq8Hl9sS5IxGcbSiKZjOzp7FF4BEJ0dDvkXboy
         B0raQrKB+HjsHsyPoSM8XUfJanBUcu3xzZeyAxBTDP+l0wyK3aaz3kfZzdaevah9wY+q
         fm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696259622; x=1696864422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKlKP5/9RI4UDE4Mv9BGz18R+1865OFX4ZcGb0PXpPY=;
        b=gofnY6HWBe9jnJJL7TuVlf300/8E5soiCQuu3dSAOE9DKj7Z2QqTaC302YxxUM1Fav
         Alv2rX2saSOrZx3S/4LE/G9fcmsKrfjiIshjHb/0SP8a52QZ9RxZrjw40PXOBa9Js+Hx
         QhYf5h8q8K+pSklt3e2Q3MSnqOnv0HykWu1mHADuU2JguH3tmr0dGwzHK9bkcQs2lnw5
         02z4WheORPq5hBJJJZ3DNj+ycOAcjMODFZjr8AHtF4PdGqljqwkx/hhKV2laiV0e1Cje
         5mCIoj0bCWAgv7Ulty33aGko3ZT/netRfJHP96t+uLexkMZjF4dlwvLWz3D4uCTLdd13
         B0Kg==
X-Gm-Message-State: AOJu0YxBaiUgaBnLzXWbyS7lbw8js/KZgwIYO5xKP2a1edIPcb7wWdvf
	RroklbdwHp6qM1imJj4zLPvibQ==
X-Google-Smtp-Source: AGHT+IHO+YzsPhqZFo4O8yw5o3ilb0oSA+vYnzJ8XqlEcYHitO4Hyb9F4EkPU7aucBS8UpRf+rPooA==
X-Received: by 2002:a7b:c8d6:0:b0:406:5190:7d07 with SMTP id f22-20020a7bc8d6000000b0040651907d07mr11349388wml.17.1696259621727;
        Mon, 02 Oct 2023 08:13:41 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l5-20020a7bc445000000b003fbe791a0e8sm7509731wmi.0.2023.10.02.08.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 08:13:41 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 3/5] riscv: mm: Only compile pgtable.c if MMU
Date: Mon,  2 Oct 2023 17:10:29 +0200
Message-Id: <20231002151031.110551-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002151031.110551-1-alexghiti@rivosinc.com>
References: <20231002151031.110551-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_081345_491769_F89C8F9F 
X-CRM114-Status: UNSURE (   8.78  )
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

All functions defined in there depend on MMU, so no need to compile it
for !MMU configs.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 9c454f90fd3d..c71d4253a171 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -13,10 +13,9 @@ endif
 KCOV_INSTRUMENT_init.o := n
 
 obj-y += init.o
-obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o
+obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o pgtable.o
 obj-y += cacheflush.o
 obj-y += context.o
-obj-y += pgtable.o
 obj-y += pmem.o
 
 ifeq ($(CONFIG_MMU),y)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
