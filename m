Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D82C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 15:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFIa9zMEY1bV0qgthv9z5X2SyvZmjuWkegbkV6vCAuE=; b=0HrHpf3AZVnz82
	rqLR7d1YyouedjrgggmnpvDRN2DmoWMKdhl3FfhzBI881QFqRE+SBV9mSnWvZyFBwdmQf5ozBjWa8
	bzBgsRH5cbocRUYnFXGgtl+L5yo4PkFKd1AivvhbGIVU89uIV+c1NA3zMhzIiOsTpN0cg7Bazy6uP
	9DpY8BTDEZ0vhqMErOZ9J2to1U3FLUG5gTUrMHfuhPK9i5iDKE5FVqiqQgZoM5Q60qvOKaYj+OlsG
	b/C+QFXimseAZNKdHdVdp/Wdpz2FpsdxKePgsHWH6SNwPJgRC6mm/nuGOrF1f/hPRjkARIhupSRjw
	cmrR0LgRrcvAsZD1lgHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4PBS-00Flep-MO; Thu, 23 Jun 2022 15:55:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4PBI-00Flbc-Hp; Thu, 23 Jun 2022 15:55:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3A116B8246B;
	Thu, 23 Jun 2022 15:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EB5C341C6;
	Thu, 23 Jun 2022 15:55:38 +0000 (UTC)
Date: Thu, 23 Jun 2022 16:55:35 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
	Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>, Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
	Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4 10/20] arm64: topology: Remove redundant setting of
 llc_id in CPU topology
Message-ID: <YrSM9x0mokN2l/Zb@arm.com>
References: <20220621192034.3332546-1-sudeep.holla@arm.com>
 <20220621192034.3332546-11-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220621192034.3332546-11-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_085544_773917_7FB8A263 
X-CRM114-Status: GOOD (  16.31  )
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

On Tue, Jun 21, 2022 at 08:20:24PM +0100, Sudeep Holla wrote:
> Since the cacheinfo LLC information is used directly in arch_topology,
> there is no need to parse and fetch the LLC ID information only for
> ACPI systems.
> 
> Just drop the redundant parsing and setting of llc_id in CPU topology
> from ACPI PPTT.
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

> Hi Will/Catalin,
> 
> This is part of a series updating topology to get both ACPI and DT view
> aligned. I have not cc-ed you assuming you won't be interested. Let me
> know if you are. The parts affecting arm64 is just this patch removing
> some unnecessary ACPI code that is now moved to core arch_topology.c
> 
> Please ack if you are happy with this and OK to take this as part of the
> series.

Yeah, that's fine, keep it with the rest of the series.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
