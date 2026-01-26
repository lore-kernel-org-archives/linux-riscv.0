Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1471BD1950F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 20:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1N34CqeX5+JTC+XQfxVa1aQEqT15+Kn36JE91DzbtxA=; b=oBERu68ZWbzdQf
	f3QYtRJPIZbD5JFEUdc9nDaZh6Y5a9DuIQWLsdomUxlg8PuLHel481ul2NQGeci4PR1ICruKOpfRq
	dXsuKH0ZljoDumVO66Eu5oTDz6l4Ic5hJiI0ndKbQLLeu/6KdzaZ4YM7STvOKPa4juYl342mGiKVA
	IMIWFzM5G1YoyoN1uIP4dn7WmAjMhR4DLcMx/JyuzL31KQZMgKFaTHegG5nzvu7RwD/+KKVls673c
	/bW3TEElC+8D/U/ic4UDYfVY5lugvU4RrnBcYmhEpAvlGSHGdcSXyviKxSRBvI2Fh3DNh60GwsiQh
	PldM5HvT92vUXjyQpTzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkSvg-0000000DBE1-0E3l;
	Mon, 26 Jan 2026 20:11:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkSvd-0000000DBDX-3vQA
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 20:11:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4F4C43EFA;
	Mon, 26 Jan 2026 20:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12647C116C6;
	Mon, 26 Jan 2026 20:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769458276;
	bh=uQdtHTO2bngOoIZ/QTpWxDdrifho0WobVr5Fo3+MEG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jXq2dXHp+ME2Br7BBX8lbp8BsdySiX96KfmwRcxUercTnjIcRAi0bEA93lVjYWOlg
	 qjdVKnJLdJ56cSx2NMXOKUFqVAPrt2bJvbEZZaKYs/JhBL3Le0+0q7AZCkt4Bw0ccR
	 FTHEFqKUuzZcYS8yAeR9ma3pceQSf31rjIN9j5WRMWhpMRMu6TWZ3h7qbmUcsUNLY/
	 ByoRXscdizWQcFGCP3qru6sBCaeNCz1mAHcGwUcseYjOigO4i1PEnoxajLR4wzmgNi
	 XxvXaT3kyGz/6sFrB23N+Z1NSCBFk4PPEpl6oE/O5tMVL+MMD7kQkeDKzex0fIh4pN
	 1wJ0Hz4qvhdbw==
Date: Mon, 26 Jan 2026 12:11:14 -0800
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
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
	Chen Pei <cp0613@linux.alibaba.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liwei1518@gmail.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Dave Martin <Dave.Martin@arm.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [External] [PATCH RFC 00/19] RISC-V: QoS: add CBQRI resctrl
 interface
Message-ID: <aXfKYokyKJ8oassV@x1>
References: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
 <CAEEQ3w=0_JvE0nuJ=F_RHsBE=tbV5j0ycgT_k3kYPLE_ixOExw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=0_JvE0nuJ=F_RHsBE=tbV5j0ycgT_k3kYPLE_ixOExw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_121117_995916_E2A73742 
X-CRM114-Status: GOOD (  10.81  )
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

On Mon, Jan 26, 2026 at 09:14:24PM +0800, yunhui cui wrote:
> 1. What about the relevant logic for mweight?

My intention for this series is to just add support for functionality
that matches the existing resctrl schemata. I think mweight could be
added later. There is active discussion [1] about how to expand schemas
in resctrl.

> 2. What is the support plan for IOMMU?

Similarly, I wanted to land the basic resctrl support before expanding
to other resource types.

> 3. Can we also add the patches that support RQSC to this patchset?

I'm about to send it as part of v2 of this series. I removed the
platform drivers and use to ACPI to boot the system. I will finish
editing the cover letter and send today. The b4/ssqosid-cbqri branch
contains what will be the v2 series.

Thanks,
Drew

[1] https://lore.kernel.org/all/aXUK7XFsHl+gnwA%2F@x1/
[2] https://github.com/tt-fustini/linux/commits/b4/ssqosid-cbqri/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
