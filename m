Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AA2CFB442
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 06:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNZREUGhPVImGgBT4Uy1d6JfRz/d2TvUWGlKgbAP+hs=; b=ud/ZK9X0VEJt3R
	XTc9rByAhaIUPJ065VOGwXrPXaAKNiYhCtdgezH8zxCLLydS2zS15TRY+aPOvQDXushptYVsIV7PU
	xeamYdnFmnjLl6z6zinMpaa2uqQ3/3Wh+LL+kMhknZeKLwnp+pdGW3KlicDmXuac4bvCuFpxy4uzG
	1eyqofG0dtnmPeCtnGELALHBXenvF2v9CfX8C0Dny5kGpcRRT8GoSm4MvuFx0swFlzoEQhKcpkofw
	CXVdriIaUu2L7pKGVo36XFaHOEZMt94G+Sh7AL1msTUirIFI6cqHbxKYUFUCZ12NH6bSANbApPwOQ
	Rdk/MJUKz9ItSz97t4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhIQ-00000001RUW-2hsl;
	Mon, 07 Oct 2024 06:32:42 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1sxh8F-00000001PHa-12lh;
	Mon, 07 Oct 2024 06:22:11 +0000
Date: Sun, 6 Oct 2024 23:22:11 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Christoph Hellwig <hch@infradead.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH v1] riscv: make ZONE_DMA32 optional
Message-ID: <ZwN-E279o4bUQG26@infradead.org>
References: <20240827113611.537302-1-vladimir.kondratiev@mobileye.com>
 <e8f6ed93-d47c-4c07-963c-8f16f498abed@ghiti.fr>
 <VI1PR09MB2333FEC324AA0B3E5F1D7F98947C2@VI1PR09MB2333.eurprd09.prod.outlook.com>
 <VI1PR09MB233370D7BD8553E7891EF46F947C2@VI1PR09MB2333.eurprd09.prod.outlook.com>
 <ZwN0l0Y_oUfDX8jl@infradead.org>
 <VI1PR09MB23335FF3B1274ED13F24AF06947D2@VI1PR09MB2333.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1PR09MB23335FF3B1274ED13F24AF06947D2@VI1PR09MB2333.eurprd09.prod.outlook.com>
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

On Mon, Oct 07, 2024 at 06:17:14AM +0000, Vladimir Kondratiev wrote:
> >Well, this doesn't get any more true by just irgnoring the previous
> >discussion and just reposting :(
> 
> Sorry, this wasn't the intention. Perhaps I messed with the message-id, I see my "patch v1" in one mail thread together with the previous discussion, but not in the other thread.
> 
> Anyway, I think making ZONE_DMA32 selection depend on NONPORTABLE answers the concern
> that was raised

It doesn't at all.

For one not having ZONE_DMA32 is going to break a lot of things.
Drivers do expect 32-bit addressable memory.  And because SOC designers
know this there usually is a way to provide it, e.g. by doing window
translations between cpu physical and bus physical address.  Please go
back to your data sheet or talk to the designers.

And if there really is not way to provide this, the right way is just
to stop the runtime allocation that triggered you to do this if
ZONE_DMA32 is empty, not to add a non-portable option.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
