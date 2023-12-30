Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC12BC46CD4
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Dec 2023 01:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQLTcazes1g5QOqf14t+sGkyXy0+GKOTDoxgtWjjaNM=; b=yL5yGHs6GEIZAn
	CFH1e+l4LWw6OA5NyEpW8Qrcmb1E65RnvDOK73CxNYz3mCqSXxEzlLZKBKmmfNztuNwIdz1ergngv
	xUuMjtGCZMvWlIDln12wNdEWBt4Q+wacoyPVCQmC1p7Puh6QbxoDSjCxDwlq/T68yGF4fVGFweUkv
	/5JCSXeGAnAOQ+FchjBZqB8T1T4y+gSkP1EE1PxQ5+Aq4C5oKsfxdzIJNhsWxd8GHpl4DvhNmAFu6
	D76UlWcN8diVBykeut9n5qU5tBFxs4yRxCuwmf9Upl3RxagXZNmDV/NHOnP04OjJlo+NuunVzeXTs
	HypXw7sDYjJA/3CTTqgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJNnb-001tbl-27;
	Sat, 30 Dec 2023 01:05:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJNnY-001tb1-2G
	for linux-riscv@lists.infradead.org;
	Sat, 30 Dec 2023 01:05:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9E409CE1885;
	Sat, 30 Dec 2023 01:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092E1C433C8;
	Sat, 30 Dec 2023 01:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703898352;
	bh=UqF82yKjdxpOQCyUaobw/f+fNPUpUKAx3pqoyiDv+qY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1qQxJJqF2CRYgnKIpyN6zbyJT5C61o/eowepp1eUWpMTehZzi3m+HNqKO2eMTpnx
	 qdBYTOTKkWuNy9eiq8h8JKb3BvKuLXlU8h67QSrLdFNiydDSGeTRqYP3nP+Kopui1K
	 3BrzBrt/gq+UGuA99jNuVpsAm3STK7bzHlm1lnYULtgG1QBZnS/oiy3fgMqMlQMjEl
	 /GLTYBH4IAyB6r/cT+juIj2r31OFoXUDfILk6LgVFjP9uhvqq5d/llJTEHaOVmlUMq
	 MScY9xPpQMHfrq+RJJq0DRAIVSZ7upGn+19+AxL3DOg3+SBM+yKfh9WT0EswFqvnOP
	 GjV+NpZGuTKLw==
Date: Fri, 29 Dec 2023 19:05:44 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, bjorn@kernel.org, charlie@rivosinc.com,
	ardb@kernel.org, arnd@arndb.de, peterz@infradead.org,
	tglx@linutronix.de, Vincent Chen <vincent.chen@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Baoquan He <bhe@redhat.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Guo Ren <guoren@kernel.org>, Xiao Wang <xiao.w.wang@intel.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [v9, 01/10] riscv: Add support for kernel mode vector
Message-ID: <20231230010544.GA770@quark.localdomain>
References: <20231229143627.22898-1-andy.chiu@sifive.com>
 <20231229143627.22898-2-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231229143627.22898-2-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_170556_941430_EE5CA408 
X-CRM114-Status: GOOD (  11.52  )
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

On Fri, Dec 29, 2023 at 02:36:18PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> Add kernel_vector_begin() and kernel_vector_end() function declarations
> and corresponding definitions in kernel_mode_vector.c
> 
> These are needed to wrap uses of vector in kernel mode.
> 
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Reviewed-by: Eric Biggers <ebiggers@google.com>

> +/*
> + * We use a flag to track in-kernel Vector context. Currently the flag has the
> + * following meaning:
> + *
> + *  - bit 0: indicates whether the in-kernel Vector context is active. The
> + *    activation of this state disables the preemption. Currently only 0 and 1
> + *    are valid value for this field. Other values are reserved for future uses.
> + */

The last two sentences above can be deleted.  Bits can only be 0 or 1.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
