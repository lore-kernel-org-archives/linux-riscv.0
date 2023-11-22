Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F28C61DA7
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpI5i26XyTjdQCW+VNZEsAqw1N6H0efh2rcZOCtzlEU=; b=vZUkKDBGnKNRrc
	JKUtCoLD2JYRN9P7VZmex1/sAsnfztnDhpvgn/wwQmCM8PsL5/hCE9g0lCmTyYy+y7rPSisSE3APl
	MMhii9OREX2/np+E1KtMNCZAXavBdAJF/9+GVXFv5x2caVr2BjzE2GiWDmcDFmF6kDlay7Dl7Gh4a
	fDpcWchCs3BwfiY+eoLYkTmhoEfe/mrtPE1FpZWyTBgOsHvI/eUd0TI9BmvJ12Tpc5IU7rjx6DxvJ
	Xlz54ugS6YQXOCspXd++/JTMjarRUKADaAGJp8v3WNKQ2WboG+AaVqn4R2LqY3tHaXYb3RDnTycF0
	F+ddfVUnnW2whrFVP9jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jnL-001HM7-0g;
	Wed, 22 Nov 2023 09:45:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jmv-001Gro-31;
	Wed, 22 Nov 2023 09:44:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E168361CCC;
	Wed, 22 Nov 2023 09:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6165C433CD;
	Wed, 22 Nov 2023 09:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646292;
	bh=HrTZdiDMDN2AL5+FFpvaO5U1EqVinVUtyfSdqXL4wYA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p0Z/U7xMPKgM32RdtDRReCBHmtw+qLgWMkmr9fAlX9sTPpSTX1kzT1b4Ax8iNZTQ1
	 SDpqnAv/m3xI6cskZjeIJXtgnHudh+xvZe8lSAZLVs7RjUByzMaLt84cVni6atFfi1
	 +X3DScY2qReqW23WxMSFy7bEE8mBc2v/XGgaKns+PNuVAPlMnGMDRcv9OEpAI4D/om
	 CpDnm2ALUXUkqaRpqSUp+bCmc6Y3gqo06ZtP0UHlplrxt73e4QcDOclNWVf+LnjHaN
	 QXl+y5Ql95Ai80nNQ7l/b37t+jrxyuqXFBUhUW9i2y6qZpxx91LF6ySTkMQLR3is6Y
	 lXvqWl1Km6fLA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Nov 2023 09:42:26 +0000
Subject: [PATCH v7 16/39] arm64/idreg: Add overrride for GCS
MIME-Version: 1.0
Message-Id: <20231122-arm64-gcs-v7-16-201c483bd775@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HrTZdiDMDN2AL5+FFpvaO5U1EqVinVUtyfSdqXL4wYA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlXc0CojGZj7s7XLMcN8F+/cIfToo5TSu1/o7Jx
 iRDev9LKKeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZV3NAgAKCRAk1otyXVSH
 0IzPCACBRiVUTa+NHQT8XYai1y7/yLDxXJtjiAwGWCackHesESEtvValhKUigkGVJTRmqHLXptp
 cfwVGt2mctgc4HJtz8X8e6HP2UNCAeeD3OzagUJnZaDRGgKuFx6WxtnBaxjDKorTWBOhf6WqttU
 iV+LqXArWC0PbuMC2DgqoQwv6zSNVIeG0//Fhbwj7qd/pve5AUJV5aFS8zHE0FBOSbKfDl5y15z
 Xn+yX4gbWJIf0xIN4DDjLjwN3Jl0uM2gMo9nMACXRJvrQLhHqw3BjMF7ida4CqfIiVvU/BTHlpI
 jlGGSl6tFko0XV6J3tsrAJW+uVFoylFuxbpJ/cMFFFqzZs5R
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_014454_102163_C5FE69E8 
X-CRM114-Status: GOOD (  10.16  )
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ++++++
 arch/arm64/kernel/idreg-override.c              | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 65731b060e3f..e2282f310ad7 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -418,9 +418,15 @@
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
 
diff --git a/arch/arm64/kernel/idreg-override.c b/arch/arm64/kernel/idreg-override.c
index 3addc09f8746..cc059ba39d58 100644
--- a/arch/arm64/kernel/idreg-override.c
+++ b/arch/arm64/kernel/idreg-override.c
@@ -99,6 +99,7 @@ static const struct ftr_set_desc pfr1 __initconst = {
 	.override	= &id_aa64pfr1_override,
 	.fields		= {
 		FIELD("bt", ID_AA64PFR1_EL1_BT_SHIFT, NULL ),
+		FIELD("gcs", ID_AA64PFR1_EL1_GCS_SHIFT, NULL),
 		FIELD("mte", ID_AA64PFR1_EL1_MTE_SHIFT, NULL),
 		FIELD("sme", ID_AA64PFR1_EL1_SME_SHIFT, pfr1_sme_filter),
 		{}
@@ -178,6 +179,7 @@ static const struct {
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
