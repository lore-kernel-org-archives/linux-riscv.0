Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DA5D3CC84
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 23:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uduIVydhldgbUjTQ9x1DlaJsc7bfS2zFZkNToLDDu1Q=; b=i1Lx+7shipem2D
	MLeYk8KxlnXahQUvJnirQa4/6TmaBRlDqHdTIOi69o6Wx6KfPxBhIkFNmXTCb48pTjy9AgkppVQJt
	aJ1IthRtBuUNnR0TnIzsbHAv5Ja0NRb5WAfgA19tjHU0v2Y+2RkTh7/IOZSIa7ZgUrQ8fw8cz36Aj
	F/cX06B5N9KUec/uuefCBPNFlTAqDq9ukYPtF1dz109dZ9v6SWMYZk7LymFYbORu3uENLgfcdJKQ8
	Z8y0+yuz0/i2VufALq6w7VHONl3d+KHJkBhzHroNHiQu0PIp9NtrFdQlSVrV24EvLvcIBWFbtjjyg
	hzfBDcAOrTzZ+YubaILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgAHX-0000000B5nq-0eY1;
	Wed, 14 Jan 2026 23:28:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgAHW-0000000B5nP-1S9n
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 23:28:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2859E60051;
	Wed, 14 Jan 2026 23:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D08C4CEF7;
	Wed, 14 Jan 2026 23:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768433284;
	bh=EI7BTv41G7olOZumH0mmXwnej0g2v1o+TsoL4iuuqBI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ftSJZrR70jl3YW9IC8y2ZJcUSo96xUVBE8KZCYUgZUhzfKJF9Dbjk3BhVTLJcH/dH
	 iqDlYbsyaYsHvnykBIf5QKOYV4s9Kzw5Crb+nUDI3tLWYkqfGsajOjTgsTmmJnp2Er
	 aX0LuILbS4R+4Onmel83tfFc7Mm5KYywvgXQc6ijueGYfV5/g8rQqRvBVyK+a9yJic
	 3etmK609O1U/qT5h2iwB9R4fPqR7wCKb3VlToJ+KkKIR4s0pqIUoyuwFyRsauDqS+/
	 DppzwFWTJ8eNnWgCV0NZYZwZVOhBg5PMdV/SNI1r0eeO2AA9/7dSiJwek8M6iVsX5o
	 RPtPmGtf5kJQQ==
Date: Wed, 14 Jan 2026 16:27:56 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    Anup Patel <anup@brainfault.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
    Yangyu Chen <cyy@cyyself.name>, Paul Walmsley <paul.walmsley@sifive.com>, 
    Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
    Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
    Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    spacemit@lists.linux.dev, linux-serial@vger.kernel.org, 
    Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
    Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH v4 01/11] dt-bindings: riscv: add SpacemiT X100 CPU
 compatible
In-Reply-To: <20260110-k3-basic-dt-v4-1-d492f3a30ffa@riscstar.com>
Message-ID: <006317ae-dec7-a893-372b-c68afe35863e@kernel.org>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com> <20260110-k3-basic-dt-v4-1-d492f3a30ffa@riscstar.com>
MIME-Version: 1.0
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

On Sat, 10 Jan 2026, Guodong Xu wrote:

> Add compatible string for the SpacemiT X100 core. [1]
> 
> The X100 is a 64-bit RVA23-compliant RISC-V core from SpacemiT. X100
> supports the RISC-V vector and hypervisor extensions and all mandatory
> extersions as required by the RVA23U64 and RVA23S64 profiles, per the
> definition in 'RVA23 Profile, Version 1.0'. [2]
> 
> >From a microarchieture viewpoint, the X100 features a 4-issue
> out-of-order pipeline.
> 
> X100 is used in SpacemiT K3 SoC.
> 
> Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]
> Link: https://docs.riscv.org/reference/profiles/rva23/_attachments/rva23-profile.pdf [2]
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

(just for completeness, since I acked the older version)

Acked-by: Paul Walmsley <pjw@kernel.org>


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
