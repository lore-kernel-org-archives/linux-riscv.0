Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EEAC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 12:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osx1kno9axEsfmTwfoD4UPpXv0KK9a053l5BgJO/0oQ=; b=Wg2FlI1EcHeTdo
	r8gM05rgO8LjsURQder6MIOzHdW5d3KFhnyKRs0lUCR7yhguYdxd+y9SgVb57aEa/9zaYJP0S3DSK
	0yrkcNHFV7c36s5PRhk17FOPhnnRXB8oze7y1MKa+WUFLXloO0eTp3yLx4mCU1Z7i0M9g7Gm0OYEr
	UiMJwVJ1lKw080QT982uISrQU8RGi3OleMSn9bQrxKHy5+OAlURiJ+QWST5Srzo5F/XffyqdcINg7
	ZaMLTQYzmrQC3CZNfZB/sz5+wvZ0W3xuXF9EGlUJANCKF7ceyP9yLFV2QJzg5b1tUsocsPeTqKzHw
	mBZEXo6JkICz8Uu86d+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwN8u-00FxSa-R7; Wed, 01 Jun 2022 12:08:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwN8e-00FxKQ-NY; Wed, 01 Jun 2022 12:07:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EA1F1FB;
	Wed,  1 Jun 2022 05:07:47 -0700 (PDT)
Received: from bogus (unknown [10.57.9.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B3E93F73D;
	Wed,  1 Jun 2022 05:07:45 -0700 (PDT)
Date: Wed, 1 Jun 2022 13:06:58 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Gavin Shan <gshan@redhat.com>
Cc: linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Morten Rasmussen <morten.rasmussen@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 09/16] arch_topology: Drop LLC identifier stash from
 the CPU topology
Message-ID: <20220601120658.2x737nhyxmodoo7t@bogus>
References: <20220525081416.3306043-2-sudeep.holla@arm.com>
 <20220525081416.3306043-3-sudeep.holla@arm.com>
 <20220525081416.3306043-4-sudeep.holla@arm.com>
 <20220525081416.3306043-5-sudeep.holla@arm.com>
 <20220525081416.3306043-6-sudeep.holla@arm.com>
 <20220525081416.3306043-7-sudeep.holla@arm.com>
 <20220525081416.3306043-8-sudeep.holla@arm.com>
 <20220525081416.3306043-9-sudeep.holla@arm.com>
 <20220525081416.3306043-10-sudeep.holla@arm.com>
 <3860bfcc-a323-c031-0fdd-77001d338bec@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3860bfcc-a323-c031-0fdd-77001d338bec@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_050748_831895_B589C733 
X-CRM114-Status: GOOD (  16.34  )
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

On Wed, Jun 01, 2022 at 11:35:20AM +0800, Gavin Shan wrote:
> Hi Sudeep,
> 
> On 5/25/22 4:14 PM, Sudeep Holla wrote:
> > Since the cacheinfo LLC information is used directly in arch_topology,
> > there is no need to parse and store the LLC ID information only for
> > ACPI systems in the CPU topology.
> > 
> > Remove the redundant LLC ID from the generic CPU arch_topology information.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >   drivers/base/arch_topology.c  | 1 -
> >   include/linux/arch_topology.h | 1 -
> >   2 files changed, 2 deletions(-)
> > 
> 
> How about merge the changes to PATCH[08/16]? I don't see why we need put
> the changes into separate patches.
>

It took a while to remember as I was with the same opinion as yours but
decided to split them for one reason: to keep arch specific change in a
separate patch(if that becomes a need due to some conflict or some other
non-technical reason)

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
