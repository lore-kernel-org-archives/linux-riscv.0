Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2690C87FCB
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 17:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CBS9j5WTEHyG/j8/ZBUTcpUg0PbtiboT5D5v4k1pjlI=; b=QxrCYUh1MsYuBs
	lNlo4ZqtyCqpNOlctkiqoKwYVzYYVIf2AF9OhltKYYCC1CJx6WsxH/5JUT917Nv1f1vh2yIvSgUde
	lYDKZS1P6PEcQk8G/X268hrXALjzwfEOiT0MZrsJOLR9R1Z0VFEDL4xbVXyiCyS7JNVb3CNMC03Bo
	8qREFcKA4nTIOsxkKx/Jh771/ehdVzpgJQaiM7kYF29/N+v3rvzsyhkhSaxig5ElTIdug/CfEwmHJ
	C25LDUQpcNoICJy+7JwACfyulFSE7IWO+AxbbZpVm74YSxsZPfTNTgIXdfy3D54BPQ/pkbStbUMlo
	JK/WKnsVa0Y8vrbaaGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLLu-0000000DPpK-1S8p;
	Tue, 05 Aug 2025 17:21:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujL0H-0000000DMLh-2fhg
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 16:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ACDDC5C656E;
	Tue,  5 Aug 2025 16:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A10C4CEF6;
	Tue,  5 Aug 2025 16:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754413148;
	bh=MzHn4PwFNsPUQzIyRmZAIovqpKUpUowJ7E/2uYiGNa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eRXBUwJTBUuDu7ysnWSTbhDmoC2ydPzwS0mRrz1R5+vCmwIS/hnRoOAlvgj5L9CLT
	 7S84UBIOeuUVMygMLcDycTWnszyvCMly2AscPtmLlQnLsOnnsSrCkGfWfYkpU49D4p
	 30kaHW5ZxIMrP3smVIob2b73cBGxYg0PGgCJe0jY/Gk6KNrZF24yHEjtCyerYWXwdI
	 vYtgsGRG2mx/bekg+6CubBNn9Ry5tN5Ig56p1fLqdRUIXKoyjq/8OL9mdR6rLfAQX7
	 uaY+EO6K+ShrBC/AGz0S9V30xltg94Eq+sCVRCx3mFVKUCZHDKNviX/JnT103TqV0f
	 GYJCbLlVBxvPw==
Date: Tue, 5 Aug 2025 09:59:06 -0700
From: Drew Fustini <fustini@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
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
Message-ID: <aJI4WiigJFoYPXU1@x1>
References: <20250801091240.46114-1-ziyao@disroot.org>
 <20250801091240.46114-2-ziyao@disroot.org>
 <20250805-portable-jasmine-marmoset-e34026@kuoka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250805-portable-jasmine-marmoset-e34026@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_095909_715514_59501203 
X-CRM114-Status: GOOD (  12.85  )
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

On Tue, Aug 05, 2025 at 08:39:59AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Aug 01, 2025 at 09:12:38AM +0000, Yao Zi wrote:
> > Besides ones for GMAC core and peripheral registers, the TH1520 GMAC
> > requires one more clock for configuring APB glue registers. Describe
> > it in the binding.
> > 
> > Fixes: f920ce04c399 ("dt-bindings: net: Add T-HEAD dwmac support")
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > Tested-by: Drew Fustini <fustini@kernel.org>
> 
> You cannoy really test the binding, except part of build process and we
> do not consider building something equal to testing.

Good point. I've since provided my Reviewed-by: in this v2 thread so the
Tested-by: should be dropped if there or is another series or when
applying this v2.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
