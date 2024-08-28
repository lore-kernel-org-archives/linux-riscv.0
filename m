Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8520BC71150
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 00:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJetD/crTScKujSR+Wi5BwIaJc/UFF6b1CkYGxlb7lk=; b=mhDB7DYKyW8tVY
	afQGLt+2M0uvNjnL2TBJVcrln08NgJDfLcHvequBOFBtU0gpxkaG8rWL5v3tp5MPeAIRAuoiNxz4z
	70Z8j5TRGvvaJCIVj0FvsIqfYdWx/zp07VAVFs8YY4yFcJ+IZmf4350z+g+sDCAX0SC6GHw9XuZUQ
	+xSKX9CdV8QJ7nv08iOpJJTNUuxuXf/mH1Jn2lL++z9nAcWGzbdWVWVRFvK6/ZKe15emST2qFBYn6
	5ets5krB4fA8Cs9UPJoQAgAI2ZXK9JMa8UyWiDpO03kE3R3ZhGlawirKPZ3pVWSPfTgl0VgcAnpk7
	IUP6l9LI07mNFyXRYO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSbH-0000000HX2g-0q4E;
	Thu, 29 Aug 2024 00:01:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSAF-0000000HNzQ-3YHe;
	Wed, 28 Aug 2024 23:33:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 108F6CE1736;
	Wed, 28 Aug 2024 23:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D82C4CEC4;
	Wed, 28 Aug 2024 23:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724888001;
	bh=W5oN69xYg0RDvkVAq7OBhN9me4eHC7ENTR8wdYTObEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T0sYEOxHjFOttsTVvHr8nAQOQ8BUsl9RMPHqa31RJTgSFSQ3TIGLapA1WgRy3jLo0
	 JeODpovNuVdL80WVrYGVso4DyrRRO1DhF7kWisH1cqnFSCydDl13yVhb0nu6HT2C9z
	 pD4UgF4Dwo5Y9nuYKXJogdufMhh4W7BZO62+McXl5vR8L6zMt1WUITjQLRzWcA7u25
	 SPgM+2tb0JJ+WBn06AztAPJ7FrM5sNRzveVcG0IubW9dGdUc/PlsWeypUq2fHpf0Gp
	 pQfD/DxG1p/Tg1tfKVfxa1CicV/MXc1Phv0Iyv5PVg3YGY/+kSdolqCbHw0513h6ea
	 haeI2WZc6MlWg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:55 +0100
Subject: [PATCH v12 39/39] KVM: selftests: arm64: Add GCS registers to
 get-reg-list
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-39-42fec947436a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2418; i=broonie@kernel.org;
 h=from:subject:message-id; bh=W5oN69xYg0RDvkVAq7OBhN9me4eHC7ENTR8wdYTObEg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7KW23WvfTKbuTefeFx8re+CMzCUi4CC3I85X0Hw
 F+Tp6t6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+ylgAKCRAk1otyXVSH0AynB/
 4zJS/fNzXaknnr7WJBxyXZVPJNEDNBY8rJlOhiRC7JR4N1wpHshMVJS7B5HyeOhJWMAuD3mR2CrV1d
 r4v28SEGzfR4d+ILf+hgZkeIgrDji+0MV4VUdT+tsjQyzfTjj8tJ3F2CqTPAP3N3Uny4OsuqLSWzBp
 hlN40ZxT2iqDEbKvGfaT1sz62nwxmh3r34dtmQBwKzh0I3Y2nYIK5zGYUsoMINt5Gtov3e79ziMDIT
 AOI9DcGFA7X0dQUOWVXPLJxkZnXLGhBCT60jSVl0d8qabxjn+iAigD30fNz+DZi1Y79Ar5nZoztoG7
 adadSZsjbnTs20zCvlACDXAlp/hVa5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_163324_280145_8EE0C718 
X-CRM114-Status: GOOD (  10.73  )
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

GCS adds new registers GCSCR_EL1, GCSCRE0_EL1, GCSPR_EL1 and GCSPR_EL0. Add
these to those validated by get-reg-list.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/aarch64/get-reg-list.c | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tools/testing/selftests/kvm/aarch64/get-reg-list.c b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
index 709d7d721760..9785f41e6042 100644
--- a/tools/testing/selftests/kvm/aarch64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
@@ -29,6 +29,24 @@ static struct feature_id_reg feat_id_regs[] = {
 		0,
 		1
 	},
+	{
+		ARM64_SYS_REG(3, 0, 2, 5, 0),	/* GCSCR_EL1 */
+		ARM64_SYS_REG(3, 0, 0, 4, 1),	/* ID_AA64PFR1_EL1 */
+		44,
+		1
+	},
+	{
+		ARM64_SYS_REG(3, 0, 2, 5, 1),	/* GCSPR_EL1 */
+		ARM64_SYS_REG(3, 0, 0, 4, 1),	/* ID_AA64PFR1_EL1 */
+		44,
+		1
+	},
+	{
+		ARM64_SYS_REG(3, 0, 2, 5, 2),	/* GCSCRE0_EL1 */
+		ARM64_SYS_REG(3, 0, 0, 4, 1),	/* ID_AA64PFR1_EL1 */
+		44,
+		1
+	},
 	{
 		ARM64_SYS_REG(3, 0, 10, 2, 2),	/* PIRE0_EL1 */
 		ARM64_SYS_REG(3, 0, 0, 7, 3),	/* ID_AA64MMFR3_EL1 */
@@ -40,6 +58,12 @@ static struct feature_id_reg feat_id_regs[] = {
 		ARM64_SYS_REG(3, 0, 0, 7, 3),	/* ID_AA64MMFR3_EL1 */
 		4,
 		1
+	},
+	{
+		ARM64_SYS_REG(3, 3, 2, 5, 1),	/* GCSPR_EL0 */
+		ARM64_SYS_REG(3, 0, 0, 4, 1),	/* ID_AA64PFR1_EL1 */
+		44,
+		1
 	}
 };
 
@@ -460,6 +484,9 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 2, 0, 1),	/* TTBR1_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 2),	/* TCR_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 3),	/* TCR2_EL1 */
+	ARM64_SYS_REG(3, 0, 2, 5, 0),	/* GCSCR_EL1 */
+	ARM64_SYS_REG(3, 0, 2, 5, 1),	/* GCSPR_EL1 */
+	ARM64_SYS_REG(3, 0, 2, 5, 2),	/* GCSCRE0_EL1 */
 	ARM64_SYS_REG(3, 0, 5, 1, 0),	/* AFSR0_EL1 */
 	ARM64_SYS_REG(3, 0, 5, 1, 1),	/* AFSR1_EL1 */
 	ARM64_SYS_REG(3, 0, 5, 2, 0),	/* ESR_EL1 */
@@ -475,6 +502,7 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 13, 0, 4),	/* TPIDR_EL1 */
 	ARM64_SYS_REG(3, 0, 14, 1, 0),	/* CNTKCTL_EL1 */
 	ARM64_SYS_REG(3, 2, 0, 0, 0),	/* CSSELR_EL1 */
+	ARM64_SYS_REG(3, 3, 2, 5, 1),	/* GCSPR_EL0 */
 	ARM64_SYS_REG(3, 3, 13, 0, 2),	/* TPIDR_EL0 */
 	ARM64_SYS_REG(3, 3, 13, 0, 3),	/* TPIDRRO_EL0 */
 	ARM64_SYS_REG(3, 3, 14, 0, 1),	/* CNTPCT_EL0 */

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
