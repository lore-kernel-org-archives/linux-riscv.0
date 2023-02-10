Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5714DC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 01:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDjGTFTKn5REQPkcB/oKZbtG459la4KE8UuGj7H/PjA=; b=1g3L6mj6F/WVc+
	Kj8t7KRYjawoYBazMP9afuBqE5CN4OjW39+0IXRLGNvMFOCNsOSyyrLEo+3WLEx+a0DP+us5NmiWW
	z1XQcQrZvuglPnw50XTPbl1nDPyLMDxL2MapL1vZTqGxSYWXaSQAHh++M6Ics9hyfIiwqzNBdNciB
	THcm3rEFPMVjfI+UuFAIGHsKMYWO+C6EvCf53KbZTz6fsyVxb+Ly6l/cDwbB3rIhqip3KfJSQFD+N
	tuHhJ1RnASEPZkGvxMkIoVB0c/FRqhZ0/t740TuDigZ8iN/lCQa5GsjjiYSjyRj2litTG3tDGmJFj
	tlfLYwVhzXxhCgx1HJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQIOX-003rI2-R0; Fri, 10 Feb 2023 01:40:09 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQIOS-003rFw-DG
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 01:40:08 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DF39024E161;
	Fri, 10 Feb 2023 09:39:26 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 10 Feb
 2023 09:39:26 +0800
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 10 Feb
 2023 09:39:26 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Fri, 10 Feb 2023 09:39:26 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: "David S . Miller" <davem@davemloft.net>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v2 4/4] crypto: starfive - Add hash and HMAC support
Thread-Topic: [PATCH v2 4/4] crypto: starfive - Add hash and HMAC support
Thread-Index: AQHZNMIM/vLXVq3JgUiER7vBRC/T367F50EAgAGPv4A=
Date: Fri, 10 Feb 2023 01:39:26 +0000
Message-ID: <4f40b91f0756417ba5edbc742a3cd349@EXMBX168.cuchost.com>
References: <20230130154242.112613-1-jiajie.ho@starfivetech.com>
 <20230130154242.112613-5-jiajie.ho@starfivetech.com>
 <Y+TBDqkjsuMiA/P7@gondor.apana.org.au>
In-Reply-To: <Y+TBDqkjsuMiA/P7@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.190.105.77]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_174004_852629_4D7DE9B0 
X-CRM114-Status: GOOD (  12.10  )
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



> -----Original Message-----
> From: Herbert Xu <herbert@gondor.apana.org.au>
> Sent: 9 February, 2023 5:47 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>
> Cc: David S . Miller <davem@davemloft.net>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Emil Renner Berthing
> <kernel@esmil.dk>; Conor Dooley <conor.dooley@microchip.com>; linux-
> crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Subject: Re: [PATCH v2 4/4] crypto: starfive - Add hash and HMAC support
> 
> On Mon, Jan 30, 2023 at 11:42:42PM +0800, Jia Jie Ho wrote:
> >
> > +static inline int starfive_hash_wait_hmac_done(struct
> > +starfive_cryp_ctx *ctx) {
> > +	struct starfive_cryp_dev *cryp = ctx->cryp;
> > +	u32 status;
> > +
> > +	return readl_relaxed_poll_timeout(cryp->base +
> STARFIVE_HASH_SHACSR, status,
> > +					  (status &
> STARFIVE_HASH_HMAC_DONE), 10, 100000); }
> > +
> > +static inline int starfive_hash_wait_busy(struct starfive_cryp_ctx
> > +*ctx) {
> > +	struct starfive_cryp_dev *cryp = ctx->cryp;
> > +	u32 status;
> > +
> > +	return readl_relaxed_poll_timeout(cryp->base +
> STARFIVE_HASH_SHACSR, status,
> > +					  !(status & STARFIVE_HASH_BUSY),
> 10, 100000); }
> > +
> > +static inline int starfive_hash_wait_key_done(struct
> > +starfive_cryp_ctx *ctx) {
> > +	struct starfive_cryp_dev *cryp = ctx->cryp;
> > +	u32 status;
> > +
> > +	return readl_relaxed_poll_timeout(cryp->base +
> STARFIVE_HASH_SHACSR, status,
> > +					  (status &
> STARFIVE_HASH_KEY_DONE), 10, 100000); }
> 
> Is there no IRQ mechanism for this?

Only hmac done has IRQ, I'll add that in the next version.

Thanks
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
