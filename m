Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF0CC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 06:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YORjoXXkqRHyfmBRDXvDVb5pSwWsp1qMyIwOnu0629g=; b=XROL1tk082RrVS
	ZG4N95DN26uPB8cDbnkxHp9sluDnUFDn2R0T/lh/rApuasyoy3cG5fC+lAx93fYlw98G0v+THzx0l
	ImQsVnxrEqkJWgu1UNtibX5FbV0RL/JUF2gNIySHHhrKSOhnIPG0kzBNk5mOKN6qfUtZMXzO5pSVb
	9OSL1O0wDGfqkTSXzpDb5kg0OIrSKzPVnPmsDBGIfYPmUUAvGq4kRpmMK+mUCQVhW/gCQ8YKgafG0
	XThuOLJ0kNvGFqoctBUgCnHfVz7gMnNwyQMuUC8aoadBnTkn9jW0q6ZEwrbUwF2c0FdpQ9ClTZsxn
	I6X7CKMGmkHfw3F51Tag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKYbd-007CJ6-0p;
	Tue, 02 Jan 2024 06:50:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKYba-007CGa-0a
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 06:50:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 05B7CB80C1F;
	Tue,  2 Jan 2024 06:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE451C433C7;
	Tue,  2 Jan 2024 06:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704178223;
	bh=27H198mfFlg5dXLC/oksp1mcpXEcuJokQDeBYx0aQoY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LekdIHClfL7jGei4zMmYx7yDpqNzFa2vP41Ce7SFYItp8gfUQdUpWnX2Npp2Y14Vj
	 NAFhqo1z54zhnN5Kt4cEkBdD1kg18yjObC/MLNDPAAQIb38m/5leZdC81QjrARzgSi
	 49HQ+EbrqW8Q4WBk2mDbdf5IshVRs1h9CW4ecEz4rpll99jfFaRrOoRerFKKRbZve7
	 wnSCF+q7X3scrxXMaoR/7qSlT6AyxL3uyr4ZEUg4r9/madgi7jvNX+L5hK/UO37lG6
	 8s4wJK67VNVruoC2b3k3jO1oQ2lGVK/wt/JnAlvQLfyuuzTz9STtkqZ2h4hGxrBKKs
	 k0mt6rGUOIu1w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jerry Shih <jerry.shih@sifive.com>
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Phoebe Chen <phoebe.chen@sifive.com>,
	hongrong.hsu@sifive.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>
Subject: [RFC PATCH 04/13] RISC-V: add TOOLCHAIN_HAS_VECTOR_CRYPTO
Date: Tue,  2 Jan 2024 00:47:30 -0600
Message-ID: <20240102064743.220490-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102064743.220490-1-ebiggers@kernel.org>
References: <20240102064743.220490-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_225026_383989_642BD216 
X-CRM114-Status: UNSURE (   9.61  )
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
index 95a2a06acc6a6..bf275a713b1b5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -526,20 +526,27 @@ config RISCV_ISA_V_DEFAULT_ENABLE
 	  If you don't know what to do here, say Y.
 
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
