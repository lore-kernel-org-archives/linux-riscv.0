Return-Path: <SRS0=83+V=KP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A29C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 05:48:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FF346108D
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 05:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FF346108D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BhwcJZW3ctCG/rxYF1klX8LwSu7MFOuV7nYgZrHj/uw=; b=HOiA1SK6+N+hsbTg/fzFj6ksT
	VxOPEIiTGZwGjni8mIH1xWcBXWsSksL8VthSdWiPbYDPPd1FbDodgdNnSNrcScNCWpY5bWdX9y3Wu
	xMKHR0F25307XF4VSWTYCxd5GYtO5M9ZgB63Ki59HxPX+Wm0ypRYc7zJYiuL35hf3xVg/bMDaUyC3
	IYe6pt6w5PYPaiC1wqIOhOsShq6qlyBuUt+Xe6ojvwTi/5K0f2RvpxbAozoytJmymZPTor8CZ715P
	Xlre0YrLoh7UCZAoCAe5B1aPKmxB8kFRU38TCN831VNQcb+f64GwoWfkpnYFZhMuSRcfgQxXPWquO
	sYQRu9h5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljbXp-005zLO-Kh; Thu, 20 May 2021 05:48:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljbXk-005zKB-6W
 for linux-riscv@desiato.infradead.org; Thu, 20 May 2021 05:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NgUuoO+Q2snRRHiK3sD2zltLISkXBFMEtIkBmpIVdw8=; b=qadPxAZKcQ7SHcxF5qBR+WzL8I
 S5HGTBkqdPrj/OcIv2ex7U6tHkFEWIr2NsPCB0oCEwoxjdY3o28TSC2YaEnQ/H9sFLiXvHmTYB0+d
 yquevP6Kg7jHrj89f40FHMGYbAjEaiSoBBNmeydf59OFGXGqboYt1eosp4/hoCoKV5rTv8BLyuiLh
 wINabAPGsGpwY1f+2fiex6xGicM9RXLaKKpc/yuRmfmk3KmNAeJ2XFEeMdjgrfnlKjCpzF8kuV4J8
 vZCzL/LS4jbSo105gEtS3dGV+8ec8ZgdML/FNI1IyE24AbyY1pd7P+3VVswQkEYlbXPNpxe7mz5jy
 eEO9lObw==;
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljbXh-00FxZ7-7i
 for linux-riscv@lists.infradead.org; Thu, 20 May 2021 05:48:22 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5452967373; Thu, 20 May 2021 07:48:16 +0200 (CEST)
Date: Thu, 20 May 2021 07:48:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com,
 lazyparser@gmail.com, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Benjamin Koch <snowball@c3pb.de>,
 Matteo Croce <mcroce@linux.microsoft.com>, Wei Fu <tekkamanninja@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210520054816.GA21693@lst.de>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_224821_445634_C8E28A3D 
X-CRM114-Status: GOOD (  12.40  )
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

On Thu, May 20, 2021 at 09:45:45AM +0800, Guo Ren wrote:
> It's a very big MIPS smell. What's the attribute of the uncached
> window? (uncached + strong-order/ uncached + weak, most vendors still
> use AXI interconnect, how to deal with a bufferable attribute?) In
> fact, customers' drivers use different ways to deal with DMA memory in
> non-coherent SOC. Most riscv SOC vendors are from ARM, so giving them
> the same way in DMA memory is a smart choice. So using PTE attributes
> is more suitable.

I'm not saying it is a good idea.  Just that apparently this exists in
the ASICs.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
