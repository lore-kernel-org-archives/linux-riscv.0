Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85627C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 16:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rH+cn2w49qFY+RPaU+h7XyH9CG58DnWkSWSiN0fcVaM=; b=CXLwpXY2cwWcUL
	2dsNKDWz081OEyziFMWl7etvoPkudofPjmogWLZGrTWUitLWuzK4POmZ2Pgt3H11rgbIkI7lGsGmY
	+RryAMVegycmy3dt7FZAml05f8YPXEqVB5wfkcR3V001ayV9Iz+lrrbus+OueGO2smVcpCh80LrsU
	1p7ypYHOiAE1bnsaeRB0/ymoOnwLwXsSHx1Zy3wLwGDzEX9npWmbYPueiXCISG84VAIZpWZOgamRN
	Z3C9HH74oYl5fEaQkRFDhLUabIM/XB9oP7EM4Yc+nSNl3I9Krm5zAFMaztqhLwwaHSp2cBKW6MRmL
	72ci4dzsESa48bOGSgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC1GU-00G1B2-4W; Thu, 14 Jul 2022 16:00:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC1GI-00G13o-Il; Thu, 14 Jul 2022 16:00:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C42941D13;
	Thu, 14 Jul 2022 09:00:20 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 246513F70D;
	Thu, 14 Jul 2022 09:00:19 -0700 (PDT)
Date: Thu, 14 Jul 2022 17:00:16 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Message-ID: <20220714160016.honjpzg35ccq4fto@bogus>
References: <20220713133344.1201247-1-sudeep.holla@arm.com>
 <0abd0acf-70a1-d546-a517-19efe60042d1@microchip.com>
 <20220714150100.aqvmdgjkymc2dr5t@bogus>
 <f9b13298-5a0b-34ee-44b9-90168205cc59@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9b13298-5a0b-34ee-44b9-90168205cc59@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_090022_710135_930A597B 
X-CRM114-Status: GOOD (  18.40  )
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

On Thu, Jul 14, 2022 at 03:27:09PM +0000, Conor.Dooley@microchip.com wrote:
> On 14/07/2022 16:01, Sudeep Holla wrote:
> > 
> > Interesting, need to check if it is not in atomic context on arm64.
> > Wonder if some configs are disabled and making this bug hidden. Let me
> > check.
> >

OK, it turns I didn't have necessary config options enabled. Enabling
them, I did see the BUG splat and changing allocation to GFP_ATOMIC
fixed the same. Can you try that please so that you can test if other
things are fine.

> > One possible solution is to add GFP_ATOMIC to the allocation but I want
> > to make sure if it is legal to be in atomic context when calling
> > update_siblings_masks.
> >

So I take is as legal and needs to be fixed to push my patch.

> >>>
> >>> Anyways give this a try, also test the CPU hotplug and check if nothing
> >>> is broken on RISC-V. We noticed this bug only on one platform while
> >>
> >> So, our system monitor that runs openSBI does not actually support
> >> any hotplug features yet, so:
> > 
> > OK, we can ignore hotplug on RISC-V for now then. We have tested on multiple
> > arm64 platforms(DT as well as ACPI).
> > 
> 
> Well, other vendors implementations of firmware-come-bootloaders-
> running-openSBI may support it, but (currently) ours does not.
> But, if no-one else is speaking up about this, my arch-topo changes
> or your original patchset...

OK

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
