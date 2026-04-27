Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F44BFF8850
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 02:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPjA06ywUIscWHu1Q7Erbo2lsfXz+URymlzJFKDDndA=; b=ngHqONh7uWte32
	Kyd/8TXXL0kZ1GcBnXvVcGhtcaTlUd0bbIVdL8Mc0ALW2OV0xa7C6ZmWGDNAXpjShZVHN77ph8TlR
	Bn0fxs7V1Ynfa3qFKmbkXXJ7acK2jPIn7UeKWfnl3aiEhlpGNZXIADWszn6muh2hoTZk+QNnsD3KA
	xuElJ+oVqBMlteNBx1oUIV8CQxT/i6X8Whet0CcAwmLyv22IPHQKl/dSSESZrk6xCN5bf+A+eZjE7
	3KAHnqwbgVBXXgPPf/mfTvry6bdyD6Z3WHIez01d0s40/nNRToEuAyyuZL2Gedccc5p/2UMENY46O
	PL8EjaaRUkM18QN4h8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBlI-0000000G3SW-1tCF;
	Mon, 27 Apr 2026 02:31:52 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBlF-0000000G3RM-0cNq
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 02:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=oX3N68CM0wO9T+kbhhF9OQgbR+Z8QKW6l
	lshw/JFnd0=; b=E+zw+5eSGz6R12mNTc1QJhO4Hwn5UxedfQBPWBGyQ7n14xYkk
	TF+DA5zppkb0rNavzRnA8oU+IbCMJzazD5COspE/Rq7NMWL6BK4huqb/KcWuag/D
	iUhpp7zV7KFwMxhLFsa74RW7z6aYcUiLvUSsXTf6ADIDxv+LE6jL6ddhJg=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkO1yu5pWv4CAA--.1685S2;
	Mon, 27 Apr 2026 10:32:22 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/4] serial: 8250_dwlib: move DesignWare register
 definitions to header
From: Jia Wang <wangjia@ultrarisc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org
In-Reply-To: <aes_zx9GdaXnDNqG@ashevche-desk.local>
References: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
 <20260424-ultrarisc-serial-v4-1-1765a0b4c4a0@ultrarisc.com>
 <aes_zx9GdaXnDNqG@ashevche-desk.local>
Date: Mon, 27 Apr 2026 10:31:37 +0800
Message-Id: <177725709757.1303892.11056150858190690738.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777257098; l=3809;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=WmZ8rFbbC/cJ68Nvw+W0i3Fys8rvFt/pqzQym3PR+9s=;
 b=aMw7phVsLJoQFmtsdyicHU+CjeYJwHnjDphId0LYq0zAsyGnbjr0Q4ahx8BSud1NKhjJDawX2
 1lG4FURtJptCG2DGShE7KqUsJrkC2DcL+x/RvAqqttRyo73LGwbDHIa
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAnEkO1yu5pWv4CAA--.1685S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrWkGFy3Cr1fZr1fKFy8Zrb_yoWrJw1xpr
	10gFWDtF1qya13W340qanxtr4IqFyxGw409ryFqrWDtFW8Cw1kKFZF9F43KrWUXrn5JrW8
	ZF1UXw1Yga929rDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWnti78ACwAEsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_193149_959331_9A6E778F 
X-CRM114-Status: GOOD (  16.16  )
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

On 2026-04-24 13:02 +0300, Andy Shevchenko wrote:
> On Fri, Apr 24, 2026 at 01:39:28PM +0800, Jia Wang wrote:
> > Move the DW_UART_* register offsets and CPR bit/field definitions from
> > 8250_dwlib.c into 8250_dwlib.h so they can be shared by 8250_dw and
> > 8250_dwlib users.
> > 
> > Add an include guard for 8250_dwlib.h.
> 
> ...
> 
> > -/* DesignWare specific register fields */
> > -#define DW_UART_IIR_IID			GENMASK(3, 0)
> > -
> > -#define DW_UART_MCR_SIRE		BIT(6)
> > -
> > -#define DW_UART_USR_BUSY		BIT(0)
> > -
> 
> One nit-pick, though, these three need the similar comments in the header and a
> blank line between them.
> 

Thanks.

Will add comments and blank lines in v5.

> ...
> 
> > +/* Offsets for the DesignWare specific registers */
> > +#define DW_UART_USR	0x1f /* UART Status Register */
> > +#define DW_UART_DMASA	0xa8 /* DMA Software Ack */
> > +#define DW_UART_TCR	0xac /* Transceiver Control Register (RS485) */
> > +#define DW_UART_DE_EN	0xb0 /* Driver Output Enable Register */
> > +#define DW_UART_RE_EN	0xb4 /* Receiver Output Enable Register */
> > +#define DW_UART_DLF	0xc0 /* Divisor Latch Fraction Register */
> > +#define DW_UART_RAR	0xc4 /* Receive Address Register */
> > +#define DW_UART_TAR	0xc8 /* Transmit Address Register */
> > +#define DW_UART_LCR_EXT	0xcc /* Line Extended Control Register */
> > +#define DW_UART_CPR	0xf4 /* Component Parameter Register */
> > +#define DW_UART_UCV	0xf8 /* UART Component Version */
> > +
> > +/* Receive / Transmit Address Register bits */
> > +#define DW_UART_ADDR_MASK		GENMASK(7, 0)
> 
> > +/* Line Status Register bits */
> > +#define DW_UART_LSR_ADDR_RCVD		BIT(8)
> 
> Like this one, the IIR. MCR, and USR bits should be commented. Also preserve
> the sorting by the register offset, so the groups of bits follow the above list
> of registers, where USR bits, for example, should go before TCR.
> 

Will add comments to IIR, MCR, and USR bits and reorder the groups by
register offset in v5.

> > +/* Transceiver Control Register bits */
> > +#define DW_UART_TCR_RS485_EN		BIT(0)
> > +#define DW_UART_TCR_RE_POL		BIT(1)
> > +#define DW_UART_TCR_DE_POL		BIT(2)
> > +#define DW_UART_TCR_XFER_MODE		GENMASK(4, 3)
> > +#define DW_UART_TCR_XFER_MODE_DE_DURING_RE	FIELD_PREP(DW_UART_TCR_XFER_MODE, 0)
> > +#define DW_UART_TCR_XFER_MODE_SW_DE_OR_RE	FIELD_PREP(DW_UART_TCR_XFER_MODE, 1)
> > +#define DW_UART_TCR_XFER_MODE_DE_OR_RE		FIELD_PREP(DW_UART_TCR_XFER_MODE, 2)
> > +
> > +/* Line Extended Control Register bits */
> > +#define DW_UART_LCR_EXT_DLS_E		BIT(0)
> > +#define DW_UART_LCR_EXT_ADDR_MATCH	BIT(1)
> > +#define DW_UART_LCR_EXT_SEND_ADDR	BIT(2)
> > +#define DW_UART_LCR_EXT_TRANSMIT_MODE	BIT(3)
> > +
> > +/* Component Parameter Register bits */
> > +#define DW_UART_CPR_ABP_DATA_WIDTH	GENMASK(1, 0)
> > +#define DW_UART_CPR_AFCE_MODE		BIT(4)
> > +#define DW_UART_CPR_THRE_MODE		BIT(5)
> > +#define DW_UART_CPR_SIR_MODE		BIT(6)
> > +#define DW_UART_CPR_SIR_LP_MODE		BIT(7)
> > +#define DW_UART_CPR_ADDITIONAL_FEATURES	BIT(8)
> > +#define DW_UART_CPR_FIFO_ACCESS		BIT(9)
> > +#define DW_UART_CPR_FIFO_STAT		BIT(10)
> > +#define DW_UART_CPR_SHADOW		BIT(11)
> > +#define DW_UART_CPR_ENCODED_PARMS	BIT(12)
> > +#define DW_UART_CPR_DMA_EXTRA		BIT(13)
> > +#define DW_UART_CPR_FIFO_MODE		GENMASK(23, 16)
> 
> > +/* DesignWare specific register fields */
> > +#define DW_UART_IIR_IID			GENMASK(3, 0)
> > +#define DW_UART_MCR_SIRE		BIT(6)
> > +#define DW_UART_USR_BUSY		BIT(0)
> 
> I.o.w. uncouple these as per above.
>

Will do in v5. I'll move them to their respective register-offset
groups with comments and blank lines as suggested.
 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
> 

Best Regards,
Jia Wang



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
