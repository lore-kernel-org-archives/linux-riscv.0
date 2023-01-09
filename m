Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E813C54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 04:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEqqSnhWVsXzkEenyEjak82EZTE8O9aIgoOIUfQZ3NM=; b=FGoosGoiYvHnPc
	OSjv7me3iNXAsSbHbwNpGu/YfUrZ7lod4f7tTVirWwvWgdUUNjQCnwWP3Mqaz9Hk7dKvWOe0DT1T3
	u1F+hnPPVYVj5DoDjgEv3u7Y+FutG91Q3iOokkvhTKVu6pYccvSJ7S1hy3QBdMgPJlD5rBFM57am7
	O0eNHSWPYPeHxBLuSMgWxtATCXC5n3Swet7F+s6aMLePMhujdAlWJOfQ8LuVfMLV4wXs44/+D5Z2G
	ctKk/b2tugB77mmxKmOv5QvWdOp9MLg7K2J3VBtxgKJw4YLj5tuoS9upDQ33j1anlQtGI5ekxwjj7
	cTFNI09xJx577D659maw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEjL5-00HC61-74; Mon, 09 Jan 2023 04:00:47 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=formenos.hmeau.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEjL0-00HC5I-GJ
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 04:00:45 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pEjKe-00FRxO-1i; Mon, 09 Jan 2023 12:00:21 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 09 Jan 2023 12:00:20 +0800
Date: Mon, 9 Jan 2023 12:00:20 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: JiaJie Ho <jiajie.ho@starfivetech.com>
Cc: Olivia Mackall <olivia@selenic.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 2/3] hwrng: starfive - Add TRNG driver for StarFive SoC
Message-ID: <Y7uRVNvplGjrZxa4@gondor.apana.org.au>
References: <20221228071103.91797-1-jiajie.ho@starfivetech.com>
 <20221228071103.91797-3-jiajie.ho@starfivetech.com>
 <Y7fePDme5E3yhPhQ@gondor.apana.org.au>
 <7c2cc6e9cdf241318fc73162a5ec221d@EXMBX168.cuchost.com>
 <Y7uEGxl8xJ1xxkKZ@gondor.apana.org.au>
 <e0c9944151b24e848af55221a4388301@EXMBX168.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0c9944151b24e848af55221a4388301@EXMBX168.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_200042_590272_E0A29CF2 
X-CRM114-Status: UNSURE (   8.72  )
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

On Mon, Jan 09, 2023 at 03:41:14AM +0000, JiaJie Ho wrote:
>
> The average wait time is around 20 microseconds.
> I measured from writel cmd to wait_for_completion done.

Do you know of an upper bound? E.g., if we limit it to 40us how
many requests would fail on average?

Having a maximum delay of 40us would be OK with wait == 0.  So
you could implement it in a way such that if the wait time exceeded
40us then you return if wait == 0, otherwise you can wait longer.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
