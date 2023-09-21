Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E029E706FA
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 09:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLF5dvbhTXmvpUv7bO4XGmFjAqcmJuAwn1+JJgiDW30=; b=0dlWC5W+isW7pi
	SwH71IbCvNswctntuNSrCDGgC1CF/0SHgvii1Tkn3H3dhMIJOLz7wtlia3SSXeRu7Up4XUyejYc0Z
	eLN21xT0zfEFgdi5uBgpkHX2KvXLmTGSjRpbNpzHNTrWb0z8XhRsAE6gq+MHa7LRWmE9QzM4X/O7H
	DNRsd1eh06AKFHZBzSa6ITZYjilAdVbQ+v00wDJw+M4iF8LhgWr+j/xyQQqSn2v0/4h/baXm152Cu
	P/eftdkbg8j7KVRMWqH4GQGLSKQEdSD6oUfNYt/Ks7LvchhP2+1IMAKLD6bemeOcFJmg+2flw+z/p
	ul34Os6oi6nMk3t9Xvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjG7N-005btk-0J;
	Thu, 21 Sep 2023 09:37:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjG7J-005bsi-3C
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 09:37:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D5507CE1D51;
	Thu, 21 Sep 2023 09:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7740CC4AF5D;
	Thu, 21 Sep 2023 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695289018;
	bh=dNEOlBkvsTEIQ7sDlpgOxIjaV/wTx53tOqsrSxNccPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKe1e3A/+t7cy8i5x0gVpHox3H+UBnELoyDJ0jLD+FCQUOwlHa4OTsHka26jzP8dE
	 lW1Uhty8xFED/Zq+Lx5dciCiEGi9oJIhS3VzkFzFf0G2Lr1WXJgLO65TLaiyHneA8z
	 AcE+UIL0cMD0GyCqP3KJfEnWyYSnZsQs5YAJeebCuOB5yOXRGbppJJw2NA/9y8J7GX
	 9+NxOyrr1l8tyFmDc6joN21Luf7Jp7ej6WUVRHeImywBg3I3HE/5aPmu31Yyz1XwnE
	 te/EBz5euucputziqvfNo+WCHYjkqEb3cm+g0dAjaMRTUYuUdXTVybjhnp9LoY4ge+
	 h4OpuRZFCVFrw==
Date: Thu, 21 Sep 2023 17:24:57 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus
Message-ID: <ZQwL6fxi6IkUEIMc@xhacker>
References: <20230912072232.2455-1-jszhang@kernel.org>
 <20230912-trailing-pampered-52738ec6f009@spud>
 <ZQHSLdPufI6CXApg@xhacker>
 <20230913-faster-spotted-9df41a0d7787@spud>
 <20230920-pesky-stalemate-88f5036b8084@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920-pesky-stalemate-88f5036b8084@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_023702_247860_C481CE8D 
X-CRM114-Status: GOOD (  22.96  )
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

On Wed, Sep 20, 2023 at 09:36:19AM +0100, Conor Dooley wrote:
> Hey Jisheng,
> 
> On Wed, Sep 13, 2023 at 04:44:18PM +0100, Conor Dooley wrote:
> > On Wed, Sep 13, 2023 at 11:15:57PM +0800, Jisheng Zhang wrote:
> > > On Tue, Sep 12, 2023 at 05:27:31PM +0100, Conor Dooley wrote:
> > > > On Tue, Sep 12, 2023 at 03:22:32PM +0800, Jisheng Zhang wrote:
> > > > > riscv select ARCH_DMA_DEFAULT_COHERENT by default, and th1520 isn't
> > > > > dma coherent, so set dma-noncoherent to reflect this fact.
> > > > > 
> > > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > > Tested-by: Drew Fustini <dfustini@baylibre.com>
> > > > > ---
> > > > > 
> > > > > Since v1:
> > > > >  - rebase on v6.6-rc1
> > > > >  - collect Tested-by tag
> > > > 
> > > > Does this mean you're expecting me to take this?
> > > 
> > > Hi Conor,
> > > 
> > > I think I will take this and send PR to soc people. The reason
> > > I send v2 is the rebasing on new rc1 and v1 wasn't in linux-riscv
> > > mailist due to typo;
> > 
> > Great, thanks. Please ask SFR to add your tree to linux-next.

Hi Conor,

I'm not sure how to do this. When MAINTAINERS patch is merged, send
an email to Stephen Rothwell, are these steps correct?

> 
> I lost my main x86 box over the weekend (looks like probably a dead
> motherboard), so I may have missed a response to this.
> 
> Did you see this email? Additionally, can you add that git tree to the
> maintainers entry for the thead devicetrees?

I just created a tree in
git://git.kernel.org/pub/scm/linux/kernel/git/jszhang/linux.git

But it needs time for cgit to take place. I will send a patch
once it appears.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
