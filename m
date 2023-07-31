Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56241C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwqdkDWRCwiuErHvO3W6cxSjCUfpKpuZHAA4rXc1SSE=; b=COH5hogGsLOfe4
	2XspcBnqArxEqMw0cgaUsWNu9RUFEQLZjc3ugkaeAWAOCk79ijRRBZqbxE6pHA9HYGgmDgq/gU3/E
	Be8iHjWgheLjOTRwALg5E9ciF3nK/zC02OsjkJ6gKKa0PxH0jULCT3mwxYNgRRm85JnP2fR71ABCQ
	AETxe20HWQqXShHmL4dOgGRffoZuLNy+2SzZxVr0KFSqjZPlVqLc/Y3aLf23gevEY4aX9U16CFviu
	7xYuFA0EehFHqPocA7nSNXxITr291/VCiux9IxnJnHfgF727ZiO+FFWYultjcxMs5G1QgUrbTrVfR
	C+olwzYB1nJXpUY0nJ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQTNA-00FvFf-0h;
	Mon, 31 Jul 2023 13:55:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQTLC-00FtUr-0J;
	Mon, 31 Jul 2023 13:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VZa+yVxoJy4ei1p3UG9WfSrCLoFBnIYNn1ZiZhJXbbg=; b=df0nhU4kJJ3iOCiG44FONv2PBo
	v07O/hgKvmNLrjjX0i+Ege67rS4HmFiVve0jmYJk+OjRYOyRTSlnz51kXAxNPh+IDv8TjPKyFZudy
	x5nlJQMj44t3aN6y4koiTZzD8qzOnaDOGaAognaU25XWaH82TOLrDBlBZL0sSpmPpnc3wTw2Swaki
	3Y9dsv1uW5xgYUM6n3Jxj6tBaXSgwg0ZzAGXxuhBgC2ZCwGCkVA/JbodN+s2q4+Eh6TtjhjydYd0X
	G/M0j2ouIh4u2DYCKlbp5lKFY2DIEoI+xnHY2chZ1aK+X4EoSTfwrRorgZbZoDCx0FDXYNBixihwj
	U+cqU+kA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQTL8-00Cjgz-1H;
	Mon, 31 Jul 2023 13:53:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B89806117A;
	Mon, 31 Jul 2023 13:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEDAC433CA;
	Mon, 31 Jul 2023 13:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690811616;
	bh=Go+3eKanODPQVKnV1QnMIrC75/lXwO2PkPnkMfOn2oA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tl403dLJF2hiL4lgfn1M27YQC6t0QzZ26RnJZA3dqdpknBMDGeNe0afBztul4JuVn
	 xlopjw8Bomjs0svJ9yBOPrJL2B4+025U4LSRKcvbWB3RSt8HiOcplPy3if2ex0mH0E
	 a+QVYDlphFzL7mzCQb6XNi5UTNk9tECa8OjdoaB1MnzTCR8uQ5sc+nRxBN6EAEt0EG
	 dq96F0cZKlEJgRnQwNS0nC5rMp3zAnMEhMKNoq8OjeIP6BAr04rkVD62Y4VCWCEfeS
	 58/VGJiNeNKddzD8+cqKbqsbzyPN+0eh4LRqubPZ4Tv3g1TVi0jLixt2Qoic8bTYkJ
	 zoMhhmuu66A7Q==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 31 Jul 2023 14:43:36 +0100
Subject: [PATCH v3 27/36] kselftest/arm64: Add GCS as a detected feature in
 the signal tests
MIME-Version: 1.0
Message-Id: <20230731-arm64-gcs-v3-27-cddf9f980d98@kernel.org>
References: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
In-Reply-To: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Go+3eKanODPQVKnV1QnMIrC75/lXwO2PkPnkMfOn2oA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkx7wpe4d+jUhnR1Drf+zgBDN7lxol6j07oJ2Scvw8
 hYvLjZ6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZMe8KQAKCRAk1otyXVSH0JD6B/
 9EjugsKK1CPBzK9oHH4oicVJXLFEs8Pn02QHURdLgCmbAD6xaJkT+dMEOtWyZkNPkWK0mWvYT6Np+o
 3Y/5uHLx5ub41CEvqg20Ocu5QtHnv32Lpk0/xv4fnXroxcY+kYM8q8a+jPjDsAA+x4M/D7M5H+dK0v
 Yva4qD/Bk/SRPSN6Y58xyvl08S7/EfwSC/+2RxyYtZpegun8pJ04aMOVpR96hotYt+v/EGQ4zKEXI+
 QyZxAwRtdbD8tsCnL+yanDCkGTMZ18iXFpKlV2/Mv5neQ70JnhpsLMtIIzKZscZH+9QoJvQ2B0QLLB
 dOpJjH3haZv06cZ/k3cG/WIZVqumia
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_145338_857248_5CF20EE5 
X-CRM114-Status: GOOD (  12.60  )
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
