Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42170C61D9D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCB9iSwT78OGWYajjdl2XKNBw+nfl09FI/3Xh/DqsRU=; b=DD68Q9SV6wva7C
	T+FZrEMTdtXascS172ld7OI8IoYTo6eJxkmHG7EsdMdWD+NUrQV2xJFJN+Lw0gSSDdzlcDpqcwxuN
	ItqKOQtboBt4StaM25vGhGE9u+QqoZbOMl0EqXmLgStI6PQuQse50EzHR1Q2XUytnY6tOm5xMFyjT
	3S0MdFVzihiMlbTu6/HMxjnc86m2z3At8PdBr3px1aJdg2XPTpSfvfCnzeJo8wlXrDiK+o6M3xt7o
	mOblSo+ub6sI5XLvhO0qEJqLWwC/6STzClS8KdXzBz5sxlMfVsJbCxsA48ZGgTygWGXyh6M0pzO8b
	K2Vps3iAMWlirVjAJWsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jlZ-001FQT-1w;
	Wed, 22 Nov 2023 09:43:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jlV-001FK1-1B;
	Wed, 22 Nov 2023 09:43:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 80875CE1ECD;
	Wed, 22 Nov 2023 09:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEF8C433AD;
	Wed, 22 Nov 2023 09:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646202;
	bh=v46aUsbCUkfVZOkEZ7v0IxSRHU/syZrce+2sfpMy+L8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iIJ0MfSfGFe4BnLUwdW5xpDU2/xqYSBGq5Cj51zuM4YqUFdMnvqeDyfxsUIisnU6b
	 wUw0U8Wv0OtRwL9eJwl7JUSwkLZOKIYuD0AugCVQlgzdKZYYavos+tMW7NTLsmFKcC
	 fUTaeAlnathNNURAxXfaZCeWFV55cs7UylMWhaFfEfZ8KPnWdlZD6rgrcgdbSK7hJg
	 WbfctrcjTBpV2PpOorXe++LBEsLPqSRTj7lS0IvdWzi2ge+pX7iP5nGGrqwFD3lC2V
	 BENoY33CIdapQ9DEX5gbQnb9HvHmnMnFes7cCOy49y2tQGmmB3gDv/79PJIL2Tb+ak
	 6A2RQiwxSADUA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Nov 2023 09:42:14 +0000
Subject: [PATCH v7 04/39] arm64: Document boot requirements for Guarded
 Control Stacks
MIME-Version: 1.0
Message-Id: <20231122-arm64-gcs-v7-4-201c483bd775@kernel.org>
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
In-Reply-To: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=broonie@kernel.org;
 h=from:subject:message-id; bh=v46aUsbCUkfVZOkEZ7v0IxSRHU/syZrce+2sfpMy+L8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlXcz58KUrsysjlaWSzO1jYK55QY/WSRM85IGvg
 PxdQ5ZK0xyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZV3M+QAKCRAk1otyXVSH
 0B0qCACCvoOJm105lKv2ZPLjhkUmi7fDdR0EajV9UTvtTmDuiS9RoPv6qew3skKRJ2x99xSPM6Z
 MtWo+pWCObUZ/Em3l5ZBxXdf54PqlfguR3WeFcjJxgyWZFoYUbPGvfavfrfotOZEl8YyAR60lkT
 CE8NmFmf/pIXk4tmlokj6+AB4XXUAcDtuWo7w3VyW/4oC8t5jYKXNeusb7+/D03X7WNhzaqtsD8
 E7hAKjI9aCqrTPVhf4fOkVUbCxisy/HohyaibsbUO56DDwyDFqhYNMmUsjPSZSKQXDMaY7nzsiX
 E2K+UxJ8O8oozTh0n/yiPavYQ+94mTSwGH/LNau3iMTKY0f+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_014325_779960_21704D62 
X-CRM114-Status: GOOD (  10.49  )
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

FEAT_GCS introduces a number of new system registers, we require that
access to these registers is not trapped when we identify that the feature
is detected.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/booting.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index b57776a68f15..de3679770c64 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -411,6 +411,28 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HFGRWR_EL2.nPIRE0_EL1 (bit 57) must be initialised to 0b1.
 
+ - For features with Guarded Control Stacks (FEAT_GCS):
+
+  - If EL3 is present:
+
+    - SCR_EL3.GCSEn (bit 39) must be initialised to 0b1.
+
+ - If the kernel is entered at EL1 and EL2 is present:
+
+    - HFGITR_EL2.nGCSEPP (bit 59) must be initialised to 0b1.
+
+    - HFGITR_EL2.nGCSSTR_EL1 (bit 58) must be initialised to 0b1.
+
+    - HFGITR_EL2.nGCSPUSHM_EL1 (bit 57) must be initialised to 0b1.
+
+    - HFGRTR_EL2.nGCS_EL1 (bit 53) must be initialised to 0b1.
+
+    - HFGRTR_EL2.nGCS_EL0 (bit 52) must be initialised to 0b1.
+
+    - HFGWTR_EL2.nGCS_EL1 (bit 53) must be initialised to 0b1.
+
+    - HFGWTR_EL2.nGCS_EL0 (bit 52) must be initialised to 0b1.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
