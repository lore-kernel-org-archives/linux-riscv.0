Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B20FB5EAF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 04:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78dAHdTRZAAswBsuro0yHbKOVs/m3eeKnPYREjka8S4=; b=RKxA+3SxH/lTBC
	JQGq47E6ZxE/fBlcZvsR5haG42q5vdWl0YgpojDk3DGbXVd8f+jjDJzKF33taYXK+emPJ8j9lVZBE
	bXq7o1WmeTvTlUPV9GWJNd0Ti9v8xXHHCYhv4td4HAGoLIOSwf0gystkteVPRk2xflt0Jb/pfkEo6
	C2MPepiL5U8C6Kq1rpF1F3m1gfqgK14MzPmiYMv72m9uXeeOIQaNFMLzl1MzXgo4hhiGhaP4jljaS
	DBiwOIOGcalvQVYoxknrSxggHc6TGrJsWKV2YVFuHWGhXq9y/E3uI8njYbEzlk6xJtYVJuTKeMif/
	MW091CS87TQo50TNvrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2MTe-00000005Pul-29JW;
	Tue, 17 Mar 2026 04:56:22 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2MTb-00000005PuQ-2l0G
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 04:56:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773723375; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jv4W65Eez2XeH9G5ErU/Y8ESdtUVdFcY98YBU6VYVL32MAvWA/3o27T85GNglxfY2zG41dX/1h1hNF5YTjeGZ48TSDBQfbccolxYkJAAYFoT34Ex0ruvdCTbhoA52dl1xM+qj7xaeJ6Ni7I6ygbEzbFDtY+WPg3uZPvV5IddfB0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773723375; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/T2hb2zDBTYyx2qNSAdWht261iTUJecScL8CnM2TGvc=; 
	b=A7hfPYMKt3xQ9cT30L5UCrgV51YbBzJ65/x1qGwdJKViu9iGhnyRCLOKyvaS2w+skFbalcWM4FVCcr5FF8lJ/uYt4K6HJH0xyeV+eInKQ5fI0MGPFPiYhbh/0zIde7YtlY8BULUGRE1iesyDRkQ3YvWGg6GhZAxTtSaUU86JAHw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773723375;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=/T2hb2zDBTYyx2qNSAdWht261iTUJecScL8CnM2TGvc=;
	b=WPCqwGLghg4ELnTN0tR7SEMkq0yPRX/HCjbLCRFxu+Qmz19wmBt0P3riww0KuAZt
	4V8bMeGnXDyQ/GORqiRq5XpdtTklmon8PRTyzj+3OwG4bY0/BcQ1VozmHv5sZbg4lph
	feeQ9VTh3/e1bb9HtSRuCMlB5WMO0iyMmccY1Vi0=
Received: by mx.zohomail.com with SMTPS id 1773723374200302.13921499108164;
	Mon, 16 Mar 2026 21:56:14 -0700 (PDT)
Date: Tue, 17 Mar 2026 04:56:07 +0000
From: Yao Zi <me@ziyao.cc>
To: wangjia@ultrarisc.com, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: PCI: Add UltraRISC DP1000 PCIe
 controller
Message-ID: <abje5wWCljOBhgHU@pie>
References: <20260316-ultrarisc-pcie-v1-0-ef2946ede698@ultrarisc.com>
 <20260316-ultrarisc-pcie-v1-3-ef2946ede698@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260316-ultrarisc-pcie-v1-3-ef2946ede698@ultrarisc.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_215619_744754_F9EBAC9F 
X-CRM114-Status: GOOD (  11.11  )
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

On Mon, Mar 16, 2026 at 03:06:59PM +0800, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
> 
> Add UltraRISC DP1000 SoC PCIe controller devicetree bindings.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  .../bindings/pci/ultrarisc,dp1000-pcie.yaml        | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml b/Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml
> new file mode 100644
> index 000000000000..b50ff98dd878
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/ultrarisc,dp1000-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UltraRISC DP1000 PCIe Host Controller
> +
> +description: |
> +  UltraRISC DP1000 SoC PCIe host controller is based on the DesignWare PCIe IP.

If so, you should probably refer snps,dw-pcie.yaml to avoid
some duplication.

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
