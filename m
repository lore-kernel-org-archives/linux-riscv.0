Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6A8606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 11:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SGq0dEwc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7Jjr0uFJdEDR8aVynso7sgem8yNeJTTXR5RkD4AkquE=; b=SGq0dEwcEiP0BCTP/o348Oyd7n
	gbznxwdZre1J7hQjfbNZC2xeKxNXr7PXRC8RMPAPET33TP1W7EVte5wf30kDQmBDHE+iUx1C9D4Al
	TDlFyBBj3znxXvhkPMv/CsnCf13LgCGsQAfxud4CNCTqZNriHwUsrD2dlNPXDWG78lFc4GfYOSV5m
	jG4aPYsYYtPx4lFX0WCl26/dWq/V3K4DtxeQcEDBD1puQpKAJ/Cm2xbcg32JSnq7MvwqOkc/9T40n
	zbjcmnKBcwOfHsZWff3P/NQPW4msYymP7wB5eE26GjAqwAghidDcJnzvsEo+KcTpElur+XoYCUrjF
	dfoJniog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjlx-00000003an0-3mEJ;
	Tue, 10 Nov 2026 11:12:17 +0000
Received: from sym.noone.org ([178.63.92.236] helo=sym2.noone.org)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjlu-00000003akD-1MS6
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 11:12:15 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
	id 4jP3rl27dTz2Ftnl; Tue, 10 Nov 2026 12:12:04 +0100 (CET)
From: Tobias Klauser <tklauser@distanz.ch>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2] riscv: cfi: Bounds check restore token in create_rstor_token() before swap
Date: Tue, 10 Nov 2026 12:11:57 +0100
Message-Id: <20261110111157.12409-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_031214_512370_23B1F6D0 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

create_rstor_token() computes addr and passes it to amo_user_shstk(),
which executes ssamoswap.d on it under __enable_user_access() without
ever validating that addr is a legitimate user-space address. The
sibling function restore_user_shstk() had the same issue and was fixed
by commit df333b72c0e1 ("riscv: cfi: Bounds check restore token before
swap").

Both callers of amo_user_shstk() need the same access_ok() check, so
move it into amo_user_shstk() itself to deduplicate it.

Fixes: c70772afd5cc ("riscv/mm: Implement map_shadow_stack() syscall")
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
v2: Moved the access_ok() check into amo_user_shstk(), per Samuel's
    feedback. Added his Reviewed-by. Link to v1:
    https://lore.kernel.org/linux-riscv/20261103132003.24312-1-tklauser@distanz.ch/

 arch/riscv/kernel/usercfi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 86141e5bab82..dd6595322ee1 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -125,6 +125,9 @@ static noinline unsigned long amo_user_shstk(unsigned long __user *addr, unsigne
 	 */
 	unsigned long swap = -1;
 
+	if (!access_ok(addr, SHSTK_ENTRY_SIZE))
+		return -1;
+
 	__enable_user_access();
 	asm goto(".option push\n"
 		".option arch, +zicfiss\n"
@@ -200,9 +203,6 @@ int restore_user_shstk(struct task_struct *tsk, unsigned long shstk_ptr)
 	unsigned long __user *token_ptr = (unsigned long __user *)shstk_ptr;
 	unsigned long token = 0;
 
-	if (!access_ok(token_ptr, sizeof(token)))
-		return -EFAULT;
-
 	token = amo_user_shstk(token_ptr, 0);
 	if (token == -1)
 		return -EFAULT;
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
