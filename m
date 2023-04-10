Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395ABC76196
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOFhwbIzRYOY0qiuvrC84IQy/B9DoJzjRMACVrDgCvA=; b=FsXctJjUO7TKFo
	dtiZyZMIgRuOCschRZ2bORayoXbiNmgbsl5c5j3cSXghzLLfbyPmwsFspzk/dY42jRDT0WqUHuvk2
	TGZAywxfZKH3mGTlFvdQrb8G0daHXWbIm5Rx/5gUKB6NGCiG2FvunwaozU71bWwznfu9aHhLy3BOr
	rtK3NhY3aH9lXlrcW4+8uZxo75HlOjxtEt3DCOvdik/9OfYLT8Yz9/xZaFHQk9yhF88mWOpi2QiIR
	rN5WtnZYHFpQxSpDW7eLh6eCsbC2SMrMtBlaaFlmjJBF838vCO3BvqTrwpSBNs6nSbksp6pS89yXJ
	nSJnEmj8ZjuTyfkMPqxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plrap-00FIG9-0m;
	Mon, 10 Apr 2023 13:29:59 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plrak-00FIFL-2n
	for linux-riscv@lists.infradead.org;
	Mon, 10 Apr 2023 13:29:57 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1plra8-00EJyK-RY; Mon, 10 Apr 2023 21:29:17 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 10 Apr 2023 21:29:16 +0800
Date: Mon, 10 Apr 2023 21:29:16 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: JiaJie Ho <jiajie.ho@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 4/4] crypto: starfive - Add hash and HMAC support
Message-ID: <ZDQPLGG+DorFwZ+1@gondor.apana.org.au>
References: <20230410073752.39506-1-jiajie.ho@starfivetech.com>
 <20230410073752.39506-5-jiajie.ho@starfivetech.com>
 <ZDO/z++4/TE6AiIz@gondor.apana.org.au>
 <6df549e9-d0f6-23ca-882f-527c4e40b553@starfivetech.com>
 <ZDPgXyGZtMZw5G4q@gondor.apana.org.au>
 <c1925af208b540c2bd78a16bc593ecae@EXMBX168.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1925af208b540c2bd78a16bc593ecae@EXMBX168.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_062954_922503_E03B91B8 
X-CRM114-Status: UNSURE (   7.90  )
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

On Mon, Apr 10, 2023 at 01:10:29PM +0000, JiaJie Ho wrote:
>
> The sequence of event would be:
> 1. Wait for DMA transfer to complete.
> 2. Set bit in device CSR to indicate final block has been transferred.

OK, 2 should be done in the DMA callback function.

> 3. Device will send IRQ once result is ready.
> 4. Read out final digest value from device.

4 should be done from a tasklet scheduled from the IRQ handler.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
