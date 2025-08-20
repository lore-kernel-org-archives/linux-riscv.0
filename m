Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08F5CA0EDC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RsHOZYv+8eD5dellpEw1X9/Rj7oG1ezDmGGhCLT8Y4=; b=Fn62tluvA1Mkg2
	074gSsiS0BG028QEyUzHNoNMg1ayBExvvD43YwYkkeB5goiU0FlTimaKyaw9qsnrefd9DcXfkNyV8
	pX5oD8a2hDjmbZznRYZkjHV1RheeHLLd35MVollu6YoYe+6/kFuV7Ryd/ek49g6V+FJSxOMTC9tHE
	TME+B42JLHpTeo9C64UHKORrJXOA37mUki71TzVZvtGu0baQ7r0OX4DWOA/13+GZUInCzsbQYiCdY
	/tp6CokIjX4wkkP/pNU4gLVgcPnjY5WJw5zwHF0V4UbUBIHuvV3u9mkO9tRTsvRhS+AJDTM2bHBaz
	L/t7sRDa7LF+umn9QRnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohUC-0000000DUWz-2rWc;
	Wed, 20 Aug 2025 12:00:12 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoh5w-0000000DQpx-48tc
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 11:35:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8F4E91A0D5D;
	Wed, 20 Aug 2025 11:35:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 58B9D606A0;
	Wed, 20 Aug 2025 11:35:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 658B71C22D8F8;
	Wed, 20 Aug 2025 13:34:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755689701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=QOHtLk5QqbgZtnm43GlNAZR0h56vCGCpRCGU58YU9R8=;
	b=Lsu1LkDTMPB1LU5muwhWVRn23FMJLNqKfUMsR9IDJHWjE45qmCxx5AP6d9b55ZECZsgZpb
	q9hc/A+lIm20Lru3taO2asF6l6H/8VyMy+Jum/cCxT2ReEVhkFLPRayceA0Qdix1PO4W5m
	gr5lQUmpUdJOlRtGpmwloQSI0I9fO65qPP7lXklBAtQVw0p08f1bi1F++WujW+Rs5+xTGV
	NqypZSpQHsuLa2kCClB4Ihvb2bTrT0sGGeYb881pGLbvQofXGZUT24IIxf2eLwmT/h0yRD
	4XXsx7oq8udgN9HrcROhny4ywakOpELNa1sr97A5W7qm6hufK1fy9+/QcwrSnA==
Message-ID: <3c8d191c-efd6-4756-9c71-109236d4c54c@bootlin.com>
Date: Wed, 20 Aug 2025 13:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 2/5] net: spacemit: Add K1 Ethernet MAC
To: Vivian Wang <wangruikang@iscas.ac.cn>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250820-net-k1-emac-v6-0-c1e28f2b8be5@iscas.ac.cn>
 <20250820-net-k1-emac-v6-2-c1e28f2b8be5@iscas.ac.cn>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20250820-net-k1-emac-v6-2-c1e28f2b8be5@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_043509_176378_9114ABB8 
X-CRM114-Status: UNSURE (   7.47  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Vivian,

On 20/08/2025 08:47, Vivian Wang wrote:
> The Ethernet MACs found on SpacemiT K1 appears to be a custom design
> that only superficially resembles some other embedded MACs. SpacemiT
> refers to them as "EMAC", so let's just call the driver "k1_emac".
>
> Supports RGMII and RMII interfaces. Includes support for MAC hardware
> statistics counters. PTP support is not implemented.
>
> Tested-by: Junhui Liu <junhui.liu@pigmoral.tech>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

I've read through the driver and it's looking good to me

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
