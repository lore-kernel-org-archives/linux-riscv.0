Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16360C07E97
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 13:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7O0aaEsyhsfJlMyhps+Wr1GYmJ7JoAqEZMBXW3hB2s=; b=Xt5rcTTL9FzeqO
	P0tGOnYHk0ro9mU+SlNFwq3AfyWBJH3wwtBrwqya33htGxt9BcH7X5BNVE2t38Kyh9MxGNwjeNbmp
	Y0ruJYfWcxKthDwUZxRGWuIssdBQMXJhffTZZg3BSgMhZBXI8QGDwUWX1dcKT2p40UibiVlCaxSjz
	8XgWtP6oOrbtTtzjdBN5rStl66yN8RZF0SagXCexERkUzsivn2Pt5+BVuggI7SvfckqXF+OfweEqJ
	CVHRESYuc1Zi4+V+D2boYFlllESMRQ+DTAr7Z0ZLOw6jj6vhD0cMFTtGwlhObi/3zksgCfe4+m/uC
	k8gdzoQl/1lIU+vUuZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7yZ7-005QP1-2L;
	Tue, 28 Nov 2023 13:55:53 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7yZ4-005QMi-0X;
	Tue, 28 Nov 2023 13:55:52 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SfkVd4WZ8z6JB96;
	Tue, 28 Nov 2023 21:55:21 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 774E61400C9;
	Tue, 28 Nov 2023 21:55:38 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 28 Nov
 2023 13:55:37 +0000
Date: Tue, 28 Nov 2023 13:55:36 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Gavin Shan <gshan@redhat.com>, <linux-pm@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <x86@kernel.org>, <linux-csky@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-ia64@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>, <jianyong.wu@arm.com>,
	<justin.he@arm.com>, James Morse <james.morse@arm.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH RFC 10/22] drivers: base: Move cpu_dev_init() after
 node_dev_init()
Message-ID: <20231128135536.00002ab9@Huawei.com>
In-Reply-To: <ZVywLPwhILp083Jk@shell.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
	<E1r0JLV-00CTxS-QB@rmk-PC.armlinux.org.uk>
	<095c2d24-735b-4ce2-ba2e-9ec2164f2237@redhat.com>
	<ZVHXk9JG7gUjtERt@shell.armlinux.org.uk>
	<ZVywLPwhILp083Jk@shell.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_055550_488256_0F1EF2DD 
X-CRM114-Status: GOOD (  20.89  )
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

On Tue, 21 Nov 2023 13:27:08 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Mon, Nov 13, 2023 at 08:00:19AM +0000, Russell King (Oracle) wrote:
> > On Mon, Nov 13, 2023 at 10:58:46AM +1000, Gavin Shan wrote:  
> > > 
> > > 
> > > On 11/7/23 20:30, Russell King (Oracle) wrote:  
> > > > From: James Morse <james.morse@arm.com>
> > > > 
> > > > NUMA systems require the node descriptions to be ready before CPUs are
> > > > registered. This is so that the node symlinks can be created in sysfs.
> > > > 
> > > > Currently no NUMA platform uses GENERIC_CPU_DEVICES, meaning that CPUs
> > > > are registered by arch code, instead of cpu_dev_init().
> > > > 
> > > > Move cpu_dev_init() after node_dev_init() so that NUMA architectures
> > > > can use GENERIC_CPU_DEVICES.
> > > > 
> > > > Signed-off-by: James Morse <james.morse@arm.com>
> > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > > ---
> > > > Note: Jonathan's comment still needs addressing - see
> > > >    https://lore.kernel.org/r/20230914121612.00006ac7@Huawei.com
> > > > ---
> > > >   drivers/base/init.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >   
> > > 
> > > With Jonathan's comments addressed:  
> > 
> > That needs James' input, which is why I made the note on the patch.  
> 
> I'm going to be posting the series without RFC soon, and it will be
> with Jonathan's comment unaddressed - because as I've said several
> times it needs James' input and we have sadly not yet received that.
> 
> Short of waiting until James can respond, I don't think there are
> any other alternatives.

In the interests of expediency I'm fine with that.  (To be honest I'd
forgotten I even made that comment ;)

Jonathan

> 
> I do hope we can get this queued up for v6.8 though.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
