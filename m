Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB27C47074
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHz/79KO6PMUAu4nJhDCsElqEoklkeMvQRKKx2/6zHw=; b=cQie5EdFaVHc7x
	8fcmrFsm1NkuXimxLn3e1+tBfrFpXNlE6kq0xJeKVD0TkbVySCAX+OPLIqE45lgNSYX5Sk1THB/gc
	/TWfOij2PUsnsE6qog7wHJUDWJLlQLqeLSV6qnjQQ4OaE/P/fA4k2t2q7vOK1MxvFqzEpeSYD6sOE
	hNdmua6Dexz0RdNYJOZbKpyuOQ4EetRGTwVOKa7yaq+Dur8ZrvLWeFLAURA0MBB231yXtHqb99/Iq
	z1T9QeNyh5KfQoq7w8+r0LL7aED8ke0uYzdjZgqdLcoLUC7j7fysRN+Cjv30oorDDDyn8vuYjWiXJ
	8j2lIanfYaOfLPHSgT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKgYo-008MVF-0c;
	Tue, 02 Jan 2024 15:20:06 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKgYk-008MTA-0O;
	Tue, 02 Jan 2024 15:20:03 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4T4GhS49QKz6K622;
	Tue,  2 Jan 2024 23:18:32 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 434FD1400DB;
	Tue,  2 Jan 2024 23:19:56 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Jan
 2024 15:19:55 +0000
Date: Tue, 2 Jan 2024 15:19:53 +0000
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
Subject: Re: [PATCH RFC v3 21/21] cpumask: Add enabled cpumask for present
 CPUs that can be brought online
Message-ID: <20240102151953.00001949@Huawei.com>
In-Reply-To: <ZYA3lmPOwIOJq/iY@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOhX-00Dvlg-Ci@rmk-PC.armlinux.org.uk>
	<20231215171831.00004a19@Huawei.com>
	<ZYA3lmPOwIOJq/iY@shell.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_072002_319605_0ECA5251 
X-CRM114-Status: GOOD (  19.66  )
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

On Mon, 18 Dec 2023 12:14:14 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Fri, Dec 15, 2023 at 05:18:31PM +0000, Jonathan Cameron wrote:
> > On Wed, 13 Dec 2023 12:50:59 +0000
> > Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:
> >   
> > > From: James Morse <james.morse@arm.com>
> > > 
> > > The 'offline' file in sysfs shows all offline CPUs, including those
> > > that aren't present. User-space is expected to remove not-present CPUs
> > > from this list to learn which CPUs could be brought online.
> > > 
> > > CPUs can be present but not-enabled. These CPUs can't be brought online
> > > until the firmware policy changes, which comes with an ACPI notification
> > > that will register the CPUs.
> > > 
> > > With only the offline and present files, user-space is unable to
> > > determine which CPUs it can try to bring online. Add a new CPU mask
> > > that shows this based on all the registered CPUs.
> > > 
> > > Signed-off-by: James Morse <james.morse@arm.com>
> > > Tested-by: Miguel Luis <miguel.luis@oracle.com>
> > > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > > Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> > > ---  
> > 
> > Needs docs
> > Documentation/ABI/testing/sysfs-devices-system-cpu
> > seems to have the rest of the similar entries.  
> 
> Any ideas what I put in there as "Date" ? It seems to me that we have
> little idea when this might be merged.. I could use the date of the
> commit (Nov 2022).
> 

That's always a guess at best.  Hopefully whoever picks this up
fixes the date up or asks for a new version with it fixed just before
they do.

J

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
