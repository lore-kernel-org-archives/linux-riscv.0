Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D5FCF318B
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 00:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NJ5kRsr2sgH7AuGcX9YzUSkumADTVDy+ZtXXOLfx+k=; b=uGSCfZJELujGzi
	J9uHdYpIvpldTTce2nOfywUQCpc08QZ02TRzRv+8GsIpXA2w3kudT3/gbCF6egrvnzMnZKStFNgp7
	K2ahhOrx6elyT6Qz8oIXMPrDb02E20kRCUSO2Kk74mtu6ftd/0cXro7d6JVhuQdcF4o9kNWYff/YC
	InlSiprhjcJjo6j1CrugGnmDnfQSBcF6QIBMTGmk3HoBYfUBcValB1X8WVfPSKqQY6X9czhjlwaE0
	GS68UWn6rrNGHSqT4+ezmHXuVOyGU0s7+ajoD4YxC4x/jbcozhpmd0k9cnUHbzKBELv8hql47i993
	3lbnZPTvLPq39E+jSyWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svnVr-00000004TYe-2LqS;
	Wed, 02 Oct 2024 00:46:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlw8-00000004ILy-2Kvt;
	Tue, 01 Oct 2024 23:05:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C8F15C53D4;
	Tue,  1 Oct 2024 23:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CC6C4CECD;
	Tue,  1 Oct 2024 23:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823943;
	bh=ioeceP+BFqA3jud12cOD0sJcVjWnQPo6t2cQSXLuyHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kx1yRMndAjUJvJPAMXQ2VC6z8G7NmOrbYUt2g6DGAQP0QBoyDPQi+1Se7fH8Pxi44
	 8mvl5WOTzRbf99m4gw2xagRAK2roEvxigIh1LXSaGpVE34YNdy5aUzv5WeL8D50IOT
	 LUIhobuoHDtNwmChk2d2L9GtjRFAmIkRCV/UIyyK9WYiAVu33DZwXkDtiAKB7Um1EA
	 EVPUikALWWsBe23EXO3le7nTxuwuXLjQ8OEss6r4D6OZptAp6Q/LVdwoGlMKt3MQVA
	 uGFLZvzjwVHUBTCE493ZGDPjR4ai6lU73zH9qbTRrb8MSLsUN1vOls8dpEDDhNArWo
	 uYO311Tyxczrg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:59:10 +0100
Subject: [PATCH v13 31/40] kselftest/arm64: Add framework support for GCS
 to signal handling tests
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-31-222b78d87eee@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ioeceP+BFqA3jud12cOD0sJcVjWnQPo6t2cQSXLuyHs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7cl2+Mx+1HhzjopTN729pEuYjBFsWKPZlO2MdU
 P92ymjqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+3AAKCRAk1otyXVSH0Ig8B/
 9GZyQlFK4iDt8NbeQZL9to6g92whSIQqB6IZ/45SH8X0FcRvl3aYwQRzVYoXwCsi7Rd7Wv899pD2hg
 ETXnYNckPSxj+/Hg+b1GAPnHeWVVBVjFf8tQZkfBj/aqGF7dehT2mEkIn7I6Ne5FEEegty03McxT3B
 SQ+9/X4Gicx8vTjF13/ij+9T9m+D2zXt56RjM4bGDcoEqX8z+sSm3fys+crSlDhD0b9wgtVkjrO2LG
 KqizOqhNT1kF2bGNuK5x+U3FUcjJ6C7g9QR0DUYFUb+s2hLLRGPa7qNnCVj8aIjJj1o7x1xiOmBXOj
 hPUP7NjNQh7lMAUg9LW0vgYN3lcBvk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160544_765590_16B065DC 
X-CRM114-Status: GOOD (  10.28  )
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

Teach the framework about the GCS signal context, avoiding warnings on
the unknown context.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/signal/testcases/testcases.c | 7 +++++++
 tools/testing/selftests/arm64/signal/testcases/testcases.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/testcases/testcases.c b/tools/testing/selftests/arm64/signal/testcases/testcases.c
index e6daa94fcd2e..0c1a6b26afac 100644
--- a/tools/testing/selftests/arm64/signal/testcases/testcases.c
+++ b/tools/testing/selftests/arm64/signal/testcases/testcases.c
@@ -198,6 +198,13 @@ bool validate_reserved(ucontext_t *uc, size_t resv_sz, char **err)
 				*err = "Bad size for fpmr_context";
 			new_flags |= FPMR_CTX;
 			break;
+		case GCS_MAGIC:
+			if (flags & GCS_CTX)
+				*err = "Multiple GCS_MAGIC";
+			if (head->size != sizeof(struct gcs_context))
+				*err = "Bad size for gcs_context";
+			new_flags |= GCS_CTX;
+			break;
 		case EXTRA_MAGIC:
 			if (flags & EXTRA_CTX)
 				*err = "Multiple EXTRA_MAGIC";
diff --git a/tools/testing/selftests/arm64/signal/testcases/testcases.h b/tools/testing/selftests/arm64/signal/testcases/testcases.h
index 9872b8912714..98b97efdda23 100644
--- a/tools/testing/selftests/arm64/signal/testcases/testcases.h
+++ b/tools/testing/selftests/arm64/signal/testcases/testcases.h
@@ -20,6 +20,7 @@
 #define EXTRA_CTX	(1 << 3)
 #define ZT_CTX		(1 << 4)
 #define FPMR_CTX	(1 << 5)
+#define GCS_CTX		(1 << 6)
 
 #define KSFT_BAD_MAGIC	0xdeadbeef
 

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
