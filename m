Return-Path: <SRS0=AGdw=U6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB698C0650E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2019 16:07:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F8F421473
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2019 16:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TeWY5ujl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WIoPLVVT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F8F421473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GKExDUZtNkjJCFLMYcoBnM2ihULbbDfAc+G8jhGcuW4=; b=TeWY5ujlcsP+1f
	Ex3TRpTUv7jlAxC5H367esGAeBrHUhgz2nB4rswViKT5xb/zrN/atc1hKzR2Jb2xxkkwHS8/wpJuI
	xNJWKyGEU266m1JYPQ5Y3w9YJuMURb2peQfNH3xhfOkwEz7c4gDon0NH9ObO2xdFqsB+1//Uvu0k+
	4n26vLEvMm0RwR77S4xOcofuYMUo/7uMikhr/8vwl6HDr3L6NoCgFBwJNPABGxzVGa7PaRQdCm1D+
	yJ++WTzZUz2fbLIU0D4jXRmfaPowgrE5rCqoUljG+Lo6XmUxMsB8klwLC7aLiTHNy+eSt+7fGd+fZ
	Jr0lnHANBt/3saELt0/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhypQ-0003vH-Pf; Mon, 01 Jul 2019 16:06:52 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhypN-0003uU-Jz
 for linux-riscv@lists.infradead.org; Mon, 01 Jul 2019 16:06:51 +0000
Received: by mail-io1-xd44.google.com with SMTP id n5so30013216ioc.7
 for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2019 09:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=InMcyXa5sXJAd1Yjv5DDfuzVwc5hmtVlJVQ+GIywkco=;
 b=WIoPLVVTn8rSwrT7ABjLNYG0wnLKvjvHo/dgBVVxfPuv4EIDyAoUU4BrI/z8rbNtT0
 1O/xrCDhePoSl25Bh596TdgHrewYOtV0sM+w40g2+/HSGL1jnwyOhHBf53s+EhRXSntm
 zx45xkUd6WYP4VH+pHG9Dir4+Np7m0pZ3zkA7Ijt5/8LT4dQDBCaaU1oiEiE9sY1vJz6
 lyD/aMqrltDZztxu++zv6qBse7xclDClJznxjBs29GzmeDJ5rMwk9u/cFjASR0ERP4j2
 bC3Lo/DSmP2hKf+FFVwYjsGudzNzPlOcdHWOF9C6w6sx+n+S7AFqDv8dveTz78H8MmX1
 7Qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=InMcyXa5sXJAd1Yjv5DDfuzVwc5hmtVlJVQ+GIywkco=;
 b=sWfUsSPxreQEKlX+9PiU/Zt32HF+QGl2PmGGARjbwN48o9tq8D4OThgzVDa6Ab4MeE
 2g9BrvBtdvV1h3R+aEU7eUI4K2wBlKsz169nq5hcK4gwkJbfiqoTkgqa4pWVE+HTx9pl
 Vb7uTLbn17ZxOjXWMdXXMVsgMmsND6DlqlAcZL9MzhGxQ5urXYOc38EmpDxDiawRmYi5
 r00MbGsSVSb34X80DquH6eBLcvN1Qzm+NVymMwAzO3CqIUABBd5fNbLBkyuuUMmefria
 tkxZ1GvuTzlwEILOEvxQLFMPtg5gxHm8UKVeDrAUlkxUmmaacXMpHLouVNFcWsfnWkm8
 RNnw==
X-Gm-Message-State: APjAAAXoaPvKxu82mU/cYkMTTgLA7QwJEA81UUiXknH49ANYlkqM0N9d
 cAVZf7Rafg8H0nKZkGuZgZV8Gw==
X-Google-Smtp-Source: APXvYqxL4h8vZQ2+vG0HtnQ8dyFs6puOwncIF/3RmDP3OfBIMby5YcRiUgft36tp862ZyI0igX9kng==
X-Received: by 2002:a02:a38d:: with SMTP id y13mr13211858jak.68.1561997205559; 
 Mon, 01 Jul 2019 09:06:45 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 o7sm10000521ioo.81.2019.07.01.09.06.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 09:06:45 -0700 (PDT)
Date: Mon, 1 Jul 2019 09:06:44 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: RISC-V nommu support v2
In-Reply-To: <20190701065654.GA21117@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1907010904320.3867@viisi.sifive.com>
References: <20190624054311.30256-1-hch@lst.de> <20190701065654.GA21117@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_090649_700010_8B212799 
X-CRM114-Status: GOOD (  17.34  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mm@kvack.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Christoph,

Probably best to feed the mm patches to Andrew.  For the RISC-V patches, 
am running a bit behind this merge window.  Combined with the end of the 
week holidays in the US, I doubt I'll make it to to the nommu series for 
v5.3.


- Paul

On Mon, 1 Jul 2019, Christoph Hellwig wrote:

> Palmer, Paul,
> 
> any comments?  Let me know if you think it is too late for 5.3
> for the full series, then I can at least feed the mm bits to
> Andrew.
> 
> On Mon, Jun 24, 2019 at 07:42:54AM +0200, Christoph Hellwig wrote:
> > Hi all,
> > 
> > below is a series to support nommu mode on RISC-V.  For now this series
> > just works under qemu with the qemu-virt platform, but Damien has also
> > been able to get kernel based on this tree with additional driver hacks
> > to work on the Kendryte KD210, but that will take a while to cleanup
> > an upstream.
> > 
> > To be useful this series also require the RISC-V binfmt_flat support,
> > which I've sent out separately.
> > 
> > A branch that includes this series and the binfmt_flat support is
> > available here:
> > 
> >     git://git.infradead.org/users/hch/riscv.git riscv-nommu.2
> > 
> > Gitweb:
> > 
> >     http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-nommu.2
> > 
> > I've also pushed out a builtroot branch that can build a RISC-V nommu
> > root filesystem here:
> > 
> >    git://git.infradead.org/users/hch/buildroot.git riscv-nommu.2
> > 
> > Gitweb:
> > 
> >    http://git.infradead.org/users/hch/buildroot.git/shortlog/refs/heads/riscv-nommu.2
> > 
> > Changes since v1:
> >  - fixes so that a kernel with this series still work on builds with an
> >    IOMMU
> >  - small clint cleanups
> >  - the binfmt_flat base and buildroot now don't put arguments on the stack
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> ---end quoted text---
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
