Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45431C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XByIRmFOZ99drp/zdAsrl1NdJ50OtAakW/iIocCHiPE=; b=wHaauoPLxz9s39
	mS1Lx1uVH1NKuEEJLaG9oB4uVr5nDoBcTojmTlsGrpwsVt1O1LXEpDr+XKNZOVLiG5TDotAsDBDAB
	7p8TXrhrEVW2hPQ4L9/re1FOw/FmoKY+NCNPS2zRsIvyxI8qPHvJph2G12TvyStUjKqJSpNKt58jF
	vPI0NUHemZxhmsbHtNIApuR1Tf+C0nnOovHM2WKP9Ybh2wbBoaHaFeUeNaEVxtVCMY3Spizpy/y1K
	iexsdJB41WopA5pP0tbf35gOikNWf7U3u+85IQBSjH0AooVSIlB5JzPu5F/hR+xOyVoIe8rOYk7eF
	xGgGE21MT+DZXB6tPNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cSm-00DWb2-Up; Wed, 29 Jun 2022 18:30:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cSB-00DWLW-KE; Wed, 29 Jun 2022 18:30:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7668F14BF;
	Wed, 29 Jun 2022 11:30:17 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C7B43F5A1;
	Wed, 29 Jun 2022 11:30:14 -0700 (PDT)
Date: Wed, 29 Jun 2022 19:29:03 +0100
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
Message-ID: <20220629182903.fku772ka2kdjj6yr@bogus>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
 <20220627165047.336669-10-sudeep.holla@arm.com>
 <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_113019_766101_2D494176 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jun 29, 2022 at 05:49:20PM +0000, Conor.Dooley@microchip.com wrote:
> > 
> > Link: https://lore.kernel.org/r/20220621192034.3332546-10-sudeep.holla@arm.com
> 
> btw, why is this link in the patch? Why is a link to v4 relevant?
> Links to both v4 and v5 exist in your for-linux-next branch.
> 
Yes I noticed that and fixed it today.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
