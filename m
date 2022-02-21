Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC28C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Feb 2022 16:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xmx4stEWuV26jwOmn6KERmmk9N+5X6UxaRqStAS3XB8=; b=sIeJEvvYrADfpT
	WAP3G9uX1L3WLveKYSInRrPs5gB2oOVq9rGbJasR9JZ1zZHsNOh2RCRf+kc+MVMllM6WkdC1XDvX3
	x6KS8HnvMn01R0p+ovx+009XAHkXfE+Wi8N1qCRLSCjx2AgKUB3cXRbZyMHeRluzvxjhdfJIh1Dga
	1KMWAMPNhErnxiHsVCWXvZgtmMLSza1utsgVcDgLOmLPy9szh47Dd7pGo7yJ50yyio3wZgYqVSGkV
	q+favRIt6RX+WbvsHnCnvffYLYeDVw7vddXL1vs7eu5a3p+D2ux12U5q1MHxki3+y26sP2UD3mixP
	DtvUildDe4yoO/ajvU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMBNF-006dXJ-DL; Mon, 21 Feb 2022 16:17:17 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMBNB-006dV8-8E
 for linux-riscv@lists.infradead.org; Mon, 21 Feb 2022 16:17:15 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E3CEE40257
 for <linux-riscv@lists.infradead.org>; Mon, 21 Feb 2022 16:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645460231;
 bh=JOP3F1szvziyyHwwb25WbMBDR7/phOdbs80dtO/BlA0=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=o6EukZQ8zM9KFiyjjWt91Mw/lHEpWlHO3z4p/T1PQ/LyAtU9uJZrkiu6m5+Bv05uA
 Xmg7qHoxgOykf6BaDg6E4+MY+SZEyAusjIc+Awq7Y2Z0OaQXtF3kFD+rWAojcYtYGq
 F3cWfb0SKFDUG+4nb0UU3i8oucARxPZY5DLEmN9qT4JPmEFte0G/P5iLg5WIf80eAL
 YgVOupU/E5NC+gWGNJSevFUNXYA4O2wJujyvfZKwYe65jQflfJiDkEoNRaP7+M3T3j
 iPuIsXcNOY1aGCUflhS/k1DAz5nmdUPqjvUVDr6EjNyDOuOdcEfJNFBZSfZE0IkpUQ
 pnSTavhokJelw==
Received: by mail-wr1-f71.google.com with SMTP id
 j8-20020adfc688000000b001e3322ced69so7613398wrg.13
 for <linux-riscv@lists.infradead.org>; Mon, 21 Feb 2022 08:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JOP3F1szvziyyHwwb25WbMBDR7/phOdbs80dtO/BlA0=;
 b=NAUr9apoO5DDsACQ6a8V8+kYIhhDZK8ouHYRGz7zJpPrahtu109E1xykMS7ou5Tfrt
 Q2zN00GqEh7VJm/kUDGLEAUnAsQD5DRBV5rsIAcoB96oOxy0lzqXJ9ebseEQAGTh903i
 j3uVfMnR3lNJ7c8X8i0HfJKYMCgbFHXoLM5gR4E/XnKS8uv3OLI7sAmkNIKt4dcftAYV
 WEjHVCwCQek4u4oDY7dZcEbQqlQJ/LHxKfXRnjzNiwlncabeQ+OeA+xYYF+H1SiV9bRY
 jq6z34PaE+Pz8mwpMWIoDJD2aS8BTiPsg5DJo8Q5IJpakQni2EH4utV93+xrIZTPhiXz
 a+9w==
X-Gm-Message-State: AOAM533mFNtNSoRLp01BX3ug00uu54kRceyTvSRUPFNp+7rTmsdYX9cI
 3GSeJ8jotF/FzqR4SvA+jbVyU29bIkn9T+mxYwT2qaHRcb8U9KpP6jtubx2udu2TXM3+uAam34u
 l5HKEt5N5LZ5gWcnuKvBaU9A7tf8khbygbDxtEjQXa9FdGQ==
X-Received: by 2002:a5d:5885:0:b0:1e8:edbf:2d07 with SMTP id
 n5-20020a5d5885000000b001e8edbf2d07mr15598185wrf.85.1645460231228; 
 Mon, 21 Feb 2022 08:17:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXKrYccEg4SGZYpkC/dp+cdaF1zX9TsezjyOZb4KizvNQIRmWsWVT22DWvpfUqlPM3f+r6/A==
X-Received: by 2002:a5d:5885:0:b0:1e8:edbf:2d07 with SMTP id
 n5-20020a5d5885000000b001e8edbf2d07mr15598169wrf.85.1645460231012; 
 Mon, 21 Feb 2022 08:17:11 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1]) by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0037c91e085ddsm9825161wmq.40.2022.02.21.08.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 08:17:10 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Aleksandr Nogikh <nogikh@google.com>, Nick Hu <nickhu@andestech.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH -fixes v2 4/4] riscv: Fix config KASAN && DEBUG_VIRTUAL
Date: Mon, 21 Feb 2022 17:12:32 +0100
Message-Id: <20220221161232.2168364-5-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221161232.2168364-1-alexandre.ghiti@canonical.com>
References: <20220221161232.2168364-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_081713_467051_0F247260 
X-CRM114-Status: UNSURE (   9.93  )
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

__virt_to_phys function is called very early in the boot process (ie
kasan_early_init) so it should not be instrumented by KASAN otherwise it
bugs.

Fix this by declaring phys_addr.c as non-kasan instrumentable.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 7ebaef10ea1b..ac7a25298a04 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -24,6 +24,9 @@ obj-$(CONFIG_KASAN)   += kasan_init.o
 ifdef CONFIG_KASAN
 KASAN_SANITIZE_kasan_init.o := n
 KASAN_SANITIZE_init.o := n
+ifdef CONFIG_DEBUG_VIRTUAL
+KASAN_SANITIZE_physaddr.o := n
+endif
 endif
 
 obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
