Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38606D715E3
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpQVPyU0XXuSVK7MZpw2yBOoEedXVq8Leu2wY4Kv5IQ=; b=sECXcPkO8pGOQQ
	8a9lUsk8YrAnRL8eOY1EhJfz1qIEVW1fY2TbsxYaZiNMjtOxrYVptS3dNQguRheAE3oi9qQEDZug3
	fOQquZS7xae1VKqgHH2C73qIScIfi8p4yCvD8w+738GtT+Fr5bVFOeb2xlfhF/ttsaJP6fYfwm3Fh
	usPi51Myv47qOMbaigGkFc9TYEt9rcm6ZWKH98KTcZYFnCDy2dMAMcy5o6igphN3smdZYzfgakMs3
	zsNmo4nn+1uraDiFg3Cudnb8A7ZPMNOJqTSH4KkS/0CmUIO/lyVjHHNBzRlBTMfWEZYmL1N0mPiFR
	veKuqJNRrzjf5nPzkMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjhva-0000000AQGl-1Lpp;
	Sat, 24 Jan 2026 18:00:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjhvZ-0000000AQGL-2401
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 18:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3836260055;
	Sat, 24 Jan 2026 18:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73711C116D0;
	Sat, 24 Jan 2026 18:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769277603;
	bh=ZEuUe0fii9zeTFf3nGMbuhhNCbG/kSLNmWTlO1fl/hA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IrbkHLQwKIoPQvs4AEvMoM6AWVrTZwsWeB3m0BN/Ce2DyZ7a18JIdmwRocKhHjZQm
	 TiSZKjvgSuEC8nWS4u9hH72wxYz28OJAvW0a5A49+V+CtQS0/JEKfQeBh7kypa/jrE
	 vD22p33UgtzN0XgrPds2fFxXgPaSYS1sdldFighoTXoCVDLak9spgf7AWImTOHUD7B
	 7AhZ2Q1dzXUaDX5GFneKkjcNFnZ/fIBm+yH7ZV6XQ0hR4uin6T+CNIkhzWAWOkmajb
	 7wE9bLwrJx7ij92mgiiTjabPsG7w1LPY868N7PHMEHkWTmzI4aVvSV7/xDuhT1rp2O
	 z7Q9UPBPfsp1g==
Date: Sat, 24 Jan 2026 10:00:01 -0800
From: Drew Fustini <fustini@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Atish Patra <atish.patra@linux.dev>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liwei1518@gmail.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Dave Martin <Dave.Martin@arm.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RFC 00/19] RISC-V: QoS: add CBQRI resctrl interface
Message-ID: <aXUIoSSL2hZPKf0p@x1>
References: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
 <1c9b21e3-f64b-4a0c-9e1b-cc90d981159c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c9b21e3-f64b-4a0c-9e1b-cc90d981159c@intel.com>
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

On Thu, Jan 22, 2026 at 02:31:06PM -0800, Reinette Chatre wrote:
> Hi Drew,
> 
> On 1/19/26 8:14 PM, Drew Fustini wrote:
> >  - No MBM (bandwidth monitoring)
> >    - MBA schema works ok for the CBQRI-enabled memory controllers, but
> >      resctrl does not currently have solution for representing MBM for
> >      bandwidth resources that are not associated with a L3 cache.
> >    - For the old CBQRI proof-of-concept RFC, two separate domains were
> >      created for each memory controller: one for MB (allocation) and one
> >      for MBM (monitoring).
> >    - The monitoring domains had to pretend that these memory controllers
> >      were L3 caches which is not the case. I have removed this as it was
> >      too complicated and not the right solution.
> >    - Fenghua Yu talked about a similar problem last month at LPC in the
> >      resctrl BoF during the "MBA/MBM on CPU-less Memory Node" topic:
> >      https://lpc.events/event/19/contributions/2093/
> >    - I hope to work with resctrl developers on finding a solution.
> 
> Specific to this open, could you please consider [1] that proposes a way for
> resctrl to handle allocation and monitoring of resources at different scope?

Thank you for pointing that out. I think that the different scope for
bandwidth monitoring would fit CBQRI well. I will reply in that other
thread.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
