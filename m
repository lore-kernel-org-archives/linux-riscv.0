Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B18EB64DD
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 06:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PteSKRXa2S3+6v7ccu+EKAMD2UMfUAk2FvhaeMwEmxw=; b=uUT6J1rYjKzBx5
	lZsa+Ysz+pieUWYKdv3yqkh8lPi44kpB6cfHy6fvc5WqAnT4txIdj2T82Y3E4hOtLi8wl/rM4D+zS
	9LO1iHEEgkC6bZI/EvQ+EO8MKlXdtmCiWdi2RlhJ8HL/qdA4JKRwjOMLVG6+qR7UR3GHL7f0kiu1T
	U3C+h036g7t/IrDyvXO9ZyTFR2Re4X+AKmrIvYVPe8WkJe2/RmwPQc3czfFL4eIgYz7ztWuvzSa+0
	wmauOzXJVYFPU3TxQ7DpYFXq4UoO3HGuOeWerg0xbT5+5BTc1EOBJbsvKJJQcqBHSNDXvKI9FkPgL
	zj/nalOUS1HiY2xr/q5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCwMr-005KaF-06;
	Sat, 24 Jun 2023 06:03:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCwMn-005KZi-2L
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 06:03:26 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b516978829so10623945ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 23:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687586604; x=1690178604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hBPPH4/uw0ABWvVPTs2OWTzo1oNRx61u6JuJ/5dY43c=;
        b=I0vRFb+kCb71Z0VAHVn+jYVYu4Xd2HLgqO4gYa8zyJmzJVQgFpUYnMQ8H5ZenOEacF
         HHFZ5+OP/TQq06FRNQrPH4QN66dq4PM3XLOc517r3+6xj9Q+CIEShSzFXBt34sbmoTpI
         MdfWZGmHEWVKJ3v7yuyrwzoxNEBDFmvzXg5+gtXoIDBIp85spmcNBjUjJTg5PQ249ev4
         fPju/XdxvcA4LErbMgJtyQF9Vg11QPcTEKZHHhK0s+Xq0PbfDshFFA4+yTOH9ChWv1hk
         DHY+KCUEAUxXLle4/wJQXvrtVJGN+iRNpyOhd5N8PdrPtBF+8SnHy0HZfmT64kURnZTL
         9CzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687586604; x=1690178604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBPPH4/uw0ABWvVPTs2OWTzo1oNRx61u6JuJ/5dY43c=;
        b=GSjp1nwS4MFLEscB4DJl/zZuKHws0syNgzMyhnwdi3qgua4dyMAXgZ46uBSzvumOQ9
         IOKIedqcVYIUcsOOVsmzp0PyAyYoQePZqojNs5yT8wnbGFOGjytL6dwXcB619efFSfQV
         ZLONSzuSLMYIkDdVMYF+bc6i3vstrR9cIsdjBQnUbEL2GHy6WVVEO2InwsaKj4MuBzGc
         CuwxCHyG9Yb651baSgHrytnO43HSuIAGqdlarD2XU+xzv6GJhPqxLEG7Lf129pjX844I
         i7XKhCSX5KeWMcL1AwzbOdyfssf3nmT5SxG7U+gBs9G3Xm8tu6F2V6KNWKeziiBkqkWr
         JUmw==
X-Gm-Message-State: AC+VfDzdGqRO9a0G49eE4UkCC84m8Akkn5StmXIteGowb1dS/8XsLjb0
	DFdCiqaPkE4dqwEaDk2mpSSa9A==
X-Google-Smtp-Source: ACHHUZ4V9zO6Xv3qreahhHVgK9sxCO7H5Govxp5RPtg6T+PU20Khx2zOATbEIt9AW0daKtDaQEHVWQ==
X-Received: by 2002:a17:903:41c7:b0:1b5:5ad6:ce9d with SMTP id u7-20020a17090341c700b001b55ad6ce9dmr1527206ple.50.1687586604471;
        Fri, 23 Jun 2023 23:03:24 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id u15-20020a17090341cf00b001b539640aa3sm465802ple.283.2023.06.23.23.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 23:03:24 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Select HAVE_ARCH_USERFAULTFD_MINOR
Date: Fri, 23 Jun 2023 23:03:20 -0700
Message-Id: <20230624060321.3401504-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_230325_784601_EFE8E544 
X-CRM114-Status: UNSURE (   7.65  )
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

This allocates the VM flag needed to support the userfaultfd minor fault
functionality. Because the flag bit is >= bit 32, it can only be enabled
for 64-bit kernels. See commit 7677f7fd8be7 ("userfaultfd: add minor
fault registration mode") for more information.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5966ad97c30c..21e864fa93db 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -97,6 +97,7 @@ config RISCV
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
+	select HAVE_ARCH_USERFAULTFD_MINOR if 64BIT && USERFAULTFD
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_CONTEXT_TRACKING_USER
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
