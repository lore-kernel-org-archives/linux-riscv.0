Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C999C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 01:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJetD/crTScKujSR+Wi5BwIaJc/UFF6b1CkYGxlb7lk=; b=HwQxsdd5iKSlsD
	YU5U2nTrE0BHGo5eQmpLrR0i8nTCpRO4KdBP/E+gkhEU2Oh227pFPQSEFDkHl/NERqpRH5GSy1ZHN
	BCsEJdd1ihfukLpVSW738CF6ZsDWML66c931KBeV/TSqteWRh859Zc18TDmbxpQa6XY0swlIGPrnz
	UP+UWJ2ZJyBQsfF46PNbj5W0LPqNPUH22jYQAVZhH4mskh6wKV1Aq2NaunHPMdR+cdjmzoVf3B/qh
	agqlT7Ds040XSn1t+qMWriZOGNuQCRTfck84EqmKVAKR8tT0fNdr9pu3LpbPI0Axpi79KlOp/aIu+
	ZeaVnkfXzp9ZKO+UOcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwp5-0000000AzGJ-0LC8;
	Thu, 22 Aug 2024 01:41:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwYe-0000000AuGR-3hh7;
	Thu, 22 Aug 2024 01:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zpawyuS9B9pFyqPLeUbWVN8Oj0MRjkReuUsUVFsBJLs=; b=ozd8t1c2GQudkUvJqt5gGC4Vfx
	tZj4edNGd2J5mlTOpvpYUlDE8I0kYdUwsvOy040E2x7YsiSJM9Fl23vXRGh37JrPzGpNKvyJ8zIEu
	lX9uZxbmRzlOShjs2FUctQ009MuPMED40QzMMiueUDmgUHaX4JjyTGQIY8dTid47pi2ID8zqGaBs+
	/JIZar+V6BKMAa6IK9+Dxutms6y22c20PMSYEQSjF+6sgRDedUqoviqnFczEvZOrIv0jCkOmYGAfJ
	4IZHT8mbGy6lVvAc8zyK0kO0bNs9Rg6WkGEzdqasqW4YBVB+pxn2eEYrIl88H8/dMZnX9p9Iit84b
	CWTErjfw==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwYZ-00000009joh-0gwi;
	Thu, 22 Aug 2024 01:24:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B9638CE0B61;
	Thu, 22 Aug 2024 01:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B08CC32781;
	Thu, 22 Aug 2024 01:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724289844;
	bh=W5oN69xYg0RDvkVAq7OBhN9me4eHC7ENTR8wdYTObEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iEBEIs5j4ESOyOuAI+C1WdLslac5LfFf4kq+lkNdmDRnyIC5yWmiqWDSMJJspLip0
	 ml9uTFJFpjA0iZB8kpDqcRdUVrEAN3rgae1b0KWClRy/Dt5K3C0ScTk7Y4SWdSQ+0J
	 J9ynhy9+9DciCFx1xbPMettqUNcK0C/8oPiqZYnE2aLmN//nbDx9gRXLGbrz6FOC9N
	 QJZK6dQb2Eneww26LRoFWKUpXmLr8bA0krMzkGL40Umad43ef518YlBAcLdGrQ/xva
	 UmXJOYn+WGgW0hN/+th9qactP+9HaSOVf/vKYQVY8GyrjynJ7JP8i2m+nC2YGho1yB
	 C5cIrr/0/qsMQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Aug 2024 02:15:42 +0100
Subject: [PATCH v11 39/39] KVM: selftests: arm64: Add GCS registers to
 get-reg-list
MIME-Version: 1.0
Message-Id: <20240822-arm64-gcs-v11-39-41b81947ecb5@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2418; i=broonie@kernel.org;
 h=from:subject:message-id; bh=W5oN69xYg0RDvkVAq7OBhN9me4eHC7ENTR8wdYTObEg=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhrRjE52aWuqWJvl43G370Cb14vXG7leGPtlWHj9eFSeamTBo
 X9LqZDRiYWDkYpAVU2RZ+yxjVXq4xNb5j+a/ghnEygQyhYGLUwAu0sP+veD2HY0mXtEA/3Nzfa4Jyf
 PZBDNMzlaYvXxd9UdPmQeKau5R/7pmxk1bVJ80KV7nZ/iJg4lH3l6T79aqUAtX1T7NdHV6wdU22f2z
 DoV6ifrOnBJdf1xGTvvHPIXgYzx+IXyfDnGuTNt9Jn1zzH2fmQqTrCclRJxxLr+9bOLp1XfPyQj6yc
 /iSVB6KvkueNHaLp8L5yP/BqR1nWaqPGK77aHK4sT4ptQ/SlOm5x6/HTXHf7th4Q1tZn217NVH7xju
 0hSU+cvxlVlNNSErf+uMqFO19qckeCd42zv9/LSrXmn+w9OaR+uVBaI+iD31MpvczNFmEhmVLF5/wT
 fTwpAtSN7+ZuDJ9Z9Es+4WMQIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_022409_003535_F217894B 
X-CRM114-Status: GOOD (  10.61  )
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
