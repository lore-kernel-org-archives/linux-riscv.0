Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C897FC07548
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 10:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iK3SgJPpGaITgXHnpHqysrL6SiK3HSvneQMlCoNWVfg=; b=TGEeVKVTT4IyKs
	t5mHWzH5kbY1XkJODhLWP7kf+L+3yexudo+hk5x/qTDdWi5BcOiGp2EYtO7qhuVuJPHR5lM6WBUoX
	38UXHDr/NCtCIMPYAU/LxbZAWTKbBzq62JHJ2OBqzKfgYVQfmqsz+y4PxDX3XsdqIkITSqqAMfFqT
	ZxBfEGcsF2QaCfphfufanKoWbrsur9xDcdIXK72iurvEKXtlfOiTIMrkVL6WXQ8XnH1siknuLEsZJ
	A9PNq8cMyCf1AMYAQe1ZgOJVNsrMD3Pz2LN1EoHgD5kNFu8HhhDIrwYm/vBAMrhpmEZeREKhwgSQA
	FxdqelWgW0L96xkyFJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3CuL-000Qeu-09;
	Wed, 15 Nov 2023 10:14:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3CuG-000QUa-2h;
	Wed, 15 Nov 2023 10:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=J+m5Wux4gCeZ5VbKE22zSD3h2vqCToIPoOglMpcMB98=; b=WMk7AaLVtN5GRy7VHSplvABKOr
	OXRc47CE5LjYfVL1I4G9BmL9nkSst8Vh0ERKHmS8MJxRSPLKDFvaYbEeA1sMiDIYtcRhNQa/pnlI8
	PkqOB9knMX2YL+uvuraKATTscnDpMYKl3cLLR36pzK4yKmNHGHEjAw7PZ395B53vvUhyuWvtelDyB
	r5XhCGNIJB9iBgYQiuOIDQBOPCIGnr+az2tu1OpmA6+1stGbOEb7mZfrcCgopQw9ZYDmB/DHKIyAH
	MGihds8I0ekCwC2YQuqoXNHvkOJ31Wt+yTJ713pnOPmQLGMyMGfLqHWpB6tvMEThA4WWseIPd1uBc
	ry+LnBrA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56952)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r3Crx-0000WK-1q;
	Wed, 15 Nov 2023 10:11:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r3Crw-0006Uz-QI; Wed, 15 Nov 2023 10:11:36 +0000
Date: Wed, 15 Nov 2023 10:11:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gavin Shan <gshan@redhat.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH RFC 11/22] drivers: base: remove unnecessary call to
 register_cpu_under_node()
Message-ID: <ZVSZWK+OmZWEce33@shell.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLa-00CTxY-Uv@rmk-PC.armlinux.org.uk>
 <955f2b95-76e4-4e68-830b-e6dd9f122dc1@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <955f2b95-76e4-4e68-830b-e6dd9f122dc1@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_021400_897461_87C6921B 
X-CRM114-Status: GOOD (  21.67  )
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

On Mon, Nov 13, 2023 at 02:04:32PM +1000, Gavin Shan wrote:
> On 11/7/23 20:30, Russell King (Oracle) wrote:
> > Since "drivers: base: Move cpu_dev_init() after node_dev_init()", we
> > can remove some redundant code.
> > 
> > node_dev_init() will walk through the nodes calling register_one_node()
> > on each. This will trickle down to __register_one_node() which walks
> > all present CPUs, calling register_cpu_under_node() on each.
> > 
> > register_cpu_under_node() will call get_cpu_device(cpu) for each, which
> > will return NULL until the CPU is registered using register_cpu(). This
> > now happens _after_ node_dev_init().
> > 
> > Therefore, calling register_cpu_under_node() from __register_one_node()
> > becomes a no-op, and can be removed.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >   drivers/base/node.c | 7 -------
> >   1 file changed, 7 deletions(-)
> > 
> 
> __register_one_node() can be called in memory hot add path either. In that path,
> a new NUMA node can be presented and becomes online. Does this become a problem
> after the logic of associating CPU with newly added NUMA node?

I guess this is where ordering matters.

As mentioned in the commit message, register_cpu_under_node() does
this:

        if (!node_online(nid))
                return 0;

        obj = get_cpu_device(cpu);
        if (!obj)
                return 0;

get_cpu_device() will return NULL if the CPU is not possible or is out
of range, or register_cpu() has not yet been called for this CPU, and
register_cpu() will call register_cpu_under_node().

I guess it is possible for a CPU it be present, but the node its
associated with would not be online, which means we end up with
register_cpu_under_node() returning on !node_online(nid) but we've
populated the CPU devices (thus get_cpu_device(cpu) would return
non-NULL).

Then when the numa node comes online, we do still need to call this
path, so this change is incorrect.

It came about trying to address Jonathan's comment for this patch:

https://lore.kernel.org/r/20230913163823.7880-7-james.morse@arm.com

I think my response to Jonathan is still correct - but didn't need
a code change. I'm dropping this patch.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
