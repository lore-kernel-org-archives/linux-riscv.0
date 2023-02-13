Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF6DC6379F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 04:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4nJI3cgerLLRq9AMRI44nwlttZqm3aEHMK5FUWYuTfU=; b=HKwurtKsN2Le3U
	/ULhsZYPwv0NS3gQ19h4ss/o+7mfJNOeSGskM3S7t+XwCVyuCNID3bu0eI/p/95xXElWzboEuBE8K
	hU5C8Gcxf0VKKMuh4vnhWcEnHtbK6ccQybkdi18w0NFdNiLV5nyx6cC4yx5cIwQVzrJo1je/epm0C
	/szK461dExN7yFwuPO6Ea+AlcpgW+GtUfe92jqg4RB14IprEFAgRI9RjLbVy5k7ax6s1tJ8CZAl2x
	n5CXGfvex9eu2pUwt21RtzPivRZERWy+sFbT1rJEme+n9GT50bf6BCwP8hPUV66tSZJC/XzJuq57o
	P3Rnzfe5IIYtGcL2lZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQr4-00D9O6-0E; Mon, 13 Feb 2023 04:54:18 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQqw-00D9Im-9C
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 04:54:11 +0000
Received: by mail-pj1-x102c.google.com with SMTP id o13so10786550pjg.2
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lt6u6bYwhuTYMTt/YfubY13MWrPuafF8Y1u+P5cWyE8=;
        b=vt+qlNRDi7mRznlVUmbqj3O98hmw8TzQhEaLZE107DASJjh3mP5YoOhuFoE/yDgncn
         OCvZHgb1zW/hH2iTg9NRv5Wvr+diw7rZF11dNmNK02h8Eanq2/2oPPW05Ri4S37QtvJL
         22/4YVAOYRBOGaZ1sF7hoskBSUqcx3veQeIhV7or5WE2e3hlEkKjqfifPGWWsd0kxu/j
         WAyBfRKGlvAkydGHT9alybIs4NM7Z4c5f3VlNPpGkMhJwjPyX420tB4sAm4543ChntNk
         KKPDv0GKHwLrhhldTsJrjzkPUijMNypauZOdcTMX5tonq3hrIgVD+1N6zaNBQE3PWR3U
         6B0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lt6u6bYwhuTYMTt/YfubY13MWrPuafF8Y1u+P5cWyE8=;
        b=XjfOI05mV7flvBuYOTVRAbtsdUr5KpvxWOYa5l+5bHhrAR3LBnpM8tDQV0vK/U/y1K
         s+HOvv8T0mRBG8jNbHOYonHrIpSHZzeNNjHfn9NGcQBMoK45b1wDhWhasDCuSEjX6TDr
         w+EPSPlbFSLv8hEktyk3y0Nv33pLHLCj9JTF8zzEad32bZSlf+ZhB9gehni/XUzJgOAM
         hR9RAaGWFI3Xd+fSg9oISsl7CyGoysZWcYWBkTMmt8ywcFvc/n2o9P1B7eI5gGPQjfnP
         qSVirL73luwCQlW8A83uQZb73ZT29SkAKUPlQbM4STVCdBRXNz2zukqlN+RV7ou4zoVo
         nATg==
X-Gm-Message-State: AO0yUKUMl8kT7ma6dJLFADGKMgGdQF1F/KzUx9ERDZRzhVL0qT/rA/sb
	jW7FIAxaackLG0nytnf//66+lA==
X-Google-Smtp-Source: AK7set/M2hXnLP/wI4jka3ngVh/rpW9tQNim5nRuWweSNonl8MMrLnl7Zea2Dyx/IgKeNWfXUHLJEQ==
X-Received: by 2002:a17:902:dcc5:b0:199:482f:d4c4 with SMTP id t5-20020a170902dcc500b00199482fd4c4mr13241724pll.44.1676264049102;
        Sun, 12 Feb 2023 20:54:09 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:08 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v1 RFC Zisslpcfi 05/20] mmap : Introducing new protection "PROT_SHADOWSTACK" for mmap
Date: Sun, 12 Feb 2023 20:53:34 -0800
Message-Id: <20230213045351.3945824-6-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_205410_353028_A0FEF29D 
X-CRM114-Status: GOOD (  14.62  )
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

Major architectures (x86, arm, riscv) have introduced shadow
stack support in their architecture for return control flow integrity

ISA extensions have some special encodings to make sure this shadow stack
page has special property in page table i.e a readonly page but still
writeable under special scenarios. As an example x86 has `call` (or new
shadow stack instructions) which can perform store on shadow stack but
regular stores are disallowed. Similarly riscv has sspush & ssamoswap
instruction which can perform stores but regular stores are not allowed.

As evident a page which can only be writeable by certain special
instructions but otherwise appear readonly to regular stores need a new
protection flag.

This patch introduces a new mmap protection flag to indicate such
protection in generic manner. Architectures can implement such protection
using arch specific encodings in page tables.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/uapi/asm-generic/mman-common.h | 6 ++++++
 mm/mmap.c                              | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
index 6ce1f1ceb432..c8e549b29a24 100644
--- a/include/uapi/asm-generic/mman-common.h
+++ b/include/uapi/asm-generic/mman-common.h
@@ -11,6 +11,12 @@
 #define PROT_WRITE	0x2		/* page can be written */
 #define PROT_EXEC	0x4		/* page can be executed */
 #define PROT_SEM	0x8		/* page may be used for atomic ops */
+/*
+ * Major architectures (x86, aarch64, riscv) have shadow stack now. Each architecture can
+ * choose to implement different PTE encodings. x86 encodings are PTE.R=0, PTE.W=1, PTE.D=1
+ * riscv encodings are PTE.R=0, PTE.W=1. Aarch64 encodings are not published yet
+ */
+#define PROT_SHADOWSTACK  0x40
 /*			0x10		   reserved for arch-specific use */
 /*			0x20		   reserved for arch-specific use */
 #define PROT_NONE	0x0		/* page can not be accessed */
diff --git a/mm/mmap.c b/mm/mmap.c
index 425a9349e610..7e877c93d711 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -46,6 +46,7 @@
 #include <linux/pkeys.h>
 #include <linux/oom.h>
 #include <linux/sched/mm.h>
+#include <linux/processor.h>
 
 #include <linux/uaccess.h>
 #include <asm/cacheflush.h>
@@ -1251,6 +1252,9 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 	if (!len)
 		return -EINVAL;
 
+       /* If PROT_SHADOWSTACK is specified and arch doesn't support it, return -EINVAL */
+	if ((prot & PROT_SHADOWSTACK) && !arch_supports_shadow_stack())
+		return -EINVAL;
 	/*
 	 * Does the application expect PROT_READ to imply PROT_EXEC?
 	 *
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
