Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8C6C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 20:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5njTnY7ez/9TRSauVvMguRsVYHvQemKaNK3XHBtPdds=; b=kC2aBboG186dJF
	K116vX0RyYcWp5aeI+PMVMtO7xuekBk8ekbFJVedASmhU0QeVt8v/mteSOVFat9UkU5dqCeYNbPK1
	2sCKNk0BroFVHQaf9ml/ESiUbTWvv77vsWc53u/EETX5g2geHDF16jEjdjrob8X+d5w6ScGo7Jrz2
	1nkrzKP3r1kwYlMG3sWgukuCGpbzBw2pYcxMh7ATGpPsVNHDA+ssRYHKDRPbb4nUwF7ToElTEXMHj
	1kesBUt4KAFQbTy4lWBQ7eWkWip+9JnZSQmeuIdGIHcCi8NuO+1cOGGSyFXAdRf2/jaO3YfzvSPiX
	D7JdzzgEzWJacN5GZV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDPj-0000000Bp1c-17EY;
	Fri, 26 Jun 2026 20:44:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDPh-0000000Bp1T-1s6p
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 20:44:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C543640A88;
	Fri, 26 Jun 2026 20:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999F71F000E9;
	Fri, 26 Jun 2026 20:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782506676;
	bh=KKDpAYSwCxTkkEV2iput+GAGuaTs3Cf4nSmImXaZJcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KPPTXCiNb8D7IAXv83KLmtrbAKbHpCdjaN3PnanTIGcpte2CIHtW6YpncSKPlxC37
	 lpmsYeyKt1m4TiSq7gmHV8wNDElq2uyPJ/OPVfBEbg5QidtqShlkxX9uHWruFMk2ui
	 kI05SgNGZ9xOLQTXbz92dcKsA5Rq/S5MLoqnJ1bJVXQgPwQ1Mmcxuf/qqMB3l4tI+e
	 xvoMSrmr5Bs7F+eCpySs9q3fwQ3Nbt53SZ/ryzXpWE5mnEniegxB+Xn1FOWYVT+fxL
	 8ofU/bBadtf8ROI6aTsROsCCZPIm0FEfhU16yNpxJW+w5BE2OtW7Xx28f30JpktI+H
	 K1ejmJdzXe0qQ==
Date: Fri, 26 Jun 2026 13:44:35 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 5/8] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <aj7ks1ijsRTBWyHZ@thelio>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
 <20260624-dfustini-atl-sc-cbqri-dt-v2-5-2f8049fd902b@kernel.org>
 <20260625015355.B997D1F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260625015355.B997D1F000E9@smtp.kernel.org>
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

On Thu, Jun 25, 2026 at 01:53:55AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Traversing the global `cbqri_controllers` list without holding `cbqri_controllers_lock` during CPU hotplug risks list corruption.
> --
> 
> commit e1c49060a1fc98c61e36689ccda2041d360bb762
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv_cbqri: resctrl: Add cache allocation via capacity block mask
> 
> This commit wires up the CBQRI capacity controllers into resctrl as
> RDT_RESOURCE_L2 and RDT_RESOURCE_L3 schemata. It treats mismatched
> capabilities at the same cache level as a fatal error and lazily creates
> domains in the cpuhp online callback.
> 
> > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resctrl.c
> > new file mode 100644
> > index 0000000000000..2f31baff032b6
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_resctrl.c
> [ ... ]
> > +static int cbqri_attach_cpu_to_all_ctrls(unsigned int cpu)
> > +{
> > +	struct cbqri_controller *ctrl;
> > +	int err = 0;
> > +
> > +	lockdep_assert_held(&cbqri_domain_list_lock);
> > +
> > +	list_for_each_entry(ctrl, &cbqri_controllers, list) {
> 
> [Severity: High]
> Is it safe to iterate the global cbqri_controllers list without holding
> cbqri_controllers_lock?
> 
> If a capacity controller is dynamically added at runtime (e.g., via a device
> tree overlay instantiating the platform device), its probe function can acquire
> cbqri_controllers_lock and mutate the cbqri_controllers list.
> 
> Concurrently, if a CPU is hotplugged, the cpuhp online callback calls
> cbqri_resctrl_online_cpu() which invokes this function. Traversing the list
> here while holding only cbqri_domain_list_lock could lead to list corruption,
> resulting in an infinite loop or NULL pointer dereference.

I will update cbqri_attach_cpu_to_all_ctrls() to take the
cbqri_controllers_lock before iterating through the cbqri_controllers
list.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
