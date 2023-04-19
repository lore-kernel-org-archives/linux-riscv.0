Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA28FC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKK1IFaNdsde0QdKuAs1Y9sPt1uS4m+eQ29IbFCaLfY=; b=HDBA8VJ4Wj4qW5
	Jmrl/gKDnjKU7XPYA9CyhfUR2OxI5Vcv2C1nnVdEYiUaS4CUetw36WrqSktfibxAFuFTJ9bQf23Ha
	xt2gz+MH9mWK7+B+dZJa9fBY6HCu9pqEgOWLMOqKcdkcR3GsIlLYYp1VEWur060mUt81imlTjhCGG
	ryWfVlgrUBryBZBKR/tNY2sZlkvkp+KjmJfPIGppvISVbAXGN8i3JuVnxffS+O1eHTpcdjTnMeyR1
	jKntas0YCrMdwa6sxZex1EEJLY+UxR2WKWhaPyrPJPSaBbYRmUpZwXByx7s5G3IsuCc1rt8dakqtq
	NGQ/5Si0mSxLtaSztkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6il-005JCf-2n;
	Wed, 19 Apr 2023 12:15:35 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hj-0058C3-1s
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:30 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1a66888cb89so25361625ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902625; x=1684494625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hp9NpznKrrhFUn5kY4plzR5MQ6NWWu6XSocDBe3Nh8=;
        b=bSlEbec9/6HF6hffS50ZidbvyeHeOIIlvjS3fkxYt9p2ccPaMCloBmttbuqqmsN+pP
         DQKv+mly9xKqQ4DR+95+zT4hxj70m32RkOVien5/iCyTKT/aF057uciiXJCz04ujXg4j
         9UYRl+7MZAmd5jQbkwrSe4SmKcvX1AYAsUQJbwA/7i+dCzahPypNFubuZwsTbBHpKRkV
         nM3OfcozCj/et54NEGR796BoVTOz7l/50j92hxQPhew31E9fQbhqC9Tiv0CFffEHVVLL
         qGT+FuApfG1S8zPBFa1RInxm7TqmigulH7DtfZowilsJGVx+WXKTVPZlCDvlmAvfTUZP
         uFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902625; x=1684494625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hp9NpznKrrhFUn5kY4plzR5MQ6NWWu6XSocDBe3Nh8=;
        b=TOFZRzDfrVII4sH440cMpaG1jSX5bdA80vR8s/DVP3l9iEP6jbhC7Q/wjjUgD1WXu+
         Vw+VEX1ws3BLbjXxus5MGLCZlexQaUOc5lsZn9zcm13c9Z8OrTmv8x0LpJ++mCAfQ5M9
         XQg98p81hrmWG+9tbJFcD2gMFLbee+pGHv91/8ZKY0sUmId0B5rT6R2FpgJ8QCMJmFiH
         H5V3zaNVph2BZmE8I+9vgkPwFkMN0s+hJ7MfpEtW7eqCn5qtfh/egQTISHpCrvwiUwd5
         dNefg8kKSumMZYWkocse2y2Ziy/DiK8swpBsX26EIbm/K/DXEHJIFZbj8wuxhbEFHsgr
         YYeA==
X-Gm-Message-State: AAQBX9fx+RG+jxi1mhNujTiSlpHKs4LgyqVoCRWHOqr4rAAmljRdRmXt
	mZkVjUxNGzkAZibKSfVTb1s82ILkfIbVJvXE8tk=
X-Google-Smtp-Source: AKy350ai+UBLN/89dPos+Z6tfCAIHn5xTLWvbGJuKVAtD1FBL63oRuudBwAa0ym8BXor3JGzI2co3w==
X-Received: by 2002:a17:902:ee4d:b0:1a6:9f09:866d with SMTP id 13-20020a170902ee4d00b001a69f09866dmr5126919plo.61.1681902624856;
        Wed, 19 Apr 2023 04:10:24 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:24 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	x86@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	James Morse <james.morse@arm.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 10/21] RISC-V: QoS: make CONFIG_RISCV_ISA_SSQOSID select resctrl
Date: Wed, 19 Apr 2023 04:11:00 -0700
Message-Id: <20230419111111.477118-11-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_041027_688475_B598522F 
X-CRM114-Status: UNSURE (   8.98  )
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

Make CONFIG_RISCV_ISA_SSQOSID select the config options for resctrl:
ARCH_HAS_CPU_RESCTRL and RESCTRL_FS

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 9d4c8c505191..683349c2e809 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -401,6 +401,9 @@ config RISCV_ISA_C
 config RISCV_ISA_SSQOSID
 	bool "Ssqosid extension support for supervisor mode Quality of Service ID"
 	default y
+	select ARCH_HAS_CPU_RESCTRL
+	select RESCTRL_FS
+	select MISC_FILESYSTEMS
 	help
 	  Adds support for the Ssqosid ISA extension (Supervisor-mode
 	  Quality of Service ID).
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
