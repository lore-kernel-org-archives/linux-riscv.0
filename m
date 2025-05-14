Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B35C3ABD9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 15:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmL81Cbc5DyQXDwWt31E5m1eD3S5F1cL9Tm7IUOOyLg=; b=UWCckWoehAtIXq
	O5YsYoyfW37x5Sht9yrW1kbVL4g6HE+UigaMIs8xNKZgFfzqulVsvF7UtdG5lGAfTdWLCCc8KoIR6
	6iyhUy+UX6vBOF1J8vVq9E9N5BqqYKGGVmdFANAHRMYGoxwvrGulYqReDKDBrPQu0/no00vLM2lGJ
	OBFngsn/uLkIxMupvOjmGiIJHu3Q9vH7tWKFJ/P+zjur6FjQ1iFUZmT4FpHS1k/4YvIk2HStgalpl
	TM8eEJ+jLoXzACpdLNPSVEuCkRPVOZrTBIG7asQnJXsHq5AA2lBJ4CN+pg/Z/uGzORIqyBVsuC1rI
	eBHe1eIQCZfd5sDrlPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDqT-0000000FYP5-2gPs;
	Wed, 14 May 2025 15:16:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDc1-0000000FUsB-3d7C
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 15:01:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 159CB61165;
	Wed, 14 May 2025 15:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E408C4CEE3;
	Wed, 14 May 2025 15:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747234896;
	bh=UtAN4Ton/9OUVMqLuje4Bwq3iKoTshw5ftoT3Wo4niA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9AYKyG2U87LmHdU2+TMI9es2J94xjYL5GjUAwoxxAwXVp0VpCQu9dMzBMr65O2i9
	 KzPmcBrYNfzgYS9CNIIF7Xlp+QzOykOWF7bDDKq2leW7hx3IFpoeCIVHISeh09JSeW
	 4ANObG9lNLrtrrjdYvaeZs7pMi8Vdd665lg5j8wuPSKceBwyAhFA50WIyO87xJuaSw
	 AQoedSjkXGZilhFZ1qCjQE6rLiM/Bbw3EZRUnulZtpAJLYcJDW2DSkG/tmfr+P7owv
	 TByAMheGVeybJD1rB+FK0LlVdBjsXzyUwm/1DK5SBI/3X+gpPllew4ftFWRvaNhLQ+
	 moAE8cujCog5A==
Date: Wed, 14 May 2025 10:01:34 -0500
From: Rob Herring <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: krzk+dt@kernel.org, tglx@linutronix.de, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, paul.walmsley@sifive.com,
	alex@ghiti.fr, daniel.lezcano@linaro.org, conor+dt@kernel.org,
	aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
	tim609@andestech.com, linux-kernel@vger.kernel.org,
	geert+renesas@glider.be, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/9] dt-bindings: interrupt-controller: add Andes
 QiLai PLIC
Message-ID: <20250514150134.GB2180131-robh@kernel.org>
References: <20250514095350.3765716-1-ben717@andestech.com>
 <20250514095350.3765716-4-ben717@andestech.com>
 <174723438154.2170160.6461910184012543621.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <174723438154.2170160.6461910184012543621.robh@kernel.org>
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

On Wed, May 14, 2025 at 09:53:08AM -0500, Rob Herring (Arm) wrote:
> 
> On Wed, 14 May 2025 17:53:44 +0800, Ben Zong-You Xie wrote:
> > Add a new compatible string for Andes QiLai PLIC.
> > 
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> > ---
> >  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> Applied, thanks!

And now dropped.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
