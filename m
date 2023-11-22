Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0CFC61D9C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rm3Bumq0RcEp8uQW7aIeMXot0jX7omeffa0Bej1n5i0=; b=KjZuDUsvfEBv1K
	TfzmqN5Zo1ZHw/DntkuMQ/7jrmPTW9DcMm/coJ5ZgJWn6BIaZ9BnP1V0llOqA1rqFxCWXGI1IHokX
	bOs7kKBRQPM/0lBcxYXO7R4zfkjZ3LqfIoYcFulhafWwhGuMQhMKi6u9momwTShBK9OByK5NuvhyA
	or+72XUxhuV4V2t44LBjFRw0DwxE0rkL7I33iaX07r6w8Wx/Xn7gwKclr9ltsJUT6/OmIanxrNSDx
	hQIhtt4LsTxzWJAq+INejSj/vejoqVmbJLvS1TaP+bNO7olGxSkDXXUDpwt3w4zZZymUBZbZvUj7p
	B2MdapHMwxOvUEUiZXIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jpf-001JtY-20;
	Wed, 22 Nov 2023 09:47:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5joi-001IrL-2G;
	Wed, 22 Nov 2023 09:46:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E66FCE1EC3;
	Wed, 22 Nov 2023 09:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495C6C433C8;
	Wed, 22 Nov 2023 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646401;
	bh=eI3VK56kyhvq7JOnBJXgl6j+EIFmz1Cd350CxZrMcNA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p3JwdAwl1IwDl1cRu279YeAAcZ/jDDNBFvD6epk9Cj3NAtBjknB4UKuxychR75RtB
	 FhjbV32JXVmGGIo7RvOYvZI21X1Va108tpxqaoXhAlxRto69QxeD4jrYLKfxzRH+xS
	 fS4SsKyIPwP7gr6HZsK/zCT+FGosjhk9bH6qPcKXRN5/Gg8IcmfmTi+fnplKR0d3NB
	 d4XtyugCFtLBNbW2QMhR75JadHd3ITyQBaQ4BS9ZMhBgxqaRG6GWK5XglKVU3qBEyH
	 51/2dg7wqDRYv0qDxXDHavJlTBhDl1MK0iQvFuQaTnqc0cUJPWw7BCj4c2ii5isa1m
	 5uI1oYMi+XrMQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Nov 2023 09:42:39 +0000
Subject: [PATCH v7 29/39] kselftest/arm64: Add GCS as a detected feature in
 the signal tests
MIME-Version: 1.0
Message-Id: <20231122-arm64-gcs-v7-29-201c483bd775@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eI3VK56kyhvq7JOnBJXgl6j+EIFmz1Cd350CxZrMcNA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlXc0MpoaH+B7so44Op51dKDPnZ+HR/liFSB4lO
 rxQeP/wL7iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZV3NDAAKCRAk1otyXVSH
 0OPrB/0bYwxvcTBgjII2I1FWsRdgrDk0RAdSe1MhLGxQngmZhESoEneo2Hq5C+22QiDRyqPOBWG
 NBhs+DcJn2N8QakBKktW1j2hZa/f2Fq4KvqQXWzEzaozqttPg3+lRVUc/+5XW2a+SMylEt1YziP
 D2jfrKJj4dayCnvjh7KLRR9I6EXK8+UH3eNDRgBoO3xugNgtV822vuRQkc43QiV5uAvpfJ3I5ZM
 ddSrXmzHk2QU0QffGhU8k1hfn4I2IqmpsZW99HiDapofjAKTjk9jUeKd4kbu3X+PH/DOibREYO3
 VHJNr+Al5/4t9DoAy8UzphVB0ymspKLRJlwLJbX6p/eOOAfu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_014645_137347_108206C8 
X-CRM114-Status: GOOD (  10.79  )
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
