Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F3ACD4F52
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 11:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODj+ylHnGzdoO+gxBm3xvjPD6mYZvTgORbjZGB/410g=; b=dYjfl8M/XaAgGf
	QoOR6IJ2uUghpAWjoeSXUnhNjDm/bzd3CG76/eqhkHf6Yy5hwBMC59GA0iuGRakSGaI4261T0gq4x
	KFSaGMm24P4BVstzwTpQAj3yO7RFkYBBkMxcZtAT1ICkXp4CpXb+EZh4wU2/22r45QPxe/Swz2EmB
	a1iZxeAGP+IaTXaw5onlVCdmE8SNi/cLMQWAgcuUa1HB09kEFJFBbHsgHZJ2+5O1nOFwgqW4Zeo0H
	9aF2kAiuiQNlOATQh0XFSlhRe/RLVHylDy+h8j+hnc6rdPcw5yRYNquM94X8FKQpcBsfTKW74EDcR
	dGNQGcdBXLY3jT9ezWdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvmY-0000000FMzN-28jM;
	Mon, 18 May 2026 11:05:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvmW-0000000FMys-1S9p
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 May 2026 11:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/pVSe07C+oBTUCWlNEbbGEQrf5pQhGx3DMPEzrhy4EY=; b=H/p1AGkrc3yk18fWez5tZGWuDm
	isFNr4EZKe7U1U9/tYWzFw8stisj9muLUPdjst1+wFDlVx6djRGijIGAR6DI9jfhQtxZCH6nS/6LN
	oS7lIUdcr6KcBHAT8bDsCOJ7zO/2ALY3DxtERGb25RFbBJpOOsAyHug3OliSDSHd8ID9CwR8q2C9g
	tfuxnPN7FfQtMbZ6NlHJB0JI6ktr7QFT84VvLnZVOVU7XGlQDkO503+1VKNWkwE+UE08J9oQ3c8F8
	d5wa255TKmToRIWtIIxSYAI1/+lAYQ3I5gEesiNkeOBYwzoNHT9sFxFgsd6P6xveMgFbxTdQRtUQN
	yv2VD3ow==;
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvmQ-0000000As2G-3Neo
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 11:05:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779102291; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gn2kIEfJnwoF952tKIfQO+fHEYobNWlBLWQIaDUJeWYWQypX9jSEbCOWUpPb/leEkBY9al4eJ11RlgaSQBvGd3w173cP7TDy6vL1+nD4ctRkYU8Aks5ttibDg5vvsO2YW4eDoj9D4JmziR6INEHzpIZt5ct0k5DujzPpYvOrLXQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779102291; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/pVSe07C+oBTUCWlNEbbGEQrf5pQhGx3DMPEzrhy4EY=; 
	b=aVEcFowiZIDprVhADm7fZGpqCwnPZYxbEtRV8/vFH/Azr+aZiB/r1x6va0GYtgkLewSMFuZU8jKWmp4fbEVDFiqs53ukls/XpxSoer/KRXAnPfftsfjFBgzGg3uDTMXuDnRvZNro54nCJWBjrFQiZEWI0bx4K1qLisGmIuO/0E0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779102291;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=/pVSe07C+oBTUCWlNEbbGEQrf5pQhGx3DMPEzrhy4EY=;
	b=aeqFUWAFnS5fLHghxrKypEHX41FcGvmy7CmS4Y9qwzkJ1HBKqMHjY2DmaHbhlD/i
	wtHrc8CqRTdzTG+ZEKBvWVLTU/rjSMiIXiFl3qPePtLr6YH+2jZtnDwPx0++SfNDjSc
	iFkf+mY8g022SiT4HZhimDbc7rydzygZe/aTykkU=
Received: by mx.zohomail.com with SMTPS id 1779102289610999.3891060736657;
	Mon, 18 May 2026 04:04:49 -0700 (PDT)
Date: Mon, 18 May 2026 11:04:39 +0000
From: Yao Zi <me@ziyao.cc>
To: Chuanhong Guo <gch981213@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: add binding header for
 sf21-topcrm
Message-ID: <agryR7TRtYeILSeb@pie>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_120503_611478_190B4121 
X-CRM114-Status: GOOD (  11.33  )
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

On Sun, May 17, 2026 at 10:12:56PM +0800, Chuanhong Guo wrote:
> Add the device tree binding header for Siflower SF21A6826/SF21H8898
> toplevel clock and reset module. The header covers both clock and
> reset IDs provided by the block.

Would it be better to split reset stuff into a separate header in
dt-bindings/reset, so it ends up with a clearer structure? This
shouldn't cost a lot.

Regards,
Yao Zi

> CLK_ETH_REF_P is a clock name that exists in the vendor datasheet.
> This clock connects directly to CLK_PCIEPLL_FOUT2 and there's no
> clock gate/mux in between. An alias is created for this clock
> to make available clock names align with the datasheet.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  include/dt-bindings/clock/siflower,sf21-topcrm.h | 63 ++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
