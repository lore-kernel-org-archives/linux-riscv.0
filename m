Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5758C5321E
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 02:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tuBQEgMI61+uFdfYxNRlLpecUvJQDYV4ti4cwTeqd04=; b=LU5fQC8bfrfX9+
	rq+OkUU5Ia8lVZeUrp3ieAL5abaIlKDC7v9vEOAZQdbvVFX/znmK4ZE2/ZuBAvbQM9B2x4MR+V1DV
	j9OzY4xLB3SH+zieoSv+SvFcz5GN++n4I5gbSShLyuxFConETh7naEK3x/ro4+DFcvMUIxRnzPRLT
	PnQ+vCFXU68C+DvP6s76yBIRKd2Im3LUp5qccXluD66tyGN+2hdif4yAkyiW05TDvePmoN3q7Aar3
	9uU/5PI+Gn+FG8K4ysqQOoo5Wl75p1GxCndJ74j+JcvBE1xMHuUAlUoRzK3AKHhPdFQvXoA/tmIdf
	7GNo9Huv3E7F4RCkvajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgxbE-0000000B4Ie-0xnA;
	Thu, 22 Aug 2024 02:30:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwTy-0000000AsDO-4AyY;
	Thu, 22 Aug 2024 01:19:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 405B0611C2;
	Thu, 22 Aug 2024 01:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48B0C32781;
	Thu, 22 Aug 2024 01:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724289561;
	bh=sM6ARMSzs2g0dbHkgGbbEwKAjUQqEhC4Xbb3feAOKmM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ivuKgD4on+C7+YhBbtby4IvVq0RxF5/bBnr2MIUKiL3RfsjHRaLfUWjrd/hoOkypi
	 e5oVdrksEIE09GHZZ1grqgllXSGlEDPePmVsU7M80fXrCJvMLa+IOAqlM1+qRPyefT
	 NDUMeFDAHPBoXvktlWhOxdzO2rdFQlY178qnfUC3rm4Z+F/Utr6VLItE1zn9NpiWjM
	 tyFC+TuvGcYhcMAJweOwV0VqEtP1ItN5OzDAcmWealbnPLZYZTVCmu5TDgUX36j+xm
	 hBL+YaIBVHz4YB32atTfhUVZDEps5Lz+5jhEsIfqxzoZtgyLuLZph2EmpqaRb2tecw
	 P/DJmri42EczA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Aug 2024 02:15:19 +0100
Subject: [PATCH v11 16/39] arm64/idreg: Add overrride for GCS
MIME-Version: 1.0
Message-Id: <20240822-arm64-gcs-v11-16-41b81947ecb5@kernel.org>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
In-Reply-To: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Ross Burton <ross.burton@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sM6ARMSzs2g0dbHkgGbbEwKAjUQqEhC4Xbb3feAOKmM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmxpEwGtjAb+Lbq6W5IxNjQfUxybDiSmB4j0xd4UwH
 +MPuN7mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZsaRMAAKCRAk1otyXVSH0OdpCA
 CEOwzdvcro2Y/zsVAkDS1Gh8cqiwIlyIDREbBn+Y1Fsz928BKFuNCbEKy7zALRTxwtRrlYxNM9ZJl8
 v6kBCKRDXGCRs98LRzPScxPU+FhtqEHbzd58yzE/ITWCObVM3dIfqSk1nd5rqSljitoRrI5Kx1XQYV
 reoDx/QxEVXfbj+YAbA297F3QOBTCghWQDCw4v4wkEH9Z7B/dOGjQVjJmxl9Wejbw9+9iT0x0PJDnN
 SwIXivwFaJ7YaXO7TSqvUYuVOOn7lmltxhmeimqnTp36IqnALj79krb8UmEeBQbeBn5DHxK5DgJzy6
 WY4Wviz9IEqS1ZQnNP7EKG/eX+Mm1s
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_181923_202865_8FAFF04D 
X-CRM114-Status: GOOD (  10.92  )
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

Hook up an override for GCS, allowing it to be disabled from the command
line by specifying arm64.nogcs in case there are problems.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/kernel/pi/idreg-override.c           | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 09126bb8cc9f..e6413bb8e6e1 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -441,6 +441,9 @@
 	arm64.nobti	[ARM64] Unconditionally disable Branch Target
 			Identification support
 
+	arm64.nogcs	[ARM64] Unconditionally disable Guarded Control Stack
+			support
+
 	arm64.nomops	[ARM64] Unconditionally disable Memory Copy and Memory
 			Set instructions support
 
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index 29d4b6244a6f..2bb709d78405 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -133,6 +133,7 @@ static const struct ftr_set_desc pfr1 __prel64_initconst = {
 	.override	= &id_aa64pfr1_override,
 	.fields		= {
 		FIELD("bt", ID_AA64PFR1_EL1_BT_SHIFT, NULL ),
+		FIELD("gcs", ID_AA64PFR1_EL1_GCS_SHIFT, NULL),
 		FIELD("mte", ID_AA64PFR1_EL1_MTE_SHIFT, NULL),
 		FIELD("sme", ID_AA64PFR1_EL1_SME_SHIFT, pfr1_sme_filter),
 		{}
@@ -215,6 +216,7 @@ static const struct {
 	{ "arm64.nosve",		"id_aa64pfr0.sve=0" },
 	{ "arm64.nosme",		"id_aa64pfr1.sme=0" },
 	{ "arm64.nobti",		"id_aa64pfr1.bt=0" },
+	{ "arm64.nogcs",		"id_aa64pfr1.gcs=0" },
 	{ "arm64.nopauth",
 	  "id_aa64isar1.gpi=0 id_aa64isar1.gpa=0 "
 	  "id_aa64isar1.api=0 id_aa64isar1.apa=0 "

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
