Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5607C54798
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 21:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smXWia4yDUxtdTmsd+vVbUhJpryIYXT2O5a7CD+49dE=; b=tvzSHcDC6DyUEd
	sbfdjtXJh+2mMV22hrHHuUpUYQtSFO4DKLYVR1ClV1O7C/vTiKkFZMH6SEkeBatjmjUiaWGArCBvS
	GrRt1GzQImWjBr53XnmtFXEXU5gmF5fiL1ajONEFw+HeEUWivkaHlkBWInVs6jE1hIPAxHxTo7w5B
	YlV/+quqkoTdXIvBC6tfXFHQapEsU0fhegK02sAvDIQDghsdVRTK2yPBKKJHkFFMVMZhuPt9UZIAC
	sPYk7vWAqGUTYajeRTKXEJcNnAPruuCMiqNE83WR3xmTLtQ1Ku7VYzRejjDNx0pEOoranDKXWIfpe
	wASf70HWMYf2oWN615qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riKtX-00000006NRl-2sDj;
	Thu, 07 Mar 2024 21:03:15 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riKtR-00000006NQG-1uCG;
	Thu, 07 Mar 2024 21:03:12 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709845385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q3yCKZ0fMu8j0BuWFDPPCRn2jwTBHVks4xrfWGq48Ro=;
	b=lr/ZqsuCds4TsK9/nIk+SwHQ2HIFLSYy8t2O89C2liNSua8/g/+I9Y2uBL04KA7c4bOmZX
	GROFIER689kDxBIpbrsXTQVo7doIBwXal9KGRJxN6+30VChFNQSMPwGQVitl6nDrb8XiGB
	Jb237jkOV6ySGN5MQzb+9rrqnEJnWgDRSlmwtDTjrifYMAWwkF3UEYqNb/s6xeovGLD30K
	mB4PtHGZurTz0D5XGE3WWW63eM1lzr8EAsN6M9mf+/UB0/N+aL3GYnXbkLTNxSts1IXHkn
	yA1Ha8IqdnboICnWwuIKsDMk3QvhisxidWwXGUdoh8iGc73g9HE+skpKy5gDuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709845385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q3yCKZ0fMu8j0BuWFDPPCRn2jwTBHVks4xrfWGq48Ro=;
	b=0I5TnNcy2Me45QrWKSlDMYGm8WVdqeDhMZrEwCwknfuZye1/r2jjWoOw4rKr4xsvuqBbJo
	ZPDfk4Ax2jaS2aBA==
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v16 0/9] Linux RISC-V AIA Support
In-Reply-To: <CAK9=C2UHbcnUoVvQFQzqCvHLngFsAi=4vaxaMM2+C1GoVxRa-w@mail.gmail.com>
References: <20240307140307.646078-1-apatel@ventanamicro.com>
 <CAK9=C2UHbcnUoVvQFQzqCvHLngFsAi=4vaxaMM2+C1GoVxRa-w@mail.gmail.com>
Date: Thu, 07 Mar 2024 22:03:05 +0100
Message-ID: <87edclu54m.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_130309_657750_FEFB8253 
X-CRM114-Status: UNSURE (   6.10  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 07 2024 at 19:41, Anup Patel wrote:
>
> Can this series be considered for Linux-6.9 ?

Sorry no. I stop taking patches which are not fixes or trivial cleanups
at rc7 latest. I marked it for inclusion into my post-merge window tree.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
