Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1369FCCD184
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Oct 2025 04:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxCCb4l8OT8SsG7IR+xGqmY5SUH0RiazBx1yeBoZAXQ=; b=Va9FRhA56N069B
	feg/aqZ9n8FcItjhczRULARkQorrhnPsC5PAUfXnJTisj18/F94xJQAiKzaYU2NMXO9LfN3/o8ZF5
	a8VxmO1DrOIDZcRwCJH4pYOcPComGJl2GHCobiwgydW6IVK3+Znnv8sEk3b0rHPs7sKPLpGMc7R/p
	syAi2koZnW9eRrYC5gBH3Z8ao8yLuvBILDiDkEViMRSw6zv4cFTfS2zp66+0wYW/MayfQCGCkkHxV
	cjG0MZcS7rtSL3CtqAQ7emRhk9AnaeawtsYhMjmZBG5CJw8+QWWjzo+Fk83e8+OvvEuGSB6DtvH+N
	oOdFA9xr8tpAbAbajVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9yWQ-00000009Uec-0oC9;
	Sat, 18 Oct 2025 04:26:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9yWO-00000009UeV-3LnZ
	for linux-riscv@lists.infradead.org;
	Sat, 18 Oct 2025 04:26:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C99F6601D3;
	Sat, 18 Oct 2025 04:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04702C4CEF8;
	Sat, 18 Oct 2025 04:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760761583;
	bh=MEgE0QRPhEEuk7tndh1iLlixQzBm8L9kEqydt7lrUeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WW4OQ5KKq/YUAx14hKAI1n6M84ZVfX7iqRTeZxivffvfBhaEKvGsHOzXsd81bxgwx
	 wsYxP4LAg9+QiY7xRo74GmxKOi1O0edebdmFhxb/Iw2HYC+LqNMQC/MM4AmZCsP59h
	 ADdGIV6f+SeLwqeWgGlaC9pQCzTaT3mIiGkJ1+dE3t9/pDBgiyNBY5R/nUTDMGXVSK
	 5+5bVQiCGCcnZxHhEAbWWz8abifKYN/GTIYYH5xjWKVT2p9yedgtdfN1Leu3bP/d6a
	 uvoKC/Gz03/2mKhg5TZhcyLUjLyJPbdhfv1PGTzD3x4/+uYEMajSkDerulS+OeNtLG
	 f5zlfIAEvYVRw==
Date: Fri, 17 Oct 2025 21:26:21 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] riscv: dts: thead: add more th1520 isa extension
 support
Message-ID: <aPMW7ZNjVjy/8Izk@x1>
References: <cover.1758228055.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1758228055.git.rabenda.cn@gmail.com>
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

On Fri, Sep 19, 2025 at 04:44:46AM +0800, Han Gao wrote:
> Add xtheadvector & ziccrse & zfh for th1520
> 
> Updated the commit message for the patchset
> 
> Thanks,
> Han
> 
> ---
> v1: https://lore.kernel.org/all/20250911184528.1512543-1-rabenda.cn@gmail.com/
> 
> Han Gao (3):
>   riscv: dts: thead: add xtheadvector to the th1520 devicetree
>   riscv: dts: thead: add ziccrse for th1520
>   riscv: dts: thead: add zfh for th1520
> 
>  arch/riscv/boot/dts/thead/th1520.dtsi | 28 +++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> -- 
> 2.47.3
> 

Applied to thead-dt-for-next, thanks!

[1/3] riscv: dts: thead: add xtheadvector to the th1520 devicetree
      commit aef6dc006696c20ccc58c4c0235a14e7b4b317a0
[2/3] riscv: dts: thead: add ziccrse for th1520
      commit bcc3b9c5de5e2a03ede1a8133c05255927d744d6
[3/3] riscv: dts: thead: add zfh for th1520
      commit fac4be7b3d49ae7e32d8ae523343d7fe790772f9


-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
