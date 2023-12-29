Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405CCC46CD4
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 21:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxZ8rpKDojI8nYf3E5REO3qJzb7szBvdhy0i0qtT9K8=; b=nIWbfFLgFlo4Ei
	lsFbwKOTHh5Evpsbm2+TKqbYYElh6uwCWXUEO4BiQD+8yPPb9QGNSP98+36mH1XZGWEOlRlKq3vcL
	w2eaUV5lqlUkFUAm3tNYzGHySPS3goT3LbTJtJL4xGtH+F8xqfmHwYW+JLrGs9Ub6FQr9oP7Hea/f
	YUYOXNKvaDG+sUdqLoN7u3bLDla29cPfuKrmrXuViqo12l0FmYujcR4UDXYuxKvw3cVAia+L8fxQF
	nTGYvUxAxnA8Njnjyr/CEBaN3BWqznpBRqb+jvxLg/crxyPr9DM8Zr1IRwyM/A0b4bFgtp2Jf1hVl
	WQJjZ4mZV63291lXIwaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKk5-001blo-0F;
	Fri, 29 Dec 2023 21:50:09 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKjy-001bhr-2u
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 21:50:05 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6dc3b219395so195238a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 13:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703886601; x=1704491401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzYVT3U62jOpimrVBwbFtsr3YzUGPIXyIVj0onyqTs4=;
        b=FABunppeAUfd8k6vzmIFKl05FnthrEkI/lORFNzkhwC9taL+pTxeDVfJ3LNwre5r7J
         XUeppcscH10p3121M97PK7ywAf8qQL8R9m0prd0Uueg2VrlR8DY8Et4gkRshZzJ9NUo5
         Kt0vpL+a4NVtGWwwi9rhbwZtwc+lyxoWFy720TgQN2a/8Ka3cYoBL8r40gATDtMpkWew
         pTyBQOdDz0dUZEt5IaiyGJ+INvR8gYmEJmwpZHv15gZbW8rbtAqb+gbC/z9hm8kyy62c
         qYVsNf5n9bR74YYQNQTBCg8xg26texW2t74YgBBCBCSWb6lFag3C3WKYexTv41wjeD91
         LEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703886601; x=1704491401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzYVT3U62jOpimrVBwbFtsr3YzUGPIXyIVj0onyqTs4=;
        b=AGLbtAtrpDXh4F1XgBcAyYdrXP4aS4vfmaToJq1iMGqupNOhlz3KQwyZJKJrsVKC7c
         FVZtRh+mFseP6ZmqknlZ/ShFxyggb2bYTy3lVpTiRETeKJo4C65v7OVAUTknIb7SHFc9
         K/S0zWhTT/JPRV+2cktemKZouBmPj+T8dHthCMs/SDs9nn4LbERLDxSEwLy4e9pnUA0f
         WFEk0+2N60V7S4lCtjTCVQQRV5G0BJrtxUxWVqrqlmbIz6GQcgxWkdv3yLoZgXIIe8L0
         x/yc+1Kdu7GIiDT9FlbHTUIFcEDYCiQ8QVVtnWh0C9Ggg1chaKjMQ/w6XOUXVYwX7/KW
         eo0Q==
X-Gm-Message-State: AOJu0YzBJY/LzxRNiRkwaAkZq0voLoZn4D7/GRn9Ptdj01q1Sam9dQ6J
	PKCXJcLkfZAJw/99UxTlIAg5rCfDCzQlQw==
X-Google-Smtp-Source: AGHT+IEuODbSbFsbVriLOlUiOCO/2vbrQ4JMxcm5CHyM2vpKjHNqL2v71wan/bwXHLaT8EDFaqqeqg==
X-Received: by 2002:a05:6830:3b0a:b0:6dc:1846:fd with SMTP id dk10-20020a0568303b0a00b006dc184600fdmr883138otb.16.1703886600858;
        Fri, 29 Dec 2023 13:50:00 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id r126-20020a4a4e84000000b00594e32e4364sm1034751ooa.24.2023.12.29.13.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 13:50:00 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [v2 01/10] RISC-V: Fix the typo in Scountovf CSR name
Date: Fri, 29 Dec 2023 13:49:41 -0800
Message-Id: <20231229214950.4061381-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229214950.4061381-1-atishp@rivosinc.com>
References: <20231229214950.4061381-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_135002_942712_CE226AD9 
X-CRM114-Status: GOOD (  10.47  )
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

The counter overflow CSR name is "scountovf" not "sscountovf".

Fix the csr name.

Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h         | 2 +-
 arch/riscv/include/asm/errata_list.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 306a19a5509c..88cdc8a3e654 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -281,7 +281,7 @@
 #define CSR_HPMCOUNTER30H	0xc9e
 #define CSR_HPMCOUNTER31H	0xc9f
 
-#define CSR_SSCOUNTOVF		0xda0
+#define CSR_SCOUNTOVF		0xda0
 
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 83ed25e43553..7026fba12eeb 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -152,7 +152,7 @@ asm volatile(ALTERNATIVE_2(						\
 
 #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
 asm volatile(ALTERNATIVE(						\
-	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
+	"csrr %0, " __stringify(CSR_SCOUNTOVF),				\
 	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
 		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
 		CONFIG_ERRATA_THEAD_PMU)				\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
