Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22477C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 20:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PhyfVJcxpOvoCnNTfUzPRIi+mXAAaTguAsekr/UVjrE=; b=0WithktwBLaicw
	pp/dfiidh6T2dhDXpZsQwa6GWgvDRMrXvTJ24D6uvepv0wvyR/9DDZkaL30OfLG60JjwXchpjHXs+
	8VYXyNrVcPfSrpTFf4VqW4Ye0uemEGeO4gAWncmB9cFuhtjSDcbjkueBWTsJTt1zH3IJ8/fZez9KR
	iom9fpOcEaQRb4jEQMbFXm3WQAUFV8Ieg20APPdc+AQIlWwi2leC+fe90gR0QEOWvBrbr/sm3IMlQ
	wUFdwo3RXc4xMZce9I5/YoW1Yc3Y9MT130cIrNDKb1+tfc/ujYv0tiVwAOGuog7pvOY5ujTrfFph5
	F/RKRxAhQ8h5ddaCxflg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8p5q-002bJN-Rd; Tue, 05 Jul 2022 20:24:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8p5f-002bHS-A3; Tue, 05 Jul 2022 20:24:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45061152B;
	Tue,  5 Jul 2022 13:24:10 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 193F23F70D;
	Tue,  5 Jul 2022 13:24:06 -0700 (PDT)
Date: Tue, 5 Jul 2022 21:22:55 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: Brice.Goglin@inria.fr, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, Valentina.FernandezAlanis@microchip.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	wangqing@vivo.com, robh+dt@kernel.org, rafael@kernel.org,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-riscv@lists.infradead.org, kernel@esmil.dk
Subject: Re: [PATCH v6 00/21] arch_topology: Updates to add socket support
 and fix cluster ids
Message-ID: <20220705202255.lfev2jjtl3e46qa7@bogus>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
 <6a647b6b-c913-b9d7-a23e-b17a8034c5c8@microchip.com>
 <507c6b64-fc23-3eea-e4c1-4d426025d658@inria.fr>
 <da1cf1aa-7291-92cd-4b62-0af0d0d12277@microchip.com>
 <20220705200737.unxj2hdcowdjdkt2@bogus>
 <d4b7bfbe-c6a5-c0a9-8aae-7d04682a5271@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4b7bfbe-c6a5-c0a9-8aae-7d04682a5271@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_132411_429500_ADC310BC 
X-CRM114-Status: GOOD (  14.57  )
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

On Tue, Jul 05, 2022 at 08:14:38PM +0000, Conor.Dooley@microchip.com wrote:
> 
> On 05/07/2022 21:07, Sudeep Holla wrote:

[...]

> > 
> > I would have preferred you to add me to the original thread and referred
> > this thread from there. I don't want to derail the discussion in this
> > thread as nothing much can be done here.
> 
> This is the original thread! It was just one off-list email that was a
> to me only response to this arch_topologu thread that you can see here
>

Ah OK, private mail. I missed to see that and assumed it was another
thread, sorry for that.

> But yeah - should have CCed you on the cpu-map stuff too.

No worries I spotted that and responded.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
