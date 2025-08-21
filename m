Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8A0CA0EFA
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 23:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AcKRyN55f0acdmCaMyKvbtTGlyyNQOjg+AQwfkuJcbs=; b=pbtn7fThNy1nvy
	qwbjzR6ClkUZsYKDFwjIhr+4KLsVsFcQzayExce98x9bb7A/9sUp+k0dTaoX9sb8zb3mnhaME7XB/
	m5PxRN1ClnLUVnmJwIEtuBuYh10sMPl0WZ6/GsFalYLZW/17RaODUgA0H01u4rG4cYOgEeXETSzj8
	IrWuFtORmrRsq3myOSgCiIO0uzrdf61iqAMfI3p200ivlH4VleIoULvCYCuFFGsEPEUo6ATlDE1tj
	vd9Ox0MlL/DRqWWwRNAsrQw+MHaYVe2CDS8glPssAaoRhx6H8xzipXWfR44vqCq8BnoGtF6BgOHM3
	nl82RaZ6BvHdiMMcRZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upF8z-00000000yrf-2qzF;
	Thu, 21 Aug 2025 23:56:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAhG-00000000EFA-3JXe
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 19:11:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AB3343289;
	Thu, 21 Aug 2025 19:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1406EC4CEEB;
	Thu, 21 Aug 2025 19:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755803498;
	bh=uBeS+0q2RfC8E0D72PJXd2iaXb6wfvh3yNZW4yspKXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kijUHdnTxV825tQwAxz4HfPtuqm6T0T+mT+WxRjh/D7F4OUdxWHIfltQsGl5ykAOB
	 dXLvFBd/jI8kX+UJG16ktu8W7D9f+gkrqrFbriO3Oe48JBGRD+2EpCBU/i6KHtzVd2
	 0Om7167ANP4ywCiEhnqwinj5Veq5XWFDPajsolGuZ6y8iO7SzWG4yIRs28/yGby88H
	 0pRNAk3x5WFGhkPzdp7exxe4YVURRBcscfgz9Yq7RvxLlHWJmQIaCY0Pjlv5/RMCCb
	 7g5PwjDM38OaRPoQyON9bTGWdg997vY5agkQO7th9cFDBBZQ2v5yLSAZCfexeNGx/X
	 Se0dkqW6SCUpA==
Date: Thu, 21 Aug 2025 14:11:37 -0500
From: Rob Herring <robh@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] dt-bindings: vendor-prefixes: add eswin
Message-ID: <20250821191137.GA421206-robh@kernel.org>
References: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
 <20250616112316.3833343-4-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250616112316.3833343-4-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_121138_845620_2F2FC9A1 
X-CRM114-Status: GOOD (  11.24  )
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

On Mon, Jun 16, 2025 at 04:53:12PM +0530, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
> 
> Add new vendor string to dt bindings.
> This new vendor string is used by
> - ESWIN EIC770X SoC
> - HiFive Premier P550 board which uses EIC7700 SoC.
> 
> Link: https://www.eswin.com/en/
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

I applied this patch as 'eswin' is already in use in several bindings.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
