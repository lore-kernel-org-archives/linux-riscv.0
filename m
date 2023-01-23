Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB2CC54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 12:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyUDaLkFiARNLUHOJCz/lQWMmNscrWoYNRDg7GnfZY8=; b=IgYzTWaBtFo1S2
	MKkyg1Xl+jeoiss1lSUCZhvk6XdFDUwA3Rm5l6ge9oHocjELCACdFy+s0se7QrBI4gz9Czyi+d7rZ
	hFoSbsxnOm/5SRzXhUE5tRekuWXUUK5UD3SiarFBl3G9oprdZ7wnIco1uIjLeHZkCb53pRoRGl0Ja
	xgliaEuOEgPnju/XzAV3If5rWWYSWvSJ6CgWfQTzvvn7aIufcvxaSKXCxc2U9xPbW1cC/uxOs62Tr
	3ngC3q0LoOJCwH150oUjrfmIOJ3EPoggudHj6IJVg3acV0kGn13eWSujCSrXie7HaLoLoxaXiwoah
	MzXUaW87gUL75ZBnnYSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJw5X-00H9Mr-FR; Mon, 23 Jan 2023 12:38:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJw11-00H7l3-7Z; Mon, 23 Jan 2023 12:33:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D27DF60E94;
	Mon, 23 Jan 2023 12:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9951C433EF;
	Mon, 23 Jan 2023 12:33:29 +0000 (UTC)
Message-ID: <0c411b60-1d12-1c34-0f35-5e38d38e2786@xs4all.nl>
Date: Mon, 23 Jan 2023 13:33:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/4] Allwinner D1 video engine support
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
References: <20221231164628.19688-1-samuel@sholland.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221231164628.19688-1-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_043335_396130_51926AC5 
X-CRM114-Status: GOOD (  20.33  )
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

Hi Samuel,

What is the status of this series? It seems to be mostly OK, but I did see
a few comments suggesting improvements.

Does this series depend on your PPU work? That was not clear.

I do think there were enough small comments to warrant a v2, unless you disagree?

Regards,

	Hans

On 31/12/2022 17:46, Samuel Holland wrote:
> This series finishes adding Cedrus support for Allwinner D1. I had
> tested the hardware and documented the compatible string a while back,
> but at the time I had a dummy SRAM section in the devicetree. Further
> testing shows that there is no switchable SRAM section -- there is no
> need for it, I was unable to guess the address, and the usual bits in
> the SRAM controller register have no effect on the video engine. So that
> needs to be made optional in the binding and driver.
> 
> With that done, the node can be added to the devicetree.
> 
> 
> Samuel Holland (4):
>   media: dt-bindings: cedrus: Allow power domain references
>   media: dt-bindings: cedrus: Make allwinner,sram optional
>   media: cedrus: Make SRAM section claiming optional
>   riscv: dts: allwinner: d1: Add video engine node
> 
>  .../media/allwinner,sun4i-a10-video-engine.yaml       |  4 +++-
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi     | 11 +++++++++++
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c        |  2 +-
>  3 files changed, 15 insertions(+), 2 deletions(-)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
