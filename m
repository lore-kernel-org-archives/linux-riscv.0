Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8D4C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 15:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwjecE9Wnux7JFoodDCKFRL0DU0djhHpj+uDkw6dfjU=; b=iJKKK80Ojc5qh/
	MuPgU9rfR2PYA9jXxIfJXSIqTSijgyBX8+vTBgU9jmPmK9opZtGs0CzWx5ogYD2YJNaARe7JReuan
	v2ch7jgFYfUBTOXl1UpJWIvC8uATcUr1NjGP3sOMoYbGXadAAn+XzpmXVMThg1C6nNyAFkKoHebci
	lDrgw7i+uFDrjGIwVs8wrJ57rVIZnBDwVZMDuXYVezltzBQrVNSYQ2QxSJsTtcdQAxnw1w7w8KzjV
	hvd1lIVbNcxyAviG5fDRgABtDdSQ55rJPCkzcJoioIPdY39JBqz+GGPP5DtFA8wEyTDecw5piQXFD
	YQljaXLquorXuJG6uhcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCNRo-008OiD-SI; Fri, 15 Jul 2022 15:41:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCNRb-008OAl-Vm; Fri, 15 Jul 2022 15:41:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 086DD12FC;
	Fri, 15 Jul 2022 08:41:26 -0700 (PDT)
Received: from bogus (unknown [10.57.11.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8F403F70D;
	Fri, 15 Jul 2022 08:41:23 -0700 (PDT)
Date: Fri, 15 Jul 2022 16:41:20 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	Sudeep Holla <sudeep.holla@arm.com>, ionela.voinescu@arm.com,
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Message-ID: <20220715154120.wsviffws2bsgvtio@bogus>
References: <20220713133344.1201247-1-sudeep.holla@arm.com>
 <0abd0acf-70a1-d546-a517-19efe60042d1@microchip.com>
 <20220714150100.aqvmdgjkymc2dr5t@bogus>
 <f9b13298-5a0b-34ee-44b9-90168205cc59@microchip.com>
 <20220714160016.honjpzg35ccq4fto@bogus>
 <50b3316b-aed0-2ef1-a7ff-69aa3991d7e4@microchip.com>
 <20220715091121.mvwsopbh52c3zztc@bogus>
 <8146f6e0-0682-4876-95d0-01e99141330d@microchip.com>
 <343b8031-f2d7-0d53-6967-d2e5925703cf@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <343b8031-f2d7-0d53-6967-d2e5925703cf@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_084132_095548_4588135F 
X-CRM114-Status: GOOD (  21.18  )
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

On Fri, Jul 15, 2022 at 02:04:41PM +0000, Conor.Dooley@microchip.com wrote:
> On 15/07/2022 10:16, Conor Dooley wrote:
> > On 15/07/2022 10:11, Sudeep Holla wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>
> >> On Thu, Jul 14, 2022 at 04:10:36PM +0000, Conor.Dooley@microchip.com wrote:
> >>> With the GFP_ATOMIC, behaviour is the same as before for me.
> >>>
> >>
> >> So you still get -ENOMEM failure on your platform. It is fine, just that
> >> I am bit curious to know why as it succeeds at device_initcall later.
> >> I was hoping this might fix your memory allocation failure.
> > 
> > Correct. 
> 
> I take that back. On today's next with patch 2 applied, I don't see a
> problem with no memory, so this does appear to have sorted the memory
> allocation failure. Sorry for misleading you & thanks!
>

No worries. Glad to hear this fixed the memory allocation issue you had
on your platform, I was hopeful based on some analysis I did. I must have
done this from first, I think I had seen the bug in my initial testing and
moved the call to detect_cache_attributes() into init_cpu_topology() instead
which fixed it but broke hotplug which I didn't notice on few platforms
I tested until Ionela tested it on a particular platform.

> With my patches for store_cpu_topology on RISC-V I do see it though,
> when called on the boot cpu. I must have mixed up which I had tested.
> I have a fix for that though & will update my patches later.
> 

Sure.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
