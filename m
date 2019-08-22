Return-Path: <SRS0=8Mks=WS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF19C3A59D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 09:26:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 811BB233A0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 09:26:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZeS7Z/kk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 811BB233A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAv5PRbMjJ5Qwt8kSmG/LkawEcMXmw7m2P41FMXbg34=; b=ZeS7Z/kkVFlaQ9
	qS6Ez0s6jEgSkUY9VmBnGTcYt/dXumkDpqJTIEWVFW16Dw8uXNhHApiLdxgqszfvbLCdgwD4JNYin
	v7QNMWU+RlnGchtTE3sKffiqtQIa09HAFvn6WYJynjPtGW/r601NrIqI+38x59IKRvV+Uokf/uDyM
	EGZ6ckul3/LsL5nGekhk2fctfy4IBEvX/UFseT6werbPepCbVmxpbwPAPupEup/M6Wh2Z+wa46IGB
	DNRpfvxEBB2aq5GfS44weyyyRNJILQnW5HGYGiMimND4uuIfY1mF9g4hXjnpn0m7KFEDhM6679DaP
	/BPaw/3pK/7zIlKqQ3Tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0jMh-00039c-4s; Thu, 22 Aug 2019 09:26:43 +0000
Received: from [177.133.63.56] (helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i0jMf-00037g-FT; Thu, 22 Aug 2019 09:26:41 +0000
Date: Thu, 22 Aug 2019 06:26:35 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] riscv: move sifive_l2_cache.c to drivers/soc
Message-ID: <20190822062635.00f6e507@coco.lan>
In-Reply-To: <20190819062619.GA20211@lst.de>
References: <20190818082935.14869-1-hch@lst.de> <20190819060904.GA4841@zn.tnic>
 <20190819062619.GA20211@lst.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: palmer@sifive.com, linux-kernel@vger.kernel.org,
 Yash Shah <yash.shah@sifive.com>, Borislav Petkov <bp@alien8.de>,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Em Mon, 19 Aug 2019 08:26:19 +0200
Christoph Hellwig <hch@lst.de> escreveu:

> On Mon, Aug 19, 2019 at 08:09:04AM +0200, Borislav Petkov wrote:
> > On Sun, Aug 18, 2019 at 10:29:35AM +0200, Christoph Hellwig wrote:  
> > > The sifive_l2_cache.c is in no way related to RISC-V architecture
> > > memory management.  It is a little stub driver working around the fact
> > > that the EDAC maintainers prefer their drivers to be structured in a
> > > certain way  
> > 
> > That changed recently so I guess we can do the per-IP block driver after
> > all, if people would still prefer it.  
> 
> That would seem like the best idea.  But I don't really know this code
> well enough myself, and I really need to get this code out of the
> forced on RISC-V codebase as some SOCs I'm working with simply don't
> have the memory for it..
> 
> So unless someone signs up to do a per-IP block edac drivers instead
> very quickly I'd still like to see something like this go into 5.4
> for now.

I'm wandering if we should at least add an entry for this one at
MAINTAINERS, pointing it to the EDAC mailing list. Something like:

diff --git a/MAINTAINERS b/MAINTAINERS
index 7dfe381c8b43..1c3bc5aa3af0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5906,6 +5906,7 @@ M:	Yash Shah <yash.shah@sifive.com>
 L:	linux-edac@vger.kernel.org
 S:	Supported
 F:	drivers/edac/sifive_edac.c
+F:	drivers/soc/sifive/
 
 EDAC-SKYLAKE
 M:	Tony Luck <tony.luck@intel.com>


Thanks,
Mauro

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
