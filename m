Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44356C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 09:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNJ2IUtkfCFEyAOau9Sp29bUD11YJodNEccTs6PTHVU=; b=e6NCg29jG7bbe2
	xveMR8KpT/HBaZpcbJJr0+qZcN9eHYmD91jLV9QgEgO7Gto2C/0lXHwjV8kvTduDKpwm/ph6dIP6e
	tEy2k5jj1de535Lo4im6jMGRtRR5mf3ZoYa5h6nfCERtliF2RzEFUCQ/B5k2G7kiumlF5v/jItV9E
	PWl7zR+Ep+PGqrR2yLW/dpGfACorH8+AzxlKCABW7pUGS4qg+9N3+srGBA7OuX9A04A3IpioEhg/a
	S94IC0DhHS5tf0OtLYjXK9jFgWxZx0bpPtb8F+43rFOsQMf7JGKv1Kh4O7b+YdUW0o+UFOggLhN67
	8/5SEa5BPVFGDK3eK27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCHMK-00622r-0Z; Fri, 15 Jul 2022 09:11:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCHM9-00620N-Ht; Fri, 15 Jul 2022 09:11:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E052F1474;
	Fri, 15 Jul 2022 02:11:27 -0700 (PDT)
Received: from bogus (unknown [10.57.11.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D77E3F792;
	Fri, 15 Jul 2022 02:11:25 -0700 (PDT)
Date: Fri, 15 Jul 2022 10:11:21 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Message-ID: <20220715091121.mvwsopbh52c3zztc@bogus>
References: <20220713133344.1201247-1-sudeep.holla@arm.com>
 <0abd0acf-70a1-d546-a517-19efe60042d1@microchip.com>
 <20220714150100.aqvmdgjkymc2dr5t@bogus>
 <f9b13298-5a0b-34ee-44b9-90168205cc59@microchip.com>
 <20220714160016.honjpzg35ccq4fto@bogus>
 <50b3316b-aed0-2ef1-a7ff-69aa3991d7e4@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50b3316b-aed0-2ef1-a7ff-69aa3991d7e4@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_021129_658963_B7BDD39B 
X-CRM114-Status: GOOD (  19.93  )
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

On Thu, Jul 14, 2022 at 04:10:36PM +0000, Conor.Dooley@microchip.com wrote:
> On 14/07/2022 17:00, Sudeep Holla wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Thu, Jul 14, 2022 at 03:27:09PM +0000, Conor.Dooley@microchip.com wrote:
> >> On 14/07/2022 16:01, Sudeep Holla wrote:
> >>>
> >>> Interesting, need to check if it is not in atomic context on arm64.
> >>> Wonder if some configs are disabled and making this bug hidden. Let me
> >>> check.
> >>>
> > 
> > OK, it turns I didn't have necessary config options enabled. Enabling
> > them, I did see the BUG splat and changing allocation to GFP_ATOMIC
> > fixed the same. Can you try that please so that you can test if other
> > things are fine.
> > 
> >>> One possible solution is to add GFP_ATOMIC to the allocation but I want
> >>> to make sure if it is legal to be in atomic context when calling
> >>> update_siblings_masks.
> >>>
> > 
> > So I take is as legal and needs to be fixed to push my patch.
> > 
> 
> With the GFP_ATOMIC, behaviour is the same as before for me.
>

So you still get -ENOMEM failure on your platform. It is fine, just that
I am bit curious to know why as it succeeds at device_initcall later.
I was hoping this might fix your memory allocation failure.

> Therefore, with the following diff & for RISC-V/DT:
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>

Thanks !

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
