Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA04CF318A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPL2HtLDaYh3dr0ymJBHkAJ63w1yiTFF0zhVW2pX2QQ=; b=CnieR9Skh4VadH
	QLZ/KzrH6QKXMx0XPYzv+vV0woSkkFdDkS0Jz4LLbViJFD7THWdm1KZ1HNel35HgZpRtQCvlC8Dxb
	Iwoe+lc0/zEdEnj2Fr1ib2Lv+ehJppGSLQwVqlUbEnrQcJpGoPITgxolmqFFozk6onvJuDTml5Yf2
	asbFh/CW2pkanZVXRHr2mW7qiKQa1K3Dl42D27QJ6Uy920McSipZYKbSmPjk2Qm1RexwBNwBya6+f
	Lyilu/wA+/haS+8eYMfJXxmMkFdaib/Nat1AYG9T8ZeMrjIb36GfpLJqpO/idvLv+oBtiCzyNnTOg
	6mO1+ZV1mCz1jNrUWw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svmS3-00000004Ntp-0GDL;
	Tue, 01 Oct 2024 23:38:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlvy-00000004IGy-15y6;
	Tue, 01 Oct 2024 23:05:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6ED1C5C06A8;
	Tue,  1 Oct 2024 23:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A385C4CEC6;
	Tue,  1 Oct 2024 23:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823933;
	bh=qbIXmU2eUtmemMq8xp+h1yj3ghFTmpSN4hiSxbQmL24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iLfN8hK6fHJsCL43iSYWHnlQe8lmB/0kpA5kef24n6vIHD3puN6AUc0DPk4sOqABb
	 wWAjZyCkgL0G9BIFMcx8vXrgyMxvMHHfYAHX+x+mB0u7AfBeK8aepBzLUdkq6pOEZv
	 N56GqM7jshutguOWelLOOIe09qymjx/165hlaMxOg7nQT69Losj8yjFsr85AwUTXyZ
	 c+lc9rAWrd+ijT8JfypMqXpIHR89Q94sffXErVyiSHR+KNkso6Qb3wgi5CScjjwN3+
	 cA7pnI/kGEugcQvkMWCHyU01V4KUQOzIthpcHlAIkQa2BGUJojXKuFps2EShSHPk/9
	 U6SlBWyZTQfgw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:59:09 +0100
Subject: [PATCH v13 30/40] kselftest/arm64: Add GCS as a detected feature
 in the signal tests
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-30-222b78d87eee@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1892; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qbIXmU2eUtmemMq8xp+h1yj3ghFTmpSN4hiSxbQmL24=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7b2/iy2LdLJp3um+baJpFqFpKYtxnFOd3PCELd
 fKwZqKaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+2wAKCRAk1otyXVSH0NHEB/
 9EKBm0Nlsi2M1QMfMGnwSQGrHLQyo0Ec2/WoKudVqFQEvsSyGbPTSFYvGmQ1dt68l8+uMZJF6ZolQ6
 +p9amzeznqBLv2udaMcOQCbVRNUVkhWWEVPH03tjMMJ2JCfAhJiu5tWmU+AO3dNrD0+IKLhlvAy7a4
 ytAjYf8dykZi4yMOOBEZVFM2y0oDkNBzrnLNudtDx1M0m5EGTdCOtsOuOgbcYE3iCawBsDuPo5PVii
 W2sqXjLa0a3JOYmFrJ+qR3PhmfLgNx6tlv0SDPPQuPqi6bStN5a3v662I9gyQ3nFzHQQPFLgjdhlGT
 zbzEjrNGMmUur+kCBdWhwHlyVS3mx9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160534_473585_F531FBEB 
X-CRM114-Status: GOOD (  10.95  )
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

In preparation for testing GCS related signal handling add it as a feature
we check for in the signal handling support code.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/signal/test_signals.h       | 2 ++
 tools/testing/selftests/arm64/signal/test_signals_utils.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/test_signals.h b/tools/testing/selftests/arm64/signal/test_signals.h
index 1e6273d81575..7ada43688c02 100644
--- a/tools/testing/selftests/arm64/signal/test_signals.h
+++ b/tools/testing/selftests/arm64/signal/test_signals.h
@@ -35,6 +35,7 @@ enum {
 	FSME_BIT,
 	FSME_FA64_BIT,
 	FSME2_BIT,
+	FGCS_BIT,
 	FMAX_END
 };
 
@@ -43,6 +44,7 @@ enum {
 #define FEAT_SME		(1UL << FSME_BIT)
 #define FEAT_SME_FA64		(1UL << FSME_FA64_BIT)
 #define FEAT_SME2		(1UL << FSME2_BIT)
+#define FEAT_GCS		(1UL << FGCS_BIT)
 
 /*
  * A descriptor used to describe and configure a test case.
diff --git a/tools/testing/selftests/arm64/signal/test_signals_utils.c b/tools/testing/selftests/arm64/signal/test_signals_utils.c
index 0dc948db3a4a..dcc49e3ce1eb 100644
--- a/tools/testing/selftests/arm64/signal/test_signals_utils.c
+++ b/tools/testing/selftests/arm64/signal/test_signals_utils.c
@@ -30,6 +30,7 @@ static char const *const feats_names[FMAX_END] = {
 	" SME ",
 	" FA64 ",
 	" SME2 ",
+	" GCS ",
 };
 
 #define MAX_FEATS_SZ	128
@@ -329,6 +330,8 @@ int test_init(struct tdescr *td)
 			td->feats_supported |= FEAT_SME_FA64;
 		if (getauxval(AT_HWCAP2) & HWCAP2_SME2)
 			td->feats_supported |= FEAT_SME2;
+		if (getauxval(AT_HWCAP) & HWCAP_GCS)
+			td->feats_supported |= FEAT_GCS;
 		if (feats_ok(td)) {
 			if (td->feats_required & td->feats_supported)
 				fprintf(stderr,

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
