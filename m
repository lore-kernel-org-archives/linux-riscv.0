Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14F0E8FDD5
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 11:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9l6pIBbAg1OlB3c9p3opsWP94LbWEgceNWSuyf8+ORM=; b=ix6FIq3u5Kflu5
	rdh1Q29bwsMomXB7TgUjQeRLVHApwo1YfoiUZQ6WUYJ8zvM9nQ1ETcdOc4PWCp5pZFPFTR4x3rISt
	PyupOzeL3zkdcNt86EP1llZZWfSbbjucUXM6sTS4r77rwD19tMxjR0i9NtrLkHxHIG0FtssoUhWVA
	Tq6NQsd1tLNPJjvn3/gMmM0d2QF9zD0Ge/SAhhYTag4g794IMxGWtlwX/tOgJTJgh5MpFz2uQB1+0
	IkK98iiq+Geq1oGVQlKcoobkvLiRQWgS2oar20YhaUG9l+3ucSp3L0ArzyNyFupIdxCB46wrKi8LF
	atD/xWFLw4GIrp/SxZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSAT-00000001sbZ-1Qq3;
	Sat, 27 Dec 2025 11:09:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSAQ-00000001sbC-2fdu
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 11:09:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D086944267;
	Sat, 27 Dec 2025 11:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3CFC4CEF1;
	Sat, 27 Dec 2025 11:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766833740;
	bh=8hBszxXVdm/Dk0txNhipsHcV7UwFW+dyq7Nqm04kZkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lsie1DXZczYyLYr2ib7sbI+8evcaDfKod6DUdAfTYEo53baGzb5dwqyeYhKQ/e6SP
	 Viv7v/REvqSD5610UuQTMr1HnFm+hqQD7IFQLPElDr74vyG4kez5zvcwEfL2GFXjQZ
	 Mil2UhTYN4cYNut5lTP+FagNRuFrDA3CM+04fZjNZS0bILAW+hXizBejj01C8Anhkp
	 ORQTIGD7gaq4V1Uujhv6rC4wqIeP22SinwMmbEXA8RxLumETLxrgAAEoRJWwz3KffX
	 CJFuZHQLo5fAtD41V67N0tAUmF6JR0psWh7R2FXcrrV1WVGjOA50tZbDLCpVXg9W88
	 7GeBU+7qdJagQ==
Date: Sat, 27 Dec 2025 12:08:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Han Gao (Revy)" <rabenda.cn@gmail.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
Message-ID: <20251227-tacky-corgi-of-inspiration-afffe6@quoll>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
 <FBE5FD78-D7E8-4961-BF13-9BDA0F840548@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FBE5FD78-D7E8-4961-BF13-9BDA0F840548@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_030902_714936_6190E9BC 
X-CRM114-Status: UNSURE (   7.29  )
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
Cc: Drew Fustini <fustini@kernel.org>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Yao Zi <ziyao@disroot.org>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 25, 2025 at 05:35:34PM +0800, Han Gao (Revy) wrote:
 > +
> > +            dpu_out_dp1: endpoint@1 {
> > +              reg = <1>;
> > +              remote-endpoint = <&hdmi_in>;
> > +            };
> > +          };
> > +        };
> > +      };
> > +    };
> > -- 
> > 2.52.0
> > 
> Tested-by: Han Gao <gaohan@iscas.ac.cn <mailto:gaohan@iscas.ac.cn>>

No, really, how?

Please explain me how can you test a binding (and build process is not
testing, otherwise we all should keep getting tested-by, especially
Rob!)

I don't agree on fake tags.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
