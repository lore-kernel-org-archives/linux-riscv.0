Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CA1D11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 08:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xefZmZE6TD8nGVRwFpUYafBw5ixaEVlIYvIAubc+qmk=; b=dGEAn+SWIDI7Kr
	L2piR6JijoxMAgsLfLcD0zys0EJJ6V+YQLsKo9T1sQ+XLS/RY+srwrHkIRP5pw1hHBeXgJfwm+RQF
	9feGgqfqD8fKejdidC9n4ZvyaGDP3zeYBcp1jVcHkMuIeoN/DZsFIrwaerVO//Cam0/ziW4wprhWY
	Wwegp5sKrN0O0A86T6qWr7brzxfAh2+hgJ0c0YVvJsnVdv1RTTu4PAf+XTp05P6TjpsNNWHAzJOTh
	bbRQshhQ9nFfeAnDY1u7Ozg3V5f5Yi2d2qEHz92jhgAFspde5VvkGhCtRDY5xUixyK6CcpbQkGC95
	csZ9aADNNlL8LrutWbLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXBB-0000000GBvX-2LWH;
	Thu, 27 Nov 2025 08:16:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXB8-0000000GBv1-2DEi
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 08:16:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5645E43CF6;
	Thu, 27 Nov 2025 08:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2414C4CEF8;
	Thu, 27 Nov 2025 08:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764231397;
	bh=7Rk8c66XN0l5S5JcqfocJB+VVsyduUHmIjF/OJYBuoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UUCYiEdekSX2PWhfCLMIULcQHcP4/WhEX2i5W4RLlSVW3EJtunvYVIpBLFVEzABAF
	 pa8pfKrq48LJ9cpMaufKWR3CN+/XAK++dgXC8S8LTvaBXpN+myoh2VB/JuPcykx1Pu
	 5rFQDWBD1h5Wf2V1wgMljs7VsBYKPH52E+/FEHRoSPE3eREC349DNRyaZ21NGHCTYy
	 Z0aphyvPcpIe60YZHCqosrnFt+ENCXPfN4F12FPxzaG2rFttamel+xLo2VseZz2afy
	 /WLVFGgmlot+JXontYODJkGFYl6P9cFfaBOcdqyhYcLAuYM71cCazVKSzfvMfOcbFo
	 ga9TriXe7ur7w==
Date: Thu, 27 Nov 2025 09:16:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shuwei Wu <shuweiwoo@163.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: thermal: Add SpacemiT K1 thermal sensor
Message-ID: <20251127-tangible-chipmunk-of-economy-c0ff61@kuoka>
References: <20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com>
 <20251127-b4-k1-thermal-v1-1-f32ce47b1aba@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251127-b4-k1-thermal-v1-1-f32ce47b1aba@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_001638_585026_F044CE34 
X-CRM114-Status: GOOD (  13.27  )
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

On Thu, Nov 27, 2025 at 02:44:07AM +0800, Shuwei Wu wrote:
> Document the SpacemiT K1 Thermal Sensor Unit (TSU), which supports
> monitoring temperatures for five zones: soc, package, gpu, cluster0,
> and cluster1.
> 
> Signed-off-by: Shuwei Wu <shuweiwoo@163.com>
> ---
>  .../bindings/thermal/spacemit,k1-thermal.yaml      | 76 ++++++++++++++++++++++
>  1 file changed, 76 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
