Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1D1C0032E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFyI2heHcf4LR+S4p/mSYrRhImJ8JMvWVX+oJ0YkzX8=; b=PktOtwHP5Ipcsm
	NcVMEPYTVByG/Ix2YNtmvCPAHyRfr6gFezvWPuBz4xnvcpWvYDThT0vMQlHNNcebpbDi3Qyr87Uk/
	38LowduSckx6F/fNqjJY9nzVMN+/r6DJqA+u7mxjaSNdKxVcMOYnTTyrxe6KBSI5VMaF97ujaiQ9x
	sVV/d19IF2iVPBnN6F5O8Zx/c6Si8UMlqoIac7SaAyf/aUxY3FSHeAyDldnXyAq+0Wy+pMkgtnCzt
	voL5LpK/t1zQYoZ8Rc89OFny7paTNyMER9DWmTKXo3qmN4/B6Y3ethcP+yYOTM66jxMPJpSstOTyS
	k/RPEWAI3g1px+sUv8EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtsZ1-002hss-1X;
	Fri, 20 Oct 2023 16:41:31 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtsYy-002hrj-1E;
	Fri, 20 Oct 2023 16:41:30 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SBr1Q0Hr4z6K6c6;
	Sat, 21 Oct 2023 00:40:42 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 20 Oct
 2023 17:41:16 +0100
Date: Fri, 20 Oct 2023 17:41:15 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: James Morse <james.morse@arm.com>, <linux-pm@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <x86@kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 13/35] ACPI: Rename
 acpi_scan_device_not_present() to be about enumeration
Message-ID: <20231020174115.0000045a@Huawei.com>
In-Reply-To: <ZTKkWozjprMYLjay@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-14-james.morse@arm.com>
	<ZTKkWozjprMYLjay@shell.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_094128_597462_897559A2 
X-CRM114-Status: GOOD (  14.36  )
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

On Fri, 20 Oct 2023 17:01:30 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Wed, Sep 13, 2023 at 04:38:01PM +0000, James Morse wrote:
> > acpi_scan_device_not_present() is called when a device in the
> > hierarchy is not available for enumeration. Historically enumeration
> > was only based on whether the device was present.
> > 
> > To add support for only enumerating devices that are both present
> > and enabled, this helper should be renamed. It was only ever about
> > enumeration, rename it acpi_scan_device_not_enumerated().
> > 
> > No change in behaviour is intended.
> > 
> > Signed-off-by: James Morse <james.morse@arm.com>  
> 
> Is this another patch which ought to be submitted without waiting
> for the rest of the series?
> 
> Thanks.
> 

Looks like a valid standalone change to me.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
