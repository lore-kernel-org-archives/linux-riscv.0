Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56419C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 09:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kG+lh/Rml0BgvBm9qEYjuMc7KSud0silMVLo5JTF6Nw=; b=eZwLS3CRIp4Od/
	89wYb+mOK/Fb5TnVi1cBBT6esG4tLtdcmwG+LrXjO78g0FqsJjpT5IZCbuHSwgtlvu812cvZe00rX
	sDCymCVj5TyiqxmPsGMSWuof/g28K8nQuF66IbtpRxmwCS1YBcMqrEpqbaTruL6FesxQ2HuTFLvqn
	YAIWmEwBgxqjEL1Ls8Z95NXHTpTg6tDbFy1Igwrkylyl7krYB3ecNwn4Sy45IZD12xQfBpgSnIx6x
	kIE+wVYhri6BihMJDnjyOzJ0kYPmvKrpeGbrooXX80qvbLvpxQnkdZvJ8fYIk+LOP+0/Cfy7uMMxL
	1zjDHvTbyhGlPDlDQxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3JC-000r5U-FB; Thu, 09 Feb 2023 09:33:38 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3J8-000qxT-LH
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 09:33:37 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id AF01B24E2B9;
	Thu,  9 Feb 2023 17:33:06 +0800 (CST)
Received: from EXMBX167.cuchost.com (172.16.6.77) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Feb
 2023 17:33:06 +0800
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX167.cuchost.com
 (172.16.6.77) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Feb
 2023 17:33:06 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Thu, 9 Feb 2023 17:33:06 +0800
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
Thread-Index: AQHZNMIM/vLXVq3JgUiER7vBRC/T367F3jsAgACIQGA=
Date: Thu, 9 Feb 2023 09:33:06 +0000
Message-ID: <88a62a7a11814d629e2198583a0349b6@EXMBX168.cuchost.com>
References: <20230130154242.112613-1-jiajie.ho@starfivetech.com>
 <20230130154242.112613-5-jiajie.ho@starfivetech.com>
 <Y+S5fBjZQZli9nBg@gondor.apana.org.au>
In-Reply-To: <Y+S5fBjZQZli9nBg@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_013335_094598_57EFDA8B 
X-CRM114-Status: GOOD (  18.95  )
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
> Sent: 9 February, 2023 5:15 PM
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
> > +	cryp->hash_data = (void *)__get_free_pages(GFP_KERNEL |
> GFP_DMA32,
> > +pages);
> 
> Why do you copy everything before you feed it to the hardware?
> If the issue is alignment then surely you should only to copy a small amount
> of header (and perhaps trailer) for that?
> 

The DMA can only support 32-bit addressing.
So, I am copying everything in case kernel allocated memory region >32-bit for a user app.

> > +static int starfive_hash_export(struct ahash_request *req, void *out)
> > +{
> > +	struct starfive_cryp_request_ctx *rctx = ahash_request_ctx(req);
> > +
> > +	memcpy(out, rctx, sizeof(*rctx));
> > +
> > +	return 0;
> > +}
> 
> You are supposed to extract the entire hardware state after each operation
> and store that in the request context.  Since your request context doesn't
> appear to contain any hash state, this can't possibly work.
> 
> Does your hardware allow the non-finalised hash state to be exported, and
> re-imported later? If not then you can only implement support for digest and
> must use a fallback for everything else.

The hardware doesn't support this. I'll add the fallback in the next version.
Thanks for taking time reviewing this patch series.

Regards,
Jia Jie



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
