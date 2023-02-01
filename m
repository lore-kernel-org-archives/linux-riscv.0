Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA207C636D7
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 06:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eX/A7pIlZv1QrKvDBr7QaXABeJIxB3H39TuobbywNQ=; b=UXX3NNzPPRJia0
	x8ZdZcIfUJ5C+tmo4CbvyPinh+eVqyrc5q6PMo4a7OWIQVUxsMAUljcgY5fKsNqJhLOgJ5kDTZHcX
	9sBdv86FCOGB4sI9s8vvOGL6tJU9EhZ8zubQw2rypn9vWz/AvldHjGw2yW2O36B0aZdYu0HCqsad1
	yxXkWFPWAS4IEGvoj2DX+3JdK5tduAmE3tR5qx20BHoMgq9oEA9OJ9pyW1s0F7NBC1eEtAnZ0vURl
	9B0m+r4OA9gWMVYnUuWRA92pJUS4vPaqVxdDzLaaHs6XIiqudHc4GNaqNrmzPL+jjNPNs8TYBZkfk
	5ssUPLTk7JC0SSy0TfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6eo-00ATMQ-TW; Wed, 01 Feb 2023 06:31:46 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6el-00ATMB-Va; Wed, 01 Feb 2023 06:31:43 +0000
Date: Tue, 31 Jan 2023 22:31:43 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Linux-MM <linux-mm@kvack.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [QUERY]: Block region to mmap
Message-ID: <Y9oHT1D1X9cdHLr0@infradead.org>
References: <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
 <Y9KQPxzHBuZGIN4U@casper.infradead.org>
 <CA+V-a8uizF8sQgs8cfTwH3OnK+nvr2dXAoSOPTXCXLFnprHSeA@mail.gmail.com>
 <Y9fhOFEV0kS9U06/@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9fhOFEV0kS9U06/@casper.infradead.org>
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

On Mon, Jan 30, 2023 at 03:24:40PM +0000, Matthew Wilcox wrote:
> > Basically we are making use of the memory protection unit (MPU) so
> > that only M-mode is allowed to access this region and S/U modes are
> > blocked.
> 
> This sounds like RISC-V terminology.  I have no idea what M, S or U
> modes are (Supervisor and User, I'd guess for the last two?)


Yes, M = Machine, S = Supervisor, and U = User.
M omde is the absolutele worst idea of RISC-V and basically a mix
of microcode and super-SMM mode.

> Before we go too deeply into it, how much would it cost to buy all of
> these parts and feed them into a shredder?  I'm not entirely joking;
> if it's less than the software engineering time it'd take to develop
> and support this feature, we should do it.

The above suggests this is in no way an actual hardware problem, but the
stupid decision is done in the M-Mode firmware.  I think it is very
reasonable to simply not support the devices in Linux until the firmware
is fixed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
