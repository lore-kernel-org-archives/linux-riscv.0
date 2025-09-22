Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B4BCA100F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 20:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bnQu4g1RVrAduSZRjIGGRlKk1QTyZSpsPB6RuMBXx4=; b=HJPYSZajcbgVCF
	qnEXS1tSZ7vNOONBbmJbr2HfIahWT5TV/J26xbB8/2kDUuTVQbSBiosV7wl6qM4aPyRTpYsJQAbew
	zSl+vkQ2b1SEtXVuodwiM2U4D+7KTNJ7CEqwdJbdFpDhoGukFCDkBJ/x7GfUabbgF3YdWD0uTJM+1
	YaGZGhpqoelkyhbI1DH0H0KQXqYnnUv+L7DyRD9n1bmCbiuT5AL/pJufOuUA2+3H48flWTqa2qazD
	nufSzcYgZY3PZQWBalr24gq2xiF9VMl6AFwTR+ooidaC2WChTD9YDo8B7X6Mg72Z7orCbClE6GAlI
	Y8+YO8GB09QhlTnJQs5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nKA-0000000BT9F-37N1;
	Mon, 22 Sep 2025 20:39:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nK7-0000000BT8f-3m65
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 20:39:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7474340048;
	Mon, 22 Sep 2025 20:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F755C4CEF5;
	Mon, 22 Sep 2025 20:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758573587;
	bh=OX8R40WQ5HfJwHkclKJ5GlUpDaTEdb1/b83kLRNMddQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZxBdiC86CBjW6F12t+dS9d/oWdtxt0F/+pYhSyLBw9Lw3InOrxNJJ63RJvfFJKjOs
	 lVenwO48aeOBY1qPv+N9bG+GSYaTAOChabkmC8Y71W2t/DG9FjHiIuznG7eKsL8/XN
	 c1XAQyic4lA+k+XrJqI400TLwrPCdSJaLlhacTr2R3Eq9nYQZWUz8w+RBHBk2cEGJj
	 p8KquiYW7Ry6AwG0EG677kae11rFKhehA419PnEkdKYz6Jz1pMT8m7l8J4LXPioNn7
	 RTmqPFaPp+f66Rw+TzcBGFjbDEW2/nqwBHUBzmbrKGC8nkHoGINRoTBYxQGZJYsd1l
	 jPPhHqjEPnwVg==
Date: Mon, 22 Sep 2025 15:39:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Maxime Ripard <mripard@kernel.org>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>, Han Gao <rabenda.cn@gmail.com>,
	linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org,
	Fu Wei <wefu@redhat.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: vendor-prefixes: add verisilicon
Message-ID: <175857358584.1289867.6423910030658494918.robh@kernel.org>
References: <20250921083446.790374-1-uwu@icenowy.me>
 <20250921083446.790374-2-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250921083446.790374-2-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_133947_961222_9D014C88 
X-CRM114-Status: UNSURE (   9.69  )
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


On Sun, 21 Sep 2025 16:34:39 +0800, Icenowy Zheng wrote:
> VeriSilicon is a Silicon IP vendor, which is the current owner of
> Vivante series video-related IPs and Hantro series video codec IPs.
> 
> Add a vendor prefix for this company.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> No changes in v2.
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
