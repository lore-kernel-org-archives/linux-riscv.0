Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26CDCF318A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0i4lih6l7XvUfNuIfZXEmiChFPAscvrlxMR+ssb5JLU=; b=Lh52oBJKvW3YCt
	FxSiEjdcE4TlWCw7q0vEi4A1bgcbRu6fqqsmFv+SvOdOT0EpNIToQP+arlQw+5qk5MDAFSL0GKZPj
	N8TPA4RQi/9GWgDgXtSy6UILOmZUHi6PJ0SKv+Woiu7DmJe5iryytrNHvT2AP1qWUThIi7c2lxCis
	hioE4UIPY1mJb0AYsAuPXdl0EYHI2FIwUuEt0ULlFXUyh/LOCOrw1rl9i/+FxyuRxHCUZd48mlEup
	GWg+u+pvzHCYqTRbpzJLrrfga2DQ74wXwM4OQL9R6O0VjEgVgEZz5Ov5ZHAnxwcEHmyl1dldqkWht
	MRpXXEAt7kcUsbnxAcvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svlyD-00000004J8R-2nHf;
	Tue, 01 Oct 2024 23:07:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlrT-00000004GHa-0Nde;
	Tue, 01 Oct 2024 23:00:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65D595C045A;
	Tue,  1 Oct 2024 23:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BCEC4CECD;
	Tue,  1 Oct 2024 23:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823653;
	bh=vL+b/h3WOPYO7SwFl92JA9c0VbV77YwkdcIPJjlNFTs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q9BEblIa6MmA5Xaow7wFPzfAM9zttSOUnO+EtJzN/PX7Huf9lzr++3lNcVEnhbBqz
	 6dMkhlxPMElbdJeNlV158SBKPlOnHk5LQmhwlqFXihJgYSoqGxl3GLqUDM7DzAG5zc
	 lvLDejujVe26CNwqEFjY9RC9WxGXrSNkF5G9RyuOCrURHXGYY7+8AA1BJ1SMrCIjZt
	 BJvDkqRMfZF1cudVdwGq4CDhB5w9OLNa4NOrghTmOJJzwygsOzNNOFDRDlXzt7kKtH
	 IpBNBwRkNrS1h0eaDjRqb0/mVRIcjwZiyqBZn+jatUlWQ0I77tCcOgDFflvH0cvLXI
	 3XrtVqCX11mdg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:58:44 +0100
Subject: [PATCH v13 05/40] mman: Add map_shadow_stack() flags
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-5-222b78d87eee@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1935; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vL+b/h3WOPYO7SwFl92JA9c0VbV77YwkdcIPJjlNFTs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7Ig3nICM+W9H3bCT71LrQPx0TmwN2XrzWIKusU
 qfRtVgmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+yAAKCRAk1otyXVSH0EIMB/
 9VAnLOcjD+99k7ouK69WkUZZje02S2hR6fRnCSftnhm+4bz+XAyRnRMAjPkiv0ecgHaTuBtP+MmN6L
 M1BTqr15gkX62ORCMeKqgMig0l5Zm08WyrOD4f/Vf4Zb4phDfeQkEhHthQYNAOzPiw9zjQIJGaypMM
 PJHFuO2ykfazrzqINBCj0D1SCeQt3+5cESSO4XqcDnyaOrpnKPqwWdoWVkNzB98GHx999EQw2iWsOp
 pEi9Zg8ZJFAhJSTayVv1NDY9QzD6ngW3nJCCx7rD/3cbiZd2/Whg25ERj0YbAqlldQVHJfqrX3RCBL
 guH+PVB5PQbczVYykW+F+llt/dznd7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160055_261104_08BFDF51 
X-CRM114-Status: GOOD (  13.47  )
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

In preparation for adding arm64 GCS support make the map_shadow_stack()
SHADOW_STACK_SET_TOKEN flag generic and add _SET_MARKER. The existing
flag indicates that a token usable for stack switch should be added to
the top of the newly mapped GCS region while the new flag indicates that
a top of stack marker suitable for use by unwinders should be added
above that.

For arm64 the top of stack marker is all bits 0.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/x86/include/uapi/asm/mman.h | 3 ---
 include/uapi/asm-generic/mman.h  | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/uapi/asm/mman.h b/arch/x86/include/uapi/asm/mman.h
index 46cdc941f958..ac1e6277212b 100644
--- a/arch/x86/include/uapi/asm/mman.h
+++ b/arch/x86/include/uapi/asm/mman.h
@@ -5,9 +5,6 @@
 #define MAP_32BIT	0x40		/* only give out 32bit addresses */
 #define MAP_ABOVE4G	0x80		/* only map above 4GB */
 
-/* Flags for map_shadow_stack(2) */
-#define SHADOW_STACK_SET_TOKEN	(1ULL << 0)	/* Set up a restore token in the shadow stack */
-
 #include <asm-generic/mman.h>
 
 #endif /* _ASM_X86_MMAN_H */
diff --git a/include/uapi/asm-generic/mman.h b/include/uapi/asm-generic/mman.h
index 57e8195d0b53..5e3d61ddbd8c 100644
--- a/include/uapi/asm-generic/mman.h
+++ b/include/uapi/asm-generic/mman.h
@@ -19,4 +19,8 @@
 #define MCL_FUTURE	2		/* lock all future mappings */
 #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
 
+#define SHADOW_STACK_SET_TOKEN (1ULL << 0)     /* Set up a restore token in the shadow stack */
+#define SHADOW_STACK_SET_MARKER (1ULL << 1)     /* Set up a top of stack marker in the shadow stack */
+
+
 #endif /* __ASM_GENERIC_MMAN_H */

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
