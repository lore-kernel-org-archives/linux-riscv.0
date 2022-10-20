Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A170DC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 07:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERNH/83Lk6vTNmxYwnu7232d+1jfTGqVU3g6kpEJV5w=; b=04CNEgPIS3XE88
	6Al+HZ3u/aqpeGZfPhmqoAvGrQ9CS9E/eZngOaLFO/22LKEJ6IQNbn6GzNJflLioV2boXkL+o6m2Q
	G36w+LvQWZWOkIrgLRkcg0ID23gCNx8TX0+Yw88Au9yE8+dn20eGQI8MEMDhF/e71MmDtDpx4t/PN
	+Adv2appI9OCAOnLCJZR+PYJm0ca1FaoUEY2pRJmsFCAxjhky7V56OZmJw1yf+ChCzQyVFhvP7+eY
	ISTHRu2dvMd5JObTIfE1Hb6zCTLcxb2FP1glNx82C4K8QYSus/UvLfXcYQ9wkaLoBbAePB+fXEpIU
	jlWDSsEt41nSNflVUonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQSK-00C0u2-Oa; Thu, 20 Oct 2022 07:59:08 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQSJ-00C0rj-1V
	for linux-riscv@lists.infradead.org; Thu, 20 Oct 2022 07:59:08 +0000
Received: by mail-pl1-x62f.google.com with SMTP id y4so734592plb.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 00:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuilwbSjTkXNw6j4kYlnUJ0pwJrZlWFK5/+cTZqJbNQ=;
        b=ZKNy4Em5+FuBRP2gsIy40Yrk6FnGU3CqJrbS4NGA0H4o/nv3ogel1a+BelUzdLO1+g
         EU+MmxJ/fG6lCskSK8CjnrO6mvqd192jk75tdkMPCx2sj0HVYrLPSIl/FCjUKLQqhXIR
         O+B28Y0IXu56SXNEgwVgKrhhZ6VobhnpNyQY2oG3K0B/EDQxN58o7Xd2xk1gaHZyl3fF
         njlaQHg7PekkPyXa7GZgMueBWS6N6jJ9f91rD5qgIsxZw9SBJj74KQ+Ze7eazFE4kmgx
         E0MgKtM0nHURmmTr65D876z74uLsOqBlxTsCGuq16N7OZB/lo37TXNpMWUkkYyqExwcp
         ohiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuilwbSjTkXNw6j4kYlnUJ0pwJrZlWFK5/+cTZqJbNQ=;
        b=GbKGjaTVGA+P7iVutb0LE9VRNheCLokrkkT/1GVSZfArLwMds+beuyMtLXHaceKohJ
         5rNTsDUBWGrSZPmn7HBUEwqFR9Io5aZqPS3Lc2Xnm4v2V2p/ZclaZ1kUCihxt1LRRLXS
         si4DTdcpggh8/hBKKDkASo71KIcZa3OIiyBk9Im4QAPoVPLJnFLrkxzrRIdzUSwqPFAE
         03MaChHBog06Nw+m1Wejjxiaf52/DbSU0+i8LeMSPOOZvZQi/XyHq2Q+OKEKNZRmuUBr
         bGtS7pOsu+PTyIyFd31OrhHwv9DzyxjrHrJ7gdHD8kydB/fjZDh++aqwKmY5aycpr3+j
         xT8g==
X-Gm-Message-State: ACrzQf07JUthv9P4R7C5ihBG+ExiCKGDHZ1DpgonQDsc4TcCFUZXhDR8
	CDTpaXgrTuV3dkuFY0Ir4uqSKg==
X-Google-Smtp-Source: AMsMyM4owvZnTyqDDywJXkxNgsuebJjnZ5lE2U3qnXcYFm8cRhbjwN/IzGov1M7IHnfRXLtTT1BHcA==
X-Received: by 2002:a17:902:eb89:b0:185:33d:cb34 with SMTP id q9-20020a170902eb8900b00185033dcb34mr12806731plg.55.1666252744045;
        Thu, 20 Oct 2022 00:59:04 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.80.23])
        by smtp.gmail.com with ESMTPSA id h30-20020aa79f5e000000b0052dfe83e19csm13206438pfr.16.2022.10.20.00.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 00:59:03 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH v5 2/4] RISC-V: Fix MEMREMAP_WB for systems with Svpbmt
Date: Thu, 20 Oct 2022 13:28:44 +0530
Message-Id: <20221020075846.305576-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020075846.305576-1-apatel@ventanamicro.com>
References: <20221020075846.305576-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_005907_103945_B43894CF 
X-CRM114-Status: UNSURE (   9.00  )
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

Currently, the memremap() called with MEMREMAP_WB maps memory using
the generic ioremap() function which breaks on system with Svpbmt
because memory mapped using _PAGE_IOREMAP page attributes is treated
as strongly-ordered non-cacheable IO memory.

To address this, we implement RISC-V specific arch_memremap_wb()
which maps memory using _PAGE_KERNEL page attributes resulting in
write-back cacheable mapping on systems with Svpbmt.

Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/io.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 92080a227937..42497d487a17 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -135,4 +135,9 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
 
 #include <asm-generic/io.h>
 
+#ifdef CONFIG_MMU
+#define arch_memremap_wb(addr, size)	\
+	((__force void *)ioremap_prot((addr), (size), _PAGE_KERNEL))
+#endif
+
 #endif /* _ASM_RISCV_IO_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
