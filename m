Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B87FCD3423
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 16:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jc31OqjADzUFB9Q+Kt1mmMb9Mb2fwF2RCaQvESTLOVw=; b=Si3iY/TMD/IGs8
	N83DpTMrgEOKGf02D9mRPpXOC1MoekCVI1XdKWP4W67ZMMcbSTAR3uvWY/HQfuPhdTw80CMZHs+1v
	M//AQ+ei+6/FYGfBae/X4ROpk82CnxdCqFJ+SKd9BY4jVRIGlyQFj+ry86Y3bwQ3DMBUUsEIks5DB
	oSuk4tu7Zww60J6L6LiYqifKWcHR0VBd3a3HPtTbfQAKH0DNKPYzbggghYReMnQhEXVCgJHoRYM5H
	kB5VmFO85Tqp2I+rwkUAUh67yx/g723jdi82TotUHP3d9/kwYT/Y0CT1/fpFcVECW/+2nMgZTzSsO
	E2guhW3zVhYDDAX8/3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr7W-00000007TT0-3CKV;
	Fri, 01 May 2026 16:53:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr7U-00000007TSX-2cth
	for linux-riscv@lists.infradead.org;
	Fri, 01 May 2026 16:53:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA09044217;
	Fri,  1 May 2026 16:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A75C2BCB4;
	Fri,  1 May 2026 16:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777654419;
	bh=770+8GY90hKXMI2cf/tU09CcDPFp31skm8cGJkor5Bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VkXj+jS2LplYgGAK4wvAUye2IaRpCnPJDQAQhmbsG69HyzLr+DwT+cT2oPLv2a4ei
	 oa4YDx9ewMfhDjvjLqXokbgHXB/UbKkZOh2Wltx8vg+7nDp+OcKuR4bPkqDykFjcot
	 072Kyo2CPHCHWrEKHCJgcwpo0DeOTf8wKLIArreW35oSITduJtl8qM0XdiUgAsOWnn
	 yH1hA8FOMsAMJjZ/yyB7qQoXtCYjMf6PqMAOHLamiRi3ZJTpYn0qvkYZ+iUI50QeD3
	 DV3vqcv8X34eLeVHiYuhqWKCqEeuFZW83MpjlvPxZ2Qt08ZbNe4Kcxj5e7/FnvWcCk
	 IutKrj4hIdvyw==
Date: Fri, 1 May 2026 09:53:37 -0700
From: Drew Fustini <fustini@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
Subject: Re: [PATCH RFC v3 08/11] ACPI: PPTT: Add
 acpi_pptt_get_cache_size_from_id helper
Message-ID: <afTakYFbm45hYNqT@x1>
References: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
 <20260414-ssqosid-cbqri-rqsc-v7-0-v3-8-b3b2e7e9847a@kernel.org>
 <4fa25edf-65eb-4ff6-bb52-a7087490e81d@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4fa25edf-65eb-4ff6-bb52-a7087490e81d@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_095340_702420_489E5F97 
X-CRM114-Status: GOOD (  15.99  )
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
Cc: x86@kernel.org, Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-kernel@vger.kernel.org, Gong Shuai <gong.shuai@sanechips.com.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J. Wysocki" <rafael@kernel.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Gong Shuai <gsh517@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Peter Newman <peternewman@google.com>, Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 30, 2026 at 04:20:23PM -0700, Reinette Chatre wrote:
> Hi Drew,
> 
> On 4/14/26 6:54 PM, Drew Fustini wrote:
> > Add helper to look up a cache's size from its cache ID in the PPTT
> > table. This is needed by the RISC-V RQSC parser to determine the cache
> > size for CBQRI capacity controllers.
> > 
> > The implementation follows the pattern established by
> > find_acpi_cache_level_from_id() and acpi_pptt_get_cpumask_from_cache_id():
> > uses acpi_get_pptt(), upgrade_pptt_cache(), checks all three cache types,
> > and uses the do/while empty-detection loop.
> 
> I see how this helper is used to initialize cbqri_controller::cache::cache_size
> but I am not able to determine where this value is used.
> resctrl does need the cache size but it currently relies on struct cacheinfo returned
> by the get_cpu_cacheinfo_level() helper to obtain it.
> 
> Reinette

I will drop this patch and try get_cpu_cacheinfo_level() once I have
moved domain creation to the cpu online/offline handlers.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
