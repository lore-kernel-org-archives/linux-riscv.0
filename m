Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC7BEB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 22:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5J2YNO4zgc2Spd4dgqNmXTdhrRbw+pz5V9wwn3UIIMM=; b=enVZ0yUXJQabq3
	RAsXd9EjKmhnTB/C9jS38fMD08qkpy8e4pUcf7iN0O3msmnKXfses+c2UKo0COdyTy97ikiYbfL9W
	klNAKRhe6+RHnjE/OcQemMqlN9ORb2v4Lv9GpgoiMimZO1hmEU6ejodtn/jz2pend7Y41yRfAR47w
	ySjaLaMLlskK2umE0rupmMjQ5v3YgKiujDSVXS1/lYSxK8c54hyqIQ12F6PNDgQxwHTf2NpIuZmGm
	JAsV1CnseJO2ZgClYqIykfoQZ5M1jdmjlyFojWDfo8wSg79H4WN6jcHrcnaFwuOn9iYOUxYb1mdky
	PW3pZwVf6bTveXYn4fig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9mT-00Fwbv-2A;
	Sun, 16 Jul 2023 21:59:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9iO-00FtSb-1s;
	Sun, 16 Jul 2023 21:55:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D0B460EFB;
	Sun, 16 Jul 2023 21:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB808C43391;
	Sun, 16 Jul 2023 21:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689544539;
	bh=6C9vpUKzxaC1YPufnnUpE8qHeuHqYjFB9iVUxK25t6w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qRa+YtE7yvYvcODmiwXlBSh4F1vfSwmQsxOYCCQHdyb7+9c2QZaWomxYvuS8kAIhp
	 714G1h1smywg2+5j2TZEfjSY4jKrv7pSFsPmWoRlS0zeS6ohrJTmnPvVIi14ff21D8
	 JDffHX6QBQP9aOIkracyewUb01/PrSGXzH4WmI+M4og6H7vnCvlW8GNZs+SChNn2N3
	 CFO4IYgetGBzac0xoAbaU0lbR8qvrMLJ3zH0bVfQcPnzspiFpfFuWqBx87Ho0dw9Vh
	 P14G/ouU2IXhzfq4tdx9JGoiCtFadeEMcbJpJfckv7oSDxvR+DrHoPw2gwKEtpbUZO
	 WD42Obeggb7Jg==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 16 Jul 2023 22:51:23 +0100
Subject: [PATCH 27/35] kselftest/arm64: Verify the GCS hwcap
MIME-Version: 1.0
Message-Id: <20230716-arm64-gcs-v1-27-bf567f93bba6@kernel.org>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
In-Reply-To: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6C9vpUKzxaC1YPufnnUpE8qHeuHqYjFB9iVUxK25t6w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBktGakI2DafnLEN0xPOYtS8rBwoQOkhbNIa3aIl3+T
 kLXsS3CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLRmpAAKCRAk1otyXVSH0C6mB/
 wOqidQ+86Oz6oompV7K5g7vr0TQDYT17lne0KPFqCuXH52UJc3v5g1bWEBZCf72AIeUyxqIlXL1eo+
 fCOPXyV5gx9kIxzNL5ZchfzMMppq9l2z8iGxIDidnZ6Rwu88A8zTi11YTTgcJawGzWSHPi5x0M4tYS
 kmZDonpfdL3p2LhjP7t0nhltgDjNqnE0LdDpgk1M6KoClhQX7tBC0Y++yuKtA8RVSwE87k+oaTYNUW
 ieQNE9JyTJnXTC1B5QfO3otl1F+D47QHyh9/+ktlmXTv5gfNRDIydVmDscZmRd4N7GYcn9T2SDLx4b
 kNoA3+dO/UVfdsAY+7oBJuc+B6wbTC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_145542_409723_7842357F 
X-CRM114-Status: GOOD (  11.59  )
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

Add coverage of the GCS hwcap to the hwcap selftest, using a read of
GCSPR_EL0 to generate SIGILL without having to worry about enabling GCS.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index d4ad813fed10..38844e4c5aae 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -39,6 +39,17 @@ static void cssc_sigill(void)
 	asm volatile(".inst 0xdac01c00" : : : "x0");
 }
 
+static void gcs_sigill(void)
+{
+	unsigned long *gcspr;
+
+	asm volatile(
+		"mrs	%0, S3_3_C2_C5_1"
+	: "=r" (gcspr)
+	:
+	: "cc");
+}
+
 static void mops_sigill(void)
 {
 	char dst[1], src[1];
@@ -223,6 +234,14 @@ static const struct hwcap_data {
 		.cpuinfo = "cssc",
 		.sigill_fn = cssc_sigill,
 	},
+	{
+		.name = "GCS",
+		.at_hwcap = AT_HWCAP2,
+		.hwcap_bit = HWCAP2_GCS,
+		.cpuinfo = "gcs",
+		.sigill_fn = gcs_sigill,
+		.sigill_reliable = true,
+	},
 	{
 		.name = "MOPS",
 		.at_hwcap = AT_HWCAP2,

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
