Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C050CDE000
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 18:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lu+GG7DQhtyXps7cm2gJbPIEjuylIA0cRL7OZ2CXS8=; b=KLgr4FCxP+G/8M
	wX+4j/7vd/B2Vzj4jMwX6t+60lVdvMOu55ftKizm1mU5yr222l8rldunM+YpqYBZdlJILhy/TJ9u2
	gHP1y4SpMFrtNPP0MJizd/vOQVi2OJ82kFUwSi0YPkUNIwaxIGmg1bJ0uPRv0QGSkfEwIc4x+IHia
	uAfFkzRQqiaZNYOS4PWaRUzUkq+s4xPvBgojqsBm0uG3G6y7bbyOGqzBJp7C6JqyT1zCA2qKL2Olx
	hmICGlTbw77LYTssSnYSFIwK4hxR1Ze1SJ3fKsmWOGchCpIjK+aTDG74oIDXj5/QQ69/xV+Mn7hBB
	4gZETtnEWfQRpOuXTKIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoii-00000009fpG-2YgR;
	Thu, 25 Jun 2026 18:22:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoig-00000009fp7-2HH3
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 18:22:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D8F2560098;
	Thu, 25 Jun 2026 18:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0021F000E9;
	Thu, 25 Jun 2026 18:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782411753;
	bh=jV/CxhSLZpkprYeAM4FiNKChRpTe3EY93HVCDlSl8D0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=afFn02f4Qptbu2nMNuryfZzePXzJHLmPYhIL7C3htfchXwvf4ZSHBB5DICPiAzQZA
	 ZrfujR9mZSRcFuV/Tj7VAqFZF4DeDKpBn4RU8hhqosu9p8ySYQH8eoUjz0I2FGi8fX
	 dW7MMtFBnLTepSWVnV+gT219RZgfUxsS23h6ioXtQPpAs+l75KwOcNMC5KsCmqmOmE
	 f1e/oOrtpPVeeiKPtjBOZ9flR2Dh+uXujIU/wRBTdLi5XXkluzlzaThmz4LLtqdJPt
	 o4b50HZr6Qhlw7k7gJ39bddYwbCLm2s/N8SgPTHxZWafUNfxCGuUDC+Gn2CbdTJOAK
	 c9mSdSikl9fcg==
Date: Thu, 25 Jun 2026 12:22:32 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Yicong Yang <yang.yicong@picoheart.com>
Subject: Re: [PATCH] ACPI: RIMT: Only defer the IOMMU configuration in init
 stage
In-Reply-To: <20260625094702.11558-1-yang.yicong@picoheart.com>
Message-ID: <2d4310e8-2d86-b636-af4a-253c69bae0e2@kernel.org>
References: <20260625094702.11558-1-yang.yicong@picoheart.com>
MIME-Version: 1.0
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
Cc: aou@eecs.berkeley.edu, rafael@kernel.org, linux-acpi@vger.kernel.org, palmer@dabbelt.com, jialilv@picoheart.com, pjw@kernel.org, geshijian@picoheart.com, linux-riscv@lists.infradead.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 25 Jun 2026, Yicong Yang wrote:

> The IOMMU configuration will be deferred if the IOMMU driver
> isn't probed by the time. Make this deferral only in the
> initialization stage with driver_deferred_probe_check_state().
> Otherwise the devices depends on IOMMU will be deferred forever
> in case the IOMMU device probe failed or it doesn't appear in
> the ACPI namespace.
> 
> Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>

Thanks, queued for v7.2-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
