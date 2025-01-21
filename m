Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0E7C02185
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 10:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Y7t8+JVduHTtWy3fovxLIioj1aMesDWxmvJSqjqQ7Q=; b=u7Q3oeFzoTuGFc
	7DF+1k+FFuVSxeFaQZWFBme0cPOQ3r4UiybgtSuk/8Bw+7ItGlW4LBY3HL3z5KhTSvLHr/GyOniFb
	NaJQTnBATx3AawYRrdwMs6W9Ck1CZOo7KgdHPt9qqRhz35UEBYebIFdd2ozv9b7g//pCb8Ju8H42B
	vNTja1QnO5LN9uaiUWByE+dKU36Dt9d/R9Xcpt84rl9RvnmBWtrDIQjxogcKb/MiRtjA5MHRQV71F
	8QKEiQ/UY/cHMCWCAmwbbynD2wymxwLmi0qX68uxPn/GnSdhs7td7C03D0z2gMTOSzsICTR7jLtSH
	+oSNw+1WigdjEq9AN1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBCi-00000007WtO-3ZiC;
	Tue, 21 Jan 2025 10:09:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBCf-00000007Wrn-4C2X
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 10:09:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E6BD55C108B;
	Tue, 21 Jan 2025 10:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1A6C4CEDF;
	Tue, 21 Jan 2025 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737454189;
	bh=iKXCTaunJbbRfM7uFpg3sysGlHLpmUBaQn4ftpbByNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a4vNfWTm0j9rRNxhZuaSage+sdEk8JCmjCoa3wLc6Z5/AfCSE/L5DZ23foA2UuP/8
	 eZXlut+CC8hHE5fHnUGnxVpiAnr89DM+5ZjN4NZIPc6x9HL5ibNUtdeT6Oj/qTQh4G
	 ruzNd/xMzX95yJ4RDyU+foZRT3hi1ioh3dngg/tOtyEFUlhhMmFNRUatah7N7TdsiQ
	 X4Sw3QA3SvgmLclgpjef4/V9xq47jdsGcY9TNc+VyduufFh+1IZM5ijEiUnRHFmQoU
	 Ctics4OdqCYxK3KkXTIU6egITiZsI7F/SNS7xUid0gegywWRk7zX92P+2sD07bXnUK
	 x2vhHUKEuLTDA==
Date: Tue, 21 Jan 2025 11:09:46 +0100
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
Subject: Re: [RFC v3 10/18] dt-bindings: gpu: Add 'resets' property for GPU
 initialization
Message-ID: <20250121-thankful-discreet-hawk-2fdc26@krzk-bin>
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172133eucas1p232c85cb934148427e52dd939c974a82b@eucas1p2.samsung.com>
 <20250120172111.3492708-11-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120172111.3492708-11-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_020950_080461_103C2045 
X-CRM114-Status: UNSURE (   9.75  )
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

On Mon, Jan 20, 2025 at 06:21:03PM +0100, Michal Wilczynski wrote:
> Many RISC-V boards featuring Imagination Technologies GPUs require a
> reset line to be de-asserted as part of the GPU power-up sequence. To
> support this, add a 'resets' property (and corresponding 'reset-names')
> to the GPU device tree bindings. This ensures the GPU can be properly
> initialized on these platforms.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
