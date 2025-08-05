Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0552DC87FD2
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 06:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Xkol/CTmZxScuMW3agFlbiE8PrtMIYaGbuBQx5T/H8=; b=BHqH1h9xaHY5rO
	sEkQsX81sgYkSsGMbCV8X/W0IQW+SZWSk7HjSusEZAPZtc6aSTWtyqyvKosxptpPzjyOF9UEb9JaW
	aOe8/pPWhDKTm0XOK5r/QOdz8USUZkS7DvpyVBUrbGiHrNRYsDObqnSqS7CF0R7x4D8e9nzZPmOKU
	XkMhkZuxrUAPAQidD7gF1DnabPObRqKFfQc65OyY8eaUhtNyegiugYRiOcc2PXLihF8wAKy3iqkMF
	/xAWEK33x7boXxJCnrhIeH5MGFgEUUo7KW47pB6WfjW4IK6fufED+ldaCHpv5aa9/A0Ae8otD5G+e
	rhgSFDF1r9oSzUDHe4SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBSA-0000000Bw2H-2bfR;
	Tue, 05 Aug 2025 06:47:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBL9-0000000BuqI-0IxZ
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 06:40:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 659AA5C588F;
	Tue,  5 Aug 2025 06:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE1AC4CEF8;
	Tue,  5 Aug 2025 06:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754376002;
	bh=y43eChycutdYzUFJz6MO9DSyRcPKyMzwMzBdeUn8eDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EExD8YAyPy4IntVrNv5HTw9a1S6WReOOAccYEoeuwQqzW9g5z9BuZfedX6pSz20zP
	 orXKOtidCIjP+kxPbYY1e+lLSNgDfrKR+/EH4KPG/xXnptdo1zMWniyJoNRxMjfkYg
	 CWQXzDHySZnCw3Q2wzVl7TrIFgUQ9Mas0WBCPbOrGDc2aFYQqjFCCTjqgnmS9chBOv
	 75eseopcjBLp7ptbCoiV59ighwvz9ClTA/cbuw7Tf9Xy1rORgy4EZQ3wZEigiL/HyQ
	 RAHNiLuvfWa4B6R5/qyDoYmeJEfeTsSgYCt4V3OnMiQCBhjf1xAzIgyQB9mB2JrGBq
	 d+54i7k65Ecsg==
Date: Tue, 5 Aug 2025 08:39:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Jisheng Zhang <jszhang@kernel.org>, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/3] dt-bindings: net: thead,th1520-gmac: Describe
 APB interface clock
Message-ID: <20250805-portable-jasmine-marmoset-e34026@kuoka>
References: <20250801091240.46114-1-ziyao@disroot.org>
 <20250801091240.46114-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250801091240.46114-2-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_234003_791784_3FAC99E4 
X-CRM114-Status: GOOD (  11.29  )
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

On Fri, Aug 01, 2025 at 09:12:38AM +0000, Yao Zi wrote:
> Besides ones for GMAC core and peripheral registers, the TH1520 GMAC
> requires one more clock for configuring APB glue registers. Describe
> it in the binding.
> 
> Fixes: f920ce04c399 ("dt-bindings: net: Add T-HEAD dwmac support")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Tested-by: Drew Fustini <fustini@kernel.org>

You cannoy really test the binding, except part of build process and we
do not consider building something equal to testing.

> ---
>  .../devicetree/bindings/net/thead,th1520-gmac.yaml          | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
