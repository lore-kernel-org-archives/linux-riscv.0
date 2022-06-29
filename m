Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F69C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wm9ZNFVJDTpPu7aouw9YFamXkkh8LQkf3APk+Hz2jo4=; b=raRuRnI0GwY/Ss
	/fmkA6sHCvIYveURl2i3ctp3QYEhHKU33tEGSDhHiCaBQpCKIGNsDH31zsDGxJUk4yjI2GKrwHuMI
	strh0OQ1IfIrnnEH2Rvh1zgguzXA48EKA200iAEaGq5NxgXSF8vmaH9a68Sx9f5SggGGZJGsaM6mq
	3JF+DhL9e2q2Qh+Qk3tMGwabDuMbDyH9SZvPCfFVegR01pVYbrHKg9CODx9nrQsMw89bQtpxyS4LH
	GasMBMIXRdB4WS5fk7okLb4kmzmX9egDWo7xV40iA5tGxd8YfLkgTwCt0FeHP1AvZX6eqEoKpHZha
	mUaQ2yHt/Pf9AX8SEEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cX2-00DYBt-DS; Wed, 29 Jun 2022 18:35:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cWm-00DY7n-4J; Wed, 29 Jun 2022 18:35:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6316E1480;
	Wed, 29 Jun 2022 11:35:02 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E91213F5A1;
	Wed, 29 Jun 2022 11:34:59 -0700 (PDT)
Date: Wed, 29 Jun 2022 19:33:48 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	atishp@atishpatra.org, atishp@rivosinc.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	wangqing@vivo.com, robh+dt@kernel.org, rafael@kernel.org,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, gshan@redhat.com,
	Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Message-ID: <20220629183348.ga7gbcsba57dzf2t@bogus>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
 <20220627165047.336669-10-sudeep.holla@arm.com>
 <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
 <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_113504_251992_51F9FD1B 
X-CRM114-Status: GOOD (  21.10  )
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

On Wed, Jun 29, 2022 at 06:18:25PM +0000, Conor.Dooley@microchip.com wrote:
> On 29/06/2022 18:49, Conor.Dooley@microchip.com wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 27/06/2022 17:50, Sudeep Holla wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>
> >> The cacheinfo is now initialised early along with the CPU topology
> >> initialisation. Instead of relying on the LLC ID information parsed
> >> separately only with ACPI PPTT elsewhere, migrate to use the similar
> >> information from the cacheinfo.
> >>
> >> This is generic for both DT and ACPI systems. The ACPI LLC ID information
> >> parsed separately can now be removed from arch specific code.
> > 
> > Hey Sudeep,
> > I bisected broken boot on PolarFire SoC to this patch in next-20220629 :/
> > I suspect the issue is a missing "next-level-cache" in the the dt:
> > arch/riscv/boot/dts/microchip/mpfs.dtsi
> > 
> > Adding next-level-cache = <&cctrllr> fixes the boot.
>

If the above is missing, even the existing cacheinfo will be incorrect on
that system. But we must end up with L1 as LLC, I need to check if that
breaks the boot.

> No, no it doesn't. Not sure what I was thinking there.
> Prob tested that on the the last commit that bisect tested
> rather than the one it pointed out the problem was with.
>

So can I assume the pointed commit is where the boot breaks ?

> Either way, boot is broken in -next.
>

OK, that's bad. 

> > Not sure what the resolution here is, old devicetrees are meant to keep
> > booting, right?
> >

Ideally yes. But with this, I assume the cacheinfo to userspace is also broken
on this platform and I guess that needs fixing which can happen with DT update
only.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
