Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136F7C47082
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 06:51:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7C6C611ED
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 06:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7C6C611ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1iwJIyNInEerkvqfzp3YoU16pJynSDwGa0a96UVGBAw=; b=fe+WkP/aXYfGis
	C3BwuI5w0Fm59zRZL4hJopnnex8aOqn4n1uO5y5WJ82xnKP6ej+1e4Pan8SHTuYHHr+vKTuu4V34G
	pw1OqL4bLagBkp4FD8++53xVKuDXhZl7gxC6Zyi+68czVWqMYeKi487JtpL+gvsHdQL9e/3cvLNmi
	Z9bCtzOdX9gl7YZquSPNgk6v1DH/Tcac3TiccP5h5bRrpX8y9zfI9BoJnnfDW5pICWmHu82kdLwKQ
	HDlWRdsLthIq/WL44pBpWtFDPju+JozVDoBcFRNsDCA3fDWfkykPCePVNWNIBhTBadxElqqZMiCXh
	vcxxGzC1Yx0J5NofMd5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq96P-001ofA-ME; Mon, 07 Jun 2021 06:51:13 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq96N-001oe4-45
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 06:51:12 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2A62B67373; Mon,  7 Jun 2021 08:51:09 +0200 (CEST)
Date: Mon, 7 Jun 2021 08:51:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Nick Kossifidis <mick@ics.forth.gr>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com,
 Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Benjamin Koch <snowball@c3pb.de>,
 Matteo Croce <mcroce@linux.microsoft.com>, Wei Fu <tekkamanninja@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210607065108.GA24872@lst.de>
References: <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
 <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
 <CAJF2gTTpSbNWS4VLHAu4XsV5-Vos=6R9MmPOx8-yzMFJu=wX4A@mail.gmail.com>
 <a8f2e68dcc1a6eb1ff3b95fcb8d0d0d2@mailhost.ics.forth.gr>
 <CAJF2gTQuQ5bE6HeGSoNaDynA0o3+KEo4snwft42YGzE=+DjKOQ@mail.gmail.com>
 <20210607062701.GB24060@lst.de>
 <CAJF2gTRZuER5YbTD=0xWLU0Np6eD8L_z3rZH0i_WXgENUD3nbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRZuER5YbTD=0xWLU0Np6eD8L_z3rZH0i_WXgENUD3nbQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_235111_344052_3B4795D3 
X-CRM114-Status: GOOD (  12.29  )
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

On Mon, Jun 07, 2021 at 02:41:14PM +0800, Guo Ren wrote:
> Double/Triple the size of physical memory regions can't be accepted by
> SOC vendors, because it wastes HW resources.
> Some cost-down soc interconnects only have 32bit~34bit width of
> physical address, are you sure you could force them to expand it? (I
> can't)
> 
> > or somewhat dynamic.
> How can HW implement with dynamic modifying PMA? What's the granularity?

I'm just stating the requirements from the Linux DMA perspective.  You
also do not need tripple the address space, just double.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
