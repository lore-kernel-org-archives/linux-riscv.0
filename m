Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D316C6FD1C
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OYdmP6io9xFSGzZi81UUy9WEc9/EOXlm8r0yW0De/uo=; b=wUIhBMD0apTmEu
	0Da5lgrSwJWYYsAHaLQtZroEqeJKYMJcKanJT24g8MpOqEQ2IJtgvW0WAWIBPEDmLwtijCWKY4Rs7
	Dh9hPZgyfDCjY7y02x5NEwyIOTnKsyEdBi/lWLfqh73HWZloBK7PgH/Pll5JinqhZWGJevLDpLlV4
	+nzg3J2sXt3sMjuEMNtBC+toXG9Bmyiqw5EWJ/85ppRcNkGPLsFIfEg+DW2mjV8Kj/leUAVZbS+ME
	aqQIWdBTU6kJVwcH9UD1s2byH/bt7wxF0+Ct5zCTNe5zJZQ//WOG1gwmJdhK1vAcx78LpdQYeBi+j
	Uu4N4d0uRIHjjcYEhowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5jT-00ATXD-14;
	Tue, 14 Mar 2023 14:34:31 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5jQ-00ATWI-1V
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 14:34:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1pc5jL-0002AR-Bo; Tue, 14 Mar 2023 15:34:23 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1pc5jH-0046Cd-KN; Tue, 14 Mar 2023 15:34:19 +0100
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1pc5jH-0008jq-0N; Tue, 14 Mar 2023 15:34:19 +0100
Message-ID: <0a3830dcee01c2605c8371a15dfaddd744a8e906.camel@pengutronix.de>
Subject: Re: [PATCH v5 05/21] reset: starfive: Replace SOC_STARFIVE with
 ARCH_STARFIVE
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Hal Feng <hal.feng@starfivetech.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>,  Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
 <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Emil Renner
 Berthing <emil.renner.berthing@canonical.com>, linux-kernel@vger.kernel.org
Date: Tue, 14 Mar 2023 15:34:18 +0100
In-Reply-To: <20230311090733.56918-6-hal.feng@starfivetech.com>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
	 <20230311090733.56918-6-hal.feng@starfivetech.com>
User-Agent: Evolution 3.38.3-1+deb11u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_073428_508891_0C6898DC 
X-CRM114-Status: UNSURE (   5.40  )
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

On Sa, 2023-03-11 at 17:07 +0800, Hal Feng wrote:
> Using ARCH_FOO symbol is preferred than SOC_FOO.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
