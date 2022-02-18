Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87882C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Feb 2022 13:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ehUyKX69NM0GxhOxeVueavwDB2lOtjqPmTlhZg2GHTE=; b=oXkbcALy+Y55Ur
	gSOUIvhsTy9uSXKc0F3Ps8lz2qWbbWCrtChOgkF3pXwkojEeJw+IhAYE7MBYoPFEUweXux8H0wT6k
	Pd6P0jry/6HLi/qflEkzF8pt0i3fEH2Op96414TCRZSCI+pndSdhxbfvfzlLk32vqDLBQv7JtBBWC
	jCKws6f1ev1Kq4WSpeaARBWFKcD2kg+2jzERGEyTUfbkFa1MmzCtRpu5sQav/zrKwf4+Vypcjtev1
	ITHbRbDox0eygxgUA17tttjql7JGcNbUzSoloxz6WqTbLXiSnOxBUvZIq62L08+HzCDLR+DdfOZ/H
	gZyWaR2t39XOnGWyM0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3aB-00Egrt-74; Fri, 18 Feb 2022 13:45:59 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL3RG-00EcyY-2k
 for linux-riscv@lists.infradead.org; Fri, 18 Feb 2022 13:36:50 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A7E4A4001E
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 13:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645191402;
 bh=H/bO0aBxUyDz5Z1iaHc3hPM9Zt6+vPNG7kqFlweb1Sg=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=g4ClVBKoiKOVYoMBtn/PaYmVnT2JIEhCAgy9ZAOhFQN1xPOS0EasbsYR6GiM7SbqT
 0IdM2i/wNFu8PtbzrbOlSkU+k3NmlSmfkdeap/l5sUkm2OIkubr2I84NkWxuJhyox9
 aRBVICcdHwAM/11F29WC90JB5YsPZEfVxiL19nD9varG7jfkqkKRSFouRswg8imna5
 Zmt+0Yj2fCOIlVa935DNJ8XXCe+JO6A1PmcySF7+LxNeMEDFv2gHgeqIMeQg643qx0
 toy8OzlSFH2TQN//SAMrQFk4/uFA0+5ifyo6fVA4IoqePtmlJHZFvB8y5vHjA9zuDO
 DdjK+KsKqGDtg==
Received: by mail-wm1-f72.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso5943781wmh.3
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 05:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/bO0aBxUyDz5Z1iaHc3hPM9Zt6+vPNG7kqFlweb1Sg=;
 b=Bf1VHIzH1jjnMBE7lMMVEWKZh06qJLPWetgfEm4S2lZJHs/PSNtxOmrUGYW4Z1KN7o
 nVlaJJTN2xcdvo1LapI05fqvXJIAGusFHCVH31wevfJn3VkYwTXCdGF4wh9vCuGpX0k3
 DJaPIG/cFOVdXNLtP3BSqVevqEqvrDaaWyQGegEkWKIwK0c+3GNLn9WMzGIDc8LnCja8
 Atwg5owBmrjTxSrasHI8NsW9PzqijjNt07gFbTO7kNm1vHwn60heAH29bQG+xRhn33d2
 S8VeRBQiDxI7+Goq/vDqYqVo7V3ACGGTy1l/6Pe7y4TboF9NDBLW8wusE9puXI6+b7b1
 HLcw==
X-Gm-Message-State: AOAM530grbKYhmsRwb7DwSxZ1noB4YkDn9fqWMyY6dDcwOKViMha0CHb
 SxK334weU8sobc2ceZAeotDsbAtIHKeAx8waSiwmo0L4qUXJup5r1w0euZf+3AZPkxjpOdkF1WJ
 NWNvbK7j0kY7icoLvUzKvB/bfxf8cSTHR5UVZq4vfwKq5fg==
X-Received: by 2002:adf:c188:0:b0:1e6:8ecb:ea5a with SMTP id
 x8-20020adfc188000000b001e68ecbea5amr5888273wre.711.1645191402137; 
 Fri, 18 Feb 2022 05:36:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyONeVylq+VBkXW8VpHpa9vSjAFyqnAnqrsQ2M08ZZvxaC3/JU4jOZLRotcih0KkieDFRj/qg==
X-Received: by 2002:adf:c188:0:b0:1e6:8ecb:ea5a with SMTP id
 x8-20020adfc188000000b001e68ecbea5amr5888255wre.711.1645191401906; 
 Fri, 18 Feb 2022 05:36:41 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1])
 by smtp.gmail.com with ESMTPSA id z7sm4146155wml.40.2022.02.18.05.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 05:36:41 -0800 (PST)
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
Subject: [PATCH -fixes 1/4] riscv: Fix is_linear_mapping with recent move of
 KASAN region
Date: Fri, 18 Feb 2022 14:35:10 +0100
Message-Id: <20220218133513.1762929-2-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220218133513.1762929-1-alexandre.ghiti@canonical.com>
References: <20220218133513.1762929-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_053646_297063_A832F449 
X-CRM114-Status: GOOD (  13.67  )
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

KASAN region was recently moved between the linear mapping and the
kernel mapping, is_linear_mapping used to check the validity of an
address by using the start of the kernel mapping, which is now wrong.

Fix this by using the maximum size of the physical memory.

Fixes: f7ae02333d13 ("riscv: Move KASAN mapping next to the kernel mapping")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 160e3a1e8f8b..004372f8da54 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -119,7 +119,7 @@ extern phys_addr_t phys_ram_base;
 	((x) >= kernel_map.virt_addr && (x) < (kernel_map.virt_addr + kernel_map.size))
 
 #define is_linear_mapping(x)	\
-	((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < kernel_map.virt_addr))
+	((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < PAGE_OFFSET + KERN_VIRT_SIZE))
 
 #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + kernel_map.va_pa_offset))
 #define kernel_mapping_pa_to_va(y)	({						\
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
