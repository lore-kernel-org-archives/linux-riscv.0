Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7656BC7619A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 03:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMGugw64D7F3ZC/40o8DW++biTKaTcUFiYnS6o+wZdQ=; b=EkSwO7X9lUR7YW
	cnVXmtXz5MepTd93wxCgxwsNGNt0gJ9A0OkI/nXf9Y9HQh2TPOhDMzPdnAamHH2ZhZiqq1dWG0llS
	7Tmfp4zCQk0njkTosrUwWTVu1eJV5shSqmVPdpP9nAYXZh2tI9yyFtp9d0xZggMsFQeUEOgPocHPC
	Pdbz4HWjHCaSu/gkMYVH3S9ZzH5BV4oNLZKHzJqA0Ta3WpNj7Nn0F61dVcwUt2gyQYAzTvdhxjiXS
	WIzXo5bqw4PiEuREqXqQqgYwuqe78ELkgoi5L6MOx73Rj+48De8qX7CXNrtuLaklQ84Ra7OL5HoHW
	yh6OF1+gBzdT4tVgf53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgdIO-009bu3-2l;
	Mon, 27 Mar 2023 03:13:20 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgdIL-009bs7-2b
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 03:13:19 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2CB7424E309;
	Mon, 27 Mar 2023 11:12:37 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Mar
 2023 11:12:37 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Mon, 27 Mar 2023 11:12:36 +0800
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
Subject: RE: [PATCH v3 4/4] crypto: starfive - Add hash and HMAC support
Thread-Topic: [PATCH v3 4/4] crypto: starfive - Add hash and HMAC support
Thread-Index: AQHZVbQZd9+lAcQFW0yunvw0rKV1eK8JONIAgATPZGA=
Date: Mon, 27 Mar 2023 03:12:36 +0000
Message-ID: <436f7f43f79b43209d3477c9d99addf6@EXMBX168.cuchost.com>
References: <20230313135646.2077707-1-jiajie.ho@starfivetech.com>
 <20230313135646.2077707-5-jiajie.ho@starfivetech.com>
 <ZB1w5G5XpaQkfqZi@gondor.apana.org.au>
In-Reply-To: <ZB1w5G5XpaQkfqZi@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_201318_003480_9456EA55 
X-CRM114-Status: UNSURE (   9.11  )
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

> On Mon, Mar 13, 2023 at 09:56:46PM +0800, Jia Jie Ho wrote:
> >
> > +static void starfive_hash_dma_callback(void *param) {
> > +	struct starfive_cryp_dev *cryp = param;
> > +
> > +	complete(&cryp->tx_comp);
> > +}
> 
> Please get rid of tx_comp and do the rest of the processing here.

Hi Herbert,
Thanks for reviewing the patch.
I'll update this in next version.

Best regards,
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
