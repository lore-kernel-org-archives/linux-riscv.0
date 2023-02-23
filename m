Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5369EC64ED6
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 22:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyCyDxaCFR6Kg8U7JQ1PK2Io1h0nYvnLlxnT+SRQH3A=; b=J931VSq9CfkVZF
	KkyCg9pTr8udCaTlZ47piLeaPIHNHl6BzbyBEeW5iu/NWEzB0GyilRSczzyGYVIOsNdVTDct0WBRS
	3m+FYhXoSL3AfJ7tKZgv0f8Vr24kDxUElJYAQKitKN5BFktuSXFBX6R/sy6vSK+R8wCKgu2tdyHml
	DL4KmephkYja7AxxLYNwUbl/AdAnWIpzHlQdH3eVPq0FSTGFbxP6cWUwDAyVBEQG3JLVMy/L41p8Q
	f1Bag+cRlUmTfQpv+8h7YHHbTtr+3MQqUbFCnxqd6psR3yOGDNh3xu7ILITDqnOhCUyoj0S/Bnzst
	+6hO0XfwMwd5xVFfE8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVJiz-000S7q-B8; Thu, 23 Feb 2023 22:06:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVJiw-000S6H-6L
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 22:06:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CEF6DB81B31;
	Thu, 23 Feb 2023 22:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BFEC433A1;
	Thu, 23 Feb 2023 22:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677189955;
	bh=slfG7arzy36WwKxB6a02WckmWCrxgVshZ9ipMm+MbAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jjC9HaRMaE3mFXKEUaVULPc9m1iDc/hx95PCtiDqHc2cdBcfWmROw8ruIEZcRYMyO
	 7EUUf0Kpt85PugWS3Uja5+2/x44+EN1obvP16C9MZJdVkM6TQKXsrnlo48v26GshYV
	 3qm4Y1bCw0nXtjXU2YHpiQQ0wvQIkraKGPbgBWPR1LcDiKWXlirARtSth4aSjUz0JT
	 uu/j5QQc22HuHZMfZvUQXoxAeqp902dtn8/0WVB+55ClF5bAlEK29w5Y/u4MrM6vZ/
	 4mip6m8gBdB75d+0HANAALiL0IleLangMVtLXAe6jVJN13ca9g7ZVAdT3odrXyYNYA
	 3Fdb3nw69CNbg==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	nathan@kernel.org,
	naresh.kamboju@linaro.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v1 2/2] RISC-V: make TOOLCHAIN_NEEDS_SPEC_20191213 gas only
Date: Thu, 23 Feb 2023 22:05:46 +0000
Message-Id: <20230223220546.52879-3-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223220546.52879-1-conor@kernel.org>
References: <20230223220546.52879-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2084; i=conor.dooley@microchip.com; h=from:subject; bh=hciiU41cmccFKM8j8MWjmtv2w5WAHIGPZfhA69tDbBQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMnfH5veX95Re3Hn9dn7+b5fb9QQeHz+1EqG5+LnJueqWa1s ndhS0VHKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJiM1iZDi5vSS4Qko08uzpx6kJ8k J3r1Ql/i++bMPEk7b+5tSfR84w/K/bUapSOGc6y3bx46IXtlkmlpTuEjdfJdJ7zfKXRo/eKRYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_140558_555923_D7264F9E 
X-CRM114-Status: GOOD (  13.65  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Quoting the llvm docs:
> Between versions 2.0 and 2.1 of the base I specification, a backwards
> incompatible change was made to remove selected instructions and CSRs
> from the base ISA. These instructions were grouped into a set of new
> extensions, but were no longer required by the base ISA. (snip) LLVM
> currently implements version 2.0 of the base specification. Thus,
> instructions from these extensions are accepted as part of the base
> ISA.

There is therefore no need (at present!) to carry out a $cc-option
check, and instead just gate presence of zicsr and zifencei in march
on the version of binutils that commit 6df2a016c0c8 ("riscv: fix build
with binutils 2.38") highlights as the introduction of the requirement.

In fact, the status quo creates some issues with mixed llvm/binutils
builds, specifically building with llvm-17 and ld from binutils-2.35.
Odd combo you may think, but this is what tuxsuite's debian stable uses
while testing 5.10 stable kernels as doesn't support LLD.

CC: stable@vger.kernel.org # needs RISC-V: move zicsr/zifencei spec version check to Kconfi
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Link: https://lore.kernel.org/all/CA+G9fYt9T=ELCLaB9byxaLW2Qf4pZcDO=huCA0D8ug2V2+irJQ@mail.gmail.com/
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4eb0ef8314b3..c6902f4c5650 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -291,8 +291,7 @@ endchoice
 config TOOLCHAIN_NEEDS_SPEC_20191213
 	bool
 	default y
-	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zicsr_zifencei)
-	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zicsr_zifencei)
+	depends on AS_IS_GNU && AS_VERSION >= 23800
 	help
 	  Newer binutils versions default to ISA spec version 20191213 which
 	  moves some instructions from the I extension to the Zicsr and Zifencei
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
