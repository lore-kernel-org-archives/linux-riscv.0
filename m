Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BA1C47DD3
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 00:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hoUHK5dj6MNIUVS00B1h9JUpZxnaiEbQmituwAyflE=; b=i8d61e7GGD0/FS
	oDa0NktuiXHK56231Mfy3yCQjaTD+lF6R9uBKP/7WIBqacpBE07r0M2GvHm9955ijGyFKRRSY0zHd
	lWi1kME48iejyF4sULOVyjEPho27XVF/pw9VZYzyq4mehAxDQe+Q9rgmWkUYhtjQ1jQ1f/UDydhff
	010WRWTrSyBFBkR1w22JxmxaucfFFMdujTJr3d0OMjgrZiz1QMh9EGEesVGUjv4RdpYd2x1XUGisN
	yiL5e8zH/dKW2WGM10mphrKCwubNu4awK6p5YTgDZJtx8HHDnj40GaYjj1KsmRt2AiRvUcoiKptLR
	qPU0ua2eCznECAYJ3Zjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRi5e-00AFn4-2t;
	Mon, 22 Jan 2024 00:23:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRi5c-00AFmJ-0w
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 00:23:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5685161008;
	Mon, 22 Jan 2024 00:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64366C433A6;
	Mon, 22 Jan 2024 00:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705882978;
	bh=aVQvquY3/QZrbd8jHI67vn2mQbmidA09BUUPYfRdUOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FTtQ7CnRAUueJnnwKyKVtqaOwLHuwC50ol1N6VBH3F4bXANTK4yKJAw6z1Bd+7gnE
	 0IIJKaDyNCShEoILNDTHusQSstJiDlGlbnsDfmMniFSVrchtQUhYr3vI3l4khHjkKd
	 h6LcwvPzGM+OP1JHcacDkJnkgZw9TagVLJx1zZXf3RfUMrSsM7aItVVFJokHuMGpmC
	 q0Pw3Argq3++kZn2Cymq+WX+dr3xaTG8SFvmjka986TDgrZ7yZ/BegxfAUzFx6jJF1
	 jY8188HAgmTprMrmSOwzKr/UnrdXb2LuUYjSlIAZy/EkYhh97eiF4C50oT+MFjUr0s
	 44HlDYBKQ385A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	=?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>,
	Jerry Shih <jerry.shih@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Phoebe Chen <phoebe.chen@sifive.com>,
	hongrong.hsu@sifive.com
Subject: [PATCH v3 02/10] RISC-V: add TOOLCHAIN_HAS_VECTOR_CRYPTO
Date: Sun, 21 Jan 2024 16:19:13 -0800
Message-ID: <20240122002024.27477-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122002024.27477-1-ebiggers@kernel.org>
References: <20240122002024.27477-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_162300_391715_6161F5EA 
X-CRM114-Status: UNSURE (   8.60  )
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

From: Eric Biggers <ebiggers@google.com>

Add a kconfig symbol that indicates whether the toolchain supports the
vector crypto extensions.  This is needed by the RISC-V crypto code.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bffbd869a0682..5613b2bb686ec 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -571,20 +571,27 @@ config RISCV_ISA_V_PREEMPTIVE
 	  consumption due to the allocation of per-task's kernel Vector context.
 
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
 
+# This symbol indicates that the toolchain supports all v1.0 vector crypto
+# extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these at once.
+# binutils added all except Zvkb, then added Zvkb.  So we just check for Zvkb.
+config TOOLCHAIN_HAS_VECTOR_CRYPTO
+	def_bool $(as-instr, .option arch$(comma) +zvkb)
+	depends on AS_HAS_OPTION_ARCH
+
 config RISCV_ISA_ZBB
 	bool "Zbb extension support for bit manipulation instructions"
 	depends on TOOLCHAIN_HAS_ZBB
 	depends on MMU
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
 	   Adds support to dynamically detect the presence of the ZBB
 	   extension (basic bit manipulation) and enable its usage.
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
