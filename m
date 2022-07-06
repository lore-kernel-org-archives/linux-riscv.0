Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C6DC43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 14:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REkQrChifH3ByGNrXuqEphBZocoerf5YxodOGPf67/g=; b=SbkQDHEZDvqw3l
	NrwZWsCAuMWQ4iqxlENuypr8/v9q7dS/gbsjKLYw+Q5xPHM/u6VjlipodTm4fMpv0OPw+eiygaGu5
	zoBMm/NKcNDCM/tcdRAgEmq39M4Htu2LqhX+zb7aG3zXUk0aibgGBywoPsfCgOq3ghUsc+3Q5MfHY
	fwJ02362615fk4qnOTwUEclHMPyF023AhzpwdtxL0DpgGf1saRyzgHlEognwfUvvi7hqsND2Rmx6c
	I9Jjr/0XpNSxI2YQEd5okvtOiS7CA5noizhXbTy8ep0LE9JN7HkMeviSmSGFYt0cVvlyyG739b2t7
	r2jy8tGI/gTRtotrHj+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95at-00AVTA-7l; Wed, 06 Jul 2022 14:01:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95ap-00AVS9-Ug
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 14:01:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8792D106F;
	Wed,  6 Jul 2022 07:01:25 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B460B3F792;
	Wed,  6 Jul 2022 07:01:22 -0700 (PDT)
Date: Wed, 6 Jul 2022 15:00:11 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	Daire.McNamara@microchip.com, niklas.cassel@wdc.com,
	damien.lemoal@opensource.wdc.com, geert@linux-m68k.org,
	zong.li@sifive.com, kernel@esmil.dk, hahnjo@hahnjo.de,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Brice.Goglin@inria.fr
Subject: Re: [PATCH 0/5] RISC-V: Add cpu-map topology information nodes
Message-ID: <20220706140011.oow6pswbyct6cwrd@bogus>
References: <20220705190435.1790466-1-mail@conchuod.ie>
 <20220705201931.nfwi5rlku7ykmydr@bogus>
 <8f07796a-d9a2-3301-aafb-7fbec4d5b1a2@microchip.com>
 <fb7be22c-cf19-0e06-f231-bb5b9167e179@microchip.com>
 <20220706092126.k6zaknwcwzyg22ak@bogus>
 <bcc3fc6c-1ff8-3db6-5aa9-beed2d0ea41b@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bcc3fc6c-1ff8-3db6-5aa9-beed2d0ea41b@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_070128_088495_C2A54A96 
X-CRM114-Status: GOOD (  10.31  )
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

On Wed, Jul 06, 2022 at 01:04:24PM +0000, Conor.Dooley@microchip.com wrote:
> On 06/07/2022 10:21, Sudeep Holla wrote:

[...]

> > Looks good. Again package id is not cluster. This is what my series is
> > addressing. So update the log as Package instead of Cluster above. The
> > cluster id will be -1 unless you can get that for DT.
> >
> 
> FYI I took that directly from arm64:
> arch/arm64/kernel/topology.c:L57 (next-20220706)
> 
> 	pr_debug("CPU%u: cluster %d core %d thread %d mpidr %#016llx\n",
> 		 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
> 		 cpuid_topo->thread_id, mpidr);
> 

Yikes, that needs to change. I will get that updates. Thanks for pointing
that out.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
