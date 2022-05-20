Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841C8C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 13:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8u94g9B0E69Ou00L8nKKxsX3v3sTSiMRPn4UMqSnafI=; b=hNwhSQEPFLucev
	Ju+G9Lg6ADbkIc2RphMbfpRb97VNrTKdZI01gnQtgYtX3Ld8k20hUgCRkSyXdX0R2ruQqwxhyq09b
	bAtNv7KxF88oSs/EBQLpVGsKv17MQlF5bnVya1PMhIDWcX+a6umRHSvArsx/AAdfjHpuWSHkKlUPA
	57528SWKR8SgX70xM0dBHiUQFeWg9G8k9nIG+2NzrOLhgVq6cZtIgZAaFNnrUjMY1lQaxyWH9874N
	aNClrrvSU0apH8EBnbdhchaJ1Kf1NtLxxvUHIFXaZ61PG3ZuBHhUx8GPAUofNo0b++Xb1jNbhwe21
	fykcnzgqYoXVIClIU5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns2Yn-00Cb5I-Rh; Fri, 20 May 2022 13:20:53 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns2YY-00Caxz-EE; Fri, 20 May 2022 13:20:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA1C21477;
 Fri, 20 May 2022 06:20:34 -0700 (PDT)
Received: from bogus (unknown [10.57.66.157])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B74F3F73D;
 Fri, 20 May 2022 06:20:32 -0700 (PDT)
Date: Fri, 20 May 2022 14:20:25 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Qing Wang <wangqing@vivo.com>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/8] arch_topology: Set thread sibling cpumask only
 within the cluster
Message-ID: <20220520132025.sbbmnusnmls3ruow@bogus>
References: <20220518093325.2070336-1-sudeep.holla@arm.com>
 <20220518093325.2070336-3-sudeep.holla@arm.com>
 <db6dc5e0-780a-5542-5e49-711cd454a9d8@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db6dc5e0-780a-5542-5e49-711cd454a9d8@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_062038_567374_CE2B4987 
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

On Fri, May 20, 2022 at 02:32:19PM +0200, Dietmar Eggemann wrote:
> On 18/05/2022 11:33, Sudeep Holla wrote:
> > Currently the cluster identifier is not set on the DT based platforms.
> > The reset or default value is -1 for all the CPUs. Once we assign the
> > cluster identifier values correctly that imay result in getting the thread
> > siblings wrongs as the core identifiers can be same for 2 different CPUs
> > belonging to 2 different cluster.
> > 
> > So, in order to get the thread sibling cpumasks correct, we need to
> > update them only if the cores they belong are in the same cluster within
> > the socket. Let us skip updation of the thread sibling cpumaks if the
> > cluster identifier doesn't match.
> 
> So this issue should be there on ACPI systems as well then. Kunpeng920
> and Ampere Altra don't have SMT, so very likely nobody has noticed this
> so far.

No, I think it is handled correctly. May be the wordings of my commit log
needs changing. Previously the core ids were generated and unique across the
platform. But with this change I am assigned the id as read from the DT
node using core@<id>. That results in the problem and needs to be taken care.
This doesn't change the end result(the actual mask) but the way we arrive at
that. In short this is not fixing any issue that was broken before.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
