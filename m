Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09C1CCA490
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 23:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HOyI+Q7sXfLvaELKJ5l59bn5b6qOHgTuAwGCGBuRGBU=; b=3alRq2fTIJ2Ra6
	zdBgmGHDo/xdSepeOnMoPB9PRiwuCRKitd1NshE/uOMIkdYGHQ4IDaN2k70U1eQVKEeQU5mQUiHWF
	Ql4fb7LAllTVQK2AdFQq9e2/PhqeNswmE/KqzyRCdgh21oHsNdeL8Eeuiucl6cHCyXn4ctuuMGAio
	hHW0JJG4hNyyGmwpu86+x9wzOKRJPWaAwO6nhbrxt13wtXPzO/gFEp3T9MHdMLXmCYG6K8wjqBE48
	6PIlS+RKScGCDUVHGhLpI6T0eCH1Na11eyjRVm3/cfA76lfzu5jn/Etp94O4MSuvvwzeZz5edhkIc
	1XQ5FJXufU682O/rSiYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIaBF-00000006IGc-3m8z;
	Sun, 18 Oct 2026 23:20:41 +0000
Received: from poodle.tulip.relay.mailchannels.net ([23.83.218.249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIaBD-00000006IGF-3ndA
	for linux-riscv@lists.infradead.org;
	Sun, 18 Oct 2026 23:20:41 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 170BE7A1EFD;
	Sun, 18 Oct 2026 23:20:39 +0000 (UTC)
Received: from pdx1-sub0-mail-a253.dreamhost.com (100-96-21-213.trex-nlb.outbound.svc.cluster.local [100.96.21.213])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id A229D7A1E4F;
	Sun, 18 Oct 2026 23:20:34 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Stop-Grain: 1d82831b35bc6619_1792365638878_2061766694
X-MC-Loop-Signature: 1792365638878:2130402678
X-MC-Ingress-Time: 1792365638878
Received: from pdx1-sub0-mail-a253.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.21.213 (trex/8.0.2);
	Sun, 18 Oct 2026 23:20:38 +0000
Received: from offworld.tailf5af7a.ts.net (unknown [172.56.178.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a253.dreamhost.com (Postfix) with ESMTPSA id 4j7F5s64Z4z102n;
	Sun, 18 Oct 2026 16:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1792365634;
	bh=iGssDkMKOkDMTgnof+Jz7YdazPxwR7tkZNErXSOjf30=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=Pj93fdN5Ir+nGDRabem5WsfnB0/umQvhqMnSNnvkEopc3QSMfqekFIuuxFXzCRqu5
	 95r4rwgVVYHzsz1u8qD6O87L+/Uq0arHiXhWc7i7bYcQyfd9VcGwuH75Azu+XZUVni
	 ETHsruXPrfGsBHqolFd9WkgC9xm81erIzzWATKparshB3o0dHAvJkmTabjOVw3QmhA
	 46zIZurVYdc/gZdQifRwQjOPC+PA7t8gRLR+OkrX2Ua+TDO1lrkhwir+enBrDNkRNv
	 CBMiFUcC3MVhdqymqjVmKy+zwdxHsRFsJfjyB+6ijLW2XQC/8n7hwZNxa/vfweh+cK
	 f9MuK9fB0/knw==
From: Davidlohr Bueso <dave@stgolabs.net>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dave@stgolabs.net
Subject: [PATCH] riscv: Remove unused REG_AMOSWAP_AQ
Date: Sun, 18 Oct 2026 16:20:16 -0700
Message-Id: <20261018232016.1771835-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_162040_139760_43954FA8 
X-CRM114-Status: UNSURE (   5.06  )
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

Its only user was the shadow_stack lock in handle_kernel_stack_overflow,
which commit be97d0db5f44 ("riscv: VMAP_STACK overflow detection
thread-safe") removed along with shadow_stack itself.

Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 arch/riscv/include/asm/asm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index b8bf842d4c13..80287b3f68f1 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -29,7 +29,6 @@
 #define REG_L		__REG_SEL(ld, lw)
 #define REG_S		__REG_SEL(sd, sw)
 #define REG_SC		__REG_SEL(sc.d, sc.w)
-#define REG_AMOSWAP_AQ	__REG_SEL(amoswap.d.aq, amoswap.w.aq)
 #define REG_ASM		__REG_SEL(.dword, .word)
 #define SZREG		__REG_SEL(8, 4)
 #define LGREG		__REG_SEL(3, 2)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
