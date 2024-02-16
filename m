Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F349FC48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 21:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBGuNDw62l8Hmy4S/PAStXM+Td5HxUOQE4DxgcuoNPc=; b=34CGqVn3JYjfnL
	caaKVwyRt9/2D3l4zJ2pXKccxO8fHvWmNahlLQ3Uwx3O/bfGfevEtScf0E/lZRnHu2WvpQmn2tlH1
	0ZnwfoOpyj8FF4k+BAMqZ6jTAQz3p25MJwQzl018iYMySIA8Tf5on9PpQVPMOsrPUnI73i7mYpCeA
	TvIWJawmUORKWgZJyQFbMpgJvkj5gYyYRfcJpu9lXqJRCRl6kMgXSH70zvbLh7/BKmvJtYAlAovpP
	dKfTb7qy941EhDrplbMfY0V8bxc4fwEMJjZJl8XVSPY0rSxUWQYdrF7QPGkMA49bxaDtlqGPxq8kS
	QEWupskVmpe/cgedvuww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb5Oy-00000003l8B-2ySJ;
	Fri, 16 Feb 2024 21:05:44 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb5Os-00000003l6G-0YvC;
	Fri, 16 Feb 2024 21:05:41 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708117536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NmEvoquY3BqSFZ0HDkxXKDAY9E0wZEnxUJmSLkCOtxg=;
	b=vvCnSUsijtARAt8uts96ga74b3dHsnePNt2qBbmO253debzyKJ0adesDq/8mekvm+xz4iY
	p8otEfvshT8dv0ifaktzky7cdRv7GSc36mgrG9tnvEBgBkR5ZvaLJaLAQMbZEaSuf3oFcF
	JEEXzOt+8Q/GV1/ltyXEBYD7i03vvlkwlgPAc93+U9vhcvL42d7loSxyjm+sg5byhZawco
	FENyHeFmGbTBr5CrXBxQQ+wzsYe/PRB9MywSnF9bQvqIneGPA4jcYsS6Tj8ZTMl7J3LOr3
	QOXHu0jgflSoLqgg5DIk+cX9PgiH/EmK4cMxmW63+wpJf+6g7ozIRBRJkOVO6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708117536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NmEvoquY3BqSFZ0HDkxXKDAY9E0wZEnxUJmSLkCOtxg=;
	b=fu5NEToUUytvGpRtCWSTHzGJsDi1/IFYPlFboW3xgF/5SAD3bEtn6TbczZv2JjWOw10Qma
	1FWa28CpyIvTPVBg==
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v12 00/25] Linux RISC-V AIA Support
In-Reply-To: <87v86pcxcb.ffs@tglx>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <CAK9=C2Vwtj2gZg-P73yLMxu0rPXQ3YrRRuxq6HcpHMXgs-jHaw@mail.gmail.com>
 <87bk8ig6t2.ffs@tglx>
 <CAK9=C2WsSSHgDF+7ruxx_QF0Lk+Dsx2F2Y-_NabnxrJ_qWhgGQ@mail.gmail.com>
 <87v86pcxcb.ffs@tglx>
Date: Fri, 16 Feb 2024 22:05:36 +0100
Message-ID: <87zfw0azmn.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_130538_341415_EC84CFFB 
X-CRM114-Status: UNSURE (   5.84  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, "Ahmed S.
 Darwish" <darwi@linutronix.de>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Anup!

On Thu, Feb 15 2024 at 20:59, Thomas Gleixner wrote:
> I'm going over the rest of the series after I dealt with my other patch
> backlog.

Aside of the nitpicks I had, this looks pretty reasonable.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
