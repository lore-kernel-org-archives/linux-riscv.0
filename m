Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11957C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXqX/pk3yZvI+/c5LxkdWoEF/KdzxIw2sxvuPZTV440=; b=L2F5CZMr3pyMXy
	jpR28PJJDIFDty1EzLEd5E/8p9bHuXMtq/yCGcaXJbXONbgRSfXrOLh6CVCET2olcjtF+PyTt9wc5
	lVJEToLRG6p3p1cW/Z9tDDEuF5bEM6IsWokgfztXOyRBdP90f/rjuwrpmCP0Ygc8hCwtRgLRTUyru
	Pwn5hMmfpYCpDJOCPE3rzwNW4PQbmRrQ8PRpf2ZgYNmSg32+pc6nf975uCLdLcmtGKckwCMy7ZGYS
	hWx9VGLdp16cgSQ4Y37/H1EAy4TvEahU+zOhgHUf+1BoN6mq3ZVwaa5hfkQrjlO5csIYQUfkTtTCH
	wak7EnIdjFDVRTIzhrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVdp-00000005RaX-1Sqr;
	Thu, 01 Aug 2024 13:14:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVQL-00000005Juy-0sci;
	Thu, 01 Aug 2024 13:00:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 234C0CE18F9;
	Thu,  1 Aug 2024 13:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9507C32786;
	Thu,  1 Aug 2024 13:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517250;
	bh=daws7+gY8b6XFlV57O+J5ZaQ5dAS4S0GI4Vh7sgzmHk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YaeczFSW/0sQVi4Y5MZxG0vXvCbqJ3B5xzzE5AP9dTzYvhAzl/vQ3+MYM6uYprAOe
	 70sA7AYgAVjQD2r6xVtm2I+QdnfpYpgb38IG0UvMK88+S9If+ArSDMipaZa139A8Aa
	 amnSXsdY0QAmRVZRHyUaLz9RHZvhUZEBoD1RNXnhXsJM/Oh5kw5Ir48Lb5Uc+P48GC
	 L1EMrJ1FWOTRIyygtumExRrL5WQTM+hzMyVys/ZrDZ/E5Yx1aFTNNf4YfF085NmlYT
	 7xGguAyHeqD58lUBuw4xsj6qRJLzqe34cjOTUlZlt3PSgLpNFkepoD/v9BoZcVi5hn
	 GMKYDblaFYphA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:57 +0100
Subject: [PATCH v10 30/40] kselftest/arm64: Add GCS as a detected feature
 in the signal tests
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-30-699e2bd2190b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894; i=broonie@kernel.org;
 h=from:subject:message-id; bh=daws7+gY8b6XFlV57O+J5ZaQ5dAS4S0GI4Vh7sgzmHk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4Yd/AayJpdDJb2tH+bu+tocCjvDaVO7v9RFDWZu
 YTIKLIeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGHQAKCRAk1otyXVSH0Ji6B/
 49n/gPVSOC0zUdOFsKaXyNbeJnnjaeAF6Gi0yO/OvRf6VhmA1x9nevcrHxGpv9DmgkfvS1ypLr5tnA
 i4w0As1xKtNtyuW7oYQecE0S2I8n9mVnIQt+N5kfwKwsHQr+n/GJCNd29oNl4QZIEeFqOVYeu/6a0b
 HB/wcdBizcnOfVCSchCJZPMPOyeBHkP5+q+4FiTIPtAddvi9WiYoYv1IDkYLyarNhgHtFWHNEl0MhV
 UiHVNfUn0FsTrxnnEaml6vKI7WrzvQKeELLE4SHw6rHgudllTAtV1UffSDB5Kuidf6INcLHWx0iECg
 FQCqn39dvgOsLwpZxr5jqd2j64PGrJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_060053_688359_A1AEEE1A 
X-CRM114-Status: GOOD (  11.53  )
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
