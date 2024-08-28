Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3B0C71150
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KFGJGAUMXWsvjLOirUhvygBpG6hKjcMp8PfhoXR9aME=; b=JAcZXccqArrkgl
	2dvSj7om4H1WbXLlShn9Q4I2HcNXsF0b2UfO49J7IEu4V7aKWKOQvtYU6VH27/XtYkq0EdhS3hImA
	3gFwOBt79QQg592xZhCQ1PwgQlk8MGPjEp+EMNtL9Xpfvi14HXoMnN2+peur8jEiowhqpAXZ8fOqx
	FgabMRmACA4SBtuOZqGilGQJljqjWETLOhNwehgJQ8PAroYHKfB/8atpDV+8DRVUlWtGFU8UKGGPy
	Jo02xifNsPbtlQ/x9ytmk9yl5KqSoKErzJLfJnmDAKwidRP8WIr1f+gZDmBFDR0NQPAgLUtbfNtpp
	69xqL3uBs+d5hCHVNS4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSCy-0000000HPA5-1SSE;
	Wed, 28 Aug 2024 23:36:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS6N-0000000HLzH-48VX;
	Wed, 28 Aug 2024 23:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0EB1BA4375E;
	Wed, 28 Aug 2024 23:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB798C4CEC9;
	Wed, 28 Aug 2024 23:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887762;
	bh=4p/cwsbgBUzYKsL2fclAIfpUU9Y3uPXu2QlRekLj7SY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kNcQU5nyrsMetOTGFm6ud7UHZ/GnC48WWUDtMXTgWHntNfYUFLWWUbL9x2wYmUDTy
	 x7lAq0JvS+9YS0FzCoPtxTbjpqy3dltQDe4nreFRosly12F+4B+Wb+N0OvQBsE8bQD
	 UcMJcKi5VwuSPfz3VnTbOn6GfEtR23FPaLmt68TzAf1gDpvvAlmr0hc4FoH6g6T8LM
	 dmi7fEHFLFgHQ/wd35qLqQxoyt33lXfh+qz2JE53etAKJK1fN/NYH0a+3sQkBQIbTb
	 jVUc8RtgEhHBH+qzQiPpSMaOsGUxLEcwHNhLcC9cIUgM3x1hBKYNObyRW8qXnPl/7y
	 jk9bBXyYZiSHQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:23 +0100
Subject: [PATCH v12 07/39] arm64/sysreg: Add definitions for architected
 GCS caps
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-7-42fec947436a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4p/cwsbgBUzYKsL2fclAIfpUU9Y3uPXu2QlRekLj7SY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7J98aWl1pxIvDvuP+c4z7xD1MmZ369TKWVm31vC
 ZPKg71mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yfQAKCRAk1otyXVSH0DWhB/
 9LgFKRD1xzzF2u2DcCqEwfQNnsJraBn1ikyZXthyso+/206Wxdaj6j6nc8nWNfdRhZgLV2t+fzG0jo
 Iqy1hG93N0nh6yqsPqlIgSAUqDnBq8+GpuhxlQy/nbpu2V6m5KslRv2aoooWQCcm3+VF9uw8elyiEk
 8K1yoV30FcvolqwyqiZIvm+S23v39l+nKYnW8QpvGSiHjSeltbT/rzxCHDZjG389l0YAM7lKEm3bWT
 BCFwq57PaZOdi/pK9ntm+WT8D25rZXmUhRtmILh9YNxOVifkuPFXQXHfD8Vu0zOZTTR/3kOWXQmrKC
 aSV0N0IHiwIlq88HTD622I9HTZSO2a
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_162924_243897_71CA6C03 
X-CRM114-Status: UNSURE (   9.79  )
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

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 4a9ea103817e..b8d8718a7b8b 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1077,6 +1077,26 @@
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
