Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEB4ECAAD5
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 04:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ofsOdG+dgEVPBtWS/+buTUKOPlndD72aQXnOUrgNDM=; b=EsXWGfefLxE7uY
	k7EEOX8k3qhu2jcu/0jte6AlVZ8R6l55AbcCG6EhPrE7LQwKqpheyVHe1kLpSGjX+yxJ7+HAa6SEk
	hu2BpFtxk7ztfsZ9P8hIv9SrbCrJ0fC5W/pWobEmoyYGJgAZZaXOG13PgQ1WKgVySQoUe2aFF5065
	fzebpIGjDt22RNdbYGosPUmZurmL/NYzRZZa4x6QKhnTgN2CQD6IJ/1By4+TZyfxZPAf81KVdpF0C
	Dy55czLuuoNqIe9lC/w1yPp7sfArNgLgKacuXGn63RiV0kIH91pBKCD9/II9j6svmdpYt2ScPfE43
	E9G8FYMtqJISf91On4qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oStA3-00E3kr-HZ; Tue, 30 Aug 2022 04:47:39 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oStA0-00E3hQ-QM
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 04:47:38 +0000
Received: by mail-pj1-x102d.google.com with SMTP id n8-20020a17090a73c800b001fd832b54f6so8047848pjk.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 21:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DF3EHZACZLIxZm103wJfkyVVUnHhmNz4e84k34pg8iM=;
        b=d//IYFbFbRj/XGv/L+vodF9VdUAaDfuMlXokuJPWHcVkRNgY84J/Nq6BwNLvkQJH+l
         qIY3tux1IkH+TGS1zi/PJWIDe/9R1ROlQPIotY7+VEvdoMJ4/thsof72inQ0Cn80VXj+
         xltiE7undvWYlNF+uMHyz6euWLMHSPsJoRSnEupUASGZx1lcKIDaxRaywMxGeyC3jOfj
         +B6i5IFJw98Qv6rfWsaCKPTgHuNrb7NawC+gGZG3zQg9LKTo8SVMHL6JYCYJrlJh8M3h
         ZYz+ouRwEeFK43KJD33wD1e4BwnP/wFeR9+Qkjk++zoL5wsLEeHee6JpThHE5socKCRj
         crFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DF3EHZACZLIxZm103wJfkyVVUnHhmNz4e84k34pg8iM=;
        b=5hcK4mzD1xJWtXRovdNbWfHCulrdIjMzPR/OT4bz4Z+soT+aP2sCTkviUPuwSqLhMy
         S7A0Yr3GFVJmLxVwTJzScRFNaOv0Pkxtt9Dm8YrPgIma6HL1qlAKxxB1A1vevW/4G5Wr
         ilEn/tx24tgLXksuwxDviqcBTFaUEsd/VGYlyZ3fZ/Yo2t7oHnsqVnO6dAUg+nGuKBCo
         ++h+PrOG/8C3kd+MegFTldGktze7U0IDJh7W3/sUeZ6NLO/czGOei2z5uV2kCVCH58QQ
         S3No8wYHvFzaHcnEvytKv8p9H3u0v8Jg/bx0MqPBh2AJgbJev8q4uch0Zl560LtDDW/f
         hMUg==
X-Gm-Message-State: ACgBeo2r4nxybDN1/CazvSenEOw9LxF3jFd8BbwTQoFlncoN6+x57Iuj
	OyYwQISX4mOpCnS4t1fVu9qc/Q==
X-Google-Smtp-Source: AA6agR5dOijUTXfsEnOaqP4oO/8aejOL3xC6Fv953h7pj5T7Bxh/cxnIMjRjsK29SKoejrrC+jmtyg==
X-Received: by 2002:a17:90b:4d07:b0:1ef:521c:f051 with SMTP id mw7-20020a17090b4d0700b001ef521cf051mr22130876pjb.164.1661834853798;
        Mon, 29 Aug 2022 21:47:33 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.81.23])
        by smtp.gmail.com with ESMTPSA id y27-20020a634b1b000000b0041cd5ddde6fsm592240pga.76.2022.08.29.21.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 21:47:33 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH v2 1/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for systems with Svpbmt
Date: Tue, 30 Aug 2022 10:16:39 +0530
Message-Id: <20220830044642.566769-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830044642.566769-1-apatel@ventanamicro.com>
References: <20220830044642.566769-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_214736_867342_64AAA69E 
X-CRM114-Status: UNSURE (   9.16  )
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

Currently, all flavors of ioremap_xyz() function maps to the generic
ioremap() which means any ioremap_xyz() call will always map the
target memory as IO using _PAGE_IOREMAP page attributes. This breaks
ioremap_cache() and ioremap_wc() on systems with Svpbmt because memory
remapped using ioremap_cache() and ioremap_wc() will use _PAGE_IOREMAP
page attributes.

To address above (just like other architectures), we implement RISC-V
specific ioremap_cache() and ioremap_wc() which maps memory using page
attributes as defined by the Svpbmt specification.

Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/io.h      | 10 ++++++++++
 arch/riscv/include/asm/pgtable.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 69605a474270..07ac63999575 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -133,6 +133,16 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
 #define outsq(addr, buffer, count) __outsq((void __iomem *)addr, buffer, count)
 #endif
 
+#ifdef CONFIG_MMU
+#define ioremap_wc(addr, size)		\
+	ioremap_prot((addr), (size), _PAGE_IOREMAP_WC)
+#endif
+
 #include <asm-generic/io.h>
 
+#ifdef CONFIG_MMU
+#define ioremap_cache(addr, size)	\
+	ioremap_prot((addr), (size), _PAGE_KERNEL)
+#endif
+
 #endif /* _ASM_RISCV_IO_H */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 7ec936910a96..346b7c1a3eeb 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -182,6 +182,8 @@ extern struct pt_alloc_ops pt_ops __initdata;
 #define PAGE_TABLE		__pgprot(_PAGE_TABLE)
 
 #define _PAGE_IOREMAP	((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
+#define _PAGE_IOREMAP_WC	((_PAGE_KERNEL & ~_PAGE_MTMASK) | \
+				 _PAGE_NOCACHE)
 #define PAGE_KERNEL_IO		__pgprot(_PAGE_IOREMAP)
 
 extern pgd_t swapper_pg_dir[];
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
