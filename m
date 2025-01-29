Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC412C02192
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 07:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1bs2ibc0LwnIwE3H8Bw3aoh7EtpSAZQnO4j8bGyrBo=; b=I3FUTTsAfGWtqg
	9lQoCvahHMYT375hd8xEV9U3Kg3CcC3od8J44kNBpIVvEGkTeYy9SWfJ0P+ZaTMamTTApAMMxEehS
	CF2/9LaPFFA9UN0PBmfHguK6SJ29M/C8byoZ2110Xnwg5C5kHEZCTNe8UxSGmJb//dQbQORoJKYOg
	kdxCY2wbvtZvmK2bTDZzidzaWas/MQ8twWUNbGnWW0wNb5Lcq/A1754sJdMuEctJrSBEzZLouOTvV
	y05F95x72/ukVpv9YnBZon8Fa3BFLhdYU+nzHwLoOb7oSerRNESEB9pLJtGkjXl0jbfJn0S/jgUmz
	GkRcKNZObugn/XCOGviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td2Vz-00000006TVD-3RNn;
	Wed, 29 Jan 2025 07:29:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td2Vx-00000006TUj-05R5
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 07:29:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 134D9A40249;
	Wed, 29 Jan 2025 07:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9843C4CED3;
	Wed, 29 Jan 2025 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738135771;
	bh=DXSINqkmFSvNXZ9ZgNUdpFLZfOy0cstu/Nnpuqu30vA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XbAqTznqG2RKyauAP1Wo2Hfs0x+2I4RrU4O0/QclXgYFjHcLHbkvro8MU29Md7BgN
	 4EKO6LxIPLbNhal3n0geqjJZcHN0QTKRzx4WAmz9QiT5oP0YvRyGegdHt8rLjprf8N
	 QuldEFKC0Q2l1InZM/Sf8nqHe8D5OaTfX0odhd5Lfs65sGTzmTVlNrsThkgOCG4b88
	 jhBEEQEa4K0pcp+iIqwr98ddocM5ECQZ1LWvaiqI+qSPQlOM1QNriV0RkSmG4RZa+X
	 RLOGYDqnfVVllxCcZNDUNpDz6T0QkxcX64DI5hJS1WfeAzZJbnVQD+jKSoyE1A5X+E
	 Z1jGiHO/+CTxw==
Date: Wed, 29 Jan 2025 08:29:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org, 
	jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 01/18] dt-bindings: clock: thead: Add TH1520 VO clock
 controller
Message-ID: <20250129-outstanding-golden-taipan-d3fff5@krzk-bin>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194826eucas1p1b18e5af64e66b06da985b194d022273c@eucas1p1.samsung.com>
 <20250128194816.2185326-2-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250128194816.2185326-2-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_232933_121128_BF8EF9B2 
X-CRM114-Status: GOOD (  10.66  )
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

On Tue, Jan 28, 2025 at 08:47:59PM +0100, Michal Wilczynski wrote:
> Add device tree bindings for the TH1520 Video Output (VO) subsystem
> clock controller. The VO sub-system manages clock gates for multimedia
> components including HDMI, MIPI, and GPU.
> 
> Document the VIDEO_PLL requirements for the VO clock controller, which
> receives its input from the AP clock controller. The VIDEO_PLL is a
> Silicon Creations Sigma-Delta (integer) PLL typically running at 792 MHz
> with maximum FOUTVCO of 2376 MHz.
> 
> This binding complements the existing AP sub-system clock controller
> which manages CPU, DPU, GMAC and TEE PLLs.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/clock/thead,th1520-clk-ap.yaml   | 17 ++++++++--
>  .../dt-bindings/clock/thead,th1520-clk-ap.h   | 33 +++++++++++++++++++
>  2 files changed, 47 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
