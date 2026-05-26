Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CC2CD5BB1
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 11:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uzTPwz0nKsO+UrGIPfMpPgRxeW1rUpnihUUVHMaekG0=; b=sq95+mCRakabhV
	ZPDLLLIrXPB5RJog0+zhV3KKJNPTwvphr9aroSDb8/e7unVdegxN3vf35go4fFMpolITUDku/uQQz
	m5J6O7EoSQErvnJ2suuXuSUSXskmgdXtjwv0MUx/qTYehWlmwltY0lkSknKyTAVvtj3k5AckI8ncX
	zG61Z8guyDjngS3s25s3V38XYCuvnyrkFrocvB1aMC2hSFmCPu/j9pUqUp9Vpxkci6DOm5/NOQCc4
	XcsiiiBVWMt74Jzsq9AIksBs1ZNeOgXbCS3xC7rTUqz/GkVBuDBBKpA047ARFVgYv/MUAn8QTYaU6
	REW6yOjdnzm/9wEuN5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRq7N-00000001ouS-1Eii;
	Tue, 26 May 2026 11:38:41 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRq7J-00000001otF-3vLg
	for linux-riscv@lists.infradead.org;
	Tue, 26 May 2026 11:38:40 +0000
Received: from hwang4-g16.. (unknown [120.244.199.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 2A2FB3F83E;
	Tue, 26 May 2026 11:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1779795515;
	bh=4GdQPoNzrwihLEfvx3BYpzWDBscKHYn7iQ3om5+0sa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=dxnQ5SlFCVD0iWw7Sm7OIDPQoxjwn6c7mC/ZXylhfi0PJc2g+8FXcj4kvAyoSmmu1
	 ouUeYfyTlHrM7urZ/J+SSiVTLnYHbicmo7NG/9C7ppcktDczDVQQkce7w+dDpX9ZRZ
	 FRUyVJa/inF2+9dyZjeyQNuYKQzj3wsidvJTXZv2qpypqEzkIAdHWHEELsldzd36zO
	 KkttMeQG3lzKhDjCxmvMfiJ9EX4TlCln1Tlh9ALkqtkM7a6V+bVi9vUxWy7cKBo858
	 HEjbKuKhx9f4UGJS86WATogHE6oaW4prSK3wttnFJWiDxtTHBuJmmClz8LRUqlsmqb
	 R6+V3C5Dkz/Y4MKmTYHBn820byBoO1b9sHuGJqKaGF9HrI4tQzpvDKr6kgipkpH+q2
	 +AQBsKVs6cH++f0nMFeEZt6VB06C66Usv42zehGYWQU7lb0BBC9FUCHC50FRMV39Mx
	 eiT3vKYuuGdtmo3bsoS1vyld2iJjvV0y8GaU1NdaDhK/bOb6PMqaCqno6+g51OdUhe
	 ol8bEMn9BbxCqRIdXPMVPwItT931S7mgQV7dFmNpyyEIlx9GG18lNsx1oPRsHwGmMp
	 WQX+vQv60tT2opJ+AWbKndHA0hJ3vUCRW17ngp+fu3J2O8CVbvUGGDjqeOGcM/GAvR
	 cCFtBjkjOzJhobha47wS1/pk=
From: Hui Wang <hui.wang@canonical.com>
To: linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	vincent.chen@sifive.com,
	stable@vger.kernel.org
Cc: hui.wang@canonical.com
Subject: [PATCH] riscv: kgdb: Fix a missing irq restore issue on an early-return path
Date: Tue, 26 May 2026 19:38:29 +0800
Message-ID: <20260526113829.115007-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_043838_437846_0BC8D33F 
X-CRM114-Status: GOOD (  10.10  )
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

If kgdb_handle_exception() fails, the local_irq_restore() is not
called and the function returns to the caller with interrupts still
disabled. To fix it, add the missing irq restore here.

Fixes: fe89bd2be866 ("riscv: Add KGDB support")
Cc: stable@vger.kernel.org
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 arch/riscv/kernel/kgdb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 0bf629204c76..1956e4840a30 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -337,8 +337,10 @@ static int kgdb_riscv_notify(struct notifier_block *self, unsigned long cmd,
 	local_irq_save(flags);
 
 	if (kgdb_handle_exception(type == KGDB_SW_SINGLE_STEP ? 0 : 1,
-				  args->signr, cmd, regs))
+				  args->signr, cmd, regs)) {
+		local_irq_restore(flags);
 		return NOTIFY_DONE;
+	}
 
 	if (type == KGDB_COMPILED_BREAK)
 		regs->epc += 4;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
