Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3FBEDB7DE
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 07:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMMO3bBxsP1BqzNa+0XdkGzmzvF/DIYO5CtjHrK4S4Q=; b=yMCzchm4ymae4m
	sB0pltbyAT9P1jvA3noMFVCATVxghC3G0TOE8VGFokUPn5AVWawwV6E1Qs6fdCIaNDv+DYiSCOCoI
	scyumwB6TURLOPWcrIY1n2Cka0GR84M5NqTfJP4vuniixLRBxA8FqtVonUlN3R7q2mu36AnMsBXy1
	S5NsFih4B6qIdawEAqU8k/QHcyLZ0QPFsiBeCjalcdnx3sLjbbQCfCvIshwwpvZj2hP9FsH1gecXa
	UixyfjLGHk7B4np90UjNG4jjxOka0vgdZmfMBiEbLihi8JI98BE0YOjiJLSkw7eQ6L6ZgyfeE/58o
	RaIfObRvF7I0UJok0YJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA17A-000000065wL-1JRa;
	Tue, 07 Apr 2026 07:44:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA178-000000065vz-0qdv
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 07:44:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76A9342A08;
	Tue,  7 Apr 2026 07:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C179CC116C6;
	Tue,  7 Apr 2026 07:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775547885;
	bh=HjZP30bYnSmFP1+xLQFRJtHi+NfCFRTfqlk4yhxk9NY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TSQNJrh0F0gZTFwo+TmT4VSoYmwdye0MphJxYNt+pvFRgeFwV+QtE1B9gstV08AxV
	 JeNFOF7U3ErVbHFDzIpGRah44q5FjT2uQikbDaZJFLAmR0ZEOICEQRgTVoPyLJZrgD
	 x0XkWxrhykrxczdvY0iR5oAylxQDc32NFmUNRxPWVVrJz/ZIqIBn7H8JBixkyS/JB/
	 bzorod1Ffbp1615pJjx8BEvCDPpTT0Y6LKvDziVyUS46W1PkovVvwBR+q5HeF50q4l
	 YfeYvDv4x4OG0z95Q3V9+p2qq6Tan5MbtaQeGwDPABwrH1dz5+eN0IMquCt2Uv0Lp3
	 QzVe0PtCv3buw==
Date: Tue, 7 Apr 2026 09:44:42 +0200
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
Subject: Re: [PATCH v2 2/4] MAINTAINERS: Add entry for the UltraRISC DP1000
 PCIe controller driver and its DT binding
Message-ID: <20260407-gentle-warping-tanuki-0edbda@quoll>
References: <20260407-ultrarisc-pcie-v2-0-2aa2a19a7fb3@ultrarisc.com>
 <20260407-ultrarisc-pcie-v2-2-2aa2a19a7fb3@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260407-ultrarisc-pcie-v2-2-2aa2a19a7fb3@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_004446_278915_10670E5A 
X-CRM114-Status: GOOD (  13.35  )
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

On Tue, Apr 07, 2026 at 10:40:53AM +0800, Jia Wang wrote:
> Add a MAINTAINERS entry for the UltraRISC DP1000 PCIe host driver and its
> DT binding.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3fe46d7c4bc..c8159670a14d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20582,6 +20582,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
>  F:	drivers/pci/controller/plda/pcie-starfive.c
>  
> +PCIE DRIVER FOR ULTRARISC DP1000
> +M:	Xincheng Zhang <zhangxincheng@ultrarisc.com>
> +M:	Jia Wang <wangjia@ultrarisc.com>
> +L:	linux-pci@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml

There is no such file.

This is not supposed to be a separate commit.

> +F:	drivers/pci/controller/dwc/pcie-ultrarisc.c

No such file.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
