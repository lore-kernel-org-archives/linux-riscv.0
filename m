Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDC4C54EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 04:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdOHtytxSZoyUmhDrFm5msvQpb5lImOP+h/M4Is/vSk=; b=4+DlZ+hASY+JUl
	mwMEa9PgojPEjZq1rFPb3zB6ZwblDqTtLICOYhKHVQ7xEsh8Xby9kN3UA+w6BGqvw381WEscsFPFj
	pO+AfLC4pVW27rEbkmwICgibzM4WDngLY5vWzpmh5eWNk79DJATLVmRHTlWsIOeAsG/U3KgTlTFo4
	HRnXKkQDLLYWPV9yl5iV79+fmkAzQRJaCGcN90TBwFV7n2ukQZuaKr5nXAwO+g0wz54BZ0+xaHBP8
	6rWRyslw7HUtL6/2AMnT0K1lvkYKvN4GXxzwlRxAElOutM3JpKctT9EC8nGcg6YagFjfCN6aeuwi6
	IwIh1zlGaQn/JzhocTqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ2tB-006nPu-9q; Fri, 16 Sep 2022 04:23:41 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ2t8-006nLR-38
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 04:23:39 +0000
Received: by mail-pf1-x429.google.com with SMTP id 9so8970233pfz.12
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 21:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=gvdjpHS/YRkH0vho3frtzgK80BilJG2+eEXjf2bW/zQ=;
        b=JcV1gWeBnsQpr8IFqM1+cNtK3uJZja8fNUZDQ9YI32sLk50HAJeJHl8CtuLS0PXkF1
         bt8oDuJ+JN1bl77ccVAq5lwZQNC7l++U2iAztTCBPnoSxu1cTU+6Dr9hs2glfYM4yf09
         8kmNhFJRFeOsax8NwX9CBfSKXbeMXz2OHU3cGE3e9PbAsbQTZ0v8JoOO+0yHnQXU5OtV
         GDf+DQDJjUGr4ucmj+WbBhKV8+M03WKpLvZR68yhxLFN6GhWtkPbT5jhahFYTtdPE2SX
         BYRR6rco9AMkf69xO+CGlY/878xxKJA3DNg3hv8A+uZwjXcyp64zU/wnKB7rLAqunwgu
         cBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gvdjpHS/YRkH0vho3frtzgK80BilJG2+eEXjf2bW/zQ=;
        b=w9LdUoNuOHFhvCnrbiviXXApGHaf6sm8VW8CMN7D2ReHSTaS+9DpHUMrZmIYoMXnoJ
         gch0RH4Z32H9zdvIGl1wbw9vchmLpJZAULNXBVa+hQVi3TwI3XYp2hEEnBjjlMT/2wzi
         I0NXBJvLlXfceJUUhvb90VhOdMTNJ9Ub/oKzfSpfOM7Rr1shWn1eayRH5V9NsY+qgcwE
         gcQuzy+iLDcJYJ0R5baL9hf1OqAL4GCEhnUdrvbzsSXwHCgX12fvS7Co0jZiTC7rTPE2
         1Al15rjkUD2T/x8YH85Lgjy4OXyv+NAUD0R7S++4YEE92qZdzv4O9ZzKvO+ZTNtUPogS
         GeXQ==
X-Gm-Message-State: ACrzQf0K/gG3+1e3wjQyrjcEVvV5kjTR6rq7GMxShls2gruPjyRkWYlk
	scD1+qKsnJDhxNhi114dVNCSiseb29dPHw==
X-Google-Smtp-Source: AMsMyM4cNNU9y7eTJK5lmnGYbYr9GG/UfHslV3Qdx3TRxlr05zTuKGANPDIp17c/0MkdgUZJJIB8Jw==
X-Received: by 2002:a65:56ca:0:b0:439:169f:f027 with SMTP id w10-20020a6556ca000000b00439169ff027mr2792866pgs.580.1663302214959;
        Thu, 15 Sep 2022 21:23:34 -0700 (PDT)
Received: from vineet-framework.ba.rivosinc.com (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id x4-20020a623104000000b0053e6eae9668sm13257286pfx.2.2022.09.15.21.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 21:23:34 -0700 (PDT)
From: Vineet Gupta <vineetg@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Christoph Muellner <cmuellner@ventanamicro.com>,
	linux@rivosinc.com,
	Vineet Gupta <vineetg@rivosinc.com>
Subject: [PATCH v2] riscv: ztso: disallow elf binaries needing TSO
Date: Thu, 15 Sep 2022 21:23:31 -0700
Message-Id: <20220916042331.1398823-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916030552.1396820-1-vineetg@rivosinc.com>
References: <20220916030552.1396820-1-vineetg@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_212338_375650_3E9235D1 
X-CRM114-Status: GOOD (  13.78  )
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

As of now the software stack needs work to support ztso. Until that work
is finished, disallow binaries needing TSO.

This patch is needed to help ztso ratification and prolifiration of tso
bits in tooling.

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
Changes since v1
  - Build error (and boot tested on qemu)
  - Improved the comments a bit
---
 arch/riscv/include/asm/elf.h      | 11 ++++++++++-
 arch/riscv/include/uapi/asm/elf.h |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index f53c40026c7a..b6b4542b3039 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -26,10 +26,19 @@
 
 #define ELF_DATA	ELFDATA2LSB
 
+/*
+ * Make sure the elf being loaded is compatible with extensions.
+ *
+ * In the final incarnation this will get the extension list from DT and
+ * make sure elf can run on given hardware+kernel.
+ * For now disallow TSO built binaries.
+ */
+#define rv_ext_ok(x)	(!((x)->e_flags & EF_RISCV_TSO))
+
 /*
  * This is used to ensure we don't load something for the wrong architecture.
  */
-#define elf_check_arch(x) ((x)->e_machine == EM_RISCV)
+#define elf_check_arch(x) ((x)->e_machine == EM_RISCV && rv_ext_ok(x))
 
 #define CORE_DUMP_USE_REGSET
 #define ELF_EXEC_PAGESIZE	(PAGE_SIZE)
diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
index d696d6610231..fa9e4c52c7ac 100644
--- a/arch/riscv/include/uapi/asm/elf.h
+++ b/arch/riscv/include/uapi/asm/elf.h
@@ -32,6 +32,8 @@ typedef union __riscv_fp_state elf_fpregset_t;
 #define ELF_RISCV_R_TYPE(r_info)	ELF32_R_TYPE(r_info)
 #endif
 
+#define EF_RISCV_TSO		(1 << 3)
+
 /*
  * RISC-V relocation types
  */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
