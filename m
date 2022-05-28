Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8459C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 28 May 2022 01:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=guCtYbCH1FUAPSsZEJwEnXziauJflDKoLHsxe/hrpvQ=; b=q6fFBthj43cR91
	nb/yGyRTkhTW+7FwMb29uOmN6SvBEVKVEzLEK7DI0vj0wLRF2Ga/2cd9ow78QNYkHR55IQP03qh5W
	T0QhkmV3uloDBxgtahms736vqtPiXddRyXH6TAocCrEmWFkkYPno5StRy1s5px/Eeg8XrXRWRd1Gj
	md9kmBz0BkCItivpvQqOgQD8TodsxMsVYZM419k3+StjuvtEdiwDP2S5cP5QeK2BZDjLd+p50Ie1L
	9iB7N1myhoJZU05lTb5sSmivDNszVdIcOIY3ZXsoVkc3XeM9dO2m73gxYQGtLRs2s4wa9nxUyVtJ2
	Jbq5tOJwZHVjAVPHW0nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nulSv-001GfK-IL; Sat, 28 May 2022 01:42:05 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nulSt-001Geg-5H
	for linux-riscv@lists.infradead.org; Sat, 28 May 2022 01:42:04 +0000
Received: from LT2ubnt.fritz.box (ip-062-143-094-109.um16.pools.vodafone-ip.de [62.143.94.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 3544D3FBFA;
	Sat, 28 May 2022 01:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1653702113;
	bh=xKW+dUOE1K1RtN/DU5IwGfeJQMsUXHQODp6XmKq+3mY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=cRG8KJWu4uAZXkaZPT88oYE3h06bFTKhYdj267Mv3JKxusu/up8L8tQkRcFxhkXso
	 /R4EL8n7ine4jmI7AztkSQAYA75UjbEvhAxeJSWuLXEUMKrBgVcEPvv2IJmnB21d+0
	 2yc+P4ukts1x+wZXK+xrI4vQ6j8RavH6fXNLmSWZ9PkiZrFAaqvN7FAKk/0Rc30QjS
	 x77uAad5aHGimmGOQcq/gc7j8A2I4whLWUcS/M0pmh1PjVuOSGYDZwBM8KwjXQ0aig
	 HZecP8w6I7Zp2609twGdpSnPdlw98QRkuE19awCBJYaZaVJpVvZcxcTY5IoGWXFBCF
	 ypu9p2TlVFIsA==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH] riscv: read-only pages should not be writable
Date: Sat, 28 May 2022 03:41:32 +0200
Message-Id: <20220528014132.91052-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_184203_369344_EFADFDCE 
X-CRM114-Status: UNSURE (   9.86  )
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

If EFI pages are marked as read-only,
we should remove the _PAGE_WRITE flag.

The current code overwrites an unused value.

Fixes: b91540d52a08b ("RISC-V: Add EFI runtime services")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/kernel/efi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/efi.c b/arch/riscv/kernel/efi.c
index 024159298231..1aa540350abd 100644
--- a/arch/riscv/kernel/efi.c
+++ b/arch/riscv/kernel/efi.c
@@ -65,7 +65,7 @@ static int __init set_permissions(pte_t *ptep, unsigned long addr, void *data)
 
 	if (md->attribute & EFI_MEMORY_RO) {
 		val = pte_val(pte) & ~_PAGE_WRITE;
-		val = pte_val(pte) | _PAGE_READ;
+		val |= _PAGE_READ;
 		pte = __pte(val);
 	}
 	if (md->attribute & EFI_MEMORY_XP) {
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
