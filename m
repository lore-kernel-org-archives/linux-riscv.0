Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5C71125867
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 13:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPN4ru7HJDR2DCZvbWz1eUCEElLeRwXfZZ7p0+OGQC0=; b=OyUEUQASXfo2Au
	CZBvcsPQ9rRIJ3I1zdQLlDegluLEnFWZBmSZMpkufcDXnW/Reh3V7ncmlOsTqahg18bVxDKVABZyi
	HNgR3D9sKAjvk4t+RsPHQZYpissxMO8ZRzlIcmcmhJBKTwzc7yVKuQqph9BSITkhWSFH9BrG0mLyV
	1LtGhwiKJwtMdmohlDPMd9GCV5lFa1F7/pgcGDgJp1VngzDBHXEWO9lEfPv0msvllKZrIstj1S+qW
	yz9DFxWnclG8AqbWeAkF0UtTFJMPOoyxuGlMcH5Z1OALGN+80S93Shw2wYPQWu4hNCyvQE+Njbizg
	YpQZ7GW3qLhivtUsNUoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gMb-0000000E9Uo-1wrZ;
	Thu, 12 Mar 2026 13:46:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gMX-0000000E9To-0Bbi
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 13:46:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 498A443DD8;
	Thu, 12 Mar 2026 13:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02077C4CEF7;
	Thu, 12 Mar 2026 13:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773323164;
	bh=tC35RsqzjjyjLf2nIHQplQZOFFuOpKdWewHzucMI1eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zy6/l9zc52C9xgXBMrB6UV75iyXNovk2H5Zm0OE+TyNEhtB41TFudk358k8AO0SZD
	 vOCAVQIE+vfVZXeTMamdhZteKoxjEDN9q9xDtrEqaQfxLhnYQbHymtSd6ht5y1hYJc
	 v63rfBL4VO9SwrkF48v6qyvHeNusIhSAKbb5gZ/qhMwHydJ+QnBdYrDSI6HmdqZ1aR
	 ZtYQtCvTz8uFeaHCQvUbT9wlcKfUsuE/iDpwUOCntRqf0BjbR+sWqab3TNYEgtryz3
	 70Mav9Y0zzb84nHcsB1GrF7sp9GRNaVebIckcgcB0R8YV8LldCY3wzLXVdJcfFG4LA
	 Kqsd49j7eFqIA==
Date: Thu, 12 Mar 2026 08:46:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lubomir Rintel <lkundrak@v3.sk>, linux-kernel@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	Guodong Xu <guodong@riscstar.com>, linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: serial: 8250: spacemit: fix clock property
 for K3 SoC
Message-ID: <177332316270.2898009.16159680813861530459.robh@kernel.org>
References: <20260304-01-uart-clock-names-v1-1-338483f04a8b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304-01-uart-clock-names-v1-1-338483f04a8b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_064607_106783_60CBFC94 
X-CRM114-Status: UNSURE (   9.52  )
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


On Wed, 04 Mar 2026 07:19:39 +0000, Yixun Lan wrote:
> The UART of SpacemiT K3 SoC has same clock property as K1 generation which
> request two clock sources, fix the binding otherwise will get DT check
> warnings.
> 
> Fixes: b5024e804ee0 ("dt-bindings: serial: 8250: add SpacemiT K3 UART compatible")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
