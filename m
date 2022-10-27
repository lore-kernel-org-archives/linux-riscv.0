Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671B2ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 15:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A3xSjifPYjS7+OQF9DROVqkQ52tLh/ZwlR1dEZ3nSq8=; b=gwLNBIF0Hf+0aB
	VN6LaEYnftbk6bpb3nIZx5vMom+Rs7XdySDy1mlVRymRnQQdVfd47QqLIsLU2equKHRoYL18FN0qi
	W+khcmNHxIDZGV1oYW1ortblgRV6WonwNpiiEIwkOb9/9VAYcgbiD7TtgCTkgIr867SZathwsflRk
	vEJ0RxS/UkQOKezOU35TUFONSYP3rPL1BEL5kGBT28SKPwhE/45+NjKxUbFNB/uwFHsp7RkH6Z2Z7
	pDh2XlegZrkVB38EywatqPWchZC5WOTYsSTDLP52hTa0+f0l119rxDPbbhzDEVuLZDMu//IgZl4vG
	W+RKdo2PazkC1Ovn7Zvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo4ww-00E6p4-Cg; Thu, 27 Oct 2022 15:37:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo4wr-00E6o0-RO; Thu, 27 Oct 2022 15:37:41 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oo4wq-0001O0-6u; Thu, 27 Oct 2022 17:37:36 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, Atish Patra <atishp@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 3/9] RISC-V: insn-def: Define cbo.zero
Date: Thu, 27 Oct 2022 17:37:35 +0200
Message-ID: <2545978.irdbgypaU6@diego>
In-Reply-To: <20221027130247.31634-4-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com> <20221027130247.31634-4-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_083737_924643_0F633180 
X-CRM114-Status: UNSURE (   7.40  )
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

Am Donnerstag, 27. Oktober 2022, 15:02:41 CEST schrieb Andrew Jones:
> CBO instructions use the I-type of instruction format where
> the immediate is used to identify the CBO instruction type.
> Add I-type instruction encoding support to insn-def and also
> add cbo.zero.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
