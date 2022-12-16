Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05298C001B2
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 16:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nhccfOmIP90knj2w7FFFDpPSgwTWaMJiDwW1D26CEF4=; b=hn8gb2iWRaki37
	3AR9jAKECQPe89FPfRJldLlsQ1QokKP7L2qZ/kEndnLahs4xS2CRTZQGY9Gw6j3I0bXm99OSFjKxG
	35eVK3Xtj8afiAHEpdT5wk4FojxwIUHvak/+K1biz7TpjOFECXtK77P+FDOcPU6QFGf2FDItKHccE
	zLHS+CDFtnYpJPNYGkRAqae2i+ddHOmouTWy+0XhjVDjvxvyK6TdCqyBzfrC4mtGNKMeVln6GAB4i
	n2SnzqCfi9SDQrFy7KoP1xdwQnlz/Sljusuetc2tH9xvMNedIv32WDVYlTAOs47UWDPpLNdaVLl2u
	NpF7HktmStfZy5aqHYtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6DZ5-00GQgi-M7; Fri, 16 Dec 2022 16:28:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6DZ3-00GQf6-3w
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 16:28:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id o5-20020a05600c510500b003d21f02fbaaso4471738wms.4
        for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 08:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qYMZscnhg3axVtI2bTNdXZnKgui98AcKoWlQAnIeCs=;
        b=vhEZGm1QXPdlJCD+7d9PcJy32KzwQJAMknHGf8qqBajr4gCrr0UxQ70GIvhyqSYoNz
         eNFWzXaH5KOeakclklBAaJQTNJ0A+j2VNskqQLWwhTpZd3CKARTbDX2opCaYTEhAiOvq
         eDh8gvk1mz/IqzUCP055btEAV/12C4EOpPySxKaOT77Zrlsdsqr1WHFXoPE8sw6Z8D7R
         b/AXf/Dv1w9KgT2gAp/6tjyNEmhKOTfQn9SLuqxmHOEsjI2c695gxRTAVuu+HCIMCAl1
         4PamHQAR09nYPNXQzRqMO1oJkExVcjPxnkbuboCIC60O7ssqlEycQyWCYz4hAYvth7Dw
         WRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qYMZscnhg3axVtI2bTNdXZnKgui98AcKoWlQAnIeCs=;
        b=P7c6EjmY5xATVbvCi8QVNmkCSLivvzwGzuIE1Xc/4zf0jBstNWQfF0bqrobt/gAT37
         3o4Vc7G7JoHk62OuHz7Zw3B7xdiIOGYOW1vmh5a+kSj7yaXHw+0QoAsKRKXWjit5HEdZ
         r9nC1japs0HavM6T4vcq6507bGjfS1tlH2wx3LafCgqWx9tEp3sW9AdsRBNBM77mLFMS
         zUeqSWr2td2r73+TiSw1oLr9sQwfCe1/bG32DK3DEByhKrFArPiWOLY7RxD7XE4Ji8mE
         VOIu781TI4fSAG2j6qytyNs6COqMWnAJbfkAVZxjryerUZmHBhynnMzYYaNiysfxR1nL
         V9qA==
X-Gm-Message-State: ANoB5pmoi7rxz4JgNXhTD+SKWjd6y7YoTiS8feneXD+Z0Vd6yQH8uorI
	aJMEPLQK2J8I3rNuXc91nO/5289Y9FJ5jpM1aXM=
X-Google-Smtp-Source: AA0mqf7guqpBhqTNxv/AP9fjpSc862y9DanbVLkBzjvCq+Op7BGNw9IUHI5Lc+bbIkQyrsvM9opB4g==
X-Received: by 2002:a05:600c:34cd:b0:3cf:c2a5:5abc with SMTP id d13-20020a05600c34cd00b003cfc2a55abcmr26558882wmq.17.1671208077738;
        Fri, 16 Dec 2022 08:27:57 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id i27-20020a05600c4b1b00b003d220ef3232sm2784387wmp.34.2022.12.16.08.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 08:27:57 -0800 (PST)
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
Subject: [PATCH 6/6] riscv: Unconditionnally select KASAN_VMALLOC if KASAN
Date: Fri, 16 Dec 2022 17:21:41 +0100
Message-Id: <20221216162141.1701255-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221216162141.1701255-1-alexghiti@rivosinc.com>
References: <20221216162141.1701255-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_082801_175298_D9CFA5FC 
X-CRM114-Status: UNSURE (   6.86  )
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

If KASAN is enabled, VMAP_STACK depends on KASAN_VMALLOC so enable
KASAN_VMALLOC with KASAN so that we can enable VMAP_STACK by default.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6b48a3ae9843..2be0d0d230df 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -113,6 +113,7 @@ config RISCV
 	select HAVE_RSEQ
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
+	select KASAN_VMALLOC if KASAN
 	select MODULES_USE_ELF_RELA if MODULES
 	select MODULE_SECTIONS if MODULES
 	select OF
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
