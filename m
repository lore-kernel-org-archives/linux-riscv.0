Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186CAC5B555
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISyNIbqecwKrlSHZlCLqnXhGomU33sAvzc7+aitftpQ=; b=wnMaP/IGfu0NqT
	pccZg2K+yIAdYfG22pqg+MG4ZkFsJLa8jeg/8S3QzxXPSpc9JYmOIbJOfdSquo8FVP7BbA4rC1lF4
	jkSEANevJ7N+t5dO0V6GZQWblRUG1JD6MqkTwgZ1xQoGi4BVfX99tsstiN7eVHuUhXGrwx7dp7j4m
	OFt9SjjtXytts0sMXfLfiNatozgbENtWiPR/UkQqxtdrYubWESBFzn9jdsTjhVVtFBwc38Ks9hfg3
	XNvOoFxMlq1g4K7/ORVBC4QUsctqhTJTI/nZz0Agqgr7UGQMDjxpmWtvw5klMXsAiUmidu9GCcwN1
	GZdKsuOPv2UGIS5vTNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRYL-0000000B0wX-41fZ;
	Tue, 03 Jun 2025 13:19:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRYK-0000000B0wE-1TfT
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 13:19:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8923B61129;
	Tue,  3 Jun 2025 13:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42966C4CEED;
	Tue,  3 Jun 2025 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748956779;
	bh=BUb2QW21yeqzM051GOhES0gqoIL4Rmp0XJ1cLsKkkFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCx2Ves8w9qYxM4hUda/RJyzKt5LpAysbiddLfiCtysyBkpuf3XPKrS89PpbxCWfF
	 TFHL0qTmoQizeffzo7MOchIdzhidrICVIOPN8GsxW31h6I0iGXWsLbEB4OQRtMrSXC
	 XBXlUaS4Zuh7W4Qj+IMHPSE8jbNRMookwpZXMWflFATq6HN0WfhOPguKV6NSQHrdKE
	 tUZXz4TJNXQZMH0NU5lCDjPG3Fc4CkfcnQ7oXNLNWAnzJjSLCyRPUKHOthYYZ5t+t+
	 Qaaj5iolJa15f+Vr4drY8reSk6s7Kt6X3vBsPMOxGMnAT/bqxBoJ9zST0GO70cncyI
	 /EdpFNYfZdEFw==
Date: Tue, 3 Jun 2025 15:19:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Drew Fustini <drew@pdp7.com>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/8] dt-bindings: power: Add T-HEAD TH1520 GPU power
 sequencer
Message-ID: <20250603-cuddly-certain-mussel-4fbe96@kuoka>
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
 <CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
 <4519844e-b1c0-40a7-b856-a6e4a80c6334@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4519844e-b1c0-40a7-b856-a6e4a80c6334@samsung.com>
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

On Mon, Jun 02, 2025 at 10:29:13PM GMT, Michal Wilczynski wrote:
> >> +description: |
> >> +  This binding describes the power sequencer for the T-HEAD TH1520 GPU.
> >> +  This sequencer handles the specific power-up and power-down sequences
> >> +  required by the GPU, including managing clocks and resets from both the
> >> +  sequencer and the GPU device itself.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: thead,th1520-gpu-pwrseq
> >> +
> > 
> > Before I review the rest: is this actually a physical device that
> > takes care of the power sequencing? Some kind of a power management
> > unit for the GPU? If so, I bet it's not called "power sequencer" so
> > let's use its actual name as per the datasheet?
> 
> Hi Bart,
> Thanks for your feedback. 
> 
> The hardware block responsible for powering up the components in the
> TH1520 SoC datasheet is called AON (Always On). However, we already have
> a DT node named aon that serves as a power domain provider
> (Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml).

So no. One device, one device node (sometimes with cildren nodes). You
do not get another device node just because someone wrote incomplete
binding or because driver looks differently.

> 
> Following the discussion [1] about needing a separate DT node for the
> power sequencing capabilities of this AON block, and thinking further
> about it, I think the binding should be more generic. The AON block can
> manage power sequences for more than just the GPU (e.g. NPU, AUDIO,
> DSP).
> 
> The compatible string could be updated like so:
> "thead,th1520-aon-pwrseq"

Should not be separate node, you already have one for AON.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
