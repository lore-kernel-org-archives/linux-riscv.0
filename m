Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E09E6F08F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 13:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0M7JDH/1Pl56ofS4LETUuiAi8mRDJ2k5MARbyiOnas=; b=n/KNBxmgB4zHPx
	4jxYZGYeOll+uvNDNh3NdsYx0aIndvqNambFqTFWHTnk97JH7qQ2yP14DZhitg4e52ZFSZy17e3zs
	8vhw+0BoB7jdYNrN+OzGEuvg2GRRpKDTvPnWqMfA3WfQ+GSD8GV70QY3Q9O6Glbtd414O7K4UJhKx
	B9Uo0gNMbPGFa6JQmTi1A4YBXQvbj4HvLxCJ0VwduHfW6enhQXP0W4kR66wtFqNZ3bCVCVOd9upN6
	eG1cbnUjqrZrrQ2gmrvfee8CrOzAvcsHK5KubSZPQfsk/SZbX2/E5O/XbDC/ljGsBmfLAFBGi3Pxh
	5NIh8i+BXdkFFMZ27wtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2jp-0000000FYEd-3CT1;
	Tue, 23 Dec 2025 13:47:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2jo-0000000FYEQ-1qtR
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 13:47:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48A8A6013D;
	Tue, 23 Dec 2025 13:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CBFC113D0;
	Tue, 23 Dec 2025 13:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766497663;
	bh=sfI6oSUVUszg+G4GEdk3ZFCt3nWG6J6yi2rcz+VwDqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olU5v8t9qwqNRAYdoWlW7UthOf0g2d2x2lbOnnsWj8Iyzzh1yZr26pjKR5oGaXfMZ
	 zOOJHgsKHmavtCJn7jDOluVPrbnHjKirDPMzn7qqPef4MHoAZDAwXhTKu9SGkSME1C
	 1e6Ydp0+rBi9V6+6+/kEUgEHLbGr7H/0vGkmZMXSKMBbIKPoFTRHcrf/JqlbaEeAx5
	 X7rp+D2JC3t3bK1slt0HHL2ERwqe58eFIW0kXtr6Fn0Xb/SmtX9hHPr7u7YY91bdM2
	 8G/PpZxE0HEJ3syzQTjBhA8TLk2CVNTHnjfjc9HFpfnAAHWEhpwY60yZrEq11GWwzZ
	 y3D2L2yHDiAGA==
Date: Tue, 23 Dec 2025 14:47:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 04/13] dt-bindings: interrupt-controller: add SpacemiT
 K3 IMSIC
Message-ID: <20251223-careful-nebulous-griffin-9c6c08@quoll>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-4-3af3f3cd0f8a@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251222-k3-basic-dt-v2-4-3af3f3cd0f8a@riscstar.com>
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

On Mon, Dec 22, 2025 at 09:04:14PM +0800, Guodong Xu wrote:
> Add compatible string for SpacemiT K3 IMSIC.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: Fix the order to keep things alphabetically.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
