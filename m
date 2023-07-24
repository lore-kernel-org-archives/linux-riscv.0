Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF76C41513
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 12:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcQCwayZmc1SwvhWz/H3tMRbaGXe50tqKS+IZ22UrFg=; b=Aq8J9Xvw9XwmTG
	EMi0e5YOC0eit4S4PblQl+KJ1aMErMW9yBy62yRZ79UBpqipGfXAvuJjWoBqxXOPPAN39fdu4BQJn
	Avi3CWtguFo4tokQMoSVrnhvQnMOQpsSW2unbZnrIoXq0wlVlKwt4etpNw5qBEiHAyabXdRVQjrBJ
	8ZnfOK6jErHvHGZVjli94Ml4jxH8oIYCSD8/RQ1tor32jQ/OBay7wgcOdNFIRuybEzS6f5f1/oNWu
	p94XoLVRh41wfWy9bjxBTp/5LicfpdUn6kmlfNMYcr8hdAEAk+ubnxbvC4YwgJoOgCO5ooq9467mp
	XLGU6aYzLKpUN6Aq62Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuyc-004HN6-1a;
	Mon, 24 Jul 2023 12:47:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuyK-004H64-07;
	Mon, 24 Jul 2023 12:47:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8268C61158;
	Mon, 24 Jul 2023 12:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F74BC433CC;
	Mon, 24 Jul 2023 12:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690202850;
	bh=k6DV13RSkbr/e436II0jx5LmEFZf9bksk2EmOe6Nllo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZzFz0xChocJigRyhckWkiGbMNFfgvUZ2aTY7UJZW67aba143TsIFJnYZGFLRCzhkV
	 p4z1OLlrd2p3/IDbsMvOIuc4G27M5eFFqNUE88mw5fCDw6nCfdOq66e55crV8yHPMD
	 qdXW5aoB/sbGf0Vsv3kEsbdgFZLT3axGgt6mCINcTiUED8LytKlGuFxIURRm2wOuy/
	 i+0WGPMA/T7XNJNFl/papK8Unr+ROqOxTls7IIv3WfrJp7flvnL0vUJl3UWa9a2VAd
	 DerxdUFxwQ6DvVXiuvvdpOmzGStGtxsFNgfoEr41kZBf8F6KeU3NWDIOqGkGuTvl4z
	 HJdQFug7WKl3Q==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 24 Jul 2023 13:45:52 +0100
Subject: [PATCH v2 05/35] arm64/sysreg: Add definitions for architected GCS
 caps
MIME-Version: 1.0
Message-Id: <20230724-arm64-gcs-v2-5-dc2c1d44c2eb@kernel.org>
References: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
In-Reply-To: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361; i=broonie@kernel.org;
 h=from:subject:message-id; bh=k6DV13RSkbr/e436II0jx5LmEFZf9bksk2EmOe6Nllo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkvnKK9YFEeNnB2LPFVrbzQw3UpaZONHZ1AlyTlpQc
 LjIPvO2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZL5yigAKCRAk1otyXVSH0C1jCA
 CEu8W1gxLJnyqsAHY9nrXFKaQgsN3fIBVjMqPThPyUFGK3JkKj/xjTN4FLtLOcerA0mdaK/IrRrjmq
 2SzkrXRwYFqUEgiH7+P6ndrDekxsrL/RkV5zWGwh7trg3vEYRcTxwTmqr0DrWyRocEHlCoNYjobCDp
 /8L+FUV80oiCeVHDab84OddNNzbe/ftHHu1HuxP8iARBpXIuOXeRBi3q6OS/+uyrVZlt5K9/a6hC7h
 qDFgoTiBL+EdZPqbu2VswHtcc+52XtaJnVzU5olM0oazxeLuuUghx87z1CVfw0uROEuBWRvmZJBuou
 tDkrJHz+RhOVB1WooSjah3wTHIK4Zz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_054732_177416_A99140AD 
X-CRM114-Status: GOOD (  10.67  )
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
index b481935e9314..3d7f9b25b8fb 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -730,6 +730,26 @@
 
 #define PIRx_ELx_PERM(idx, perm)	((perm) << ((idx) * 4))
 
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
