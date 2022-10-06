Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF88AC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 07:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFQ9VXAv0GUvJxvrspcZZVhYbPahViq3iyRCdVhBI2Y=; b=NjVokpcEl6sc8x
	VyxiV5gHpsoVb9hm+eK+yLSz3EOka4CtB8DSR3+m6CXDywgGqNkKgUkeSRf1SCajPlVQl6fO4tl2P
	rzqnyDrt4dWsqOqYCbjTwRSvrBhvGXQZwomomi4QOYRg97jm0hCo6YcdfKRPt4PmmXRB49vgLQ1s7
	n4fI4LsCn5OBwQX11f6TOn1uYEhVeajIpzgE3nD7QJkE5nrxyd3TlX7BdGVuBPiRctoHiyJ8DCtoB
	7cOSVJKxefOqk5kpKbFtrvaEy/sEfga4/V1SGXuYI5BKdp/A6StInnWvs2wEdqSL6eUMfZP3yg0zd
	IFBAe1HXnpFaDzFaJogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL90-000MfD-4Z; Thu, 06 Oct 2022 07:18:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL8s-000MXr-9S
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 07:18:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C6D6E617FE;
	Thu,  6 Oct 2022 07:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212D4C433D6;
	Thu,  6 Oct 2022 07:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665040681;
	bh=q1P6JOc4LZgqnbSMLMvIBMsGeHNZHYmP6JQftBlIGdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G9qkS9oNbnmHmAddKCyn+luppCnBMsmL1peXa0hNrUrrp6gMtETjSsdVjD8LkwKM9
	 seG1/vliubyojeyCrHIj1oDAyiIbGcohZo67HvIRdaTzJWwmaIff+aZ4vzUGf3dfGQ
	 1ATQu1DgnElg89SQK+CPYMOhlu8wT/0k+3049yXeozFcY0XKU3B4w2TXRI0yH6KNx2
	 RM/JO+iX0MfhF29pI25yE/osiZZE49Qq8JVsqxeiMO/cUcdJTYmmbAjgOyd2NWQVbS
	 QaWUeqbBQNfVW8p//s9t1MxLzxWgzABSZ4tfwrfw0Q+EC02YZ/X90yypP4JOlueCKN
	 mtwyzZNypWTjw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] riscv: cpu_relax: switch to riscv_has_extension_likely()
Date: Thu,  6 Oct 2022 15:08:17 +0800
Message-Id: <20221006070818.3616-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221006070818.3616-1-jszhang@kernel.org>
References: <20221006070818.3616-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_001802_397713_2B19F19D 
X-CRM114-Status: GOOD (  11.92  )
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

Switch cpu_relax() from statich branch to the new helper
riscv_has_extension_likely()

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/vdso/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
index 1e4f8b4aef79..fb30480f36a0 100644
--- a/arch/riscv/include/asm/vdso/processor.h
+++ b/arch/riscv/include/asm/vdso/processor.h
@@ -10,7 +10,7 @@
 
 static inline void cpu_relax(void)
 {
-	if (!static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_ZIHINTPAUSE])) {
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZIHINTPAUSE)) {
 #ifdef __riscv_muldiv
 		int dummy;
 		/* In lieu of a halt instruction, induce a long-latency stall. */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
