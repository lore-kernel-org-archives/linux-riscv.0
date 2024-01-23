Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CDEC47DDB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 10:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NdjEwp3ba9vuTh7eD0nVTtnFCyGZWolMJjPTjq8vAfE=; b=mXjJlBFvYzI1A7
	i5FuUrKjlfiriVo1XxfMhQ/T70tw0N9UXuF+KwveBB3qSq8BVK7cyRGIuLe84Nm78cC7wpXs6yDTw
	elR4dUBGgxCo61wnLnQbfn1fg98tFOBAQaQfx9/o9QyQTDtBltMjyp76JpOWkldxDMmFrwXfVEZ5b
	Hi1CmMVIxf934xlxHZD1xZSeGgYiRxfzFC7+FtcTcIx26eydYqeYzZTdOOBCXUQRh8E7KC6KBVstz
	M6MQ/ttguNDJD3/r+IQlOkHNcESuySoRuu27eVBxNOZgOMKS3zhdtjmRhF7z5cLBdAxAC467E/Iuj
	21ONEof+NQPdRDvijqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSE2H-00Fvzh-29;
	Tue, 23 Jan 2024 10:29:41 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSE2D-00FvxY-2r;
	Tue, 23 Jan 2024 10:29:39 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TK3Ct523Lz6K91D;
	Tue, 23 Jan 2024 18:26:34 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id B7F05140A90;
	Tue, 23 Jan 2024 18:29:29 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Jan
 2024 10:29:29 +0000
Date: Tue, 23 Jan 2024 10:29:28 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, <acpica-devel@lists.linuxfoundation.org>,
	<linux-csky@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-ia64@vger.kernel.org>, <linux-parisc@vger.kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>, James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 18/21] ACPI: processor: Only call
 arch_unregister_cpu() if HOTPLUG_CPU is selected
Message-ID: <20240123102928.0000270c@Huawei.com>
In-Reply-To: <ZYBB32fMWB6of7Jb@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOhH-00DvlO-UP@rmk-PC.armlinux.org.uk>
	<20231215165009.000035f2@Huawei.com>
	<ZYBB32fMWB6of7Jb@shell.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_022938_203503_8E7539C0 
X-CRM114-Status: GOOD (  26.21  )
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

On Mon, 18 Dec 2023 12:58:07 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Fri, Dec 15, 2023 at 04:50:09PM +0000, Jonathan Cameron wrote:
> > On Wed, 13 Dec 2023 12:50:43 +0000
> > Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:
> >   
> > > From: James Morse <james.morse@arm.com>
> > > 
> > > The kbuild robot points out that configurations without HOTPLUG_CPU
> > > selected can try to build acpi_processor_post_eject() without success
> > > as arch_unregister_cpu() is not defined.
> > > 
> > > Check this explicitly. This will be merged into:
> > > | ACPI: Add post_eject to struct acpi_scan_handler for cpu hotplug
> > > for any subsequent posting.
> > > 
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > > Signed-off-by: James Morse <james.morse@arm.com>
> > > Tested-by: Miguel Luis <miguel.luis@oracle.com>
> > > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > > Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> > > ---
> > > This should probably be squashed into an earlier patch.  
> > 
> > Agreed. If not
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> 
> I'm not convinced that "ACPI: Add post_eject to struct acpi_scan_handler
> for cpu hotplug" is the correct commit to squash this into.
> 
> As far as acpi_processor.c is concerned, This commit merely renames
> acpi_processor_remove() to be acpi_processor_post_eject(). The function
> references arch_unregister_cpu() before and after this change, and its
> build is dependent on CONFIG_ACPI_HOTPLUG_PRESENT_CPU being defined.
> 
> Commit "ACPI: convert acpi_processor_post_eject() to use IS_ENABLED()"
> removed the ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU surrounding
> acpi_processor_post_eject, and that symbol depends on
> CONFIG_HOTPLUG_CPU, so I think this commit is also fine.
> 
> Commit "ACPI: Check _STA present bit before making CPUs not present"
> rewrites the function - the original body gets called
> acpi_processor_make_not_present() and a new acpi_processor_post_eject()
> is created. At this point, it doesn't reference arch_unregister_cpu().
> 
> Commit "ACPI: add support to register CPUs based on the _STA enabled
> bit" adds a reference to arch_unregister_cpu() in this new
> acpi_processor_post_eject() - so I think this is the correct commit
> this change should be merged into.

That or where that change ends up given your earlier suggestion to
move that change as well.  I find it hard to care as long as
the bisection issue is squashed by the change.  If we make the code
drop out before the build issue is introduced that's fine because
we are arguing we shouldn't be running it anyway so such protection
is fine if not necessary for build fix purposes.

J

> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
