Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94AF606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zLtlPg9k;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=W56Kaq5f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2D+q8k+xAUu/xBn215al9ORVHV8dAzf+OHw+Qmv0yms=; b=zLtlPg9kjZPC3gLHacJ2CfDMj1
	3ID5TBcs9h0gPYGvt35K+jmUtqJ0Ly6SZDThplO966wlboIrXXp5N236vCPAIW+8RfZMGOzh0gTUk
	qwydxvspizqHG9X6T1O3mIdAq5xN8sStUlFWcworbSOI+VmgIsKEgATq1e2tBJvEM52ItZECzGTHS
	Pm/WAFf6/3tstblIcNItxWCmKTH00tnY9to8/S7jzi0G0tbzT71Pl57YE5jwGJDsb61CbWYz8plG+
	gd0X/+ZAvVDJL1FPFP1GSUEBEYDtKIizHIk/Ie4LD6IVfFTLlPHDggp7KHGo+lNs/maKvkNwS6kx1
	31niVrEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPz3-00000002ed0-10e5;
	Mon, 23 Nov 2026 09:05:09 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPz0-00000002ec2-1m41
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 09:05:08 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0E150200AB9;
	Mon, 23 Nov 2026 10:05:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795424702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wr+kWjHpTo7WaujM5d0oISZ/ZZw0eCmzGrhlM9Yi0DU=;
	b=W56Kaq5fn6fASvOPqIXh+677od8Brm4t8jOtXlCuLuggcHN/ogLBmJwKApIBmhC28MAZR3
	eIor5yFLnf6ewenyllkLuUcXizcRBq+kz8vQ4jall4FHUUrettQ9xGHLd9rbDlNYrriGq8
	mLONxpXD60FQkuNNSZC9LUZt7f3GuW8QWHLMv6LiAmZNeozGk8VvKRYQdsMPDW3sVPDDye
	+pISlk2C89ewjgNaVemqsc0qJodGAdPo7y8jPan93JOu7EWeL5LnCVSJ6s8t6cIvKrBc43
	RCO0Spndfd88BRv0laJa03QNcEqFeenHS99xy6+Vg3lWZJw1Wr/G50IXOvzL0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795424702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wr+kWjHpTo7WaujM5d0oISZ/ZZw0eCmzGrhlM9Yi0DU=;
	b=SdGy2ubpY2vVJ4pgQS88011nLIzkNbBlXINeFZe5KFUgk6B84MarTvqhSlmMIXmG/2GqmV
	nUkK3PeqWzqSiJP9+xwHM3IdTECnc6sXWEskW/poR361/GBbF52FvirgI1abJkim9mj/GL
	WCwHNSM4IsPfo1EtNP3pZ53rjj9FLWAcaXoMKSeEs66D0tOrcy4A+epwoGVSi3X/inisBv
	DtQkfs73Z0aTNfeMQh2z9QhkMq6qGFCveNxkgrKYplvpVbtIuh5KA/DuznOUy5vzA/ltO9
	/hevQ8H/DWudwJA6aovOCkxppeTNkGEXXKmhem3xF2kVCQGEHlIk9RAVXdkTsQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795424702; a=rsa-sha256;
	cv=none;
	b=HItAs5iU2zEGkHqGzEjxRGPsjfprtiJOAq5H5wHmtBoXuC14LWXEe5Qx3mxL1/PNn0C+EF
	FaiaqcMswXFiCid0OVgqzsaHewRtWKqUwsLJfucFMsvcz5YSdIV+Bi72gjrOdNJZGcFAeS
	B2gOhxPPtZAYsMjXXMvEeHr6PvWCI9BMrZDzI3W236RMrcRZOGIK9v7g027I7OVYLRB6rF
	I4BxxD7ffGTpcUPliW+qxgDXK1vFmTOhBjx4VPk5kGyaZZIvHDLf/DO7WkRkkK7iHb5A94
	f72LkBApOwR1A/h6V1+qrX6VIF/8k3nAo3+QVPnFmjBrBfxAwK2FHB16WGjrmw==
Message-ID: <447a60519c38eed420f7778ff0cc6de359a44cd6.camel@pengutronix.de>
Subject: Re: [PATCH v2 5/6] reset: starfive: jh71x0: Support discontiguous
 reset IDs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, Brian Masney	
 <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org, Hal Feng
 <hal.feng@starfivetech.com>
Date: Mon, 23 Nov 2026 10:05:01 +0100
In-Reply-To: <179536251467.2728475.8360126735543701661.b4-reply@b4>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
	 <20261118100523.11395-6-changhuang.liang@starfivetech.com>
	 <0ee6bfcc5bb62fcb0c9128168e9367254393eca3.camel@pengutronix.de>
	 <179536251467.2728475.8360126735543701661.b4-reply@b4>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_010506_702845_ED6B6DB9 
X-CRM114-Status: UNSURE (   5.71  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jerome,

On So, 2026-11-22 at 16:48 +0100, Jerome Brunet wrote:
> Hey Philipp,
> 
> With the comment above addressed, Is it Ok if we take the whole series through the clk tree ?

Yes, please.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
