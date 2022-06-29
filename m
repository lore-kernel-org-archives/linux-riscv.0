Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47862C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxQQnJo8LaoUNb0w/9fxZ9CpAh2UftEyihaAmcicors=; b=ZYFU7XYqjf/ZfP
	v63OBpGRrfHLYMo9jgQovYGXsnaqOhIiwYFy2FNETMxRAdAsBSuEsbiTsyfhQFSs4oyQ6+zrxv/1E
	yTOkapECAF7XG6K3NrJSzNjHNscAYUBXTNRVVWGqYFP4rPyEADaG7Y2Z8GCRk9Y2CMWERp/cpfjlu
	ZMa8rliukoQ1K1J+lvkru8FvXYRLPuTUFs1pUGb0zPUyYrJ4XpCGiAyblGOCMqerBC6nmqN4c60um
	LBI2eRBomtXf5rNojaCABv7zhoa5UwSYBK4fv0Q8mYn20oULte3W0qWjtlwjpOCgf7sDWbjD5OrK1
	jPqvlOfuUNYlUQWoL5Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ckA-00Dd4g-Uq; Wed, 29 Jun 2022 18:48:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cjh-00Dcpr-5V; Wed, 29 Jun 2022 18:48:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D9B41480;
	Wed, 29 Jun 2022 11:48:23 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B330A3F5A1;
	Wed, 29 Jun 2022 11:48:19 -0700 (PDT)
Date: Wed, 29 Jun 2022 19:47:08 +0100
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
Message-ID: <20220629184708.x5exgjoy4sblyqml@bogus>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
 <20220627165047.336669-10-sudeep.holla@arm.com>
 <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
 <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_114825_277855_238C1F3F 
X-CRM114-Status: GOOD (  16.14  )
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

Good that I included this in -next, I had not received any feedback from
RISC-V even after 5 iterations. I also see this DTS is very odd. It also
states CPU0 doesn't have L1-D$ while the other 4 CPUs have L1-D$. Is that
a mistake or is it the reality ? Another breakage in userspace cacheinfo
sysfs entry of cpu0 has both I$ and D$.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
