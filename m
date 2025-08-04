Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164C2C87FDA
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 08:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGRUhIQ/Pg/6ibgx09hBYVdBrl6pAZkDQkBOqumVgEY=; b=41ZIJL36FvjS/e
	NGB06WO1BeP/dRJi4QSUaJZVfaWo+jru1YMXwSt1ykZi6aUFLLVUdw2vIRT6yL3ND68Lxok5DbzVR
	Y3mJ/s1UwGBwfuAWKRdkjFiHnFVdd9f202ubKtgpJrPINHsQMmYQYZS/hFbkOX7xj5hFl1bf14fan
	FyFJ56dMjuzfx+FS3AikfnNhaiVw+byJwRyVYDJYo2J8nBl68RCYjv9KFI38br9exiB8nW336NDK2
	nKPyPoJYonUS29xeqoxnAODOPeSoKo3yTwb6eCHBpQbGObSK81uI5p8Ez7HZwCm1WG2Tnea4WMo6B
	gNM73+GswC/imnhDDu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqlD-00000009ygB-14iK;
	Mon, 04 Aug 2025 08:41:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqKH-00000009upZ-2fci
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 08:13:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF0235C5AE7;
	Mon,  4 Aug 2025 08:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CECEFC4CEE7;
	Mon,  4 Aug 2025 08:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754295224;
	bh=pCWbIpgPnuJ09TaUynGKBB+FXSeY+nmvlXGp0GR0TH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ET0kbWi4qW25P3tOSoRFUOJt8XnZewHObdIlNJlRuJ94JG0NaRKexY4mnAszR7eb9
	 HINj0tgw+bxNToY652vYMX/Mz16SCQiPk8zSvlliMcyUig2YmYnBWzWBYsYNNlOcYD
	 GM5oyWDMRrHVmnV5q3w4k21Es90a/HEKWMJ4GSmvBh62t29rXrIfN6y7B9bS5NHhr9
	 f8UN7gt5ZStbllVTVemiz5gbv379G4AASRtQ+y1CEuYjm9qnWCJJcyJB/PGSiVgnCi
	 KkAG1QckA5nEKGM7E/4tg2nzatsLWveiqdzZMJZZMcnvqd30zEkG+fCXsH85QkYWDS
	 AaGn6zONYOsxw==
Date: Mon, 4 Aug 2025 10:13:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU support
Message-ID: <20250804-talented-chubby-caiman-9ed7b5@kuoka>
References: <20250801-apr_14_for_sending-v10-0-e85802902a29@samsung.com>
 <CGME20250801103106eucas1p11c945f612fcf56ad2521151962d745b8@eucas1p1.samsung.com>
 <20250801-apr_14_for_sending-v10-2-e85802902a29@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250801-apr_14_for_sending-v10-2-e85802902a29@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_011345_754484_55D64792 
X-CRM114-Status: GOOD (  15.51  )
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

On Fri, Aug 01, 2025 at 12:31:02PM +0200, Michal Wilczynski wrote:
> Rework the PowerVR Rogue GPU binding to use an explicit, per variant
> style for defining power domain properties and add support for the
> T-HEAD TH1520 SoC's GPU.
> 
> To improve clarity and precision, the binding is refactored so that
> power domain items are listed explicitly for each variant [1]. The
> previous method relied on an implicit, positional mapping between the
> `power-domains` and `power-domain-names` properties. This change
> replaces the generic rules with self contained if/then blocks for each
> GPU variant, making the relationship between power domains and their
> names explicit and unambiguous.
> 
> The generic if block for img,img-rogue, which previously required
> power-domains and power-domain-names for all variants, is removed.
> Instead, each specific GPU variant now defines its own power domain
> requirements within a self-contained if/then block, making the schema
> more explicit.
> 
> This new structure is then used to add support for the
> `thead,th1520-gpu`. While its BXM-4-64 IP has two conceptual power
> domains, the TH1520 SoC integrates them behind a single power gate. The
> new binding models this with a specific rule that enforces a single
> `power-domains` entry and disallows the `power-domain-names` property.
> 
> Link: https://lore.kernel.org/all/4d79c8dd-c5fb-442c-ac65-37e7176b0cdd@linaro.org/ [1]
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 33 ++++++++++++++++------
>  1 file changed, 25 insertions(+), 8 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
