Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F05C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 15:01:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB782613A6
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 15:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB782613A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZC6GG3I/iBFkLvlgfYI3BAiLFSwo+6R9agJV9Ilbmk=; b=BYuPNjZH5k12Ye
	rnVSvnrizBSxTDSdQOX2RzpmkWOhHUZ5dDWpcy5PbkYsmNxOgWS62BDP552OBWjjX/aJ51cZtoOya
	mmxmN7R6iE6A1psWDtJquatb1YUOORKmPnhBPQqc7SI8SNeFyjs24sZWKre+aPQH2SbpPQJ7uOux6
	SG4n5QqrXMN8xGy7cMq9l2NprEzTuPOm2wHBLY8QBKqVRLXzG0No8BaXEqra0K0OcclvWMEljtPJ4
	8PSHcm9FX4F4xzbdcdHyzoBAHL5TzWOKcAc8vF9ViGaCq0ur1ROzTdrv/NY54JeNLofDe1nLk4BMd
	m0Y4s1PVude7CMis+06A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVb5R-00BSR7-He; Wed, 29 Sep 2021 15:01:33 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVb4i-00BS5x-Qx
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 15:00:50 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 406FD40279
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 15:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632927647;
 bh=vJN7Ck0uNCFG+Ctq/qAp6lWVQYR8Vj2mrO3VtePHdDo=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=CdndsxOn2Q+HxgVi+RJAQYf0h3YtqonFisO24TFMTMd3xeuqhyo3398X6/Y2eYMZb
 t8+ZMLRPl2Y9rhk0n//d9ffe3YtUO1ugv5Cvy269sOglS5amFiITcl3ao9qNGghf57
 lwVl87qvCCfyaWuSfgrjDRgGUr1r0VxwfpjagziSYPop+bgx6vjgWayvW0CrWLb7/q
 F66Lcb8ndK1Y/5vNQcr2b/y/XnOfNVBUMXRZ6x8VRCEg8qzgW1RM070HqkyUqPKApR
 lg1qksiVb4bpUcdQA0egCsdari18BmNoV2uyz3EH8urBTh96xN4FwVUlcgDYPyRtsL
 DS0LLVif79q9Q==
Received: by mail-wr1-f71.google.com with SMTP id
 r15-20020adfce8f000000b0015df1098ccbso708212wrn.4
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 08:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vJN7Ck0uNCFG+Ctq/qAp6lWVQYR8Vj2mrO3VtePHdDo=;
 b=hMlETfNL211/hloKC++zgWK+gqNGou7r0KXvDnUs/uqP8eVMfUsB1/Y5lJdhadKRqS
 PevZe3zIhL8/Nk9WOZ18nPPX/BwRxwbQQ58cLnPY+qpYkre6LcIlAEORke9kHmf+inny
 fZ6jsXm04mvZmhrVuCrUZcmOiiH+UWLvnAb8Qk1BaIjUxl/0QW9q5CiBnC9cXZ9/vpYI
 Wl4of5lpSb8nLTKWchKuwssU1g3QS+7b7c4Te8XWzNNnzbfrfZQJBZQVWAgP304DROVZ
 b0m3RCQ1D44e/7Aj6GRJCLPX5sblbTJeBKabrOkgf1pxZ/FP46grBk5rLj2znWrrILXV
 iq2Q==
X-Gm-Message-State: AOAM5331h1CWtrBYYb2JdYeoErmVsLivCtNb1eQxj+mbd5kMkBG1OFC0
 YQHqCEn1rNRScWxGFs4mqHGhHPVySDdfEPrnae5zkBRN1cbXTyyObeIu0Yjh/HgY5UizidfPPfp
 yPdNA+ythaseQy/9x4KmI3BJrmsxihVcXBWL0CTULls1YfA==
X-Received: by 2002:adf:d4cb:: with SMTP id w11mr327561wrk.125.1632927646707; 
 Wed, 29 Sep 2021 08:00:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfXtNjTqRwTy6zB0yjO+6WDv1SXfe8fP/ut2QpPS8jTHw1twOX+D4X0+hshAyxExD632O4tw==
X-Received: by 2002:adf:d4cb:: with SMTP id w11mr327526wrk.125.1632927646559; 
 Wed, 29 Sep 2021 08:00:46 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id e8sm142306wrr.42.2021.09.29.08.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 08:00:46 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@wdc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
 linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v2 09/10] riscv: Initialize thread pointer before calling C
 functions
Date: Wed, 29 Sep 2021 16:51:12 +0200
Message-Id: <20210929145113.1935778-10-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_080049_042435_D39B02AF 
X-CRM114-Status: GOOD (  12.78  )
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

Because of the stack canary feature that reads from the current task
structure the stack canary value, the thread pointer register "tp" must
be set before calling any C function from head.S: by chance, setup_vm
and all the functions that it calls does not seem to be part of the
functions where the canary check is done, but in the following commits,
some functions will.

Fixes: f2c9699f65557a31 ("riscv: Add STACKPROTECTOR supported")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/kernel/head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 8f21ef339c68..892a25c6079d 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -301,6 +301,7 @@ clear_bss_done:
 	REG_S a0, (a2)
 
 	/* Initialize page tables and relocate to virtual addresses */
+	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	XIP_FIXUP_OFFSET sp
 #ifdef CONFIG_BUILTIN_DTB
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
