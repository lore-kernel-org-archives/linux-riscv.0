Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AD9C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 07:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/4/o07qFG5w0sb9HKdeCiNvHJBRzzXk597z15LHMQo=; b=EKcVMc2kbwqDd/
	oPbvgylaLwCrdATALws7TeQOym3oUZbcoq1/c6zmqjW0B2Yp41jeXE7A0gaCkwkriLy+nZRl6q8S1
	4VliHuDQBcyZ6NTuQAJKWiLWrLnahxA+UmiNZa2BNSinB6rExSmW1+3OAHz+vJApsaBFEC9CtqwNq
	P/lvxUQZyzRzjqeNN8kulGlV/GEQtk3fcZLyL/YtOmKk1eS/7soVh2WPH5yf2i78C3xF02kIrLj14
	NyL3Rw9snyKT7EF786/FYBuCC6tQz8RiEhdTgBM5y6ztG0tnMc+GXaF8JF1z81d71ztt4csvHhiwI
	5F+i1Ukp3n9JX0AxdWfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPI5k-002A0p-2i;
	Fri, 28 Jul 2023 07:40:52 +0000
Received: from rivendell.linuxfromscratch.org ([208.118.68.85])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPI5h-0029ws-1R
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 07:40:50 +0000
Received: from localhost.localdomain (xry111.site [89.208.246.23])
	by rivendell.linuxfromscratch.org (Postfix) with ESMTPSA id 083111C1DA0;
	Fri, 28 Jul 2023 07:40:26 +0000 (GMT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.0 at rivendell.linuxfromscratch.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfromscratch.org;
	s=cert4; t=1690530030;
	bh=RsaZgVR72uwvhOw19h0Tmdmp2am5vB3ljes8R8nOeJU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VH0F+7bg9jMJ2mLI5Hos6uu27l4tdeae8MAIvasLxDH9v7UBPlXJ3/h+TA2fxTx4A
	 di/pSQTTcIJTx1/weihtxBJdCMDEYU3ts9boYB2SZnMxzF0ZKxJ3Ul6Y5QS4Kqdkev
	 ijf18AWqmAlKPMaPLqNXOW+IVoc+UrxBN8+ns4NVR0/cSeOcpNuUgL0MlBSxHH0OU0
	 i/x1sFyYPFMXazcx5YoosGZhEHw41JhV9cnwWqkoajE9OFA4DO2Fjj0mdb8myDKRug
	 ZUTg4XP3sxcVpQen8BiIRUm4YheoYiK1zRTc6Ns8BEubTUnWbK36Y0F0A9IjaPP9kq
	 aNyxJGJt12IGA==
Message-ID: <af41edfe515373530d3d1ffc43c581131e6f6038.camel@linuxfromscratch.org>
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
From: Xi Ruoyao <xry111@linuxfromscratch.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Conor Dooley
 <conor.dooley@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,  Daniel
 Lezcano <daniel.lezcano@linaro.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-riscv@lists.infradead.org
Date: Fri, 28 Jul 2023 15:40:21 +0800
In-Reply-To: <ZMNojqwLxcG8FcHN@x1>
References: <20230617161529.2092-1-jszhang@kernel.org>
	 <c9a44f534071a6d67f1e21bafdb713793c559124.camel@linuxfromscratch.org>
	 <20230725-unheard-dingy-42f0fafe7216@wendy> <ZL/jMYL3akl78ZZN@xhacker>
	 <3e0994dab495920ac590dc28d6b9d9765abe0c7e.camel@linuxfromscratch.org>
	 <ZME1J4mpVf5yth32@xhacker>
	 <866eab3e30a18c50742a75d62aee223fdc7e3cee.camel@linuxfromscratch.org>
	 <4986b92f1a5aa303a529c6004aaedd2184c3ccf7.camel@linuxfromscratch.org>
	 <ZMKXQpreSr47MFj6@xhacker>
	 <290101d386866f639a7c482527d7a78c5108d49b.camel@linuxfromscratch.org>
	 <ZMNojqwLxcG8FcHN@x1>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_004049_569083_E1A770CD 
X-CRM114-Status: GOOD (  11.06  )
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

On Fri, 2023-07-28 at 00:04 -0700, Drew Fustini wrote:
> It seems like your kernel config is the problem. I used it and I saw
> the same result of a panic in riscv_intc_irq:
> https://gist.github.com/pdp7/1a26ebe20017a3b90c4e9c005f8178e1
> 
> This is the config I have been using successfully:
> https://gist.github.com/pdp7/ecb34ba1e93fc6cfc4dce66d71e14f82
> 
> Could you try that config?
> 
> Linux 6.5-rc3 boots okay when built with it:
> https://gist.github.com/pdp7/580b072f9a5bf9be87cf88b5f81e50e3

Yes, your configuration works.

I'll try to figure out which specific configuration item is problematic
in my origin one...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
