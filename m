Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D92C38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 14:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/iSiw1DBYLTd3Bccg1Po/dS1z6EvWhcNKzFBwNb9Y0g=; b=sqHQWtFtR7ane7
	zIti3vBgcFaO9pQUtPDH+STpzg4P7mSYVHYr+SP1wTtBexfdloXXyEsH1nm8meydpsGVa4TKtuHz1
	cE6jkr4O3iQmjWUmPV12t7x6o6NWvJ/N9jly0YTV5RWSt0om3cf4ydwjefL23SjuUHLh/r3NFW/8R
	nG7lv3dp0ZtWhrLH9gEH3jj3gZY53OxrHM2/Mr52W7wSMOFSTazE0f/TwhcD1PlL+LxcHmdzjS9ze
	D051OCAabc5YEZ00AxcJIWoXTxV0XQLpgetmFVLCiZU0KCcTY0k4kHF8BFqzKl2RiFGiQwQ4UuJ26
	I5TxSloGqGiKQDOyI+yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJy5y-0001ad-3r; Mon, 23 Jan 2023 14:46:50 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJy5u-0001Zj-AA
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 14:46:48 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 37A2D68BEB; Mon, 23 Jan 2023 15:46:39 +0100 (CET)
Date: Mon, 23 Jan 2023 15:46:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>, Prabhakar <prabhakar.csengg@gmail.com>,
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
	Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH v6 1/6] riscv: mm: dma-noncoherent: Switch using
 function pointers for cache management
Message-ID: <20230123144638.GB31126@lst.de>
References: <CA+V-a8u6jvR=EDeE3mAbDr6-06NoBJ7mwmi_Y9qVyHT+aC-9rg@mail.gmail.com> <45d6eb0c-cbe3-4a83-aa12-3483638473ae@app.fastmail.com> <20230110070144.GG10289@lst.de> <02988e70-b099-46fd-b260-2d537c50543a@app.fastmail.com> <20230113054807.GA23179@lst.de> <ea4cb121-97e9-4365-861a-b3635fd34721@app.fastmail.com> <20230121143733.GA7415@lst.de> <6a64b0b5-0ebc-43a5-a3d8-483a845a0b5e@app.fastmail.com> <20230122072759.GA3703@lst.de> <7ad668ba-d6f3-4ef9-9335-e42bfe8d4cce@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ad668ba-d6f3-4ef9-9335-e42bfe8d4cce@app.fastmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_064646_682335_9D01D3B2 
X-CRM114-Status: GOOD (  24.82  )
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

On Sun, Jan 22, 2023 at 12:04:35PM +0100, Arnd Bergmann wrote:
> > And I'm not really sure I'd like to go beyond that - making it too
> > easy pluggable will make people feel more comfortable doing stupid
> > things here. 
> 
> I fear the bigger risk is still making the functions callable
> from device driver code than it is to make the functions
> globally settable.
> 
> You introduced the mips version in f8c55dc6e828 ("MIPS: use generic
> dma noncoherent ops for simple noncoherent platforms"), which
> was clearly meant as an implementation detail, yet we already
> have a driver that slipped in with 3bdffa8ffb45 ("Input: Add
> N64 controller driver") that just calls this directly rather
> than using the dma-mapping interface.

MIPS actually has a bit of a history of these odd bypasses that
it seems like this driver copied.  rmk has been very worried by
this bypassing, and in general I agree.  But there's only so
much we can do except for auditing drivers.  Especially as none of
these helpers is exported and built-in only drivers are quite rare.

> > And yes, maybe that's personal because I've warned
> > the RISC-V people years ago that they'll need architectural
> > cache management instructions yesterday and the answer was that
> > no one is going to use them on modern CPUs.  *sigh*
> 
> To be fair, from the ISA point of view, it really shouldn't
> be necessary as long as you have a sane SoC design.
> In practice there are always chips that are cutting corners,
> or use the new CPU core as a drop-in for an existing
> design. Arm SBSA tried to enforce the same thing and also
> failed for pretty much the same reason.

Not wiring up IP blocks for cache coherency is cheap.  So it totally
makes sense for dirt cheap SOCs, or even for low performance periphals
in general.  The GPU folks also believe they can make some things
faster by deliberately turning coherency off on SOCs that support
coherency.

In addition to that cache maintainance is absolutely needed for NVDIMM
support.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
