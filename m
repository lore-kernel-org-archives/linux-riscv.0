Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C642C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 14:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4OkvOVhmZUc60JTJAyXK80RJ87xtsL5AS+j4w8Ykx2A=; b=ixVkkZjpTMr48w
	ST/nQFAsENEFE/HBYErRQWQ55Q8TmMyoG2aPNlT0eBWqC5MOz9IhKnFi2VKWtYQAzazvg3gS5/4X0
	8CQEloR+LCapeJJtxySB/4+p6zuYyd4LsN7NTFhOJ/sLC6ajrNHLdfJuRny8I63k5skIAudRFXyyt
	BQ5NouyA2zeeiYmTvXWXYg9XPb0R2YIPTVe1fG4acSBYq0Dvp52XBrJVioAqgyEBS8Y+AWGackiU4
	0mkS5VfqHb+S0l50YdWRGYc6/tIQJipm+fdzJB5YgRNypxsFJ+44MArF1vahLMGx0Bal/WcmZlZtJ
	8tPf4DliVU2eR9l2lLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oknTQ-007HeF-Hd; Tue, 18 Oct 2022 14:21:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oknTO-007HdA-3X
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 14:21:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 19BF7615B4;
	Tue, 18 Oct 2022 14:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE6DC433D6;
	Tue, 18 Oct 2022 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666102896;
	bh=OjvCILdRZ1jTgOB8uJxjbPuWbLlr+2SnsWohtENFRCg=;
	h=From:To:Cc:Subject:Date:From;
	b=aoTEAMpyNjdPXWRKOCnpVaEpUWLCCaiO0uiq0Goxv7apJDZwk4afsALeKT1ZIpzpo
	 RP+kSCt8txv1PTUDy3g1Sd0LWiP2pulpuJ/Ww6uYnNmlGvOaFJSWwMdKGRQlVfiaNx
	 UtPTsNSa9PCM+eJk7d5u9egQ7QCMoOcUjsQ39tZ00shvIVbyxXsSpsLNP5mdT5j7Us
	 ZJVyLoZWEnThm8YSgnQE1X/AE98ATEHUFRZrj3yCX7WesGjHznRj5Fl2FRlj4EJ8rj
	 Q7GMxgRV/ZPobO9+xBaWq9kIDlYzysIIRUMzHBuG5kfNLMkK8fizxNAV61rgEom+o0
	 B4aXi5ZIhfMxw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: remove special treatment for the link order of head.o
Date: Tue, 18 Oct 2022 22:12:00 +0800
Message-Id: <20221018141200.1040-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_072138_221535_FF89B7E9 
X-CRM114-Status: GOOD (  11.09  )
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

arch/riscv/kernel/head.o does not need any special treatment - the only
requirement is the ".head.text" section must be placed before the
normal ".text" section.

The linker script does the right thing to do. The build system does
not need to manipulate the link order of head.o.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 scripts/head-object-list.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/head-object-list.txt b/scripts/head-object-list.txt
index b16326a92c45..105ea7ac4751 100644
--- a/scripts/head-object-list.txt
+++ b/scripts/head-object-list.txt
@@ -39,7 +39,6 @@ arch/powerpc/kernel/entry_64.o
 arch/powerpc/kernel/fpu.o
 arch/powerpc/kernel/vector.o
 arch/powerpc/kernel/prom_init.o
-arch/riscv/kernel/head.o
 arch/s390/kernel/head64.o
 arch/sh/kernel/head_32.o
 arch/sparc/kernel/head_32.o
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
