Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98255C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 16:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d3gauTvBMeotE0RM0dhpfutCY29Z01MUlv7xn4IyTjw=; b=iKeGK9axugyAEm
	Il/46zs+65ztmso3sjuimW6pH/pFWjr+wzjoSLBfmPBALt3cJQoUgYyzJ3J3ZQymm8/Uc2A6Zn4XW
	Vq4v1DRRl7U4hA7hgy/mAYOXo3YV1MNu2MhUz6S2tBt+IEtVWPnfPbjJldkUJcrNSV72JNbPOCTyO
	SH0Pg4Ed7X9f1mMNaBaaY0aKqxh5pRb8Ud/T5H6NHEPWmjI7ppfazR0XEEpS5D2IGMxQrX4phZtXj
	Wpt6OyMgTJiDBCQBkHJ4WidyDt/QxOwbnPfyPHqSd2S6UH1sPj84AaqyiRqJoo+1zruBSjlxnCvI0
	jgupIjHhNeU1zaBn91yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8pg-00000003euz-10qA;
	Tue, 25 Jun 2024 16:15:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7gj-00000003KV0-2qKX;
	Tue, 25 Jun 2024 15:02:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6EB0ACE1B7F;
	Tue, 25 Jun 2024 15:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4C9C32781;
	Tue, 25 Jun 2024 15:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327746;
	bh=TArF8eu7bR+kdEQcw0PtiH938ElhCp6XbYhZJoxTCrM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T1tf4EPZxQepBQJZ+2P0ysocX15TlkKsctCglrLlJlpjTmopmLVcDgRZfo2fIdmZD
	 Lv/NFHftNTdwBf3DqfZoSYfV6WuoyPIQEs2TNGXOriUMN11am9Hf5vq5ldwCQf9dmn
	 0E6qSnfvlSNhImxN7J/5Esjy55MKMRoTeQxGdu/7rc+s6RaBqycPQCbJ1TvVIWnutd
	 b0q5gHzn3xZPm6Kw8+HEdwKQCSqhFutpjECRBpgQ1baiTggkrS2AIXDeYXF3KKOsEf
	 YDaxMulmfJyDO7V7EcDfLhjZVhoJxdoOD6NAE0/79RPpuNfB41K0JcAzwYXIXZ95se
	 U9cnQ8VrLX3Iw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 25 Jun 2024 15:57:43 +0100
Subject: [PATCH v9 15/39] arm64/idreg: Add overrride for GCS
MIME-Version: 1.0
Message-Id: <20240625-arm64-gcs-v9-15-0f634469b8f0@kernel.org>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
In-Reply-To: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14-dev-d4707
X-Developer-Signature: v=1; a=openpgp-sha256; l=2079; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TArF8eu7bR+kdEQcw0PtiH938ElhCp6XbYhZJoxTCrM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmett9kBlIGznTOvZYNu30sR1HSi39oURagt2PuqvD
 Y/xML0+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZnrbfQAKCRAk1otyXVSH0KppB/
 9h/NsU5ZbvEakpJLVgdEkxvY5UpqOW1ugkUmSI7i1GKJvwyAjnAS2GjipTcPYY971hQbCdfHwZcLlW
 cGE4g62zQz3KJInv2E7a5LvVkEoEx9xQoaz4HTnvgXRkvw7mt57wnleIJzA434vuYSF783mIrrb/33
 UM4KkpS3btWvRrCRi2VY8VDuFhRhvl/BAYFalo/nvTDQt/Bivon71MD9KXQCaREWjPFWn45DqF5xqc
 fgB9TM3IcC9LyqQXwPr+ng36ckx4ht13tLxNrKJmclwsKt2v/DvuX9vgsKXW5FMhSnNTPvaVjaVXuC
 UWd9Pvf2d8i4vTpWJR3H1tCTBLdgiV
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_080230_624263_F6932327 
X-CRM114-Status: GOOD (  10.10  )
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
 Documentation/admin-guide/kernel-parameters.txt | 6 ++++++
 arch/arm64/kernel/pi/idreg-override.c           | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b600df82669d..c1151d547b81 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -437,9 +437,15 @@
 	arm64.nobti	[ARM64] Unconditionally disable Branch Target
 			Identification support
 
+	arm64.nogcs	[ARM64] Unconditionally disable Guarded Control Stack
+			support
+
 	arm64.nomops	[ARM64] Unconditionally disable Memory Copy and Memory
 			Set instructions support
 
+	arm64.nopauth	[ARM64] Unconditionally disable Pointer Authentication
+			support
+
 	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extension
 			support
 
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
