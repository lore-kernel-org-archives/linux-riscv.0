Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F539C02194
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0hQt+hM+if1BCL3sHt8jlqnmke0qbaxvgdpLyVC0Ns=; b=n0VhPlHNArZsRz
	9wTapoZ1rX+nyr2/PE0+/nzMQt6t1VJVM1JLq8B2f2qzfUjKLlUsJLrwQtlQBTPWSL1CBrY/u+1Ee
	QE0tWFHfflpncADZ/0epgsUhCBcQ4dFujNL8WdpyxZV3+P90Tov2a8qMvtmusRBTNF8OyrLpx05Qd
	WA+Ngb3eOo80TU6NoEkcW48mQVv0DWm57iR6zl1duQtOjuLfe0QPKgsa2YzpnMtwGsFHGYWcyRqFJ
	qf/ZsqUaH6Xh21aZu7WvijJAtH7odn9wOxIGH445zDvbzA/dMFchFzPs6bRN1As+TSDi0pfTD5FKT
	/+6vnYeU0gawjrHobL8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1texJj-0000000FeD9-2vJv;
	Mon, 03 Feb 2025 14:20:51 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1texGn-0000000FdcM-3AmH;
	Mon, 03 Feb 2025 14:17:51 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738592268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J85aJuJVnCtJF5A7o6Xk9eZppKHaaO4RuNSzWv4mXis=;
	b=Mf8dvdSfuCus0IcvuuE5SN1Zl0DFclaAOSmSDUPvlBIzIb3XYgoP7bFYtytu0JuQhQ8vMc
	tAWVKC2ttVgKRJOdjfT09T/8NjB5PmdtLbZHNIObKtUDoL/fdIC+5CUgvvNJVQqq6fLmYL
	qjMq6iP4uu+mtYcHjXp64k9s95PiJ04xGIJwJi7gwr28jDZgoUmi5vxvF5FvYVbFAwFFbA
	kbknquNU4xeTXnGWhamxjUEOmLZGU1yvE36fZa4ukglnKUnZ8CjV+kKwKvhe4S5lLTJjI0
	sDW02M+ZDNzYq0gZ2XdGa8tbYZoSjqZ5cuBjJJlIn7XJoEO8Y7gZ4zS789rvMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738592268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J85aJuJVnCtJF5A7o6Xk9eZppKHaaO4RuNSzWv4mXis=;
	b=Mafj2AVKQixDU9txGK8CdHh1AG0JOnfTDQPBdQG03PJFTImSaoxh+QBrJGMJCIZqlQhtLI
	spX3B9cl0wUjMNAA==
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v2 00/11] RISC-V IMSIC driver improvements
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
Date: Mon, 03 Feb 2025 15:17:48 +0100
Message-ID: <87tt9bnmcz.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_061749_931761_1CC527E3 
X-CRM114-Status: UNSURE (   7.26  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Anup!

On Sat, Dec 14 2024 at 22:55, Anup Patel wrote:
> This series is based on recent discussion on LKML:
> https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamicro.com/
>
> It primarily focuses on moving to RISC-V IMSIC driver use common MSI
> lib and GENERIC_PENDING_IRQ.

Can you please respin this series on top of rc1?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
