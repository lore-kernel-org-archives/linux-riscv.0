Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FDBC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 03:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aviPDN82IJfRpqxNlEoxWKYHtkXL7S4FyiN+NVmwHfI=; b=O7TkYv3EiKgEbz
	5i8B2MIm7c2Nug6bPA4jZjY8B3BpBE7AU8VRSWFtFvrAIJvzRaYnRN7zfPg8/WU8N5Ai46MEqQuPq
	VuB+wVxKqi42p6AdTlx84YwQsEg2xeqv+/nVQK1WbX+UnPLt4e8gyV9bJBuzqV+c0gcz8qIfEKx3v
	m0vhaTKgDoCyP+iW/PMZU8X2RclS4G9Xv7mcXUDOK18wgH1C0NqMuV2IHtc+iUzh3UEXwHZ8Fkifg
	a69N68T0Gv6AvHTVT5NIlB9ffBZDgxHVtkqTcYaqSG6ykjwaOre/WEAIgqWVQrKtuxo0rt4uEvXRE
	DZFtHKh8c5yRTYa81eCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxIhI-00000000oow-2Y4E;
	Thu, 18 Apr 2024 03:44:28 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxIhF-00000000onL-1uxi
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 03:44:26 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5e4f79007ffso241550a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2024 20:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713411864; x=1714016664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJMTHk2ffl+E4VuUN8SIjJ1xv6FPsnu6lwF/hE1PNxY=;
        b=koQlTZgsNTQkI1jjtV2KwAWaeN+aoaL6QKw+ls1dbzGFS8SBCSFWCXmZcnDKbiA+Yo
         c5id5Li/OZLwyFyOMJa6eTwXvXKdjlW2AGv5UXGSBVQpueyayPAit1l1mXNCX4pNgD1D
         JPEoXfKpNsVHTI6CjIbW45AWcK3mYr7p6FmPo9Pw0SHE1Qm0shTf/YRjx7qibwb8CQmb
         3MfAehbNWmikkIdExG9Plxip3SPZgVMRZvW7/iAMwJ/FZ2w/DYQauymc8bVvDkE1ysYA
         96oYlzdzlsYSKEEny8twepB0PW6+XBqCvopyYQ5xn+6/VYcE9LJFwXWJ+LEOX72+mRTx
         dBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713411864; x=1714016664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJMTHk2ffl+E4VuUN8SIjJ1xv6FPsnu6lwF/hE1PNxY=;
        b=UlmjUTI9mpLu+bu9S3i4eG4ubkT5YusyfBvOV5zve6xgWHM6inWy307F/wD3UbsItK
         dbUQi72aktAYX/OS9S8Ns19nkdgaZJp7yEsILnkNo39IUKE1xLHcr9Jkb6Pv8YSuGuJF
         pThitN99Um6T5DwQR06jElX/cAjS5fhhiMO5f0ZafNJWmjlX3JqPJSBTw9ZSkKmflPYJ
         ZVtvUeOQR6QSlmghpgv0l0ffyD/dvMl6kJsYiRrpFdAux8cSEGtoX3ULrBi9iXZJDId4
         DJVMr50igyp3TSuLI3ZeJxKuEMJGxGlZsKyakrm/eR/WqJmpc5822HDjKPKt82igfa84
         c+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXDmZ4mKG9TN4VB2+6B39Mawq8isIXPL1/8QWAlrh16YoNYE84JgSTHIdyOKtnorNbqLRB1kuOfIxa7uHbNBgtpYeWOaevvY3i7wBhFs+2y
X-Gm-Message-State: AOJu0YyLb/Cl3MbL9Ug6OleMTxV9emlwUOyLrdTr2rWrIfgO+Vm0z0Hj
	9nB6tFECNrL2fIdafvYHcafECRl/4Rrq7Xp3S+1epKnoD1cDpzq+NR/yM3ZNE2k=
X-Google-Smtp-Source: AGHT+IGNfSaOuVzuIVb16fk0/zNgAN8yvRyFpld65Vh6hV1yYO9gxMq2J7SgUz5g6XQxK1IMaY0L7g==
X-Received: by 2002:a05:6a21:398c:b0:1a7:4a23:69b5 with SMTP id ad12-20020a056a21398c00b001a74a2369b5mr2083909pzc.8.1713411864354;
        Wed, 17 Apr 2024 20:44:24 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.13])
        by smtp.gmail.com with ESMTPSA id lb4-20020a170902fa4400b001e88a4ebeb2sm109880plb.152.2024.04.17.20.44.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Apr 2024 20:44:24 -0700 (PDT)
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
Subject: [PATCH v4 3/3] RISC-V: Select ACPI PPTT drivers
Date: Thu, 18 Apr 2024 11:43:30 +0800
Message-Id: <20240418034330.84721-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240418034330.84721-1-cuiyunhui@bytedance.com>
References: <20240418034330.84721-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_204425_556725_22FF0A3B 
X-CRM114-Status: UNSURE (   7.51  )
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
Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
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
