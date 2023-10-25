Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909E0C25B6B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 19:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KC73l+dJlAvu0+qVGPgHxtgVxa7/oT0RfYFiZnBioVI=; b=EvtQi/1zr/gO71
	QKe2tZfFnlnIvg21hTgEJSEWhWFJOVIahqn4TPBfVCaw+2HO6WyyA0Z3PIDHSVMHEOFpkDOdHObD4
	YKLccpbHJX+hb5Gatk475qBpYOMfsoNUknVI5S2nxywook4aJkLHt2dtCav3XxY5+Pp1SrrG0Dv9Y
	n2gTULA7RqU98A5o1M0C7+p/lILC/cmdfjGvU1jpTSnBhW1GfC6oozFtxUwWsV12BNBklZ9VSeoyV
	zKQsR7tw4nYO/os0IUC61iOgKqrQb4KxFq1kdyHrntQm9ZQKMwknY0YFOteif81c9Q6vnRGL63OZg
	W/gcwQkYyhq3Z8VsmJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvjzv-00Czpw-0b;
	Wed, 25 Oct 2023 19:56:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvjzs-00Czow-1y
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 19:56:58 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698263808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Y76BTvDL8fMtXIIKTEWVYaf4r3Jy1wak2WgowyW9Fw=;
	b=esCpCbSf/cGVbPuyJtSR/0shnIZx4AEsHhsuEwZxlDbnnT0pQnNCb03npVRR/WhzSfjUhx
	Xpt9WvqkcG2JGqu1Seh1gjDkPBHQ7OWDw4/TuryeGH6Vg4d8JlVwLLJh0jehwL10F1M1MO
	JvNMBIwld2eUpyFwYp4wLTYBqnr1C6d6ShrtrPMiDzwuBR71FSxDey1udLojgTOxynWYqb
	uQK2pY/kDLAoripSvgpJ/Hq72zxU4svuQijQMK79oXtPPi6Y30GoKPzagA/4VOSVJ8cHRE
	aXWHTUO79O38JrTYJ8ZJxZCcHDKpZE+elp4ZGtKMU0c1RHf2ja0YVtFOyN8mqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698263808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Y76BTvDL8fMtXIIKTEWVYaf4r3Jy1wak2WgowyW9Fw=;
	b=f3nWV8Kv0BmZV5MMqx2/zHJSBaiOlu6tmCwUSQPXD2tXDy2idlMko8ZhhVUvoLvflaC8KH
	RAURu2cNz+Woq5Bg==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v11 08/14] irqchip/riscv-imsic: Add support for platform
 MSI irqdomain
In-Reply-To: <20231023172800.315343-9-apatel@ventanamicro.com>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-9-apatel@ventanamicro.com>
Date: Wed, 25 Oct 2023 21:56:47 +0200
Message-ID: <87edhi5vcw.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_125656_791406_D16C9B0C 
X-CRM114-Status: UNSURE (   7.47  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 23 2023 at 22:57, Anup Patel wrote:
> The Linux platform MSI support requires a platform MSI irqdomain so
> let us add a platform irqchip driver for RISC-V IMSIC which provides
> a base IRQ domain and platform MSI domain. This driver assumes that
> the IMSIC state is already initialized by the IMSIC early driver.

Please no. The platform MSI cruft is really a horrible concept and there
is ongoing work (sadly mightily delayed) to convert the main (ab)user
ARM over to per device MSI domains.

  https://lore.kernel.org/r/20221121135653.208611233@linutronix.de

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
