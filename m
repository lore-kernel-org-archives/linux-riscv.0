Return-Path: <SRS0=cAep=XA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145F9C3A5A9
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2019 02:30:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC782206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2019 02:30:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QU2Z+qTf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC782206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-sky.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrrqpgO/W+O1ls9urwInQXOo4EVXm5xe2Q0KsNsUuks=; b=QU2Z+qTfLhiwPz
	UAE1NKIPf8pP88XUvX84Owu5Tclo3729JNsv7D4vRzz/Tcl6peKfnrbP0cIEwyFdCkgWm3abUs9CY
	PDeH1D92pvdba9PXeIy2TCM4ajcRgFGLsDHDf/4Xy1Z48Ufl6W7N/XvTty/yu0OiSToXdmPtxmcTB
	r+c65zZQenTAoX/L9bUF2W+v4hnwbIHTbjA5DwzA5HB+7V/t0bhDuIX/U8ehiKCIZsdSW3Ilu3Alz
	LE2VXjXICCcK8+ERHT7nbSFaj1zR/dygBZYO9tX0nkEWtOap2ZsKbSnS5uG9Rhk2Sc6wZfnPZZp1T
	MK33wF0HFDaPCJlBk/jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5hXL-0000a6-Q0; Thu, 05 Sep 2019 02:30:15 +0000
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5hXI-0008RD-II
 for linux-riscv@lists.infradead.org; Thu, 05 Sep 2019 02:30:14 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07812042|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.0543389-0.00436749-0.941294; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03312; MF=han_mao@c-sky.com; NM=1; PH=DS; RN=4; RT=4; SR=0;
 TI=SMTPD_---.FOxzzyz_1567650603; 
Received: from localhost(mailfrom:han_mao@c-sky.com
 fp:SMTPD_---.FOxzzyz_1567650603)
 by smtp.aliyun-inc.com(10.147.42.197);
 Thu, 05 Sep 2019 10:30:03 +0800
Date: Thu, 5 Sep 2019 10:30:02 +0800
From: Mao Han <han_mao@c-sky.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH V6 1/3] riscv: Add perf callchain support
Message-ID: <20190905023002.GA3949@vmh-VirtualBox>
References: <cover.1567060834.git.han_mao@c-sky.com>
 <86d18d80affc39cf9579a24f1beb7c8631cfa9bd.1567060834.git.han_mao@c-sky.com>
 <alpine.DEB.2.21.9999.1909041247560.13502@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1909041247560.13502@viisi.sifive.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190904_193012_787287_55A328B3 
X-CRM114-Status: GOOD (  10.82  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 04, 2019 at 12:54:41PM -0700, Paul Walmsley wrote:
> Hello Mao Han,
> 
> On Thu, 29 Aug 2019, Mao Han wrote:
> 
> > This patch add support for perf callchain sampling on riscv platform.
> > The return address of leaf function is retrieved from pt_regs as
> > it is not saved in the outmost frame.
> > 
> > Signed-off-by: Mao Han <han_mao@c-sky.com>
> > Cc: Paul Walmsley <paul.walmsley@sifive.com>
> > Cc: Greentime Hu <green.hu@gmail.com>
> > Cc: Palmer Dabbelt <palmer@sifive.com>
> > Cc: linux-riscv <linux-riscv@lists.infradead.org>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Guo Ren <guoren@kernel.org>
> 
> There are some 'checkpatch.pl --strict' warnings with this patch (below).  
> These have been fixed here.  The following patch has been queued for 
> v5.4-rc1 with Greentime's Tested-by:.  Thanks for your hard work following 
> up on the feedback with these patches -
Thanks for the fixes. I'll check patches with --strict next time.

Thanks,
Mao Han

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
