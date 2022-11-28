Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DDFC43217
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 14:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suuhFsw8R4weU44fzggyGSSHJ0nIqwDhDueDew/NNCM=; b=Vde/MKx0QGZSJd
	VkY8KAh7aytvI6u4Tty8J+r6ig4gMfdlbS5zPfSPxg5TDfDfcvZBOaVOlJ6cS7RdGiDfai+j9RUoN
	Mqa37rFurDZCSml2TPz6NuyDOdA4MHcaxyYf2KZyKmZHJ/F2XbQBEQMIawy03y1bxR/1k4SAj/gb3
	XfRJT/TJnMmDujQE+ZvCaO81DKYarhoxgVsTaqxfAhoGIIhpfWMS14MJGHNGurvmm6RD4HpbRsy/3
	Z4+dbQ+0E1jCdF4Ca8G36xnoMvqSSuavJLittJulz0v0fR408akvAmizophUh4nEg20JyMTUYtJiU
	EgJE9+SmZbJWxFbd60Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfIo-002Gul-F3; Mon, 28 Nov 2022 14:40:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfIk-002Grt-GI
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 14:40:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D484FB80DE1;
	Mon, 28 Nov 2022 14:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364F4C433C1;
	Mon, 28 Nov 2022 14:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669646403;
	bh=NvJorZr2n6+50Td4fDEE5U9WvCuKu2rwqwYX9x/uSbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b/T6loHbagLo3jI9KjpAzMEvqaMA39G7a7kCR9PSNmOV415m3vD5xGHcBKfZLE65L
	 VxUHPPzZeSHRpNqv3kST7LSciy3QKcEKLPvH7XYWYvd6PClISSMtP2r51HTVkeaILk
	 nwLSrUHhk1eT08SY6OsT6iXt7XGPd9F98L9d7GcovC1V02MEyr9IWGtfIPoW+Kqf6T
	 6i86wJNWyaWMteBCloIOYtm5aK+KtGCsJD+CHsPRQcQYp6Fro5Lt3wkLHGe8BePSsy
	 pX2hIgPYjB+/kdOwuU6B6sn135tJPksOCK9D4u/ofy1oWVKAI0PFiTwgt2UXwiCBxs
	 hNVD0RHKICcgg==
Date: Mon, 28 Nov 2022 22:30:08 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 8/9] MAINTAINERS: riscv: add entry for Bouffalolab SoC
Message-ID: <Y4TF8FzX19puws37@xhacker>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-9-jszhang@kernel.org>
 <Y4Of7s6UGpD0/Iga@spud>
 <Y4OgNW6uOe60Pi09@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4OgNW6uOe60Pi09@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_064006_857036_11B9AFE6 
X-CRM114-Status: GOOD (  21.45  )
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

On Sun, Nov 27, 2022 at 05:36:53PM +0000, Conor Dooley wrote:
> On Sun, Nov 27, 2022 at 05:35:48PM +0000, Conor Dooley wrote:
> > Hey Jisheng,
> > 
> > On Sun, Nov 27, 2022 at 09:24:47PM +0800, Jisheng Zhang wrote:
> > > Add Jisheng Zhang as Bouffalolab SoC maintainer.
> > > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  MAINTAINERS | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 00ff4a2949b8..a6b04249853c 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -17729,6 +17729,15 @@ F:	arch/riscv/
> > >  N:	riscv
> > >  K:	riscv
> > >  
> > > +RISC-V BOUFFALOLAB SOC SUPPORT
> > > +M:	Jisheng Zhang <jszhang@kernel.org>
> > > +L:	linux-riscv@lists.infradead.org
> > > +S:	Maintained
> > > +F:	Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> > > +F:	Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
> > > +F:	arch/riscv/boot/dts/bouffalolab/
> > > +F:	drivers/tty/serial/bflb_uart.c
> > 
> > I think I asked last time but I didn't see an answer on lore or my
> > mailbox - if you intend sending Arnd PRs for this stuff, please add a

Per my past experience of synaptics/mrvl arm SoCs, I usually sent PRs to Arnd
if there are two or more commits/patches; If there's only one patch, I
asked Arnd for picking it up directly. So in bouffalolab SoC case, I
want to do similar, but with one difference -- if there's only one
patch, may I ask you for picking it up directly?

> > git tree here. Otherwise, LMK and I'll bundle it with the other "misc

Hmm, is "git tree" necessary?

> > riscv devicetree" stuff.
> 
> I forgot:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > >  RISC-V MICROCHIP FPGA SUPPORT
> > >  M:	Conor Dooley <conor.dooley@microchip.com>
> > >  M:	Daire McNamara <daire.mcnamara@microchip.com>
> > > -- 
> > > 2.38.1
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
