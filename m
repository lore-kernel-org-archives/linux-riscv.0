Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD87C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 19:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wAbuPE+x65RnLM5x0ccwVgoDWsb7Zhh2KazUBuuN+k=; b=2QM6PZm9zK62Zy
	rnP1U4V3AA99SQwi9ZhaqKpWn0tMYY37pME5kbEMaoM1tfesxrYNkCWA6oSAJ+KtctH3t4bbkHXqD
	/puN7mujvBatEVVs3cbtBe7pwbuBNq8uHEo9EWXGw/aSnwOqtb2kMqRMl9fUCcsYQKHKQSIUg3TjW
	F+YHxm0zeaeib0M7e/LJluOL6JH0IumqGsm5X3WORg3E0g1vv9bi1+WuckDLd6/53SLz+oVZsvVRh
	Yei02B98gEF4wvf9cc7IoNHxGNBDJMo0CsxHj6p2Oe4dQLIOe6AA2LFA/5w9igOf7MMuN5YhtbHA+
	hcaxVaXr1irxtet0G2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Sb9-001xMp-9l; Wed, 30 Nov 2022 19:18:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Sb7-001xLi-0E
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 19:18:22 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0Sb5-0004Oa-1t; Wed, 30 Nov 2022 20:18:19 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH v2 06/13] RISC-V: kprobes: use central defined funct3 constants
Date: Wed, 30 Nov 2022 20:18:17 +0100
Message-ID: <10766961.CDJkKcVGEf@diego>
In-Reply-To: <Y4aUIsKbJ//CG9iV@spud>
References: <20221128102632.435174-1-heiko@sntech.de> <20221128102632.435174-7-heiko@sntech.de> <Y4aUIsKbJ//CG9iV@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_111821_070079_236E8A8F 
X-CRM114-Status: GOOD (  11.18  )
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

Am Mittwoch, 30. November 2022, 00:22:10 CET schrieb Conor Dooley:
> On Mon, Nov 28, 2022 at 11:26:25AM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > Don't redefine values that are already available in a central header.
> 
> Which central header?
> Being intentionally dense, but it'd be nice to mention it since it's not
> in the diffstat?

It's now:

Don't redefine values that are already available in the central header
asm/insn.h . Use the values from there instead.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
