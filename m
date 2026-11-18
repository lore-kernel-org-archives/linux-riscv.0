Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BC7606A320
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kcBfv6WG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RUMpDj+Q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KKvtp6xM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=CKVP/SXJIgj84NaRDKZN9WP9j9Cwso0hXUu9EJXZqtw=; b=kcBfv6WG5BBXyPPsc3qqkMsXFV
	cZI2yP5jryQaxy6uR+vllWW6/qKC/HdVm3uYvx0GQ/VC0mmSLlbdF919Sphp23qL94SWnqgIiIHGN
	L+ZGGC93wCUUaF4+YHjIG0+UEWVEBLX1+4N+fPzpYULu5H2ay5dmzKt7KBr5HMMoINPi9Vy1iouX/
	KZSznAoaE/JBesE5NG9pvm3/AMW1r/00PcGO/C/hRfRSCS1nMGEyNIwLA/9gR4C/JeQsgtudrFtcF
	SB4pITHOz+3/cG0NWsggrjQ6z9+VhSIJaXM3NykqSQVZqppInGd4i8Ol99CjYcn5q3nxuLlAVyFtL
	VG01VBmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkK9-00000009w2Z-1oDT;
	Wed, 18 Nov 2026 18:24:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIc-00000009tlO-0wAT
	for linux-riscv@bombadil.infradead.org;
	Wed, 18 Nov 2026 18:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/uw6eSasL1b/vj1BX3jiErELTDd2rhnZAcbAAr5FXR4=; b=RUMpDj+QGHbAI5GbWdYKi9dRuv
	eYiOAn34uDnPeEK31S7PgAKua9iAzDPdbEpWxEWbZFlhed/AFxN8BQAto4VXn6WL5fQPVKWf2bsY+
	D3YxnfUXrIUQhYaN6OI2Ueg6CPxbx4K9njn91LJk61BsRV+1H8j3My2P3eZzLBZffxbQ6IWEKGW/D
	hAvB+cD3c/Djur0rO6OYFUuyNMPkdL9S7ZSvYHXg9zLfvCGSvTAV7/lCFXPPwUQpqW2DxIJ/2Wh04
	qNvt5aEvN+Yc1S7DD8zCbq8OjQcYYB5iLlMPmiEP0LdIpmfeZzaGOgIfXkSLROZ8GsnJWAVYRwXht
	G5Df9AZw==;
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIY-0000000GOPL-2RSF
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:24 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-4915ba023d4so942156f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026140; x=1795630940; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uw6eSasL1b/vj1BX3jiErELTDd2rhnZAcbAAr5FXR4=;
        b=KKvtp6xM2N9D1ZAJkkJ+YM1xJAL9ST4hdb6F8wKJfwmzshQKnZMdoQSv9nsSrX5L1p
         FnbtQv67dc7kF4HuzGTx177uoQu9JjuO7d6+W3wg3/X4Iv+m4soSJfvdOiXrWQKlbzBH
         /f/stXQ9UsQByUsElv4LwM2thGfgMmXMKq8R+2nQ/ncM6smm5Xhkttozv33swHRFwXOk
         9QF0Ut719pIFNdbIQK4udxFtAOuu5CcEnE8pTmf45aEiNQfXf+7kQBxXoX1x+vQtSziv
         uqNbBKzC6c/cd+T9wLQuJGJuYR3+q4ZqzruEVJTwpyKBUo46+xhzJFWoiHbgb2OXEENU
         mLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026140; x=1795630940;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uw6eSasL1b/vj1BX3jiErELTDd2rhnZAcbAAr5FXR4=;
        b=0dVjaYOBJUIrBsaX7OL+vbU4YM4w3RchA3G/mijmAnRcUlYEpYboASdhKGELd0qjrD
         kcSSOneRJW6SAG0oPcLwEk8p1ioevAVpIILE0px/3nfUngO1FOhEj7NmrFGfvqndw0/A
         atVqsu1ZK3QLvmGchcSK/pRWPJMnJs8Jijui43Cq4vhkp3093AWKR9Woqameo4vboy/X
         CfIiEC5tbb4DBBZneXHLUgdDLxRJ8fKh6pDSJAsTmmA1Bdz4msNFAwmwaKFwm0NfGppK
         3PJzrBTeGsf6XZ0cMHp0qe7FirKADWWlcJNbhg58NQgn35PtIBQQ4ZH/1dLZyAxgEi/I
         QfXg==
X-Forwarded-Encrypted: i=1; AL+hErHxgHhgE7R//mhSXo6/BPM5ffN7cf72kmhxozcJIG22D/uSkORIgalwMD395J8xG0sFtfd/wTR8MwhWWg==@lists.infradead.org
X-Gm-Message-State: APuU4Z++d7vKNtagmcmlAy+Yv9VN3yDNg6bVjTpccTxrCfB7w0LFGH1X
	LnWzcfApjJjtDRONUcauNpuxvLSLVdVrTONk18d4CWk0KTxVOFNTWuZrt0CCmgygsx+Rl2p2DA=
	=
X-Received: from wmdn7.prod.google.com ([2002:a05:600c:2947:b0:4a2:8ef:a5af])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a4b:b0:4a2:59:f568
 with SMTP id 5b1f17b1804b1-4bb7da12963mr69266665e9.14.1795026139303; Wed, 18
 Nov 2026 10:22:19 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:25 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331; i=ardb@kernel.org;
 h=from:subject; bh=iMPCb+Keab2MgLv3M4zpVvDMgTGioYSkOer/TnS5abo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm7XCHZeeHX8f+DPD6s/EiYutrt4v2FF5+G3G5ovFp
 gkTt/vzd5SyMIhxMciKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJrGViZNj06n4gj8DV5D38
 0+a2fkhoXPTgWswsFkENBVf2sAsbVv5j+CunwqFvkPC1JSbr9sY1t0SfFbxp3j7/ep6t8usHajm MT3gA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-40-ardb+git@google.com>
Subject: [PATCH v4 19/19] Revert "efi: earlycon: Reprobe after parsing config tables"
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_182222_503667_533600BD 
X-CRM114-Status: GOOD (  13.58  )
X-Spam-Score: -7.6 (-------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

This reverts commit 8b3a149db461d3286d1e211112de3b44ccaeaf71.

That commit added logic to probe the EFI framebuffer earlycon again after
the EFI configuration tables have been parsed, as the primary display
information may not have been available yet when the earlycon= early
parameter was processed.

Now that only ARM uses a configuration table to pass the primary display
information to the core kernel, and the EFI framebuffer earlycon is not
supported on ARM, the reprobe logic no longer has any callers. So revert
it.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/earlycon.c | 16 +++-------------
 include/linux/efi.h             |  1 -
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/efi/earlycon.c b/drivers/firmware/efi/earlycon.c
index 3d060d59968c..997f69ce46cb 100644
--- a/drivers/firmware/efi/earlycon.c
+++ b/drivers/firmware/efi/earlycon.c
@@ -216,14 +216,6 @@ efi_earlycon_write(struct console *con, const char *str, unsigned int num)
 	}
 }
 
-static bool __initdata fb_probed;
-
-void __init efi_earlycon_reprobe(void)
-{
-	if (fb_probed)
-		setup_earlycon("efifb");
-}
-
 static int __init efi_earlycon_setup(struct earlycon_device *device,
 				     const char *opt)
 {
@@ -231,17 +223,15 @@ static int __init efi_earlycon_setup(struct earlycon_device *device,
 	u16 xres, yres;
 	u32 i;
 
-	fb_wb = opt && !strcmp(opt, "ram");
-
-	if (si->orig_video_isVGA != VIDEO_TYPE_EFI) {
-		fb_probed = true;
+	if (si->orig_video_isVGA != VIDEO_TYPE_EFI)
 		return -ENODEV;
-	}
 
 	fb_base = si->lfb_base;
 	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
 		fb_base |= (u64)si->ext_lfb_base << 32;
 
+	fb_wb = opt && !strcmp(opt, "ram");
+
 	xres = si->lfb_width;
 	yres = si->lfb_height;
 
diff --git a/include/linux/efi.h b/include/linux/efi.h
index cc1df1577d5f..4a809c6ae724 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -719,7 +719,6 @@ efi_guid_to_str(const efi_guid_t *guid, char *out)
 }
 
 extern void efi_init (void);
-extern void efi_earlycon_reprobe(void);
 #ifdef CONFIG_EFI
 extern void efi_enter_virtual_mode (void);	/* switch EFI to virtual mode, if possible */
 #else
-- 
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
