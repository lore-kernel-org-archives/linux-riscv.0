Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D513C282C5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 07:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DI6WitTlI66LBX513m56MkVMBlzE7KAlNMXlXp9xH+Y=; b=n2jmnvHMfJmtv9
	GEClyy94zMRDw289xGNP5/KVEI6VlbYWqRhyqzretjS3IfaC+tl183QOhZquO8Bck/lS+IllawkBa
	za/EqmSUALz0cQYmlCqh+65xpxlWzBiXWTLtxG5AwsjahVPBkt9FskOBJcREalRZ30pxwJ1V5epQ0
	Gy2Lrus4PdIkbTgBoQDYIwKDEO1T5UfvQKYvaQ00cnp6CtaZfikPhkSg5Mtk0SMha44kF1ZwhzLI5
	IdjZRhoH2jf7Q0zpNxzvKn4gGVZAlgy/vLbY1/zO6FLAMH7QzBrTpHw50SakjGe49L+DCP2Xc0MnU
	NszNgDd/gW+8Jt/jZDJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tozy6-0000000HOTX-30jE;
	Mon, 03 Mar 2025 07:12:02 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tozy4-0000000HOT5-0Dew
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 07:12:01 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 48DC52061F;
	Mon,  3 Mar 2025 08:11:55 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EeaFyw_v4m5d; Mon,  3 Mar 2025 08:11:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740985910; bh=VMN8Xd0ghhP1cTP0V0cYW52AfHb3ymyFSS1C2YenNK0=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=K2iHlyiArGPniZayHlQw9dJk6E60ujtfNIS83hLkTvCrwgLwEgJssUeHKNL6DmF3m
	 kvJJA29hr8NvT6k6ON/kkag1OGdx6tNiRR05FIpkdQy9GbOy1yycMqvJSRmTDTqwfV
	 DqgPisvWCsMInxjNxWDNF+D4upxRbrkK3XaHS9+/LR8hri9+5kC2FVGB0tbRP7PaOz
	 sHBt2mApSfNm+8FDfjLmKUDFxNZYj5KyWMH3qivTog5uhIck3wHzWxyAkQOYYqaPKM
	 Xx8bNJPqs6XbhsyoWrHTZNbdx/FWLdjHydX7bc9knVQUnW9xmYslrK0zf1IgQQliLi
	 ilRk3et4Drf4g==
Date: Mon, 3 Mar 2025 07:11:27 +0000
From: Yao Zi <ziyao@disroot.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH RESEND v5 2/2] i2c: spacemit: add support for SpacemiT K1
 SoC
Message-ID: <Z8VWH-ZXv1FWQU3u@pie>
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-2-21dfc7adfe37@gmail.com>
 <Z8VHaQsqAmhtQnbv@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z8VHaQsqAmhtQnbv@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_231200_518077_3830944E 
X-CRM114-Status: GOOD (  10.56  )
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

On Mon, Mar 03, 2025 at 07:08:41AM +0100, Wolfram Sang wrote:
> 
> > +/* spacemit i2c registers */
> > +#define SPACEMIT_ICR		 0x0		/* Control Register */
> > +#define SPACEMIT_ISR		 0x4		/* Status Register */
> > +#define SPACEMIT_IDBR		 0xc		/* Data Buffer Register */
> > +#define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
> > +
> > +/* register SPACEMIT_ICR fields */
> > +#define SPACEMIT_CR_START        BIT(0)		/* start bit */
> > +#define SPACEMIT_CR_STOP         BIT(1)		/* stop bit */
> > +#define SPACEMIT_CR_ACKNAK       BIT(2)		/* send ACK(0) or NAK(1) */
> > +#define SPACEMIT_CR_TB           BIT(3)		/* transfer byte bit */
> 
> This looks like a lot like a variant of the i2c-pxa register set. Has it
> been considered to reuse that driver?
> 

Reusing existing driver has been discussed earlier[1] and the answer was
no. It really has been a long time.

Thanks,
Yao Zi

[1]: https://lore.kernel.org/all/6015d35d-6d91-4ac1-8ebf-4f79b304370f@gmail.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
