Return-Path: <SRS0=tgI3=Q5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2B2C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 05:37:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9E83207E0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 05:37:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="StI1PUHJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9E83207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZ3nh6nUiL7hkxJikJILo1o9mjEMODYjdjoJENcC9j0=; b=StI1PUHJW/NMJP
	La9IPyCQTPjQWZADVQ+kf6sET5trDOULjcaTlGkuCkLvInsBDsxHeaRSnIDRFgaTnXtULlbkx0Yqv
	NWZWQ5IabMMyLf4wl00tC3rIKtzLoWHZAYP6/xPid4IsdYFNvTV9Qx7OlFJRhxtqqJjPMDKTK+Dxk
	SeumBTtXSN79s1MrLWjyvvLlJgFj+1K1n7NDYOfOIuP+8NpyrmXJyh522ER7FJZB/IvH4Sw7u+vC5
	9tXwz5ICx3/xaf3oEvyAdjSvl4s+3G4ID2PcULW4/e8iCNJgq3eyMLDnN4Vb0O0vMxkyuIgcN2/zI
	2tshpqep4QL5NCgTFclw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gx3Wz-0004MH-6a; Fri, 22 Feb 2019 05:37:53 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gx3Ww-0004LM-6s
 for linux-riscv@lists.infradead.org; Fri, 22 Feb 2019 05:37:51 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 845233097076;
 Fri, 22 Feb 2019 05:37:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-228.ams2.redhat.com
 [10.36.116.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16A5F600C2;
 Fri, 22 Feb 2019 05:37:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 160E211AAB; Fri, 22 Feb 2019 06:37:47 +0100 (CET)
Date: Fri, 22 Feb 2019 06:37:47 +0100
From: "kraxel@redhat.com" <kraxel@redhat.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH] drm/bochs: Fix the ID mismatch error
Message-ID: <20190222053747.rhed6j6nyi6tmg4l@sirius.home.kraxel.org>
References: <20190221003231.31625-1-alistair.francis@wdc.com>
 <20190221115227.ipwjpn3xm4q7jfg2@sirius.home.kraxel.org>
 <CAKmqyKM_pb-riJ+jO65eT0SsVDxrstPOgurPuDf92Fd4C8k1Ug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKmqyKM_pb-riJ+jO65eT0SsVDxrstPOgurPuDf92Fd4C8k1Ug@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 22 Feb 2019 05:37:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_213750_272864_6E1AC54D 
X-CRM114-Status: GOOD (  17.03  )
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
Cc: "david.abdurachmanov@gmail.com" <david.abdurachmanov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 21, 2019 at 10:44:06AM -0800, Alistair Francis wrote:
> On Thu, Feb 21, 2019 at 3:52 AM kraxel@redhat.com <kraxel@redhat.com> wrote:
> >
> > On Thu, Feb 21, 2019 at 12:33:03AM +0000, Alistair Francis wrote:
> > > When running RISC-V QEMU with the Bochs device attached via PCIe the
> > > probe of the Bochs device fails with:
> > >     [drm:bochs_hw_init] *ERROR* ID mismatch
> > >
> > > This was introduced by this commit:
> > >     7780eb9ce8 bochs: convert to drm_dev_register
> > >
> > > To fix the error we ensure that pci_enable_device() is called before
> > > bochs_load().
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > Reported-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> >
> > Pushed to drm-misc-fixes.
> 
> Thanks. Any chance this will make it into 5.0?

Hmm, we are damn close to the release, not sure there will be one more
drm-fixes pull req.  But I've added a proper Fixes: tag, so even if the
patch misses the boat it should land in the stable branches shortly
thereafter.

cheers,
  Gerd


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
