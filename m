Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8845606A321
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rDPpJ96G;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FgqZhvpt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hHaMiGLjpkr02pfZMV45ahUJ6S7iwfpJT0k9OZGJg9M=; b=rDPpJ96GlDd7AxLGo+j884Rtzi
	acfwmmqlplNZkzTJJi/0v20BcHyoJrLJr8HzB3jZ8QovbOT0TamskRJ1JpPnMzYJnjg6ZZUzyx5Hh
	JGvEsKjCfXq175E6gC5gQobtLtRhB4wXq+qnvCZN9Jip7UbBL7MvL4mMazpcBl2LCuJyi5Z1glVRl
	GDxuwWvKOqtHZCbklashYF4tpo1f6XmoiSKoIFW1RwXTkMrOcvYodQc2IRJCLcFp8EbzK5JF3WAlo
	7SHn6kAehN4Hv5MlxgtCHiny2t+g9mrG0XsLVphTGB+l0zcTHO4RTD0FlEhEOl0V2U2JHAVqkGdpc
	8aEEEo4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO4H-00000000bCt-11DV;
	Mon, 09 Nov 2026 12:01:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO4F-00000000bCP-1SUP
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 12:01:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B6D8C6312F;
	Mon,  9 Nov 2026 12:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC951F008A1;
	Mon,  9 Nov 2026 12:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225702;
	bh=HPmaWn2UvYMC1niFpP86bc4ieJtd5iVoWMqnzksdykQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FgqZhvptiOeVg98uQC2DZROMWSiCLyHQFXgqApJtetI8M1CwdHsauFSf3Z0KrS1nF
	 e33BuFSWT6yuICEut5QromLuW+5rmpcxwJOFLaiDGwMcks7sDuQnjQCUc3mXdH3NAd
	 eOdjYeBOlZRFPOUWmmB8l68162Z86zeSiO5qIms5GVAoC7iZSvnGFEjRJ4TDnK3omR
	 1ubf0iNXc2o24spR7USD2MltvXAC2Xg/Hxo8zy+QUP9NgPPPwFWu7gdIDVfEwwAbMk
	 Hx3O3rJppcCyijZ3ICdYWbsAnsrqlClCinRlT9/7T8zWsHrvkYYtS717voO5FPBvvZ
	 IDemmIo4rf6Hw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] riscv/traps: Mark do_trap_misaligned() with __trap_section
Date: Mon,  9 Nov 2026 19:41:28 +0800
Message-ID: <20261109114129.20260-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109114129.20260-1-jszhang@kernel.org>
References: <20261109114129.20260-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

do_trap_misaligned() is called by some '__trap_section' functions such
as do_trap_load_misaligned() and do_trap_store_misaligned() which are
noinstr code. So we also need to mark do_trap_misaligned() with
__trap_section to keep it in non-instrumentable text as well.

Fixes: fd94de9f9e7a ("riscv: misaligned: factorize trap handling")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/traps.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f28e03f98af0..a170ed343e5a 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -213,7 +213,8 @@ static const struct {
 	},
 };
 
-static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type type)
+static __trap_section void do_trap_misaligned(struct pt_regs *regs,
+					      enum misaligned_access_type type)
 {
 	irqentry_state_t state;
 
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
