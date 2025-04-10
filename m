Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3BCC369A2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 06:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkuLds8Giu3gczZ4ZZ1iN3CYLy4ROHiYrqjNcOthoE4=; b=P09f/TBPGwA3ml
	kyXtWJJWhQUnunOjVzawcp6Q14XXaHHR+8ZRjBA1msbdETzVgv7FgfHPxrp/FC3Lj7R+Z//27jv3q
	2iLPVbBEuKqI7U2AR6ijyaxz/IKVM3qDBZpsSxWegFwiujV+zFLs2AfbEgQW4NE1Eqq9XV0RTZPZR
	pw3l5iOGRBysXmezK6dKfiu5QN2hrucPiC2Vk0U0NYQYpnWd/ba92mmvSvZz8Qzu5JmwhRh4QDKe2
	L6Bcb27IwZUWHbQw8oRayKNJgEpamN9SJrCYqQQdUdM4DzH9YGI3UR2uIMLtJewOmKGmR6kCmEVzy
	5zAM79FYU2x+TQHyvk0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lLc-00000009MMH-33tT;
	Thu, 10 Apr 2025 06:25:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lLU-00000009MLI-2kNY
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 06:25:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF63A440C6;
	Thu, 10 Apr 2025 06:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D1DC4CEDD;
	Thu, 10 Apr 2025 06:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744266303;
	bh=1FwJFZZV+T9ppebZoVGwufY4OlRNNCgK3lZ0a3DeEyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FG5d59u9iYwAbNz4wHa7L62q91qr844yOjhRnc8CHuAnKwhUS08nqsrY4Pk4oP6Av
	 ZsxIAQSQPyLrdI2wOalgsVzeYhsXNHSjx++wVACK0OyhJbXDSR6Xs7awwogV/4xNom
	 XY258v3N/o2exZlDcWINvzT1m+BCM63kA3j+BBH8TUZcgRUxmVPkVfrcWbqBepkB9/
	 9M4Q5Z45o/fdZtee848ILveYtT1+mdUyP/VRzNVIuewkfUime7+x8oR2ZNKwNZbXOb
	 Ea3lgdHk02ToN2AWXf14ki1XSAy40OncMVHaQOYjT+8jRnuz14RQV4Ui8g8Cj4rd6V
	 AZG3kNQ7o1lNQ==
Date: Thu, 10 Apr 2025 08:25:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, dlan@gentoo.org, 
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: soc: spacemit: define
 spacemit,k1-ccu resets
Message-ID: <20250410-radical-condor-from-hell-cbb910@shite>
References: <20250409211741.1171584-1-elder@riscstar.com>
 <20250409211741.1171584-2-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409211741.1171584-2-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_232504_731866_F4E1BC3E 
X-CRM114-Status: UNSURE (   7.96  )
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

On Wed, Apr 09, 2025 at 04:17:34PM GMT, Alex Elder wrote:
> There are additional SpacemiT syscon CCUs whose registers control both
> clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
> previously, these will (initially) support only resets.  They do not
> incorporate power domain functionality.
> 
> Previously the clock properties were required for all compatible nodes.
> Make that requirement only apply to the three existing CCUs (APBC, APMU,
> and MPMU), so that the new reset-only CCUs can go without specifying them.
> 
> Define the index values for resets associated with all SpacemiT K1
> syscon nodes, including those with clocks already defined, as well as
> the new ones (without clocks).
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
