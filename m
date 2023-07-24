Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FC9C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CkBEvT/fAylwh5FNK0GQ/6c5HFBp83pHTK90sj0TOX8=; b=Iz0Z0inIzneGCo
	WTPHiHTfwebxVGj9Jumsq5SbYOMlLGK12t7EUhBu9pEv+vqH5MODVLoGybSjoR1fPJwO6YJT8BdlO
	xrN7ZJr/dXALHxziRU5xaQP9YIyKobfSUQO128iQl+ORmZSn3ayyiiHXCMRrlxjNmLL0xEYWF2Fce
	Ma2gSiqmchsmj2/TEw5a5VznLaaG3/Sibutt3Ryc33Qngx5gRoO/Kn9zc+stWCOaCkMRTuzomdjWB
	Du7bWIeHB6LRgdWhUchnLvNmPRvJ51xij1bJDlkWg1umXfP/mQeoxMbsh/YvuT9LoL2UV4qBXF7Wa
	wXdK+EamHzmPQeGBxGog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuzT-004I7H-2T;
	Mon, 24 Jul 2023 12:48:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuyw-004Hde-19;
	Mon, 24 Jul 2023 12:48:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCC1861150;
	Mon, 24 Jul 2023 12:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9852CC433C7;
	Mon, 24 Jul 2023 12:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690202889;
	bh=viG5anxcCcnETy6WTEqLj0O+gpdZleg7ylSYSUDSWcI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eAHFD3VkLN/8hYIgqRqDjQ6LYTYEEBqeysndIBpWyaqChnJimQhI2SWLffN0KZPuj
	 lIir4tYMNSE/l0Imtt32k/Aq1wucbaZFpvPA0Q76Ftk5Q2jz6gyNgoMwvHITgWPKzz
	 TU1gqXlVS9FVW1MNqWsf8w8XXunp1vTJmuOtK7yhaklMl6nMB+HxiZaZqRJBEHgEhy
	 byqtJUMFFWC+9RJqhZIgnfP2BJDR0dx5Qq4KNXqCldfDulWjLtbVzSdsihRjnfTEh2
	 DrOZ3c8YOFjiKv0FrziAZlTVf/nMRKDSfIxMJVdP9+jOkJpXRB+Lop3XzdQmgwvwPe
	 uq0oKZomv4thg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 24 Jul 2023 13:45:58 +0100
Subject: [PATCH v2 11/35] arm64/mm: Map pages for guarded control stack
MIME-Version: 1.0
Message-Id: <20230724-arm64-gcs-v2-11-dc2c1d44c2eb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225; i=broonie@kernel.org;
 h=from:subject:message-id; bh=viG5anxcCcnETy6WTEqLj0O+gpdZleg7ylSYSUDSWcI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkvnKRaZSoY2+MaaD6WZiUULr2xdVlp7ZPrzrnZmLl
 EHOK+gKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZL5ykQAKCRAk1otyXVSH0Mg7B/
 9+4k2ZXisvhnKjAsSHTUw1WHN7uidVpsJ/tQIxcwlf/sL96Wr7p6Dt3WpcFegBwJyWipn6L5XmrDzp
 TLd6eWFsOwxF6bMxL71UbwQ929Lih6fQ5r2sUQxNEwTKYmrIzhvm3paIYNtGe/17bHGmT5+fxtxHG4
 7o5KhB1DsaTLY9ECCB38jAMstQ7+Lv/on3xMjPHnXrR7+U52NdveoIDKePI9eiQ01sF+Ylw/EEmzIJ
 KCqoCbYhFOAwUVuppI/P3fHgbq9mkLk+K8CPa3KY+fZEMQz6DsApbzkl1+HcynR3gRKzR6YGMA227w
 dorur6W9UQcXxTVIfPt+VAxzu2iB5Q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_054810_477570_1C992CB4 
X-CRM114-Status: GOOD (  13.88  )
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

Map pages flagged as being part of a GCS as such rather than using the
full set of generic VM flags.

This is done using a conditional rather than extending the size of
protection_map since that would make for a very sparse array.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/mm/mmap.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
index 8f5b7ce857ed..e2ca770920ed 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -79,8 +79,23 @@ arch_initcall(adjust_protection_map);
 
 pgprot_t vm_get_page_prot(unsigned long vm_flags)
 {
-	pteval_t prot = pgprot_val(protection_map[vm_flags &
+	pteval_t prot;
+
+	/*
+	 * If this is a GCS then only interpret VM_WRITE.
+	 *
+	 * TODO: Just make protection_map[] bigger?  Nothing seems
+	 * ideal here.
+	 */
+	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
+		if (vm_flags & VM_WRITE)
+			prot = _PAGE_GCS;
+		else
+			prot = _PAGE_GCS_RO;
+	} else {
+		prot = pgprot_val(protection_map[vm_flags &
 				   (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
+	}
 
 	if (vm_flags & VM_ARM64_BTI)
 		prot |= PTE_GP;

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
