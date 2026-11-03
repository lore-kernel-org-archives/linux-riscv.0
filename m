Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E448606D801
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vSqQ5rBU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6KepomfP08kaJS1xJCGG+dBHlLXTXYaSNGD6lfsDdgo=; b=vSqQ5rBU08amdk3W8hMxXSYVbf
	Nm7rLDnZmW05LSvsKjenFg22f44Qv4dAvZgFFI6fRI1jORhSP9sBsiifgDNDapb9V15jjfshJX/1I
	Bz7gYfmPDG6WH41f8rn0UrQxQ9Did7GoZU3t92mdVb4QTP4Zyg88cFVyso4qq7vp3ITxjObOLMmHS
	Yfe4QakBdRTh311FCGxsWF6iwHPOSQCyqY4/b4nPN3SN+kE9BfYa2mIIZVJKvetj5Wcmd8+Lg1LZh
	CA1jiS1MYMYoEuFxAvKW9LJQfUfa0L2JVM0AJJcQS3RZhkeoQHYbyIWzwfVEAdZMZ8Y0odXhcCy79
	vuCusdqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEQx-00000002WjJ-3Sww;
	Tue, 03 Nov 2026 13:20:15 +0000
Received: from sym.noone.org ([2a01:4f8:120:4161::3] helo=sym2.noone.org)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEQu-00000002Wim-3ohR
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 13:20:14 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
	id 4jJq1d09zXz2Ftnn; Tue,  3 Nov 2026 14:20:03 +0100 (CET)
From: Tobias Klauser <tklauser@distanz.ch>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zong Li <zong.li@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH] riscv: cfi: Bounds check restore token in create_rstor_token() before swap
Date: Tue,  3 Nov 2026 14:20:03 +0100
Message-Id: <20261103132003.24312-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_052013_119389_C5100A1A 
X-CRM114-Status: UNSURE (   8.82  )
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

Fixes: c70772afd5cc ("riscv/mm: Implement map_shadow_stack() syscall")
Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/riscv/kernel/usercfi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 86141e5bab82..7971a98ca0c3 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -158,6 +158,9 @@ static int create_rstor_token(unsigned long ssp, unsigned long *token_addr)
 	/* On RISC-V we're constructing token to be function of address itself */
 	addr = ssp - SHSTK_ENTRY_SIZE;
 
+	if (!access_ok((unsigned long __user *)addr, SHSTK_ENTRY_SIZE))
+		return -EFAULT;
+
 	if (amo_user_shstk((unsigned long __user *)addr, (unsigned long)ssp) == -1)
 		return -EFAULT;
 
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
