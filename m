Return-Path: <SRS0=Qta6=KR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADEA5C2B9F2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 21:22:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A9706108D
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 21:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A9706108D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8g5p3fu1XqZpVG2a+8FpJhf7NOMuTuktGmlNWvKpXdA=; b=UMcCLLmrJgJC7U+nLygMUN9sW/
	Ip4fVDe7uKa72Yjn7+pTxPpRbQxQrPiS/ZcDtkgw3CDS2iPNX9tnx5IqkmV13s8II1t5tDbLo1Vm7
	6Xe7SFmyJUWptAGQtl7bxGO+3oQ/BoKS4n60dp1FG895C+f1UrOKSEB6H4OS2+KJBmBF6MEY+PL/E
	ipDYWOU+Hsm/SgsSlOo3cJoJB3EcQHZf83mjq2MytJD8FeTvLzBy3J0El4WcxmNptgjBO0MqXT+Hv
	/8y7jjIRdpmv/jt7j+EHJi1/QB2F1mtJkN8RWipuYzTV6NZHc4FaEDJzD6ZsCcUxB3RJ/Ms0kAbda
	viELHyUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkZ3C-0038kM-FX; Sat, 22 May 2021 21:20:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkZ32-0038hV-9S
 for linux-riscv@desiato.infradead.org; Sat, 22 May 2021 21:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=wcv2ThiXVnl/yNUWKXIyeJhKwjtkGI4Y78Y/91jUBdM=; b=Zy/28i2k7/Su2oNUKE8TQCv34G
 0uGy6JWMns/WO/LvXCT/Cj05lnhm9/mU6M2tkKhCxpLyF+f3aJ0r2AMMlWmjSukq2xD+e6kQWmjOS
 kNMk5yjgKfwXDaIJxqWFBdKSWsFiVEw4LmZm49l7xAnyqTyWG+UsyYJMoVdigSbIsnXDhfh+D0V3A
 91GhZxEYEFGzmFXLSjYAwijc9NkoBfhXN3uoE+4GQFBrcdKDA0TjLuPgGKXxni1BvUhZciiWxyah2
 04tCyz+JPxJMvqi86lzoFuAPlkT/xKaJwxuKcouSD5VNXPwN+wJWaevMjlUbL4EOUm/ok4/zXdI2Z
 zN1Advmw==;
Received: from [2601:1c0:6280:3f0::7376] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lkZ30-000D27-Hq; Sat, 22 May 2021 21:20:38 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH] riscv: sifive: fix Kconfig errata warning
Date: Sat, 22 May 2021 14:20:36 -0700
Message-Id: <20210522212036.5513-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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

The SOC_SIFIVE Kconfig entry unconditionally selects ERRATA_SIFIVE.
However, ERRATA_SIFIVE depends on RISCV_ERRATA_ALTERNATIVE, which is
not set, so SOC_SIFIVE should either depend on or select
RISCV_ERRATA_ALTERNATIVE. Use 'select' here to quieten the Kconfig
warning.

WARNING: unmet direct dependencies detected for ERRATA_SIFIVE
  Depends on [n]: RISCV_ERRATA_ALTERNATIVE [=n]
  Selected by [y]:
  - SOC_SIFIVE [=y]

Fixes: 1a0e5dbd3723 ("riscv: sifive: Add SiFive alternative ports")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Cc: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/Kconfig.socs |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20210521.orig/arch/riscv/Kconfig.socs
+++ linux-next-20210521/arch/riscv/Kconfig.socs
@@ -14,6 +14,7 @@ config SOC_SIFIVE
 	select CLK_SIFIVE
 	select CLK_SIFIVE_PRCI
 	select SIFIVE_PLIC
+	select RISCV_ERRATA_ALTERNATIVE
 	select ERRATA_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
