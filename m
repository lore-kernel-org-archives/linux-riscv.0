Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B51C25B46
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 17:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9398x2Jkw6AP5bny5Vj7JjUXecUsYtiS8xGaDGC0XZA=; b=MccV2VSpZkjaJ0
	uLW4nd7xkBdYv42+6+RpR4SBsSKcZ2m9833oQQs9TVyzQvfxONfTPgyNKf8BxSSL9hBXjW7W8pgzW
	NS5nhqZgDhbbXage2ys4aeb2iKD4fEzfncYulbz3DLM48ZdYrNiKlV9e/WloC9MuuyslnzxV2M4Mk
	IZusJRGl9pxlWy1PC1UBh0WEYX9evYHl1XwHcYR26WWvyDI3Zk1SngA25YY4FDfoJl7IdgkjSYN3g
	lUab8JxWFamWTbRmXN7xMRINjB17w7bhoCo94wC2vqLCNnDRbhHK5QoU/fp6YlwV4F74A3JMWxEhX
	Zfz+b2npIEzkcwJthwrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quyHv-007sbR-32;
	Mon, 23 Oct 2023 17:00:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyHt-007sb4-0b
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 17:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4319625D9;
	Mon, 23 Oct 2023 17:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C51C433C7;
	Mon, 23 Oct 2023 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698080420;
	bh=g1G7yWysf4/vpcAzIOKI3rb5OX5zd6qjlbvDZhuGXes=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=nUG2xBJdy02m9wKb22uypTnntGmEen+0EJfuFCoOsj/4Acln1BlcNEIB/1UxxJIDg
	 PX9LJ2sBxbFexhQebotRRXHCTOegkIL/s+/tsD2jer3WwBA0ZEoAJpp5z8/cGOMPgK
	 1KLgWe5gqKwBr4zNqPjYKzONmgTlJGc7+J/Pd+Dg3QO1rsQEpirlR4lMQNfb09Z94t
	 zlXZJltllVB02/W5Bio2LXmxyKS0y0BtcOrbNNiQVN5p0IWczY0z+PlwAia2BrzIwn
	 qQVmcBS0x3pUBugC9is8ZTorbMjsSlBdTXPC6mHw1iXtFPt2o5xn1TclSvBvOvMUK2
	 kD66lhz5Ee1Kw==
Date: Tue, 24 Oct 2023 00:48:07 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] riscv: dts: thead: convert isa detection to new
 properties
Message-ID: <ZTajxzpNbPF9WS0X@xhacker>
References: <20231022154135.3746-1-jszhang@kernel.org>
 <20231023-factor-unashamed-2fd76c2ad02b@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023-factor-unashamed-2fd76c2ad02b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_100021_267031_D632A767 
X-CRM114-Status: GOOD (  12.50  )
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

On Mon, Oct 23, 2023 at 09:27:07AM +0100, Conor Dooley wrote:
> On Sun, Oct 22, 2023 at 11:41:35PM +0800, Jisheng Zhang wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Convert the th1520 devicetrees to use the new properties
> > "riscv,isa-base" & "riscv,isa-extensions".
> > For compatibility with other projects, "riscv,isa" remains.
> > 
> > Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> > Acked-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > 
> > Hi Arnd,
> > 
> > This is the only one thead patch for v6.7, could you please apply it
> > directly?
> 
> FYI, this is missing your signoff, since you are resending my patch.
> 

Hi Conor,

Today I noticed that Arnd has tagged for-next for 6.7, so I guess I
missed the 6.7 PR, sorry. And I also noticed that Arnd has queued the
thead dma-noncoherent patch for 6.7(which is expected in rc7 :) because
I didn't explictly mark the target. I will take care this kind of
PR/directly_merge target in future.

I expected a large dt and driver changes in the comming development window,
for example, usb/eth/emmc and so on, so I'll queue your patch into my
for-next tree once linux6.7-rc1 is released.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
