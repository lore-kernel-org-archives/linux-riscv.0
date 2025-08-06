Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7132CC87FCB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 03:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWytYkoB0MoKc+zvuh4JGlc/GbUxjhdti/L/V19ZV2E=; b=egjWVq/PZSKsLE
	fN5WNC6RStf7wZbSuXerWCZzzE28eNmLGdidpVZ+aBc7SDc3La5hbOG5YsRsercRcZiKOlz1FtZsr
	tdwxZ730h/6VHKhqMsAPH7MTsz9mX+P7HhWJPebt/PJVhhaRtPiRiIdg8kP8r90KGQXVS+nRxyzfv
	xf9y1BnW3AvDggESKz3a0JWxCdkm09muhSRxwekC4FtMEMGNS4WAqEp0yHGQ6KOYwcnGh3Z8zlEpZ
	5dopIBDaL5KBXTbbT+jyhQzlC10J6Cl2nPjBPmH9K5Sl/QxHxkQrkmzLZTxRy7DyajN/0d7P2EDKd
	aauN/QJHuqSobfVr5ppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujUTv-0000000ED9y-0hqG;
	Wed, 06 Aug 2025 03:06:23 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujUTK-0000000ED5P-40iL
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 03:05:48 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A08E325D80;
	Wed,  6 Aug 2025 05:05:45 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YuG87osi2Cgz; Wed,  6 Aug 2025 05:05:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754449545; bh=N/zOvjBqKESD7r48tT7sB0c0pTptIFUp4F/avtfGWho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iAwn0t0iJnRWyP/ihfobwuarrYwO2EUspOYUMuYMGwREaOXY/pyQMKn8DsSQdELfD
	 SkNthXwDvifmNnp9j0urPDmxR/8aCuuw602P+hyu8wozhOirVYY/V5a0e64W66ral3
	 HgZs7TfXBPbUtochyMqNwCHHULB0vcbwDFR1sjMCPjl5ZR0lcC/NB2Q6KRN7Eu+F/h
	 lPCdvqBl3/ROtqWJR0UHYbLUYK47CJH1W32ywAq7khiRRt5BoD/8iCIhmLC3XIvCqn
	 gGSBok+P9kS/FPozMXSqyrrgCmQm3zuzDnDtn/xHA0DDlrm6Y2zAcfOAJHYoS3M8Av
	 j+GeS0n9rvJVg==
Date: Wed, 6 Aug 2025 03:05:33 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/3] dt-bindings: net: thead,th1520-gmac: Describe
 APB interface clock
Message-ID: <aJLGfQaPqeEsX8AX@pie>
References: <20250801091240.46114-1-ziyao@disroot.org>
 <20250801091240.46114-2-ziyao@disroot.org>
 <20250805-portable-jasmine-marmoset-e34026@kuoka>
 <aJI4WiigJFoYPXU1@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aJI4WiigJFoYPXU1@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_200547_127828_C6116BD5 
X-CRM114-Status: GOOD (  15.51  )
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

On Tue, Aug 05, 2025 at 09:59:06AM -0700, Drew Fustini wrote:
> On Tue, Aug 05, 2025 at 08:39:59AM +0200, Krzysztof Kozlowski wrote:
> > On Fri, Aug 01, 2025 at 09:12:38AM +0000, Yao Zi wrote:
> > > Besides ones for GMAC core and peripheral registers, the TH1520 GMAC
> > > requires one more clock for configuring APB glue registers. Describe
> > > it in the binding.
> > > 
> > > Fixes: f920ce04c399 ("dt-bindings: net: Add T-HEAD dwmac support")
> > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > Tested-by: Drew Fustini <fustini@kernel.org>
> > 
> > You cannoy really test the binding, except part of build process and we
> > do not consider building something equal to testing.
> 
> Good point. I've since provided my Reviewed-by: in this v2 thread so the
> Tested-by: should be dropped if there or is another series or when
> applying this v2.

I'll send v3 of this series soon, dropping the Tested-by and adding
Krzysztof's Acked-by tag. Thanks for the guidance!

> Thanks,
> Drew

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
