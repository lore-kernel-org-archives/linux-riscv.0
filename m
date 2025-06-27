Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009E7C7EE30
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 02:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYRlsNO0ykrpjQ14t/nor9qWj1b0hkeAUaFCL7XpqrY=; b=dNVpABSc7uhKnU
	7bvL3N8e0eHR8bW6nJkmarwzTM4FKoCz7qQ4KAmmfv6YRF1epQQGjl9C2KMIeSHjci13c5ltf/f5n
	NwIhZI+u8bFLgzaRkVK2cE3gsQW943mcmf+sr21AQAu0bQ63CtJx3HiM0PM6UDR4SY0/mB54D1jXw
	vPaY2kU6xjOJCrd1O3GBQ4qw8tltm0E71slA+63kJrcpBIvueumsQ+pY07g0+vGX4ycjLakQWlm6r
	PWcvKqwSrRXmSeWTbFtth/BhiyQnvKYACqFxZ/96EUDMS4d6Kn/LYL7LcIHQIKd+uzchfJdDy6Lr8
	+5ZFKpsURDJ3gUFVYipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUyzc-0000000DMkY-2C8U;
	Fri, 27 Jun 2025 02:39:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUyzZ-0000000DMju-487M
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 02:39:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 19BECA52140;
	Fri, 27 Jun 2025 02:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DF7C4CEEB;
	Fri, 27 Jun 2025 02:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750991944;
	bh=GXhtp+iymbshimIYRdDqgXF96BjgA479pHwlJ8aPRro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oWcDR9CjVvOaP7EncINx6t77o2KqLpnPp44cOGNHNhTkYqrZi3ERYbfCIUpqd+CmL
	 NhMl3iqFo2yk3Fd1OSSJqaylWAvSXrv5PjkXbo25J2VXOSBT4jr8B6dMQPi8MKVN43
	 VjOeXjW8ORrVEI+/pV1g3JK9K6R/FqjJLdRI914rCkur2X4+Z4ZtVMcKO5kI8/il58
	 A3HizFIBhljre1jTIsZrALsI6y8WaVutzfIkUlOM/IpLKp1h/lnEsn0Xi2DXPWnFf+
	 E/WLXW67IwccW2kRx3ghYtF9JWIJLa2Ps7mquS7useYGf4Kxm2WsDM/ZpMZ2LiSeDk
	 l5nvi2atzHIfg==
Date: Thu, 26 Jun 2025 21:39:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, paul.walmsley@sifive.com, conor+dt@kernel.org,
	krzk+dt@kernel.org, dlan@gentoo.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alexandre.belloni@bootlin.com, alex@ghiti.fr,
	lee@kernel.org, mat.jonczyk@o2.pl, spacemit@lists.linux.dev,
	guodong@riscstar.com, broonie@kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	troymitchell988@gmail.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Message-ID: <175099194313.1647535.17793298958776531103.robh@kernel.org>
References: <20250626141827.1140403-1-elder@riscstar.com>
 <20250626141827.1140403-2-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250626141827.1140403-2-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_193906_087072_500753FD 
X-CRM114-Status: UNSURE (   8.65  )
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


On Thu, 26 Jun 2025 09:18:20 -0500, Alex Elder wrote:
> Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially
> only the RTC and regulators will be supported.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
