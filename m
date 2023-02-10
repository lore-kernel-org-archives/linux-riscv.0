Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B69EC636D4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 02:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecordCs4V8sPFpP3qXs2lWZ4E9HUYKVHNXCbnzHZuAU=; b=iOZRx1OQy+Zs+X
	NIkUek58S3CC1dxkMqclhN+vbHiERBqkIe/reccrGXeNyiTu3QSmY40rfNOzSM7jiLyykp+4UIyER
	KG73IGjRaKano9yh/qR/vnJTf8k5bb2LcvwW4aoHmmRobdgG3vgAMxZoqd8v6u7hTEQYevbriJgh1
	T+xO43ZT0RmYFlzyrAgpeGZ/3JzUEpCbyJmbh8CJVLkCZorZDehUQXiTEC86vRXieqd6LvgQKDgNV
	R7NS4KX7uibDxNAK0cT0r8sa+pWuBxaNBguHsQD+USDHzyS2TgebEOKSaAg5gBnVUPl6OqEPizSaP
	Q2ZSiCDCm5UCjc+PISaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQJMi-003xpe-Qe; Fri, 10 Feb 2023 02:42:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQJMZ-003xns-VT
	for linux-riscv@bombadil.infradead.org; Fri, 10 Feb 2023 02:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Bs70LzziFU1ziajGdjBgYWy2M0Jn4TeybTXTlIJG83Q=; b=FpIEpZpu1w4DqTmL20uez98iKv
	R8A7aEOkLTCz3N7K8FMU8T9EOdedfkapmsNj9jlduGQ9eAt8E0IF9kPXCaiwRt3O3E+G7mWEstx2E
	N36yOU3LvDdcYYFw/sIIucwnBsew3J34BN9PvrVoBWI4MsYPIiuAuuFLftis5qF0gfPqKVUcREoWf
	RcR9KD3gPSbJsMU2QE8lNvdQ+bl0q3X5tmBsoknnfrSYMnnieWsPGns4IwxH+bZdEcWizlpHvOnK2
	nrzKpSCsdNIyX8UjRyfJr+xhdneMLvpNcgWY3QMgRZ4feel06+Aun6s4EErpKbjV7CBQEcxfHMPU2
	9a8zvLkg==;
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38] helo=formenos.hmeau.com)
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQJMT-002kh7-Dn
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 02:42:10 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pQJLB-009W89-7x; Fri, 10 Feb 2023 10:40:46 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 10 Feb 2023 10:40:45 +0800
Date: Fri, 10 Feb 2023 10:40:45 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: JiaJie Ho <jiajie.ho@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 4/4] crypto: starfive - Add hash and HMAC support
Message-ID: <Y+WurfnVQ9ZhEU1N@gondor.apana.org.au>
References: <20230130154242.112613-1-jiajie.ho@starfivetech.com>
 <20230130154242.112613-5-jiajie.ho@starfivetech.com>
 <Y+S5fBjZQZli9nBg@gondor.apana.org.au>
 <88a62a7a11814d629e2198583a0349b6@EXMBX168.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88a62a7a11814d629e2198583a0349b6@EXMBX168.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_024205_974118_33191EB0 
X-CRM114-Status: UNSURE (   5.59  )
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

On Thu, Feb 09, 2023 at 09:33:06AM +0000, JiaJie Ho wrote:
.
> The DMA can only support 32-bit addressing.

Isn't the DMA mapping API supposed to solve this automatically
for you? IOW just do the dma_map call and it should transparently
copy any high addresses to lowmem bounce buffers.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
