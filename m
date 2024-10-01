Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A83CF3189
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vamnnnN82hEu9FFqw1iD00CVXB52x7dHDpRolIYd2ko=; b=dE7JwpOH9yQapt
	1EHKDhCUw/+mPHdxHG7lQQSnptkZO50Mc5L3jIeWzL0p3dn85A/RuPhEj4ejxTLwVIMPl8+Bh3+c4
	RuTKgUFFRIks4IwLWu9aamsumVLRJzb4AqeJzDwUfpuqdVnlv7Uh5T7Jnhx+3ElS8XyyA01yRT1Ow
	3daRpeoSRyaDExNxG8klc9V30/hOUo2e3nI6w8xy7Ozoe1X8HA9W4f4tIKK0MBRwtzE6PCiruy1Ff
	E6fISP1BlmmgOHW0kAcbFTa4OPdCYhHQqPiSaVK2ZgLhFSqjAb/yc7IjJsf4obEvz0QNiCUKQwh5y
	PUeBKiPugSH0vvGr2d2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svm1r-00000004KFQ-0vXa;
	Tue, 01 Oct 2024 23:11:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svls3-00000004GXC-0fvD;
	Tue, 01 Oct 2024 23:01:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 745BF5C0F07;
	Tue,  1 Oct 2024 23:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7FFC4CEC6;
	Tue,  1 Oct 2024 23:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823690;
	bh=cWAEuqYZg+17LABQvN9oRF3fUQ66H1+faDLiqviD7Rg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JVOwfzlnQ1yPBDbyHnBgjdhX8SQ8mjDy1QRkyFkl+gx37UIxMkNToKrHVI1wydeCy
	 RvfGEfIUbYLBkyn5jLSMtS4EU1FuCrXR9nErfytRVB8rKmIeiUyzqTAXya3u5hSYSW
	 ZBqvuVQ+khkZqPwaAr87X/XDdwoPeZijmcaMzMRbnvSldy09sAicXE81Snt3Ig6vI0
	 OC4JtKB6DHV97T5dceAw0Jo4Bhxw6j2Y/6yYFnKqZbGelN+KxP2Y/5mZwrYxZIAI4z
	 3LSsPRBfwp/s0bVks8hgqIqV80OhU249mQTsriYGh3sReyLGn6wuVQhtXoHqTkFdWt
	 MzUy1utdiCF1g==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:58:47 +0100
Subject: [PATCH v13 08/40] arm64/sysreg: Add definitions for architected
 GCS caps
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-8-222b78d87eee@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cWAEuqYZg+17LABQvN9oRF3fUQ66H1+faDLiqviD7Rg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7KzFUM+Tl6KY9+ZmIs9ee3X2SFnChzVHp/wsKS
 BBUyQIuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+ygAKCRAk1otyXVSH0IRzB/
 40t5IAmsVTGi7QY/R5VsHa1iNQj0hKlpetd6TJOdMvRKsXR7+KpNuOvRgAkbhlDXCwJYjeU4V4pZTC
 49GPGeYHCub8P8aKfD8/+tiWv28sHcRKtOz1ur8l73Orsj2Cd/ed/JcBfulU4rXfyfI0SpWxr9JucH
 OwLTLsF1AA17SaFcrEInmJ2dOxjQOIIXfZ7+rCJWC1BBDKx5VwB19cZ07spFGUITn5wpQr3Gzb/8wK
 jyrS73oi0ChXeCFjRaYAEy8XRgWK3W/PS/rbmSvFxKS0Br/eqUVWIMTnB7+8JZ4zsPVbUs3ZdGhLY9
 5ld0bkuoXsL76SMw36DmJc7xoDL2LX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160131_408570_006EE603 
X-CRM114-Status: UNSURE (   9.81  )
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
index 9ea97dddefc4..9c98ff448bd9 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1101,6 +1101,26 @@
 /* Initial value for Permission Overlay Extension for EL0 */
 #define POR_EL0_INIT	POE_RXW
 
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
