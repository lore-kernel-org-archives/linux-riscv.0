Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1189CAC5AC
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXUX1tVgGpHv2hwSAp+P4aVZNy1MlxY1s5d7VU4DN2E=; b=hcNK4oUYboJ18H
	vvEgqq7msWZRbOzmZn65mCSWVvZOQWYvUy4oq581PAD+mtZDYzBRLfuvDdHEKNxltl/R+givG4vZT
	2tgQQPzYVNSHa9BLHzV91Nl5/lAEzxYUMZDCGgBbhPy9c7Pvum3apvjAEqcvV2EzG09ErE9FkyMu4
	ek+ImClAK3ZQIVJCMm1uSk9SB2I53UG/76IhUjRUpwF56zfN4Bh05OQeYLau1hgxOWmpyywJ9w/Hy
	wBkOZSi39o7hnUEzuUha2/NvduHELzgVi1+3ZtOx81aQCbKWiVive+IeV0QDIAGz4KAYoDfoycw86
	GuNtJK/9JqG1WyPTcsoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04Md-00000005tza-3zuU;
	Sat, 20 Sep 2025 20:39:23 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MV-00000005thO-3mQb
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:17 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-887745ee814so105355239f.3
        for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400755; x=1759005555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhgo805sVSiR0SJlmhLHBR/NhPzSwBuZgQ2sQCeXYLE=;
        b=ff5GSiGfr86vJxy+Eoa5N1A91SlXKKRkXKl7FVfWUukLmhGFnLA2Gf7Gg2PTsw20zk
         KrVGhMOVZ48KvUA4bHNzMYeONcVZRRz7hWVt/jqmq39mrHGi+D/EUm5ECqp6Cvs4oRHw
         oZSkGFvvbksRVyUV0rroKfN1UP4Vrj5NEBFIvl9iZ3k1Vh5DLfY4B+msdkZRUfgstcK9
         DznGqL2OBsjjmornk+z6AbJJHmSNG9vu5uRcbIG+E4QKkB24BiuFNo83K7GFOW47YVm1
         xaIoesgpW5mSgStESHjFUXcZKVP2WX9yC2DEZopttEJMv3hm2rRNb8IZ1kYwwK/cmo8e
         SI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400755; x=1759005555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhgo805sVSiR0SJlmhLHBR/NhPzSwBuZgQ2sQCeXYLE=;
        b=v5MxgDBXEwCMR6zyf8S86jROFQvuXbvXRSLQzpCaOFtu/9/r6MiCtA5MhSqPi8vqed
         +52rRmfDPSSD1ERd44suArhV7M21t8vpLXUqK3UkNSFMqju8mbCiU+LYBx5NJ40D+IdP
         KD+w/y6e5MjnHwemyakE5JmXO04l2tjyNj9jZEPNnjFg4DTSQp0QIGihYtbNogZiJVVX
         U6FhPslnl4c6kxfIg3nS0Qg6Q0Ju/O9IkrCLrQplMi/Cgiz6HtAn3076E2NYYK0D+r8Y
         Cd5ihQiESedvfbeBkMh10/fYN8slVkvdZ0qMuWTciiXL60aB1J96neOsbIAjrtQG06xU
         cU5g==
X-Forwarded-Encrypted: i=1; AJvYcCVS1/gXyNQUmAuivHfuAh3go7D3NIH7aM/uUlVUr/c1+cyPODwagkBNatrDLzEAfUFHjrSJBzQ76R8FNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAWkkqLy1AMuCtG2e0IfKkXczMFmwaUmAcRnJZAO/L/u1r9EXI
	xjy2U6gxnCXUzxIHZXQ/eLKehP/YCr5NrxVmgyXSWjX5DQXSxWzOn1b+QhOAH/l8Xzw=
X-Gm-Gg: ASbGncs4mS4ANolxwbzDI+oCK9Uo1pqb5klnYrVy1oykLXanaWoq4c9F0KUNZOyDiyl
	3R7O9kfxz+tkq1McphtgO8hCXeaAFPi5YCuY3GNG/YKGl/K8c5U92m5qqWIH7fmvWb7Xjw4MIDU
	jNxo3oc8LiqFacpyPUVdxBS/6E4ex78/0MnuIoZc6/ek0vkaHXYxBu6E0+0u+e+Sjc65tdWTk3R
	v1ugZWLRyZcGCHHhdV5rd50+e4hKmlZFD8/14uVylTFXxZefwcEtnIaL3OpGsotkah9pRz0912J
	uEYAgrJtcjE5/hmxWcbwpLtticw81p55zSomN4rEPL0JVluUmEoaCgcNC6ggQSmuA9Zs3A9J6Vb
	xxdamZVHNZnU+E6fLnm4qrLr+voZ6GHr6XTA=
X-Google-Smtp-Source: AGHT+IFpmX9UAkdlqyKeAFy3AzOo21LtEJum96Rzv+8iJlkbfeuTwtEuWDKpDYd555ixOqfVlv44jw==
X-Received: by 2002:a5d:8791:0:b0:886:c53c:9175 with SMTP id ca18e2360f4ac-8ade08247f9mr1118249839f.16.1758400754919;
        Sat, 20 Sep 2025 13:39:14 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-54cfd9b688esm2100997173.84.2025.09.20.13.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:14 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 17/18] RISC-V: defconfig: Add VFIO modules
Date: Sat, 20 Sep 2025 15:39:07 -0500
Message-ID: <20250920203851.2205115-37-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133916_016774_CC1A2D3C 
X-CRM114-Status: UNSURE (   7.94  )
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

Add the VFIO modules to the defconfig to complement KVM now
that there is IOMMU support.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 7b5eed17611a..633aed46064f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -242,6 +242,8 @@ CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
 CONFIG_DWMAC_THEAD=m
+CONFIG_VFIO=m
+CONFIG_VFIO_PCI=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
