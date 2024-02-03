Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4299DC4828F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 12:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4R8AwroyexBIWTudU7Ca7UAqhFLNg2OjnpDWX0SuTQ=; b=zGc8LKYJ6nPlRk
	PcZqjb8HvrKzXuEmUTW1Ci5p4wkx6zKmBwY6dqybZs0PprPrXozZvfRiGyAqfiZNaFALDWJT75f8+
	LuGIMuwoW3VMtIthWfIKsP9up+nc6vbE1rYWe1d1ropsbQZ3oQdWyBSC3pbYjHxzuXxVg7yimUEhh
	gTc/XHJkDaxFMYLpHYj8aj0lodC9KQOsUAWL3PxQ4WGkLa9bbwBfcilKM05+tAMB9Aju4Z1e/kyG4
	qYoWzzWMgfOz36UhuvCmeP9M1ghNXxsbKWjX4TFakQ24zNAu4htX5uXyQCpvt2GbgEqjC5JhsjYaE
	WOFD1jWbdwvRWWhYd83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWF9J-0000000GIFR-2u41;
	Sat, 03 Feb 2024 12:29:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWF9F-0000000GIDR-2QHN;
	Sat, 03 Feb 2024 12:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F84760A13;
	Sat,  3 Feb 2024 12:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2D4C433C7;
	Sat,  3 Feb 2024 12:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963368;
	bh=nfp6EMTmsacTE8jIWijq0csUQnWyRS9dbPzwDPbc9Oo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=osiScCWg4d3KIQZcrJeOEESWG83yHbzhiGcQeX7MowDI3BpjPG0b59J5w0TMyUGhx
	 AiZFxIDmeGUFCmE3Gx5qt5Ekc13a+DGzvGFihiMuVXGFOpCy0HP16OhiVdFRNmINdk
	 B+++NJvgEKQkXUHftLefN+RkWlfmRMCdidNYbJscH4DWcTBUpNux0R9eWYq6BgUyJf
	 ZIpFreOOPDY1dmytZEu+vqVlYuYTsEYckA3a3Ae8EXP8Uz0zdzKlWfbpI0+Y+oqN/+
	 8BARDvmTtKiPJDePxkqMCbgacVKxEXJM9wA9NjmKcvMUJHFKUtFzBD3+BpE2U3mXGq
	 6FWOb2QFd08tw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:25:32 +0000
Subject: [PATCH v8 06/38] arm64/sysreg: Add definitions for architected GCS
 caps
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-6-c9fec77673ef@kernel.org>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
In-Reply-To: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
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
X-Mailer: b4 0.13-dev-a684c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nfp6EMTmsacTE8jIWijq0csUQnWyRS9dbPzwDPbc9Oo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDV9XvzQG5mbwdmnxaEA2beaNmzTLR4QnZfsb5k
 dABRgtOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w1QAKCRAk1otyXVSH0DSDB/
 4ndgRTySkwuTALaejt2vvGqwqgfiRnfYkefv1ma8rX3ZFKkMhDmmWTaqgOWLCRoex5Fe5UhcFwYrHT
 a2aI58d9V1IAUodeTLqo1GD5DaDA4u1/tDmYlgYmy9u9PJrnPonUUaYzkKVfkOHjIVRvFL75b9VcNH
 ax5DpBY3FxYokPpg6PWwG8R0LApWNrwrEMY/jxDYInXcBnW8nnqGaG5PQ7XlpwM04YBo00koRuPJ/3
 Sc3T/ew/2wbt3217BNKGVIUpFtzCn83x7VLwr/Ht3vfMrHO0IkX0V/RAxhBMYq9JvGYMm5rL/cCkbA
 OLa29/wK/D7MMMDE1wda7wLwRtVOwc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_042929_817683_CA6866BA 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

The architecture defines a format for guarded control stack caps, used
to mark the top of an unused GCS in order to limit the potential for
exploitation via stack switching. Add definitions associated with these.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index c3b19b376c86..6ed813e856c1 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1064,6 +1064,26 @@
 #define POE_RXW		UL(0x7)
 #define POE_MASK	UL(0xf)
 
+/*
+ * Definitions for Guarded Control Stack
+ */
+
+#define GCS_CAP_ADDR_MASK		GENMASK(63, 12)
+#define GCS_CAP_ADDR_SHIFT		12
+#define GCS_CAP_ADDR_WIDTH		52
+#define GCS_CAP_ADDR(x)			FIELD_GET(GCS_CAP_ADDR_MASK, x)
+
+#define GCS_CAP_TOKEN_MASK		GENMASK(11, 0)
+#define GCS_CAP_TOKEN_SHIFT		0
+#define GCS_CAP_TOKEN_WIDTH		12
+#define GCS_CAP_TOKEN(x)		FIELD_GET(GCS_CAP_TOKEN_MASK, x)
+
+#define GCS_CAP_VALID_TOKEN		0x1
+#define GCS_CAP_IN_PROGRESS_TOKEN	0x5
+
+#define GCS_CAP(x)	((((unsigned long)x) & GCS_CAP_ADDR_MASK) | \
+					       GCS_CAP_VALID_TOKEN)
+
 #define ARM64_FEATURE_FIELD_BITS	4
 
 /* Defined for compatibility only, do not add new users. */

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
