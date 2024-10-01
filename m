Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA08CF318A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LAQcKkJb3KSUHdpKVbo6rc7vJ/b5bB1Wg930nC2mAF8=; b=3HBLL+fgGeyM6N
	JM3SDST6tVipSniHOkDhKEgmoDXIFSHgvf7JLWNREATGGtzqRvmvalb4Ys+84SA/ieGwcU8rRoZsI
	esgbCXDlOjgehz3lYn8EAQHh/Saez0K03Swmh+xdqdhhzAw3uAXbPiIJlo9X8kzDiEwYzbhHZ6VQG
	nCLzbani4mAE0zqOPuuVTCL0L+X3HBebq+/fx3T3n1sfNTljXRKKZo/W7LkzwpqzOHFl7VU/xflxi
	mhe7binIW2HOrN5nhHVlWbTsHPd7Tz8mXpavj7Smp4m50CD6yT7WQvQy7HRdfJ4tG5Qyu3KNW6Om+
	yLlYrWgIRTvZOwTRegvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svmdv-00000004PPQ-0CpO;
	Tue, 01 Oct 2024 23:50:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlxt-00000004J2O-2baB;
	Tue, 01 Oct 2024 23:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IUUB8QNT+jLHX9OG6ZdcM4mCPmiewIQpENAOxXcj/Ws=; b=lUBW0IkCF0Xin3tX96qSsmytHg
	rzS6GyXZeYu+vqebw3cp9jT2AVJUIC/B/P/GzOb6WSUbM088p/nDkEumX+GzrqbwaYu99uO78HfKO
	RgfKMFanC9UVq4MqqFJMCytHU2SZZpphxz3LPyldKD4FoCKvaWWQb6bJw1gJlXm3eJWdl9hg2n9SP
	74F/fJvA5TYBxf5rlLSges810FJT/sSr7Fz9zOat1DnpkLGs2FSiWdoay8ZGJWLU7eMjb+2zBaBdr
	R7LYSuSHHLIXGjUz5dw5OPZvNdEMh7W4o6OdBqX3MtMXSwnA4HLA1bSlWkt0ffqXaRs5kvSSQLaWX
	4bbVKZ3A==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlxj-00000003KvA-3Eub;
	Tue, 01 Oct 2024 23:07:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 17DC75C05A0;
	Tue,  1 Oct 2024 23:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2416C4CEC6;
	Tue,  1 Oct 2024 23:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727824041;
	bh=j6IIdqnHFeQum6z66KX3fHgl2RzDdY03fDwrd4bo9J4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MlMuheBUz9TDrNZYXlk1//cCagyMhWpLR/SGxdIhq25FU+GmsM9wO7eQvhmd0z5nE
	 83lXiVJxTeqY5wHk8bzg6jShROnWKZ+lB6WEmLzR1fjQKCqx2ZVf9Cv8cFnFILwoiA
	 F/1RU4x4fX9e6v/AIlXDtOx/CrYpVJNB99SHnzBBZE8Kg7Wgb7LCN8VJ311tPLDfz2
	 etBgdgfLrtXLe/uFUkHHHOwYXUgCE7taIIEUJv7aGC9IqZKm6Rdx6AAuJ6gaeGMwAA
	 YX9XTcwUh9AMMrlMQRkCsGpUNfuR2D1s6RYLyjvTtWewz3gL6ch+5sTU0a7Tsv5Wlh
	 a07Ozo2sKVw2w==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:59:19 +0100
Subject: [PATCH v13 40/40] KVM: selftests: arm64: Add GCS registers to
 get-reg-list
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-40-222b78d87eee@kernel.org>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
In-Reply-To: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, David Spickett <david.spickett@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=2416; i=broonie@kernel.org;
 h=from:subject:message-id; bh=j6IIdqnHFeQum6z66KX3fHgl2RzDdY03fDwrd4bo9J4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7jXlZsyr1+7roR/ZRU6a6ost0JSw7SFgAbAQjO
 xwJbQc+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+4wAKCRAk1otyXVSH0I//B/
 4vOMUsdK63kNQyVzSZDRn7qmBg3F1T4vHXcC4pbPIxVJCkLTtjsMmQyQC4O5xFSsh3MdZ2n/zkY+RB
 OGjrdX1UWguJggO+skYEssBRt3LCT1U4DkVsT7HBHEHvwbwyiNDwJvke6m7i/vrm8OvLEunaT7mku4
 hkGqiVlSrXxsje+lpEJews5xOhtfs+x0tz5eRbsj8EYyRPNpU8nV30/XAF+lQSfam5chnnMBTF1LH/
 adX/YvsJtRLVtJVhfHJtoj69nD/7FJekPVdjsN5+81ApUOobQNwSxHvsE6bbVmRm+KxZl9R5lWIQdj
 yXgi4EeOV0ewNakXwRY7QF3rT0VO6A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_000725_842890_239DCC6F 
X-CRM114-Status: GOOD (  10.80  )
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
index d43fb3f49050..c17451069a15 100644
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
@@ -52,6 +70,12 @@ static struct feature_id_reg feat_id_regs[] = {
 		ARM64_SYS_REG(3, 0, 0, 7, 3),	/* ID_AA64MMFR3_EL1 */
 		16,
 		1
+	},
+	{
+		ARM64_SYS_REG(3, 3, 2, 5, 1),	/* GCSPR_EL0 */
+		ARM64_SYS_REG(3, 0, 0, 4, 1),	/* ID_AA64PFR1_EL1 */
+		44,
+		1
 	}
 };
 
@@ -472,6 +496,9 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 2, 0, 1),	/* TTBR1_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 2),	/* TCR_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 3),	/* TCR2_EL1 */
+	ARM64_SYS_REG(3, 0, 2, 5, 0),	/* GCSCR_EL1 */
+	ARM64_SYS_REG(3, 0, 2, 5, 1),	/* GCSPR_EL1 */
+	ARM64_SYS_REG(3, 0, 2, 5, 2),	/* GCSCRE0_EL1 */
 	ARM64_SYS_REG(3, 0, 5, 1, 0),	/* AFSR0_EL1 */
 	ARM64_SYS_REG(3, 0, 5, 1, 1),	/* AFSR1_EL1 */
 	ARM64_SYS_REG(3, 0, 5, 2, 0),	/* ESR_EL1 */
@@ -488,6 +515,7 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 13, 0, 4),	/* TPIDR_EL1 */
 	ARM64_SYS_REG(3, 0, 14, 1, 0),	/* CNTKCTL_EL1 */
 	ARM64_SYS_REG(3, 2, 0, 0, 0),	/* CSSELR_EL1 */
+	ARM64_SYS_REG(3, 3, 2, 5, 1),	/* GCSPR_EL0 */
 	ARM64_SYS_REG(3, 3, 10, 2, 4),	/* POR_EL0 */
 	ARM64_SYS_REG(3, 3, 13, 0, 2),	/* TPIDR_EL0 */
 	ARM64_SYS_REG(3, 3, 13, 0, 3),	/* TPIDRRO_EL0 */

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
