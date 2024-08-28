Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45521C7114C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXqX/pk3yZvI+/c5LxkdWoEF/KdzxIw2sxvuPZTV440=; b=3HeEm8asCOectm
	/5FlpFV5Aj0cVGA7mdNoUjki+cCNQdSM0KWjMIyOkUm00HE1Tp5qpYOyJNGHWtoIpA9MFltnHbtt3
	1aLASRRTdXys0y/2U//Lqng40k46ZCfLJl0bN8iILR567qqg7n12FcfCjX9RNdSnQ/euF4ZbgJKvg
	XGC3YwLon4P1gp8DDbDTtr1CT7ApniVU8L7c2WS52afeSEYrs6gFN56wbACJS3/ALRQeuVkYHYxri
	dXhZLN03z7d99zUZgQ8hGluLEYGa5AJO3Y2R/YynpJAp8Gj5sHpzgj6QsWH/VGNGzQzr0jSJ7dUpH
	FmPkyciydnkXClSAhd0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjST7-0000000HV2R-3TNe;
	Wed, 28 Aug 2024 23:52:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS91-0000000HNM3-1SKz;
	Wed, 28 Aug 2024 23:32:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 94EDFA43769;
	Wed, 28 Aug 2024 23:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317C4C4CEC5;
	Wed, 28 Aug 2024 23:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887926;
	bh=daws7+gY8b6XFlV57O+J5ZaQ5dAS4S0GI4Vh7sgzmHk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dJ/mOv9KyokVDXmrKaGF7gLW3dPjymJfn9vb85KHKRfDBxzmkwC9ADfonFPZ8smil
	 lVUMVMuUNhhbJ2NxXXFiIeiG0zG95/TuIBKwlFGx2wK+hcD7RRK/S7lFFHB1bLWYLJ
	 pIcw0wRbfkrBoTmDs3+yC+sYY08RX4IbXRpytuGpMalbpANP6nNmpiUZcRqBAVbKD4
	 I/8UGpU799FHgqw4qxWC6NDxnjPQCuGK99PHHFd+8s57C/va7Ua/t+i8aKywtq2BoP
	 HasJA19H5ZfYEKlcC98VNm6g9mtHJCdXm+ny1GTBPZByKD9izBfLIV8zOwby2XumUo
	 cSauXnMCy2+6Q==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:45 +0100
Subject: [PATCH v12 29/39] kselftest/arm64: Add GCS as a detected feature
 in the signal tests
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-29-42fec947436a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894; i=broonie@kernel.org;
 h=from:subject:message-id; bh=daws7+gY8b6XFlV57O+J5ZaQ5dAS4S0GI4Vh7sgzmHk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7KPgjRA+l66s77QyY94j1U0r46JzOAjWBQoCK26
 nUTS0oaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yjwAKCRAk1otyXVSH0KV6B/
 9b7oXkWayuyQxO8M+w9SB/jK8Qt3ogM/TMwIBuJV0cFLhWUSfPTNC861LHRMCk/2uyI18kQ4HJFFmK
 zIYR8Gsv8zWZm6Knr+I7wWnw7WTE5o2QAZvTWO1AkuNLaqaOUDXnTdFYRoaqxGYooEMhq0WAO7GPPa
 ESvcYbIe4d9PDSE0ImczVbNpRQSWSvaqU46/0aBaE9oW/xvO2ffowyxQCG3Cfk8RIStCOEDAy0Vg+I
 nvCFwDnHjqMGsUM4ezhR/wNa4TkdNCn15xcMCMElvGL7BnAbEoNJhPJLlW2fHh9ENCUmxcEHJFI8pf
 3bdOHXG59TA2Vbi6nJCYC9DaxUSNyQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_163207_602888_85820030 
X-CRM114-Status: GOOD (  11.13  )
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
index 0dc948db3a4a..89ef95c1af0e 100644
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
+		if (getauxval(AT_HWCAP2) & HWCAP2_GCS)
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
