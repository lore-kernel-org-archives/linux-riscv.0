Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38BCE95A97
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bFumZkqg8tb66t+eovwR89g7nu0I+5DqdwjRAdyTSYA=; b=VWwcZ6coGNgpwX
	hTduOqw0XY2z4pwslEh7rJUq+a3RUHKYgJHetbE6oWy1eQWQ1mR1oIaonbF9SHUq5tb77ctk3FoNP
	GqcWK4FXcoJQ8rO6VoiWymbxIZ8GXB+AapOwA67MihvRy9DAUgm+5+xvScl/WcxAnwCMyY9eJtwL9
	02jcgpAmbDVz1SIfC6J0y1sKg9kjDmhZKNvUvewird01Pnu3BNm8WxV4ZY7nEKOWzXN1X6QaR0W4u
	nkABrYlNsfnZftXaQGenCeu0UONLam6duh0s7uTY0SKVSOUGWnewYsGKVwQej2cw1+cn+0glAzqkL
	LvFqbr2Snf1tTmOO6bYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp6G-00AZLH-1u;
	Mon, 09 Oct 2023 12:11:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp6C-00AZHn-1D;
	Mon, 09 Oct 2023 12:11:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DC636111C;
	Mon,  9 Oct 2023 12:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D73C433C8;
	Mon,  9 Oct 2023 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853459;
	bh=uElqfQr2KtEKDlB4Anquq4cFfJfq+1aLsyIKGyzwTJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qVvakmNaQygpJZ0uePjFrJUrtsbzrcfhstnJItES/IVtru3NeGfEp0fGQksQC1DWF
	 tMpQwgQ65nxCY58ThrzthwgXTnIc8aWuBUqCFMiTj0PRBWwCAGGebOZnZveIv2rrvk
	 XPwA2URNcWdhmQLqdteoSpVuvpN42XibMqMLvqmmFtwmicQMYk1NMZEzhlLUUCF/md
	 r+nKxA2Vy/p0f6j0IZcPikta50sb12/VXajcIhynQjhQk6kZDtPyif4nUIRajawG7M
	 QL7Hqud+AA0HT9n5SyxHxQ2wtlbkMENYDlSQpMemYVKshIbyzuaW4W4Hi7tYQlYr6w
	 5ZdC0OBCkOkoA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Oct 2023 13:08:37 +0100
Subject: [PATCH v6 03/38] mman: Add map_shadow_stack() flags
MIME-Version: 1.0
Message-Id: <20231009-arm64-gcs-v6-3-78e55deaa4dd@kernel.org>
References: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
In-Reply-To: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uElqfQr2KtEKDlB4Anquq4cFfJfq+1aLsyIKGyzwTJE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlI+2TBBNpiyjJLhMTZGrEExOLe9h6uwqTYHZeEaaK
 XP1+sAuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZSPtkwAKCRAk1otyXVSH0FWxB/
 9zuNP79aRqxAABj4AUSSe96yq38SrHY4j/bVNYrQh9rMPH1RVp0FPIw73yWeMrrO1QkGkFkDYCWOWG
 mVVT2KLXAeczKvsbiTQwi0+0jWSMTCgW2WiBenv4gjUaI1cZhDOFaFmpbXydGDST/L0tgS3VsKCbRp
 I3YW//w083fjMYclQWfH7/EPPDxR9SFHIS+mSQJ4xOKlcy/AZVYzDGweA1kVTrbqbY4SMQ166v51Kw
 K76x1ZQScvlzZggJ+gfra/Pz+awJQu7tTrsrRuUlgkOTvGektRvIgbswUBnuAHryYS5CYGduRUrwHP
 pAXIQM7vP8oHPKeWRA/VojXac+pwhj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051100_501514_776DBCD9 
X-CRM114-Status: GOOD (  13.51  )
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
flag indicats that a token usable for stack switch should be added to
the top of the newly mapped GCS region while the new flag indicates that
a top of stack marker suitable for use by unwinders should be added
above that.

For arm64 the top of stack marker is all bits 0.

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
index 57e8195d0b53..d6a282687af5 100644
--- a/include/uapi/asm-generic/mman.h
+++ b/include/uapi/asm-generic/mman.h
@@ -19,4 +19,8 @@
 #define MCL_FUTURE	2		/* lock all future mappings */
 #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
 
+#define SHADOW_STACK_SET_TOKEN (1ULL << 0)     /* Set up a restore token in the shadow stack */
+#define SHADOW_STACK_SET_MARKER (1ULL << 1)     /* Set up a top of stack merker in the shadow stack */
+
+
 #endif /* __ASM_GENERIC_MMAN_H */

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
