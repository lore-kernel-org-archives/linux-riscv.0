Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E6BC4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 02:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDTyzKUMYgq0HyvymhD07Mi0MvLp2Y3ck4Aw+YQsltg=; b=YydwAAA3sF/kii
	ru1Ms6TnvdBx4953LnJJuaQZUkpLMEiaHAC6Zoox8PiMhsx4dIRJ4IijrLrWuh0cnNBAviFzMUlo2
	mkRlhOLwTIM5xJ4KAyfig1u2fMYfBjjxF1jZIEaEyh1lTHktomL+YXbt86wVkZNL5rBeN7skGl6Tm
	cUpvWYBzuLcZ/Vq20QzJCcWqnzELiYbAgahm7mMNLlce5dFCJ6rMLWTemWK8dGHq/UqFOKsv3Z5IQ
	BZyZ6LFHX2ULJdfO2ycOmNLM3s2nJyRXqHZ75qYtr/wvkWR12Yte1KytkTabBCnPsf1BfqPpic7bB
	6F0nvnfACJSywrdChv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvq5x-00000004Rn9-2shu;
	Sun, 14 Apr 2024 02:59:53 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvq5v-00000004RmH-0tBV
	for linux-riscv@lists.infradead.org;
	Sun, 14 Apr 2024 02:59:52 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ed2dbf3c92so1605751b3a.2
        for <linux-riscv@lists.infradead.org>; Sat, 13 Apr 2024 19:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713063590; x=1713668390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hheiXqV+1wPbN2r8XTJ5OPePJHFHtIdLdr/kVMTR0TE=;
        b=H0EPAJgMz4YJHcYFMyZ4EFg55oS0yysJYaWxaydN8uIzm8uI4hsFUtORNuEPCTyX7S
         tI+VPUPIcx0f/pJHQSPwUalA3wIGs0Ha5n2NRXagosEY5/21ihryRmFko1c5pu0SU060
         x7KjuL7ihCQm6GkAtiKUJW5WxU22DGSAdrG8NYqXpfKooS7w5l73Qx5+MLz+bLHdscaZ
         8aG80iaNH2M8+sEsxRPO6RBAfNWpkKHfxxOKRF4eZDLgMxCZw+4e8YzscIN0xc36cNZw
         hCjKr7QWl3h4bvK5FinvzGFw7FXWVTib6UG+Ro3ZUl6jOZGZerD8zTkCdrVGhh9wQ0zh
         /WrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713063590; x=1713668390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hheiXqV+1wPbN2r8XTJ5OPePJHFHtIdLdr/kVMTR0TE=;
        b=bLT84xEFP+KR/UhvroVHVpq/04Y+QFzYOKgK0AgGdiuCQrtc4s4QmeVyyTtieGZdE8
         HyEuut5B+J8RGNJPpdPITBJY8bqfo3J7ArNOXsaVfX+caA9759eXV0jiea9ltmzRIt5k
         Xh8uVUOKpj6lI8T6Pio9BDKw9dVlprzknPvlWziXREqfS+ddCwAobRLkcPI0JKox5gz1
         2vWuPZFz70G9BQObfHOrvxgwpCMYomuy/arJA40aT676AN5H0ZpeXY7sV8YmDEnCpHkX
         SZ6blGEaQUpfFbfkqLzoShayyhQeCDenFVNJrB8o1uvrZAlCUxZSPZyf31L8yKPyTVYp
         6qeA==
X-Forwarded-Encrypted: i=1; AJvYcCVJszOpJKmI+rZ9Mj63nLsmS1lcHfcEcdguTaHh28bLdSag4WNOdJcGGEfVJ25W+yhhbD+aIPil/mqj8+ulvv3rlj7+AyA9Lffr4ywVOPFa
X-Gm-Message-State: AOJu0YyVDMoVZTwqK67k/pxEf0ze/bGoCRWKXfwBPpMVLbUvuMGJAQOs
	bW3Q6ETHiEF6nnF5VxGa2gowBZF9znLupEehvPXZSdiI5S5O0wH90BwE4RTqR+A=
X-Google-Smtp-Source: AGHT+IES5ARbziOtU0omIM62ldJV61HnJflISF54CoCezeAWh0dUBTsAEufgLAJHedaFd0waldCY0w==
X-Received: by 2002:a17:90a:d306:b0:2a2:8065:899f with SMTP id p6-20020a17090ad30600b002a28065899fmr4798578pju.41.1713063589971;
        Sat, 13 Apr 2024 19:59:49 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.246])
        by smtp.gmail.com with ESMTPSA id cx15-20020a17090afd8f00b002a219f8079fsm4799913pjb.33.2024.04.13.19.59.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 13 Apr 2024 19:59:49 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	bhelgaas@google.com,
	james.morse@arm.com,
	jhugo@codeaurora.org,
	jeremy.linton@arm.com,
	john.garry@huawei.com,
	Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com,
	sudeep.holla@arm.com,
	tiantao6@huawei.com
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 3/3] RISC-V: Select ACPI PPTT drivers
Date: Sun, 14 Apr 2024 10:58:26 +0800
Message-Id: <20240414025826.64025-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240414025826.64025-1-cuiyunhui@bytedance.com>
References: <20240414025826.64025-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_195951_275536_BC7841BC 
X-CRM114-Status: UNSURE (   7.05  )
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

After adding ACPI support to populate_cache_leaves(), RISC-V can build
cacheinfo through the ACPI PPTT table, thus enabling the ACPI_PPTT
configuration.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6d64888134ba..5d73fcaf9136 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -14,6 +14,7 @@ config RISCV
 	def_bool y
 	select ACPI_GENERIC_GSI if ACPI
 	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
+	select ACPI_PPTT if ACPI
 	select ARCH_DMA_DEFAULT_COHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
