Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0C8C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 19:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHU3ZyUJTPo56KGYLl09W1URhJwO5Z6+2/dU8fLs2EY=; b=ukmO1NNRYRm7xh
	7Crp5MYRbr3Is1rLkGxBIDOzejRX+Q5CF3KnLAcQdu3568slTKNPHr6BMGiFY7H2p+XE/tGSmhqe6
	TF1q+QgWDDdtA/qapjiMxNMTVmkn4IfrCmqEM3wU5QdL8jqHuNFH5rZKRL3HAEX91BVx3Xl+7p3nE
	MWAxmgK+EXmauxgVwH2sIqTksGW8S37AV8mKI4tBLap6IaA9ZJAQp2AqDPVqsFom64dGtcHeysenM
	23187sho2oi3angcylej76qcKobwhkhYx13S4Q51bXcGj5bBJgR34A4CDsAIbfh55H1HMmzlXrsE4
	dp4RggtdHFpL1+E/Df8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6dnR-00Dt8q-Ql; Wed, 29 Jun 2022 19:56:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6dnG-00Dt6Z-Kq; Wed, 29 Jun 2022 19:56:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 168CF1480;
	Wed, 29 Jun 2022 12:56:09 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FFAE3F792;
	Wed, 29 Jun 2022 12:56:05 -0700 (PDT)
Date: Wed, 29 Jun 2022 20:54:54 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	atishp@atishpatra.org, atishp@rivosinc.com,
	Sudeep Holla <sudeep.holla@arm.com>, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, wangqing@vivo.com, robh+dt@kernel.org,
	rafael@kernel.org, ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, gshan@redhat.com,
	Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Message-ID: <20220629195454.vbsjvcadmukiunt7@bogus>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
 <20220627165047.336669-10-sudeep.holla@arm.com>
 <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
 <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
 <20220629184217.krzt6l7qadymbj6h@bogus>
 <f1f4a30e-7a84-30e2-197c-4153b3e66b64@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f1f4a30e-7a84-30e2-197c-4153b3e66b64@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_125610_770983_E095E720 
X-CRM114-Status: GOOD (  13.66  )
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

On Wed, Jun 29, 2022 at 07:39:43PM +0000, Conor.Dooley@microchip.com wrote:
> On 29/06/2022 19:42, Sudeep Holla wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Wed, Jun 29, 2022 at 06:18:25PM +0000, Conor.Dooley@microchip.com wrote:
> >>
> >> No, no it doesn't. Not sure what I was thinking there.
> >> Prob tested that on the the last commit that bisect tested
> >> rather than the one it pointed out the problem was with.
> >>
> >> Either way, boot is broken in -next.
> >>
> > 
> > Can you check if the below fixes the issue?
> 
> Unfortunately, no joy.
> Applied to a HEAD of 3b23bb2573e6 ("arch_topology: Use the
> last level cache information from the cacheinfo").

That's bad. Does the system boot with
Commit 2f7b757eb69d ("arch_topology: Add support to parse and detect cache
attributes") ?

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
