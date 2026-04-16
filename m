Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07ECBF8A148
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2026 08:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbRaFobrFUIJbzJytzNRoQFc9WBs+08XsXAuHZTfBsU=; b=iUkxA8E3DaoltC
	lz0Ldly1mRWN0iUbgg2lDipUdeLJ67e0U/4kWcjnMDqWcVWnGDMvRd8vw6ziVgbUd5hU7N4cFGZND
	6zpixHwCmdtR0SYf6/m6yhacMkVkpmXAbiyy1ZMrN25g3Yfc4PBcYoFjkFFJbxAzv+7DhK3xr7qfV
	+rWaBEfx61ERXYlxS2YGqfl7BYW4VR2aOEZ/qQ018qW4eHBkUZOKpFjEx4F89jKGRw7myqbUVYa+M
	0ICEjB22MWCU83e6ADrwqdv821ymBNJDXdgWOxvscv1b7/axloDGiiNcKRbIJg3hzbgaaDtbRArYD
	4Bk5Sn9v1hiwJQlc+DIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIM1-00000002BnT-3mx6;
	Thu, 16 Apr 2026 08:45:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIM0-00000002Bn3-18DQ
	for linux-riscv@lists.infradead.org;
	Thu, 16 Apr 2026 08:45:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72ED94381D;
	Thu, 16 Apr 2026 08:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47A8C2BCAF;
	Thu, 16 Apr 2026 08:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776329139;
	bh=TaoPdXb7fo2KgCWPj8CeI+oooRxf58FR1DvBmuvgJv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7Z+0Yf9age7mCvPKhi6JIX5mKtFxjPBYmtNuE5+fjCm9wfe0APcw4ZedpCeSHIde
	 f0M73lHdM4GlkQBKUkjsNnUqyBs5sI6D4VmVsEXacY7rmpUhxhnHpXW4FeCeDWGEc/
	 urp2PnQ7R9xjgBqWwQaOGOqC5+FL5xW8t5k6Fj4yXheHMiBL0oGdpPSO/7irWK+2Cv
	 Z0KVs4zOs30t0HLn99cTqNCaGoZGzFgVFXFhzoumGe/GjcE2UeB7AahNIPy+uzrkUa
	 loz1u9M37sAVaulwyKssray8vh6s0+1mFfJtsJr5Q4mXqeD9Cja7oPp25BjwlZcrOt
	 mvK8MoHr3vJDg==
Date: Thu, 16 Apr 2026 10:45:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: PCI: Add UltraRISC DP1000 PCIe
 controller
Message-ID: <20260416-pretty-rebel-bee-dfceba@quoll>
References: <20260415-ultrarisc-pcie-v3-0-73f06e972616@ultrarisc.com>
 <20260415-ultrarisc-pcie-v3-2-73f06e972616@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260415-ultrarisc-pcie-v3-2-73f06e972616@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_014540_324955_57B6618C 
X-CRM114-Status: UNSURE (   6.87  )
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

On Wed, Apr 15, 2026 at 03:21:18PM +0800, Jia Wang wrote:
> Add UltraRISC DP1000 SoC PCIe controller devicetree bindings.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  .../bindings/pci/ultrarisc,dp1000-pcie.yaml        | 93 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 100 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
