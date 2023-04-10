Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56F5C76196
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 10:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqTSgJwsGJa0mAjeiAylsanwJabSXjqtKa+g4Fk5qJk=; b=gz4fqTU61Xx/i0
	qxnIrR1gM/M11Wl9Le0tUIqV5SYa7JdU3XMQkWocQD09H+orcW/4VG6/mGCXPFGxOLKiUEOZmXy+2
	38KW1MKcZrPIGhc+1ofpWIb93BuxJHs0RYq835F1mzrG8/6xd3mYIoXqVIz3kmuK0sZpmU2VnjuLT
	CnlNWnPC7GCkvR9hQSkXGKJNZSYK1ZzTWefRv+8QqIIdfIeyLsPtQEylxoSB+DGr+N5KMcVE7bb1k
	qw5D2pi9+AT4dIBC2j7G+InPI/kDyHF4bwmTyWi9rPJKe5qpGrZhU7tykJHWrqReeseZrVZQqhvmz
	b7Cd+K7E7AeXS9kQUwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ploTn-00EwII-2B;
	Mon, 10 Apr 2023 10:10:31 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ploTj-00EwG1-21
	for linux-riscv@lists.infradead.org;
	Mon, 10 Apr 2023 10:10:30 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1ploSt-00EGwm-Fy; Mon, 10 Apr 2023 18:09:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 10 Apr 2023 18:09:35 +0800
Date: Mon, 10 Apr 2023 18:09:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/4] crypto: starfive - Add hash and HMAC support
Message-ID: <ZDPgXyGZtMZw5G4q@gondor.apana.org.au>
References: <20230410073752.39506-1-jiajie.ho@starfivetech.com>
 <20230410073752.39506-5-jiajie.ho@starfivetech.com>
 <ZDO/z++4/TE6AiIz@gondor.apana.org.au>
 <6df549e9-d0f6-23ca-882f-527c4e40b553@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6df549e9-d0f6-23ca-882f-527c4e40b553@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_031027_665999_68804104 
X-CRM114-Status: GOOD (  11.60  )
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

On Mon, Apr 10, 2023 at 04:43:37PM +0800, Jia Jie Ho wrote:
>
> The hardware requires user to set a 'final' bit after data transfer completed.
> This completion is to wait for the interrupt signal from device that the final digest 
> has been populated to the read registers.
> 
> I'll do the finalize_request call directly in the next version.

Instead of the IRQ performing a completion, it could instead schedule
a tasklet and do the callback directly from the tasklet.

Actually, the ordering between the IRQ and DMA callback is a bit
confusing.  Which one is supposed to occur first and how does it
interact with the other event?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
