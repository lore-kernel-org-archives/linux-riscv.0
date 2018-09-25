Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07149C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 17:32:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A43C720842
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 17:32:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qSTGJcut"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A43C720842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ipZzTOdbAdZHo5lz/ded5/cBp5wX68vglEWzJLvk2U=; b=qSTGJcutYah6SF
	/dOndmuDIvjHBQChXrrp1S3xkq8ANodlsEE8Wf+/Nh5znb3ni/16NEaxBw9wfv1JHDO6BLIzf6skZ
	kppnwCByCVND2hFwSxFt5Az9suAQ2Zz3RXDRe6iIRapSM3tipGVV+UVCpw/jvABmPGyIBuKmTl9yr
	LONLQnNKw6G2p8+jHd2/O53AttANG2D1QIMB1IbprfBy79C4LWrtsHPaCVSxIcwRkhpAftldXJ/Il
	t3De+mYHmTZniP/G1sz0zc16qXbvJQB/N+FjEXkjuT/g2CAB2LDZunPXt+SaScREfN1g/YT/Xb+F9
	ZE3I/UCFQ7cA6L9JEumw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4rCY-0005sK-Il; Tue, 25 Sep 2018 17:32:46 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1g4rC0-0005lV-Ra; Tue, 25 Sep 2018 17:32:12 +0000
Date: Tue, 25 Sep 2018 10:32:12 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [GIT PULL] A Single RISC-V Update for 4.19-rc6
Message-ID: <20180925173212.GA21414@infradead.org>
References: <20180925161538.GA5328@infradead.org>
 <mhng-3ad7c756-ed90-4cfd-b178-cd09e021a758@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-3ad7c756-ed90-4cfd-b178-cd09e021a758@palmer-si-x1c4>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925173212.xWAgHcnaQ6GspVPCwnCMmckth_HTpZ66Gt9RwD6-oP8@z>

On Tue, Sep 25, 2018 at 09:26:51AM -0700, Palmer Dabbelt wrote:
> On Tue, 25 Sep 2018 09:15:38 PDT (-0700), Christoph Hellwig wrote:
> > I think this fix isn't quite right actually - we don't need asm-generic
> > asm-prototypes.h, as said in the review of this patch.
> > 
> > Also on it's own it isn't going to help with doing a modversions enabled
> > build, as the return_to_handler export needs to be dropped.
> 
> Ah, sorry -- my understanding was that while this wasn't the cleanest fix,
> it would at least enable the Debian people to work around their issue.  If
> that's not the case then I'll just drop this PR, but I'd really like to
> enable the Debian people to ship kernel images and that's a big step.
> 
> Did I misunderstand what's going on here?  I tried to build it according to
> the patch's instructions and don't remember seeing the warnings, but I might
> just be wrong here...

You'll only see the warning when you actually install the modules
if I remember correctly.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
