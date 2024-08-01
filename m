Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56FFC52D54
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IJrVRF4SRsz1KHcqe4L82UFIG69Zi8Zy4g5LkG2huc=; b=3kfUoIsPByRs7G
	XG0/9bfA+s9Lnqws5cf3U77sUEylobnLDY3Vp7GKwjbZ0PWMlEwvlcGRYxavrE6lT1heKgLjVeDVG
	tl9FDLQWeIhfLO5UpZjLrdFZkNmBPyATaWJB9qRktAkeeo1dKf3k5oQLYe4h4VyPchJGiZh0SWOUt
	8m7j+DmH6XG3vq0iETlcDavbhXFMhzLEIfvl+iR9X95l456d1uNTsj20m7JWRs/cAutTjfZVRTKWq
	ttX03BEFp9wC0I8MlKUF/KCPGqqGca2BPT7Av77VMz2La/7oirKytSg+plurRhFQ1gMFcEFJDxLZU
	aPWzF/Q0Q25he8aQLUcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVih-00000005TvS-2Qzy;
	Thu, 01 Aug 2024 13:19:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVRS-00000005KfG-05Hh;
	Thu, 01 Aug 2024 13:02:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 663806287C;
	Thu,  1 Aug 2024 13:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4528C4AF0A;
	Thu,  1 Aug 2024 13:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517321;
	bh=2o7H97U54cEmD5Tv71kF1eEpEycy3n5iAga6TGpYn58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EOypttz1iUC6Oqt2kwkwmd4hYK/iYBJyUlsSGBCxML2MrAMFnoFqWmEE8yplv/Zf2
	 g8lM4YlFhj9+fdD1LFcVHcxhbj4wVXGv9AFclgyBJJdQI8TN26iUHLke/PjeQJ6pha
	 qtzIUteV2oxLMg4GPFfIUSHThfXVm5pvBCWlc0/TXAbN+PB65tYEWVsOkGR0/ooeu3
	 wR3cCoXFofGIvrX3WiieIBTXZzDojnzLlQJTv+YC7WLr+WhDa3+nuZN0FbZnNlAel4
	 HYAP0fEe7Pdb1UGWHxPOw1/2ocSKJhL8rPBXlAIPbaw2nrLP0p+9aBvD0dE10tKzcX
	 caaPVWssBnNAw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:07:07 +0100
Subject: [PATCH v10 40/40] KVM: selftests: arm64: Add GCS registers to
 get-reg-list
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-40-699e2bd2190b@kernel.org>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
In-Reply-To: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
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
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2o7H97U54cEmD5Tv71kF1eEpEycy3n5iAga6TGpYn58=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4Yl2GIZXXyTb/zmM1+n2z4UQxnV39+pL7mDiQag
 cFTi6HGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGJQAKCRAk1otyXVSH0PXDB/
 4j5qGQGsGNdUNY04r8BP8DhGZFseiQkyBLks8Be56HfC2p51Bs37kAiCN7vw5o6FNjV7nHuKordgf8
 yw8h5xIw20SOGbtSiJzK+Ytmcij7dKixG3lRNnjLjqaDdEBHYQd36UkkNAQgXrVYEHb3uGUdeSe4Pf
 bVg2h3X4uA2HXpmx1Re6duBQnFxQkT9rwDaPrUVUJ8O1yGDA6GES8iwokMeuWIm1IuG8kk4/ryxjLS
 MQuOjZLd4+rfnA99YvtwSC6d7LH3XTe6kZlg8lx4hPJ/2a1XoSi//5g2fntfcaHvPuz/xHErMA3FRH
 FgQKeE4l1SWZJYN8U5tIpu0CgGk3wq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_060202_185276_041D0BF5 
X-CRM114-Status: GOOD (  11.02  )
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
