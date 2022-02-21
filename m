Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8A2C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Feb 2022 16:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5LobbI8Y86Io1L31MZ7LAnwTTe1SkuHeTzjPO1QQiM=; b=yVwLNHvcWk4kR9
	BYeDJL0ISd/tTnepl6QdWNozz9mxc22zNRYREr5gDOQki4bi/SF++rtRLWs546KdjmwFi7LNFWKZj
	3iYQ5HgQWgvB//YcHM6fKs/Q4CiBPIIeZpCDSDc7OAkCHoB8cF4sxG2TyOkk/aFw9Gfq9t0TylOyt
	Ktg2lxtt6ESaFVGn2Z1xHcK7BkcJ3qBTQ41VAmSAuWtu6QmRj94f9YFof7ZpsHnLuz9QdlGL3E1AK
	2+snwGItyuEc1SzXMS/+qVBNhIKQNsbEdZ7CroVUC31K+IjXKmC62xKs19f6UvGae8DL5fGFCUG5S
	VJh4hnakqw52moYh8i3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMBKM-006cPQ-Qu; Mon, 21 Feb 2022 16:14:18 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMBKI-006cK1-8j
 for linux-riscv@lists.infradead.org; Mon, 21 Feb 2022 16:14:17 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A0AE14025B
 for <linux-riscv@lists.infradead.org>; Mon, 21 Feb 2022 16:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645460048;
 bh=PQyFtNV3tW1qRmwZ8HqaxvUDcyO7BHPqZZLC0geQ1k0=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Pw8zIvxw8A6Tu9811T0MQ/EKgt2aY0nsNu+pz29KErjTymjyH3xZuOREbWsZtGj1L
 BU/x6aRF6Sd0KxpS3NfSmIrth+ezrzOwZM3cgPUWzNy4iDv5A9x5dKybHFt7bsMXLm
 NG83fDsWrbvFDtL8hjVAadebzmnvKtR7LIx79MWea08Y68hZuaQYOjp0NfVuXjmUyC
 fqQeJHJbJc9f8MEOW5Kld+Q244pFQLqTRKYpAq9j836uf3g9JvAazwI+gKyD1ndmnx
 JoNM6iBvXS7PTK3wwoUTNZVYUSAsoYR0+atuHFHvRGAJNdvoyp6hSq5H1TMciAeoBp
 MBtvmiDI3o9Dw==
Received: by mail-wr1-f72.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so7605664wrg.19
 for <linux-riscv@lists.infradead.org>; Mon, 21 Feb 2022 08:14:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PQyFtNV3tW1qRmwZ8HqaxvUDcyO7BHPqZZLC0geQ1k0=;
 b=HBTjRz+Ce1AAZW1Ykcf9pK4Nj8NUD7khe4JvDJKKbsQb649k+fgkzQIrvfXEgrIs7O
 /Ci8g0os2odnlS5GBa+z0JDMwAwtoSWLJF860Rzu/n09dmi466rwskQsb2OOmb4EFUtX
 3JnQg+Cyfnfr2P1wI21JWlgtPtqYkjCd2tbZksmsabK0Ykck/ysvW0tUeBrIKJir01o5
 nGAlHSZDAVkZ9+vXUS0PullC3Z20FVqhujGjgYMrAZYo0KGy9eIjwCPNCfl4LpJiisKf
 Wbkg4R1cOYbfxXvS+ZVGkJWLviJ3O3na8YLjPowxyOrGGgTKCXoXqBDwSw2IkIe9E1bj
 OliQ==
X-Gm-Message-State: AOAM533FnMD1SLi2aeBPceMIi178/WOrg1lVa1pK1FEU/VETgWYul+S4
 Cj+0y0fmxjnboaDayH/JV3pz5n+sovD+Z4JBZy609OmnhyB3DWjoH3u69p8XIPN2dLm7LlXe9n7
 ruerPJ4Jpa++zARzHw65cQwdDueVd0RaJaxHIeKkKcEB6GA==
X-Received: by 2002:a5d:59ae:0:b0:1dd:66c3:c67b with SMTP id
 p14-20020a5d59ae000000b001dd66c3c67bmr15950154wrr.400.1645460048038; 
 Mon, 21 Feb 2022 08:14:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNwlTRPQUvSp/uTF60wmHJDYNhgiXOGL05nzjrbLdn6G2rJra00RbHGeqsfRNSqcTRx5zKzA==
X-Received: by 2002:a5d:59ae:0:b0:1dd:66c3:c67b with SMTP id
 p14-20020a5d59ae000000b001dd66c3c67bmr15950135wrr.400.1645460047868; 
 Mon, 21 Feb 2022 08:14:07 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1])
 by smtp.gmail.com with ESMTPSA id o4sm32504065wrc.52.2022.02.21.08.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 08:14:07 -0800 (PST)
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
Subject: [PATCH -fixes v2 1/4] riscv: Fix is_linear_mapping with recent move
 of KASAN region
Date: Mon, 21 Feb 2022 17:12:29 +0100
Message-Id: <20220221161232.2168364-2-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221161232.2168364-1-alexandre.ghiti@canonical.com>
References: <20220221161232.2168364-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_081414_487966_0741ABD0 
X-CRM114-Status: GOOD (  14.23  )
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
 arch/riscv/include/asm/page.h    | 2 +-
 arch/riscv/include/asm/pgtable.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

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
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 7e949f25c933..e3549e50de95 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -13,6 +13,7 @@
 
 #ifndef CONFIG_MMU
 #define KERNEL_LINK_ADDR	PAGE_OFFSET
+#define KERN_VIRT_SIZE		(UL(-1))
 #else
 
 #define ADDRESS_SPACE_END	(UL(-1))
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
