Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0C3C71150
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfbC73gE1k2YttRwTbDRfjtEraMGhnMEkmKsvNCiVhY=; b=wMzcbe0lJswS7y
	cf+hB5JqcckCHBNjdqSzgOeW1R674qQbucaqR1JwOHY3CHrFZfNOJoD3BUGYNqOb3R9PuyjDbMqmU
	8h/VEDoRw3LTfFqfNCxYSfyLokZ3+Hmt0WWUVjI4OUoKZrrhSbz9ZZpG2wWEncfHSAqLZzNQ/JTlA
	vZGtV7y86YhDAFMFRLV0Ze8nPIfs6r5TGApsJmkwyK923ZLCtyMF2+lWGE2LNAtsolZ1tXnkHqGKk
	iwcJr06Z3+M6jT+s/1W/+POjsfDL6eZPlTiXnqFA3j55D09BM17J+dDjXe81XbsqW2UAfyXpabSuJ
	pvwaOXAXzM6teFVDCGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSII-0000000HRfb-2qz6;
	Wed, 28 Aug 2024 23:41:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS7U-0000000HMVC-3Oej;
	Wed, 28 Aug 2024 23:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 16A11CE1736;
	Wed, 28 Aug 2024 23:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F90C4CEC0;
	Wed, 28 Aug 2024 23:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887830;
	bh=wjYe9ivwzmH2HU5Bu/krsN+hRENYTgl1ATQJfRBTR9I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lIbQQA5yebhqqE70nAuqgNR3tkh/f6rCrVtESiHZp3rzWZDkpq3TMxRtFLJisJc1C
	 k6syrHZlg6DrCc8Kvoj9sUEy6VMLQxh3OceDdWlqMvMCkWUD7d982XWSa+OdUKB5ph
	 fo+PchcSBoAEfB2IV7/rwPqOZNO0NGwQDZesbLUksruMraMqOYSnj+4h2qRlstYDiY
	 JKAH2z9UL1KiSR/Cm+TDjnG2GJFsfLSQ0Lc8OzLdkf+5Gtb52gCQF+mMwJglnD0hoo
	 ucodW81ooVhwrTweu90KLRFMCJaY2t/RWXgFbuFVDhg1GgbqC3wMbr5+fnT8TvTJQf
	 TWBIiD9D8gnwQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:32 +0100
Subject: [PATCH v12 16/39] arm64/idreg: Add overrride for GCS
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-16-42fec947436a@kernel.org>
References: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
In-Reply-To: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wjYe9ivwzmH2HU5Bu/krsN+hRENYTgl1ATQJfRBTR9I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7KFAReHbuS7RCcLtps3x4CwuXAzGuonS9h0Xm8V
 n2UpW62JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yhQAKCRAk1otyXVSH0KO9B/
 9/OcoGpxSpHi/K8N7HKdwcDjo5X0BCdJlr1zjFK6/Mc0oZ7PGJDmIQFdUqBaGdjfltp6Rwmt4m7RZ+
 9F8TvVKqgOkl2sPrIUZ69dfurycmVlEC+1l6FOrv52pOxuegJf/x/bkpQMRN48IJN4OxdmB2AsxWpt
 5S8vVLmYFF+kWZ7YBF7R1m4n5Ui67OpPO52vXgtVJfoZ+XvmKvVChxUzTWZSjHLOY46+WVKOGb74a1
 BN1pGHzu4cCCWTuG76JTbxEiK3PS51OmZPqnaXiGZTJaJDfd9k+wa2I/7UGGyXb1S6wndNiTyZvHqq
 i4rZ0mp4l/YuxFW0rfR7UbAsU3IVzO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_163033_261277_9A5C7047 
X-CRM114-Status: GOOD (  11.06  )
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
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
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
