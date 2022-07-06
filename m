Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80C5C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HhEmyNGUmlKRM9jWejQifbyDhiSq7xjXtrbNzvb478=; b=kmdYAjUJAPVO3D
	oud1OTarchtZm9vePR8Ve5GGvcz2zbxzOgiviwlUOSzuQCDlKPQ8z5zRl6veDZKZfbITMA7jbKhNT
	grI57Ei2IaeoCKgdidNqxGHJeSBEpaaGex1R4o4TFpWXP6p3xrynqwsoG7HcNuHu0rvjLclybL5Db
	f8rBU9uqkuMNgYYfVigCa+tT2UnDqxwD/+zZUlyg+mkA87NctxoEVLP9th7R5BYvSZt+fNu0Aofn+
	/1mfPY7pDelhVwnKpWVzRviKJaAG03HDEtOW0QmcLf+xDMXwIlBT1Auzr3nQFP0AVBmtcZa/ncHFI
	nd49Vh3ziF9HoEP288BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91Ce-007iv6-Oa; Wed, 06 Jul 2022 09:20:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91Cb-007itw-8v
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 09:20:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 753EC15A1;
	Wed,  6 Jul 2022 02:20:05 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9FEA3F66F;
	Wed,  6 Jul 2022 02:20:00 -0700 (PDT)
Date: Wed, 6 Jul 2022 10:18:50 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	Daire.McNamara@microchip.com, niklas.cassel@wdc.com,
	damien.lemoal@opensource.wdc.com, geert@linux-m68k.org,
	zong.li@sifive.com, kernel@esmil.dk, hahnjo@hahnjo.de,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Brice.Goglin@inria.fr
Subject: Re: [PATCH 0/5] RISC-V: Add cpu-map topology information nodes
Message-ID: <20220706091850.deealvovinkzjrml@bogus>
References: <20220705190435.1790466-1-mail@conchuod.ie>
 <20220705201931.nfwi5rlku7ykmydr@bogus>
 <8f07796a-d9a2-3301-aafb-7fbec4d5b1a2@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f07796a-d9a2-3301-aafb-7fbec4d5b1a2@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_022009_397496_CB99CE37 
X-CRM114-Status: GOOD (  23.02  )
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

On Tue, Jul 05, 2022 at 08:33:39PM +0000, Conor.Dooley@microchip.com wrote:
> 
> 
> On 05/07/2022 21:19, Sudeep Holla wrote:
> > On Tue, Jul 05, 2022 at 08:04:31PM +0100, Conor Dooley wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> It was reported to me that the Hive Unmatched incorrectly reports
> >> its topology to hwloc, but the StarFive VisionFive did in [0] &
> >> a subsequent off-list email from Brice (the hwloc maintainer).
> >> This turned out not to be entirely true, the /downstream/ version
> >> of the VisionFive does work correctly but not upstream, as the
> >> downstream devicetree has a cpu-map node that was added recently.
> >>
> >> This series adds a cpu-map node to all upstream devicetrees, which
> >> I have tested on mpfs & fu540. The first patch is lifted directly
> >> from the downstream StarFive devicetree.
> >>
> > 
> > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > 
> > I would recommend to have sane defaults in core risc-v code in case of
> > absence of /cpu-map node as it is optional. The reason I mentioned is that
> > Conor mentioned how the default values in absence of the node looked quite
> > wrong. I don't know if it is possible on RISC-V but on ARM64 we do have
> > default values if arch_topology fails to set based on DT/ACPI.
> > 
> 
> Yeah the defaults are all -1. I'll add some sane defaults for a v2.

Sorry I didn't mean it to be part of this series. This series of DT changes
are just fine on their own.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
