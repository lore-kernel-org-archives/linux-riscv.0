Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FB6C46CA1
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 16:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=so3D02p+yUv6edSfPhWPOv3gV62+8kEqXfUBDgdsGag=; b=MxNJX5TQiHQDFU
	vdGs3aCUyfcpsDr7ric1gUxyFXgEujBLQ8eY1Aan1HReDZTfHMwYSbi72l03ODZ7adWcKCGQ17tbI
	X6VSdoNickTlCiBnhtEJKa6RRjfMM6alk+wAFWSdiR+pwr3zChCes31sjbBzv2nQSKLGKs7v9DIno
	xbm4M8NJYxLEIkzX8ncKPB7Kbw6uP5du20MYHOJeBGhqdh0zws7BPlB2D/66xylXy43pB68TTWRMd
	VY15hw9qiHWcwat8rnyJ0KeqvfAJReqw6++g1fVtWztgJXs+ctPmDT2ULAzAFG3CSEEoRUfHYDJYp
	Dvt7eAC7loW00MKHuxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsmpn-00Cp92-08;
	Tue, 17 Oct 2023 16:22:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsmpk-00Cp88-0R
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 16:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 10287B81EB1;
	Tue, 17 Oct 2023 16:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D911C433C8;
	Tue, 17 Oct 2023 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697559733;
	bh=BGLcQJ1AIS+kHLin3KQTBMCUf5EKbNVI9D++C1CMJyM=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=Nnmqwu0eZrEhF5zWXqPVOFVakwQjkftnq6TzOp+QYI2fjmBZvkwzbNoSGjQr/YFeQ
	 aD5lG9oCgefLhW7Jlf/GqcLkXj0EqJ/3jogA/i5hVUtYjuzH0Hyb8QwwbouqjY7z/x
	 RhQ1WEX3lB5UHScD2YotQoWWHqBvUCwQQXFcD/lhQVrKjVfeFV7cnxLUxg62BPHUGh
	 zdA6ZYR3ezwFCbp/U0MxxTPIyKeiFE7wmdRwYteL+zCqAjJPtj8YW9nF33x74UeGfF
	 WU3jUD1rG1PO0jUQuiSOFtvGFLrWbWh/Vx3QOnDJdAwFQvt0uF5gfO3Mf3sC+3/ceT
	 AeD3jwh6gXlfA==
Date: Wed, 18 Oct 2023 00:09:59 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus
Message-ID: <ZS6x18XEJXmB7FFL@xhacker>
References: <20230912072232.2455-1-jszhang@kernel.org>
 <20230912-trailing-pampered-52738ec6f009@spud>
 <ZQHSLdPufI6CXApg@xhacker>
 <20230913-faster-spotted-9df41a0d7787@spud>
 <20230920-pesky-stalemate-88f5036b8084@wendy>
 <ZQwL6fxi6IkUEIMc@xhacker>
 <20230921-4a1fe80384e083c67f38dc27@fedora>
 <ZS1uiXORq2IRPnId@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZS1uiXORq2IRPnId@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_092216_501706_C6235986 
X-CRM114-Status: GOOD (  32.65  )
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

On Mon, Oct 16, 2023 at 10:10:33AM -0700, Drew Fustini wrote:
> On Thu, Sep 21, 2023 at 11:08:28AM +0100, Conor Dooley wrote:
> > On Thu, Sep 21, 2023 at 05:24:57PM +0800, Jisheng Zhang wrote:
> > > On Wed, Sep 20, 2023 at 09:36:19AM +0100, Conor Dooley wrote:
> > > > Hey Jisheng,
> > > > 
> > > > On Wed, Sep 13, 2023 at 04:44:18PM +0100, Conor Dooley wrote:
> > > > > On Wed, Sep 13, 2023 at 11:15:57PM +0800, Jisheng Zhang wrote:
> > > > > > On Tue, Sep 12, 2023 at 05:27:31PM +0100, Conor Dooley wrote:
> > > > > > > On Tue, Sep 12, 2023 at 03:22:32PM +0800, Jisheng Zhang wrote:
> > > > > > > > riscv select ARCH_DMA_DEFAULT_COHERENT by default, and th1520 isn't
> > > > > > > > dma coherent, so set dma-noncoherent to reflect this fact.
> > > > > > > > 
> > > > > > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > > > > > Tested-by: Drew Fustini <dfustini@baylibre.com>
> > > > > > > > ---
> > > > > > > > 
> > > > > > > > Since v1:
> > > > > > > >  - rebase on v6.6-rc1
> > > > > > > >  - collect Tested-by tag
> > > > > > > 
> > > > > > > Does this mean you're expecting me to take this?
> > > > > > 
> > > > > > Hi Conor,
> > > > > > 
> > > > > > I think I will take this and send PR to soc people. The reason
> > > > > > I send v2 is the rebasing on new rc1 and v1 wasn't in linux-riscv
> > > > > > mailist due to typo;
> > > > > 
> > > > > Great, thanks. Please ask SFR to add your tree to linux-next.
> > > 
> > > Hi Conor,
> > > 
> > > I'm not sure how to do this. When MAINTAINERS patch is merged, send
> > > an email to Stephen Rothwell, are these steps correct?
> > 
> > Sorta, yeah. You don't need to have the MAINTAINERS patch merged first
> > though, just send him a link to your tree and the branch name(s) & he
> > will include it in linux-next.
> > 
> > > > I lost my main x86 box over the weekend (looks like probably a dead
> > > > motherboard), so I may have missed a response to this.
> > > > 
> > > > Did you see this email? Additionally, can you add that git tree to the
> > > > maintainers entry for the thead devicetrees?
> > > 
> > > I just created a tree in
> > > git://git.kernel.org/pub/scm/linux/kernel/git/jszhang/linux.git
> > > 
> > > But it needs time for cgit to take place. I will send a patch
> > > once it appears.
> > 
> > Looks to be there for me now. Thanks for doing this!
> 
> Hi Jisheng, I'm writing the cover letter for v2 of my th1520 mmc series
> and I am wondering if this dma-noncoherent patch is in any tree yet?

Hi Drew,

I forget this patch. Thanks for reminding.

Hi Arnd

This is the only one dt fix for thead SoC, can you please pick it up
for the upcoming -rcN? I knew soc people can directly ask for pick
up for only one fix in the past. Let me know if I need to generate a
formal PR.

Thanks in advace 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
