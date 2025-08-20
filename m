Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52E3CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 18:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ry1DV+2Nc+GDgNqS1AMQZMHXzpxg30FAuvqT3ckNwGM=; b=UXjxAaMO/bHldq
	pVgS1LJiod1tGj4kCUxxEn/qv+g7MrKq0MuqGRJqdIYmDrCO+UC7octYlX2sT8fg6Yu9LmLwG1HyD
	fWhAoGUj6Ws18ChZRbsYiuYO/SHWEhvcRcxxNVagLSZEW7cfCVe774FN3RM7iIGRJ5Dh5wOEDhiMA
	gRuMboiUDcWqMVzPrroNfg2qXcgcxUkYIkrOlE92WYX90zQ9l+SfJ5n8u/kYhQu6eFV2pnUEAwLwL
	k/3QTS7FmJAKKOZdCHLk+rzWlY3P+MnzoHW/jI9WrQmhmH0NyIQiEV3FjNTAVY/BkSM7sRO8BUvSn
	UoFsXFUEpezNjm7NJovQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonvH-0000000EiNk-03ii;
	Wed, 20 Aug 2025 18:52:35 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokeu-0000000EF8Q-2nHl
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 15:23:29 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b4717390ad7so4394299a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Aug 2025 08:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755703408; x=1756308208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fgfeAIl9y/jXqZZohjgzAmcbebe2tB8QsVyXyo5QN9E=;
        b=DR9ZQfLV+U1v5bNwhdCc9IuH8tZ6zuOYAisBSyY+jSwORSZ7ZNgolFDTOg1sOUg54S
         wr1Dtee03mP29nvmFYgFB5QnmvRVUPwL8IgpatDAN6a7EnIvptF2NN6EFqQWuZsw3P6A
         9AEqm98HJO7mhZCEu6un62qdWPssd/udtGuw81HieDI7EkQMhePyKM2oyyHFLMWfYy7A
         P9Hc9NkOgVQdBEshBysJpErWmwqaHWVT+fNqpXiGP3Y1n2CX6iabbHSDlvbgKPV2Fau/
         TZ4j9L1WnXfdXulwFaYMeob70+7WUJO1dtgO1K8Rnd5FKSo9gFaivdjSFuF5txN00oy2
         N6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755703408; x=1756308208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgfeAIl9y/jXqZZohjgzAmcbebe2tB8QsVyXyo5QN9E=;
        b=vC85BfQKXQanZp5a9cT6nwFf56MlShXCyFJgrMeMpVchCp3vzxDXM36glPzauq77L9
         tC5VB9CqZCQj2vg+ma3eNG1cyK8OWbkKQ1nNhDS3qsxb3lKskQURHm+z7ZXuzSt+UzYY
         e6fPtTPaF1Mba8wEhsJ17rchio0stPAf5acNBFlkyrmD00Ou8XlRZcnLOoez0gQPD2xM
         GD/0tvk9PtXksYN4lHY4jt9RnTisay2iIsUYl16WR1srZosE/UiA19eF0gtxODht/5KC
         udP+zuOKraadC/nz6Ey988amDgXNiz83sUxLArCSc/YltY2E3eMGOWrkd9AYEVg+lgxh
         SVjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0woquLGPfNanfParLLVwR8WPuKUc+rksKL6nbqe+gbkhZTImQncwP3DYtZ51GglQhbQKMpgAEmYTnRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxKxdWnf+noAMCd84H7R90cgsfPjFxThTPQsDEJHRJFVE7/l55
	uQB80V77pa0YuVEKbQeWSc+pgeT7v8xAU9RIquwZIvFjyJAfgDhxkETqFnBvCasOLrY=
X-Gm-Gg: ASbGncs5KV+Og2rivjcTV/iXxNtZMoRegcuLd1y4fbk1rQQuei9P+LAxtpVu8yBO5Hz
	cXYkH+WMsY0wAOuAYAXpyi4OBmqzqx3F7CB+6g34wsrEgoJs00q50sqkeNiffCjrXzRvFEGjqrt
	iIgM8rwcUFCXS1LVrbHKAi5N3lo3xQmiLyrNq4DHx16wkdaQpHw+agcQbJu10y2+izY2O63tAwB
	CyTiYBkYXzgEEPSeqcNS9+qwRIJBVwq7IDrk+ZWVkLV8CukQUGaFvBpY4Kf+3zlGAVet1aET2mx
	9O07PpY+ch5oJuUPFn1ajfF5KWGldbl+TUY7mAiIEN3ZyCJisYreiiXlAJ/KsVrKdMC6fNjpVAJ
	x7KGKGPT3o6bd3qht83SdUzb6ycN20+Ms7TQzFJ808Tgg1CtqqljRsOS64cU6IA==
X-Google-Smtp-Source: AGHT+IHm9VcX0JB5QQASYW7fbLTywDvuuwEyBtgVN17jvgGI1TvIKfWIoHfTmY/OqRH50W5c11Od6Q==
X-Received: by 2002:a17:90b:58cd:b0:321:74d8:b95 with SMTP id 98e67ed59e1d1-324e143ee97mr4972876a91.19.1755703407577;
        Wed, 20 Aug 2025 08:23:27 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e26259b6sm2638689a91.17.2025.08.20.08.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:23:26 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] RISC-V: Define pgprot_dmacoherent() for non-coherent devices
Date: Wed, 20 Aug 2025 20:53:16 +0530
Message-ID: <20250820152316.1012757-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_082328_703243_1374F0DA 
X-CRM114-Status: GOOD (  10.61  )
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

The pgprot_dmacoherent() is used when allocating memory for
non-coherent devices and by default pgprot_dmacoherent() is
same as pgprot_noncached() unless architecture overrides it.

Currently, there is no pgprot_dmacoherent() definition for
RISC-V hence non-coherent device memory is being mapped as
IO thereby making CPU access to such memory slow.

Define pgprot_dmacoherent() to be same as pgprot_writecombine()
for RISC-V so that CPU access non-coherent device memory as
NOCACHE which is better than accessing it as IO.

Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 91697fbf1f90..00d8bdaf1e8d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -653,6 +653,8 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 	return __pgprot(prot);
 }
 
+#define pgprot_dmacoherent pgprot_writecombine
+
 /*
  * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
  * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
