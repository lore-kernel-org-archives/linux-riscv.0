Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA4EC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 23:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s87h6AZaItN9n4gHyBXbWNMcXX/7Mwd+cW9R0Af3244=; b=igMLgniUFguOHn
	z4jQykvl1rUubXjqqbXhsUBY4YrGDsaZ5DYFo1uDdYf2rRno6auChN6BEyWRsGHOGGu33IfH4hb8e
	9hmlvAfNIG8hBLyqwIYeVwo4SDD4DWFcsMv2rS8iNUcKBqWdysRNd7xfgcUBV77aUb4cWZBeZSOsP
	zpR08RvpQv6cXvluLWSHne5WISTBMhqhNDt6A8BLySVcf8lFD1Zs1flHXnAl+2zfZ6KItlx/PUMBu
	yY5W2umtvYxVxBrwWy0ALliFfsHt6oOGSuGWGTvRCblUVSu0JGGVN5g6Jym2fS3wsEtOiEGyoEIVJ
	J+7yQZr5+B2ffNxztBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5mN-005SNj-40; Fri, 04 Nov 2022 23:07:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5mK-005SNK-D1
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 23:07:13 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1or5m9-00020w-A4; Sat, 05 Nov 2022 00:07:01 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <Conor.Dooley@microchip.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-riscv <linux-riscv@lists.infradead.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [QUERY]: RZ/Five (AX45MP) non-coherent DMA
Date: Sat, 05 Nov 2022 00:07:00 +0100
Message-ID: <13365637.uLZWGnKmhe@diego>
In-Reply-To: <CA+V-a8u_u9Q6Hb8kOZVKFjGyPsc2HQt88c4y2Nh8dzx0XSebeA@mail.gmail.com>
References: <CA+V-a8u_u9Q6Hb8kOZVKFjGyPsc2HQt88c4y2Nh8dzx0XSebeA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_160712_471522_B7A5598F 
X-CRM114-Status: GOOD (  21.82  )
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

Hi Prabhakar,

Am Freitag, 4. November 2022, 23:09:15 CET schrieb Lad, Prabhakar:
> When trying to add non coherent DMA support for the RZ/Five SoC, I was
> suggested to use the ALTERNATIVE() macro [0].
> 
> My initial intention was to implement the alternative_call_x()
> something like what x86 has and from there call the C function, So
> while doing some experiments I realized that using the asm "call
> <func>" would cause adding the whole lot of registers in the clobbers
> list.
> 
> As per my understanding the only correct approach to
> alternative_call_x() is if the function itself is inline assembly then
> we know the exact registers being used and then we could add them
> appropriately in the clobbers list.

I'm working in a quite similar area right now and I've Cc'ed you on a
RFC series when I'm also worked on makeing call work in alternatives.

As you noted, using assembler for the call'ed function makes things
way easier to handle.

> The problem with the above approach being we have quite a lot of C
> code [1] for the CMO and it also requires some register writes of the
> l2 cache controller, converting this to assembly would be a pain.
> 
> * Is my understanding correct?
> * Is there any other approach I am missing?
> * Is there no way out apart from implementing inline asm?

In the inline-asm part that will form the alternative, can you
not just save and restore the registers manually around the
actual call?

ALTERNATIVE(
[1] ... nops ...,
[2] ... CMO ...,
[3] ... THEAD ...,
[4] save registers to stack
    call ax45mp dma-func
    restore registers from stack

That way you would no incur many penalties to the other alternatives
I think.


Heiko

> [0] https://patchwork.kernel.org/project/linux-riscv/cover/20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> [1] https://patchwork.kernel.org/project/linux-riscv/patch/20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> Cheers,
> Prabhakar





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
