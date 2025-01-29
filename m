Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB7BC0218D
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 07:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2mQCilQFoD/0PpiriJzYRzUHjKeoLjuLY8XSGZcmAQ=; b=ZIDb/j7slUvygS
	pF6fFJaZgNewd33PhwW/g/fFQE2glEDI1cBiqF8ItfdE0BJt+ZARnZkvi+emPHy4L7DG9ybqnowWi
	OTsz5RmT4iH4MFQEnJO4pKsHoMptQSzFYZanZDpkIqp4m04oMh3mcBULyFjGSBVj6uOueeGoSE4pc
	a2JYQ4wczf90X8LL+6ejsFkaNC5qQHCwnarMFAb8DzVjng5g38FkZAVriDwxAxuTdV0a7cdlRsXJ7
	ZHjbZ2IP6sQZm+JZFBJoS4oRnHOpcU4rhI2uN0X78FdmLeivPGxgcWrOJjPgkjNiR85hMn2odygQL
	Ezb4wvFpxBw6DUCcvK1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td2Y2-00000006TwL-1aEj;
	Wed, 29 Jan 2025 07:31:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td2Xz-00000006TvH-3UoU
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 07:31:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A18965C57F1;
	Wed, 29 Jan 2025 07:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D90C4CEE0;
	Wed, 29 Jan 2025 07:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738135898;
	bh=vaLfSjS74gqgUZVZqpZI1Spi9TQQGJMrQAS15v1471U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VABuxuU27Ks/hWe7YYp/ddzQeaZDLN3UPkrl/THpXnuMyctbE5sHTHSnp3MeIMq7c
	 wwOZZQraoGbvTOTTEq+WvLMZlHXPrssFW575y1bCBArS2cx+jq++4Z9ON4RVa8sQ9Y
	 8+UPAd4kkoK5o1NVg1YB8j59NZk41qHAgg53gWFMc3VkWpGBmh8GZBvaroBFiWCs2m
	 uhYX127ozm/hK4TmC4DMrO9k4LqWhZd3FE6yN0jDSEh0rRqU/vEy906s0AL2mlgUin
	 zSA0AxA3ysKTJI86bJ2rvryAKDYcULXhPPVWxJsCTJ9CH1MSReCjuLntGyQ/6pLSsa
	 +zs3MzRpdeouA==
Date: Wed, 29 Jan 2025 08:31:35 +0100
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
Subject: Re: [PATCH v4 05/18] dt-bindings: power: Add TH1520 SoC power domains
Message-ID: <20250129-daring-tan-hawk-ffdc1b@krzk-bin>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194831eucas1p258522118b2f21abd8f6d4cdde277fe07@eucas1p2.samsung.com>
 <20250128194816.2185326-6-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250128194816.2185326-6-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_233139_973999_FD92232C 
X-CRM114-Status: UNSURE (   8.64  )
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

On Tue, Jan 28, 2025 at 08:48:03PM +0100, Michal Wilczynski wrote:
> Add power domain ID's for the TH1520 SoC power domains.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  MAINTAINERS                                   |  1 +
>  .../dt-bindings/power/thead,th1520-power.h    | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 include/dt-bindings/power/thead,th1520-power.h

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
