Return-Path: <SRS0=GA+h=BG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAABC433FC
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 23:24:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B16B120FC3
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 23:24:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KyZ5hHFb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADMVAtky"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B16B120FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lzs1NzRt4yb4eNSzBtciNwP+hLysiFee20QUN1E9gZY=; b=KyZ5hHFbTU4AEIeQGQJpFD5QP
	xJKdaQpdFWBPMGJ6RiuQArgmQnU4p6D33b5/8kND86qIcbufkqwb5YBOU7f3PUfDUrQ/uHYaASBLW
	S7LGJSvy1boqp00xxx5CoyGtizFbUyTCjQ2Kd+qk81tGFvIkWHLIqFbpyRmcc74/qi/HSlP3JUE8i
	7ua+L0yansidFtMsxOY41L2748kABc6nq63KMjf/HweXwnitiY+qR7mzty+2lbtGhG0Yf9lFqtfrO
	UHKIERBzepBFWtl8kdifpjbvjLvzkftGdSZDa5/oJIk/QdnIa1a1nbz5eqPLss919q/TggmEMR63+
	hRZlPt3vQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0CTU-0007v5-Eq; Mon, 27 Jul 2020 23:24:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0CTS-0007uP-3S
 for linux-riscv@lists.infradead.org; Mon, 27 Jul 2020 23:24:02 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1A5920FC3;
 Mon, 27 Jul 2020 23:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595892241;
 bh=O8sbMn7Pvn99MTZ61vvAbPtt75NieU4YRkG3Qh3NqLU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ADMVAtkyNTFjYb8aufIGF544EHZr0f9MKN4vbzqS5ZzOwVAr66aqW0HbU9zM/Frxo
 cxtAOH5p1pPg/ImotE0GVvAiIYGB5DKSTEVAxfZ3eCZjTbj0ASae4g7MBhxDDf9H4s
 T9JKK4b3q/4EUgLr2LEzBf8l5SL6iSmX2J0OOTVg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 11/25] riscv: kasan: use local_tlb_flush_all() to
 avoid uninitialized __sbi_rfence
Date: Mon, 27 Jul 2020 19:23:31 -0400
Message-Id: <20200727232345.717432-11-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727232345.717432-1-sashal@kernel.org>
References: <20200727232345.717432-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_192402_226833_E2928579 
X-CRM114-Status: GOOD (  15.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Vincent Chen <vincent.chen@sifive.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 kasan-dev@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Vincent Chen <vincent.chen@sifive.com>

[ Upstream commit 4cb699d0447be8e0906539f93cbe41e19598ee5a ]

It fails to boot the v5.8-rc4 kernel with CONFIG_KASAN because kasan_init
and kasan_early_init use uninitialized __sbi_rfence as executing the
tlb_flush_all(). Actually, at this moment, only the CPU which is
responsible for the system initialization enables the MMU. Other CPUs are
parking at the .Lsecondary_start. Hence the tlb_flush_all() is able to be
replaced by local_tlb_flush_all() to avoid using uninitialized
__sbi_rfence.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/mm/kasan_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index ec0ca90dd9000..7a580c8ad6034 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -44,7 +44,7 @@ asmlinkage void __init kasan_early_init(void)
 				(__pa(((uintptr_t) kasan_early_shadow_pmd))),
 				__pgprot(_PAGE_TABLE)));
 
-	flush_tlb_all();
+	local_flush_tlb_all();
 }
 
 static void __init populate(void *start, void *end)
@@ -79,7 +79,7 @@ static void __init populate(void *start, void *end)
 			pfn_pgd(PFN_DOWN(__pa(&pmd[offset])),
 				__pgprot(_PAGE_TABLE)));
 
-	flush_tlb_all();
+	local_flush_tlb_all();
 	memset(start, 0, end - start);
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
