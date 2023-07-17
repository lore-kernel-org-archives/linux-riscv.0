Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565A5C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 08:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qX1iTlF/GeDW+BTT9h77K5SJ28TZG9rcUuGDTylenw=; b=f/tUHpO/zFtZdDqQ3wZsoSPrdH
	mSwvMYD6vaImkevjAphMlJf/Gil2/ul5lWYRcyyEOv0zET8myyQ6CqvRu8c0GSRr38KbTUdZiTezN
	fXcq8/OkukVa8nMaR9Ea5TSQWS+esjJOP6l2v/Op0rVJE+oLaeiEzYWCePS9RKGmOTOf+RjRm3vsj
	lCXRD0abCzDuRX6L9EMPrQ3b9I0i59PA/dJQsN1+dJcnKhu9Mtocqbmclz1WGqg082r1K36dGlSNa
	QsI8GBP9oWEx8DQZTQK7CGGnenqz0i7ji61DMMcio2qHxijpugBRp7+0ElEsETZQ2thzYHvz/jFHT
	8WkF11Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJFf-003PLp-21;
	Mon, 17 Jul 2023 08:06:39 +0000
Received: from [183.242.55.162] (helo=mail.208.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJFN-003PDm-1m
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 08:06:23 +0000
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4F5b6SMzzBR7Zv
	for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 16:06:11 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689581171; x=1692173172; bh=HCbBZb7kJTmDWi3ebtccrSL5d75
	7N5zS4lsS2prlWPg=; b=HMJGniy9XMp5geCvp2erwRPS115Sp/ay58HDPX855QY
	KTbDCh4bfoLyh0gyCsmZe+c9dGDmIxPldukRa/4MGiOoK6q5bpMZYyNIPwp1Z/Pu
	rDs1ndiT8GkjOceqlXGj3+ZLc1s62HJw1T3thGqLQWoL0prFS9gBQpdHDEHphv/N
	bm6hnHZUsST7rpj2oPEUUrLk/gesN0qdJoO2mcIsvWQplmEiDRScaBg7x7FsnipL
	ay0sM31+DHu8IAIXiw4C3UZsOCePsaLsOtSXKhSKeqchDvuCvogmXrTpkERrWcdM
	AYI8h2VNcY87jw4MA88A0IoxHtayy/f8Ouu5gZBlmQw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id A7TIVOIPE7xj for <linux-riscv@lists.infradead.org>;
	Mon, 17 Jul 2023 16:06:11 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4F5b26ShzBQt1h;
	Mon, 17 Jul 2023 16:06:11 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 17 Jul 2023 16:06:11 +0800
From: hanyu001@208suo.com
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 atishp@rivosinc.com, maz@kernel.org, apatel@ventanamicro.com,
 guoren@kernel.org, sunilvl@ventanamicro.com, ben-linux@fluff.org,
 vschneid@redhat.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: kernel: insert space before the open parenthesis '('
In-Reply-To: <tencent_7D5EADDF79970079F568A5C4F801910DED06@qq.com>
References: <tencent_7D5EADDF79970079F568A5C4F801910DED06@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <b90d162c4fb8062355634fb53b05173d@208suo.com>
X-Sender: hanyu001@208suo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_010622_081294_CD479271 
X-CRM114-Status: UNSURE (   7.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Fix below checkpatch error:

/riscv/kernel/smp.c:93:ERROR: space required before the open parenthesis 
'('

Signed-off-by: ztt <1549089851@qq.com>
---
  arch/riscv/kernel/smp.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 23e533766a49..1454f2415b7f 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -90,7 +90,7 @@ static inline void ipi_cpu_crash_stop(unsigned int 
cpu, struct pt_regs *regs)
          cpu_ops[cpu]->cpu_stop();
  #endif

-    for(;;)
+    for (;;)
          wait_for_interrupt();
  }
  #else

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
