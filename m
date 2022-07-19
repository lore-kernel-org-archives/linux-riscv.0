Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48FAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 15:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/qr5QbF2vdJDM4sUvIQ0BtqPhfyGUeJUBEdI54spSY=; b=fWqp5GXSecFO0H
	X2PsnOf/b6kc+O4bnqU9vix2+hL3ZiVb+8RBaoIu4F3twG2iItB7642MeCZjjfKg3oIsHIRscOw/F
	2r1gx8fSHCf+mG0wYzUODCRES1T5Uuar4/j97/djQqF8q/0mpJSDBIsnydKZ+6J+ZZsO6OvORe/Mf
	Il3pDQMQcG9CNr+tkKn9tJAP9vg0mtPSo3zzkscRD9ASP4asIEV9O4BKV9gjv9QMmPhHi4xa7MtDL
	Menbq1cVxAivZ0583N9lCA9XgFRa09AGUFZlRjnp5hdHI+yH2LiFn2efGf/5j2FP3BXGU9FCguQZf
	FPZiD7mKehIR5bPOLuLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDomy-009uSG-An; Tue, 19 Jul 2022 15:05:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDomm-009uND-Mk; Tue, 19 Jul 2022 15:05:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC52813D5;
	Tue, 19 Jul 2022 08:05:18 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3948A3F70D;
	Tue, 19 Jul 2022 08:05:16 -0700 (PDT)
Date: Tue, 19 Jul 2022 16:05:13 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor Dooley <mail@conchuod.ie>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	valentina.fernandezalanis@microchip.com,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>, Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v6 09/21] arch_topology: Add support to parse and detect
 cache attributes
Message-ID: <20220719150513.a525arh663qlhkob@bogus>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
 <20220704101605.1318280-10-sudeep.holla@arm.com>
 <CAMuHMdUBZ791fxCPkKQ6HCwLE4GJB2S35QC=SQ+X8w5Q4C_70g@mail.gmail.com>
 <73f9d00c-b64c-7c70-c49f-99d3894fad24@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73f9d00c-b64c-7c70-c49f-99d3894fad24@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_080520_810736_A8098E29 
X-CRM114-Status: GOOD (  16.92  )
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

On Tue, Jul 19, 2022 at 03:37:22PM +0100, Conor Dooley wrote:
> On 19/07/2022 15:22, Geert Uytterhoeven wrote:
> > Hi Sudeep,
> > 
> 
> Hey Geert,
> 
[...]

> > 
> > This is triggered
> > 
> >      Early cacheinfo failed, ret = -12
> > 
> > on all my RV64 platforms (K210, PolarFire, StarLight).
> 
> This should be fixed by Sudeeps most recent patchset, at least
> it was when I tested it!
> https://lore.kernel.org/all/20220713133344.1201247-1-sudeep.holla@arm.com/
>

Conor you beat me in the response speed :).

> > -12 = -ENOMEM.
> > 
> > The boot continues regardless, and the K210 even has enough spare
> > RAM after boot to run "ls", unlike two weeks ago ;-)
> >

Yes Conor initially reported this and I suspected something to do with
per-cpu allocation as the early cacheinfo failed but succeeded in device
initcall level. However when fixing some hotplug issue, I moved the
detection of cache attributes on all cpus from boot cpu to individual
CPUs in the secondary startup which seem to fix the issue as I assume the
per-cpu allocation is ready to use at that stage.

However we still have one pending issue[0] to address even after [1], but
that doesn't affect DT platforms.

-- 
Regards,
Sudeep

[0] https://lore.kernel.org/all/20220718174151.GA462603@roeck-us.net/
[1] https://lore.kernel.org/all/20220715102609.2160689-1-sudeep.holla@arm.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
