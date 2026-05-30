Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3647CD6E51
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 03:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vE7eIYzLuYQVR5s+1o1lZjv0TsAhTJ7J0B1f0vejrUQ=; b=EIKhVMcbUziEE3
	W+jK1hXucTAsmKfWP6P/pcCFGnrnfqvVnP2QAkYCMSP99MMD4ANjiwntXMzGYhI6CfFdPzQcSv9+c
	4NGYH+C/7vNYHaluBpM1r2W2mo0mL4Wh3gsFQ8tXkU/+FbZv+5OBYr9S7g9RL89FjNCxiw7sr7xxJ
	6VFAVnAaiENi+EBoyIigno+FJEMDNimuTAG6F6RkvUQETTr7A4Tq7bnjOscOWWf1vOqMBoSZIjaBV
	jEWxWpKFYfROEfUlFzAcTjYHPdeHIUmm0XPUw6IQvqXi9t5KzlD5y8S2bvY485JDMt76iUD5dphNo
	pLlgI8xA5ScH3OB96/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT9yu-00000008Oe0-05aa;
	Sat, 30 May 2026 03:03:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT9ys-00000008Odr-296V
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 03:03:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A0AD360103;
	Sat, 30 May 2026 03:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F831F00893;
	Sat, 30 May 2026 03:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780110201;
	bh=lV76AH1HBmgcxLbMccze3T0BHd4sPS3mDORlT8NSVC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oFeFMKOUmBDgQJ/Ers8G0P8ui1p3EETlX5hPRVKl4gC71fHeFzNm8vb3L043SmcnB
	 ZVVGpL6Whb92ngsvTjlxMUg8GAceD/BSN5NqaUaIvktbKWa4T8mhsh3kkSIik51sN9
	 WSyK4SG6HYO2V7cfdvioFDeU95fc4kgDk3gmDWfA1EzJ8wJ3kUxO9FPVi8oLGZowMW
	 TZg2bXVWxRJh0Mnp+PXzVohL7MgQ237ydtk/549EJLhn3MfvfpUh9b3oHW33YmCi4z
	 z2ErPhNqkBBBxv93YMWq27/Oy7p4YY2xrLKEWbqNWume/HhjLAu9DKUvM84SkYf9fQ
	 D6x+Qf21+wV1w==
Date: Sat, 30 May 2026 03:03:19 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Guodong Xu <docularxu@outlook.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Add Ziccrse extension for X100
 cores
Message-ID: <20260530030319-GKG3748271@kernel.org>
References: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
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

Hi Guodong,

On 15:22 Tue 26 May     , Guodong Xu wrote:
> Add the Ziccrse ISA extension to all eight X100 cores. Ziccrse
> provides a forward progress guarantee on LR/SC sequences in main
> memory regions with cacheability and coherence PMAs.
> 
> The SpacemiT X100 core supports it per the SpacemiT K3 hardware
> specification.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Looks good, I will queue it, thanks

Reviewed-by: Yixun lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
