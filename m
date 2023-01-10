Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A81C54EBE
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 07:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJwx33CizEQUuW0ACqx3kNnoEi68niblfRR56Di73yo=; b=K2wB8hELtSLQ0d
	ltPNOOXPSfnTfwpoS29NEf1DdjXOnLL/9PxLpC8BfNB75IuUokRBRfVbCgKEsM7tln/j+QanUPcqj
	IoRDoWu2V8RyH+ZOxFCKvaBmwQJTvHnT49qOv1OAA6rim2DeRPlJITuAOM0Yz0ENh4E5FZbfrEGkI
	WVztQU3FNQJgsAGT7qKDdgpLTBBBdYMap53jCHiwwLrYqqfPVFkta1PVjDuhQWxKJKHuQlS92k7kX
	m5mYCgCymqtAECj5XuIhSuByhNtgRG/rKofej/vkd8WcmA8CRRDd+4iVYxeY8HwS09gnxcDbJObyE
	zoL8R44oHQpY0wuiIFew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF8ds-005Z63-0e; Tue, 10 Jan 2023 07:01:52 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF8dp-005Z55-Tv
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 07:01:51 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 32C1768BFE; Tue, 10 Jan 2023 08:01:45 +0100 (CET)
Date: Tue, 10 Jan 2023 08:01:44 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	"Conor.Dooley" <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	guoren <guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	devicetree@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Christoph Hellwig <hch@lst.de>, Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH v6 1/6] riscv: mm: dma-noncoherent: Switch using
 function pointers for cache management
Message-ID: <20230110070144.GG10289@lst.de>
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230106185526.260163-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <6f7d06ef-d74d-4dfc-9b77-6ae83e0d7816@app.fastmail.com> <CA+V-a8uF1s+dwKC_+apL+CBiHN8w_J0n_G2dqsgiAUZVEibfqg@mail.gmail.com> <9017adf0-acd4-4c43-8aea-3579b214b477@app.fastmail.com> <CA+V-a8u6jvR=EDeE3mAbDr6-06NoBJ7mwmi_Y9qVyHT+aC-9rg@mail.gmail.com> <45d6eb0c-cbe3-4a83-aa12-3483638473ae@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45d6eb0c-cbe3-4a83-aa12-3483638473ae@app.fastmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_230150_122850_138E80CC 
X-CRM114-Status: GOOD (  15.75  )
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

On Mon, Jan 09, 2023 at 01:59:12PM +0100, Arnd Bergmann wrote:
> I had another look at the arm64 side, which (like the zicbom
> variant) uses 'clean' on dma_sync_single_for_device(DMA_FROM_DEVICE),
> as that has changed not that long ago, see
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c50f11c6196f45c92ca48b16a5071615d4ae0572

which IIRC has been reverted recently.

> I'm still not sure what the correct set of operations has
> to be, but nothing in that patch description sounds ISA
> or even microarchitecture specific.

Nothing is ISA specific, and the only micro architecture related thing
is if the specific core can speculate memory accesses.  See the table
in arch/arc/mm/dma.c for details.

And as commented on the arm64 patch I really hate architectures getting
creative here, as I'd much prefer to move the choice of primitives to
the core DMA code and just provide helpers to invalidate/writeback/
writeback+invalidate from the architectures eventually.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
