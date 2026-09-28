Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC1ECA5FA2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 18:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=siN995uHVEMriGQYCc/4y+dYeHV/hw8cTzrG6TnF5i8=; b=PRjFeEkxfC+FTn
	bLzzOpRuqifmC9OrKgE0kkTYtR5xjE/7t3hHYCVhp+csOh++oY0AwzTw1LhPysLhDKucsEoKWsc/j
	JkdKDQR0r9g2pM6BcSXAHKw/lPxmDb6VhpvRRUJG2BA/KFTejUrddE2H/oSHAmRC1h17AcVGmudLI
	GG7H0Okio43NtaIeW8K6M07SNBe07erFYBrdcxRA+7TQOJyiT38EvytBr/GYIc03mG54HftaQRw0w
	+vmS/5nRJ8Gqt9TNmd+YpI8B6G/trEkRJYkA7O1qi48s754XrlIY7vG3/bsGpKBq37lKdCA2cMRtH
	GgdEz6Yp5nOceRfU7lDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFgS-00000001GIu-0zUn;
	Mon, 28 Sep 2026 18:02:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFgQ-00000001GIg-2zeH
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 18:02:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D299B600E2;
	Mon, 28 Sep 2026 18:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 594301F000FF;
	Mon, 28 Sep 2026 18:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790618553;
	bh=7doqCw9sONY187zVfnBddDxjdMAo8jRbJl758NpeHj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VsqInaDGfyu3eBlOMauTl9QQj3ap1Uao8vdmqdM0sfnuxrAh4nBunFzLQjkZGkeVM
	 oElhYeF8PBSA9o5dF0Kswr0rKAIZni/kGUQmWFclltIsMC0igQ+OyB74MzPKmrrndI
	 W6vXvVSZgbrtc3LI73nHKDS+gzMs6fVvlaXjw3UI3rC4YqZ9So3aV0JWlH6Wb13JqT
	 CV1GoQdB4X2cWeLaW+Qvryyc0t+ByJbX2hqBJvSUTC1x7zmBkL6AN19MBp8UDKNvWp
	 NUEcH4qUgLITUBbTt1BUUOMOkKAAi5tlvoD6/0BxkHFHQuIse+vJoQnP3Kdw3Trk2p
	 GzDUNLRQVJUlw==
Date: Mon, 28 Sep 2026 13:02:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
	Bo Gan <ganboing@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Yixun Lan <dlan@kernel.org>, Guodong Xu <docular.xu@gmail.com>,
	Radu Rendec <radu@rendec.net>,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@kernel.org>, spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <pjw@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] dt-bindings: timer: sifive,clint: Remove
 spacemit,k3-clint
Message-ID: <179061855158.116521.9196507271431226216.robh@kernel.org>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
 <20260918-k3-aclint-v3-4-cf4fd4050e14@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918-k3-aclint-v3-4-cf4fd4050e14@pigmoral.tech>
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


On Fri, 18 Sep 2026 00:29:36 +0800, Junhui Liu wrote:
> The SpacemiT K3 implements separate ACLINT MSWI, MTIMER and SSWI
> devices. The existing spacemit,k3-clint compatible incorrectly describes
> the SSWI register space as a legacy CLINT.
> 
> Remove this compatible, as it never matched the actual hardware and
> has no remaining users.
> 
> Fixes: 6cdeb30db4d8 ("dt-bindings: timer: add SpacemiT K3 CLINT")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
