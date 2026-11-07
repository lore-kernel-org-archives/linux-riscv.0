Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53256606A326
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 07:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d8TZycZS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ivk2pFcu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6C5W6kOXkZbBr8NRdzGqlyl4iG5uRjvYnaWyggLw410=; b=d8TZycZSG4mTWV4ErfyrIuIhpw
	eoOjc2KaAE70gphbZCysGAi2bB5i8H8lp707OT5wUisY5xNrWGqX+UjmXMKFZl5z8205L4YbkESis
	EpIJrgrqZA9AP+16Mbg96NJeP/acYiU8Pc99Z1qWnNKDtSmiyRik+J0ytXLsx8mFn80LIBDwnQW5B
	hxbBPpLjOyVEUfbaOH8BdLm9IIY+2j0eKj/o47boAWBaiFCWXAKjMqxD7paVP98KnvktDb6hEldHZ
	TTdnIM8IUA6iee9DP7Slqk8gp+31/0HG6loz5PHrgEBj595ESbghV0IjdgTVtr2SqLxRvqfKNoNhz
	dVxdUw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPayM-0000000EKx8-2TjH;
	Sat, 07 Nov 2026 07:36:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPayK-0000000EKwk-3Wal
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 07:36:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F9D143EDE;
	Sat,  7 Nov 2026 07:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79E61F008A2;
	Sat,  7 Nov 2026 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036980;
	bh=eKajDgmeP9tUhj+Q0O/VU5iTTmjFQvm4dhQJBZsg/1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ivk2pFcu5z4Z3JAk1pyWE9bxhryfG1zqYlQc860JPO+SWSrpteeZzRUJiHVGUouQ9
	 PmlYS0uXoSZrXap3b4MMQ5lJYUU6rqgJhbBgiw4z0OeNyV/zg4fRUhNJg5LwnYTRsm
	 bAnkrSz0wu2NXICYmOfJ8GAx0fT/GzzEl5OHPrPPnMGKlNNng6S9H+AOF6LB6HNFqU
	 rN+l4ffURFi8JDjYDBfVq0RtVMsQf/mF3p58GBP+52/JhVEeWVsaytEhMXiTh1QJ58
	 kuLVFJuEXhC2WWDEdG/mFYvMipUeCiEGaz6hmS4d5GCyQQhkJyk0jKQAUMV9vltFcA
	 dduGaDENlR/cA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv/traps: Mark do_trap_misaligned() with __trap_section
Date: Sat,  7 Nov 2026 15:16:04 +0800
Message-ID: <20261107071605.17536-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107071605.17536-1-jszhang@kernel.org>
References: <20261107071605.17536-1-jszhang@kernel.org>
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
