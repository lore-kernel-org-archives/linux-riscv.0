Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E1CC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqwNLRiElfEFJHpl05c0TXyeVy39zg6nLQN+pPL3H/w=; b=Zpw6+tQtmSTznu
	G1w5pZHFF/+SJRaGHKftqzUCWtSVCT4oFNjQVER/NUSKkv2sRnshatnjuExdG3g9CNvMRuuLe/XLL
	w04LCutKlI4/nEr7UGKqCbCsWFWdBoKLGmSfn2BRTIQbB2pLneR0iMYAi7vMbb/QHJV9sBqJzDS8A
	ovYf4wPr9ngoTQDpN3V/BEH3nyPZfqpl0Di6IsK8XM4q1xpvO5UFTOE90ClgxKt2G99NDNAe1DCek
	64N873s+zC9VlPFaYLnRHnFRwXJc7rV1U7kjKYiUa81L7/izC4kEjIYCm/RUuuFD59slFl1fvDNWk
	D91cb75XcIOO4KrBDNvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfN6-002J3Y-Dg; Mon, 28 Nov 2022 14:44:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfN3-002J10-LQ
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 14:44:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCFFD611C8;
	Mon, 28 Nov 2022 14:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4A1C433C1;
	Mon, 28 Nov 2022 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669646672;
	bh=CbaAnBCuYu+p+UM9W360R4cey3oGnj8pLzKqxqy8XvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RodtObudbG8bTHmKvie0yVRlfVrZptmw9XXByMIPO5LtqwEW/5b4M3XhWuX+ZSz40
	 9B6oL+NFt90t5KBYwWkerqJcOqX9S7OCT/ceDeQB0q0NR6tqStRlvdrJNkfqlcKOyA
	 k+vKWq0Yblo1L0WOFNVxm7gqFVNeFXXola86g9FJTuXrY1PZXA/szlQHMl+RpbGpWA
	 h8SG7ikczPJ+7su5TsPuRV0Yde1KLjs6vpkOT3/qlQl4qEoRUbXh+BT+wPXSGDSLpt
	 f1SQdZkiHVpqVTUe/MKmHTagtKXs/2uuTDU7CsSywrOAXrO7HtwJJoQoVe9M/Gv9xh
	 ixJgqkKQP8IVA==
Date: Mon, 28 Nov 2022 22:34:38 +0800
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
Message-ID: <Y4TG/iM0ibf65Iua@xhacker>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-9-jszhang@kernel.org>
 <Y4Of7s6UGpD0/Iga@spud>
 <Y4OgNW6uOe60Pi09@spud>
 <Y4TF8FzX19puws37@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4TF8FzX19puws37@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_064433_811498_7A529415 
X-CRM114-Status: GOOD (  25.30  )
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

On Mon, Nov 28, 2022 at 10:30:15PM +0800, Jisheng Zhang wrote:
> On Sun, Nov 27, 2022 at 05:36:53PM +0000, Conor Dooley wrote:
> > On Sun, Nov 27, 2022 at 05:35:48PM +0000, Conor Dooley wrote:
> > > Hey Jisheng,
> > > 
> > > On Sun, Nov 27, 2022 at 09:24:47PM +0800, Jisheng Zhang wrote:
> > > > Add Jisheng Zhang as Bouffalolab SoC maintainer.
> > > > 
> > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > ---
> > > >  MAINTAINERS | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > > 
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 00ff4a2949b8..a6b04249853c 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -17729,6 +17729,15 @@ F:	arch/riscv/
> > > >  N:	riscv
> > > >  K:	riscv
> > > >  
> > > > +RISC-V BOUFFALOLAB SOC SUPPORT
> > > > +M:	Jisheng Zhang <jszhang@kernel.org>
> > > > +L:	linux-riscv@lists.infradead.org
> > > > +S:	Maintained
> > > > +F:	Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> > > > +F:	Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
> > > > +F:	arch/riscv/boot/dts/bouffalolab/
> > > > +F:	drivers/tty/serial/bflb_uart.c
> > > 
> > > I think I asked last time but I didn't see an answer on lore or my
> > > mailbox - if you intend sending Arnd PRs for this stuff, please add a
> 
> Per my past experience of synaptics/mrvl arm SoCs, I usually sent PRs to Arnd
> if there are two or more commits/patches; If there's only one patch, I
> asked Arnd for picking it up directly. So in bouffalolab SoC case, I
> want to do similar, but with one difference -- if there's only one
> patch, may I ask you for picking it up directly?

That's to say: If there are two or more commits/patches, I will send
Arnd PRs; If there's only one commit/patch, I will ask your help to
picking it up directly.

> 
> > > git tree here. Otherwise, LMK and I'll bundle it with the other "misc
> 
> Hmm, is "git tree" necessary?
> 
> > > riscv devicetree" stuff.
> > 
> > I forgot:
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > > >  RISC-V MICROCHIP FPGA SUPPORT
> > > >  M:	Conor Dooley <conor.dooley@microchip.com>
> > > >  M:	Daire McNamara <daire.mcnamara@microchip.com>
> > > > -- 
> > > > 2.38.1
> > > > 
> > > > 
> > > > _______________________________________________
> > > > linux-riscv mailing list
> > > > linux-riscv@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
