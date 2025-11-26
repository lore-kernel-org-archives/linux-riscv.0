Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E96D1038C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 08:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=slGOBit3dpgFQ8g2Bsjlfvyy+lSDcrIKsM+1SCDBipI=; b=qb9wTthjKA1hOA
	suuyys/zXrqP0TetzWHFEVJGO/sK00un411bKGs59woN4JlMdmfKcbyavINjM5NnpICnhND4GDNil
	FDEn8kP6XN4acPnfqb0hpeYskXyRnBBLFUmwk4dXK4owKO6Pkg4LH5LMqfjRLMjWdLf26mVP3fn6a
	9qRUqlNB8hj+F7Qt7WQxJ9r0vl2VYcNeqh1S/upmKvfCrZKDRoXkX/4YMZNYyNiU1bKHG5An5Rs9c
	FwWgWs/OvD4J+P7nryZdl/mZ4ez/WcuBsYLvVpG0ZfNwTju034faLSrAL7I0H23GisYWAphbeSPWi
	5VXMczXpNtxwfMhmzM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBFn-0000000EeJF-1qsc;
	Wed, 26 Nov 2025 08:51:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBFl-0000000EeIX-3AgB
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 08:51:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29EA643CE2;
	Wed, 26 Nov 2025 08:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71409C113D0;
	Wed, 26 Nov 2025 08:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764147117;
	bh=sWWyiBZaar1uNe7opXiUwYwGj0+GUqGTWFXLEk+AtH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7hAhgNEyilJ/cUmTs1janOEr65FLvpurCBnQ5CWdgvAmi/uJACNfCyjRmHqUod3z
	 mh8IokwGgvx0GtaqHr2XVnpmGQUHmIJYGmtv5ufU6qpuDfQouSbGhoK0Ez9vsr6yqV
	 Uqt+tQY/YpQgh11GDiDEzRP3ZDPz0lAUvvFfv4rWcr1BlLADF2pwXOpB+3sDRbOlrL
	 I/7vfwFJRJ972jVyNKY2U6JXcfVsHzv6ITSjDh7GYAkyqAE2OImVpniMvdTvCW2IbQ
	 XNeZQYtF0o4CnrXFDInLvvbYRXPnRwmC2lqcOPIZ/O9sVZZdQjrhdg96YGC8MjCEy2
	 8aK6jAWisyAiA==
Date: Wed, 26 Nov 2025 09:51:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH RESEND v3 2/9] dt-bindings: display: add verisilicon,dc
Message-ID: <20251126-gifted-zircon-ibex-a9f1d8@kuoka>
References: <20251126045233.218286-1-zhengxingda@iscas.ac.cn>
 <20251126045233.218286-3-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251126045233.218286-3-zhengxingda@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_005157_814364_5D993371 
X-CRM114-Status: GOOD (  12.22  )
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
Cc: Drew Fustini <fustini@kernel.org>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Yao Zi <ziyao@disroot.org>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 26, 2025 at 12:52:26PM +0800, Icenowy Zheng wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> Verisilicon has a series of display controllers prefixed with DC and
> with self-identification facility like their GC series GPUs.
> 
> Add a device tree binding for it.
> 
> Depends on the specific DC model, it can have either one or two display
> outputs, and each display output could be set to DPI signal or "DP"
> signal (which seems to be some plain parallel bus to HDMI controllers).
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---

You already received review on this. Don't send the same. Read the
review.

NAK

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
