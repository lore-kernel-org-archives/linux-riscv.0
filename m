Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506B8606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R9iPatwO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PlEvOM2Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vVr+sbxiRpvQv0A0kigA/HbFCtPPr1413Ij5LUAwIXk=; b=R9iPatwOF/qWowpYG+d6timHTG
	JtFvN4DmiUabaVFS/JvveNtk6okk92yBmDm/MZGSYRLvY/ttvL3El8Tu08mcockqqI0f+f4ouludq
	CdM3V6NoXoPXjj//18GdlqTV5l8iLcfM5EFs7BEnNBOwt49Otw5rGbIN4kStJPlvjO/KvLwf+ypgs
	l2gcBhcDwoVa1TMdei8gL69H9NTtuaL96SmiiAI+BgzItFUI2hVGa43qCWzC2c3nj4TGEi5iNcFGI
	AQ4jNwkIVZhHuswd1HP7ehfCoqgjjHFlSo1MWLbayOH9yVqNxgg0kIAaWdcPcBwRDWoWN4YKi2pVy
	eYbsCFhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjXC-00000003Xl7-31AE;
	Tue, 10 Nov 2026 10:57:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjXB-00000003Xkz-41s4
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 10:57:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 209B36135C;
	Tue, 10 Nov 2026 10:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82ED41F008A2;
	Tue, 10 Nov 2026 10:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794308220;
	bh=yYiBagOWcslaP5fFjDzsUoDb/X8ymLQTjZmMzDj0cQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PlEvOM2YRIZR+c3pFtg6FLYfZSD1LfYFaVgyGJ5nHhH/FmgpYnP+G+XWJnWlpsOvh
	 aqYmcsjfoMohZAdVcOPGFh8Eh05u3fW+9cEIVNSV5dzqcc13iNevdsjP9Nfir86BYN
	 2EYbj0xF3PbCK0noup/owF88hhPFTnEa7opHOTlzIg1YXSlDlWKD2fEfaKoZssnz9R
	 Y/EIzp6M5CspnCMsl34DxT3LdhBZekEKRmKcUggCh6CP+s8tgltiiBUv63DLZgejXn
	 f7RGmMpfMR2VdOJqk0+jgMRdVBHXFWUTZaSgbcxleaXfvzFIL2mhz2a5m6hD5bQCkr
	 6rgexRC1hN18g==
Date: Tue, 10 Nov 2026 10:56:58 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 2/2] pmdomain: spacemit: Add power domain driver
Message-ID: <20261110105658-GKA2005@kernel.org>
References: <20261108-04-k3-pm-support-v3-0-b9dc0857039b@kernel.org>
 <20261108-04-k3-pm-support-v3-2-b9dc0857039b@kernel.org>
 <DMQHSDTR177I.1HWHAF4FWTFQ5@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DMQHSDTR177I.1HWHAF4FWTFQ5@linux.spacemit.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Troy,

On 07:12 Mon 09 Nov     , Troy Mitchell wrote:
> Hi Yixun,
> 
> On Sun, 08 Nov 2026 10:36:02 +0000, Yixun Lan wrote:
> > +config SPACEMIT_PM_DOMAINS
> > +	tristate "PM Domain driver for SpacemiT SoC"
> [...]
> > +	  Say y to enable device power management through PM domains.
> This is tristate now, so "Say Y or M".
> 
Ok, will update

> [...]
> > +#include <linux/io.h>
> > +#include <linux/err.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> > +#include <linux/regmap.h>
> > +#include <linux/auxiliary_bus.h>
> io.h, err.h and platform_device.h are not used right now.
> 
Ok, will drop them

> [...]
> > +static int spacemit_pd_power_off(struct generic_pm_domain *domain)
> [...]
> > +	if (ret) {
> > +		dev_err(&domain->dev, "failed to power off domain %s: %d\n",
> > +			p->name, pd->pm_index);
> > +		return -EBUSY;
> > +	}
> 
> -EBUSY drops the -ETIMEDOUT returned by regmap_read_poll_timeout();
> why not print ret and return it? Same in spacemit_pd_power_on().
> 
Yes, I think it's ok to propogate the err

> [...]
> > +static bool spacemit_pm_is_off_state(struct spacemit_pmu *pmu,
> > +				     struct spacemit_pm_domain *pd)
> [...]
> > +	return (reg & bit) ? false : true;
> return !(reg & bit);
> 
Actually, there isn't much difference, your version is slightly short

> [...]
> > +static void spacemit_pm_domain_cleanup(struct spacemit_pmu *pmu)
> > +{
> > +	struct spacemit_pm_domain *pd;
> > +	int i, ret;
> > +
> > +	for (i = 0; i < pmu->genpd_data.num_domains; i++) {
> > +		if (!pmu->domains[i])
> > +			continue;
> > +
> > +		pd = to_spacemit_pd(pmu->domains[i]);
> > +		ret = pm_genpd_remove(pmu->domains[i]);
> > +		if (ret)
> > +			dev_err(pmu->dev, "failed to remove domain %s: %d - state may be inconsistent\n",
> > +				pd->param->name, ret);
> > +	}
> > +}
> [...]
> > +static void spacemit_pm_domain_remove(struct auxiliary_device *adev)
> > +{
> > +	struct spacemit_pmu *pmu = auxiliary_get_drvdata(adev);
> > +	struct device *dev = &adev->dev;
> > +
> > +	of_genpd_del_provider(dev->of_node);
> > +	spacemit_pm_domain_cleanup(pmu);
> > +}
> pm_genpd_remove() fails with -EBUSY while a consumer is still attached,
> but pd is freed by devres anyway. Set suppress_bind_attrs like most
> pmdomain drivers?
> 

No, I won't add suppress_bind_attrs

As I'm also aware of this problem, but intend to address it in a different
way, and should send a patch in another separate thread..

In my opinion, Adding "suppress_bind_attrs = true" will only mitigate
the problem, in the case of this driver, it will still trigger a problem
while unloading the driver with rmmod command if built as kernel module,
consumer side won't get notification with the event. Ideally the device link
machanism should solve this, currently I'm working on a patch for this..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
