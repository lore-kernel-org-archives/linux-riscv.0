Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77B9C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 12:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXJy4qBaDNLXa9OuGqJpRCwpIiRPDZXFN7eeo7/crkY=; b=qgS5o6VN/r65YE
	MzGjwOL4GAMuuUtoFQ1B+EqP/mRRvaVp/fyO9v0P/jtzFMLIgCzl5gYsKbXFvRnZ4XCHA7I4GHnDI
	oHl3oi92TvYTcOlw/kVpvj7cpzdce+y1nqNXzp1h09Ghw8IrT+JKCpjcPYmVgWq14VTqO3PBdskJE
	nGK0CXfuwvGxlpJXzGA9Vld0IJ2XkF2Bg1uERBG51dtIDi0ln6ArZI3neUDLCHr0+tn7NrMQg14wR
	oLWprJ6mK5E2dyN6U1dE0sMtlNJuLuHgepPeGOIHyvWZ+4VTuNcRbMfK1lbeHYv9YDGQ3IB35GC7l
	7/JAx6LKNnvkBdX3rX2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyXdP-00GMDg-Ca; Fri, 25 Nov 2022 12:16:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyXdM-00GMCP-2n
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 12:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669378603; x=1700914603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xSFOXCUtd8kCT1EOBLk19+HwBikY8iOKRD/WMkWE6uU=;
  b=HHTYpNXlH6+3f90n7/SLU50FHNYUZ0btFWsH4PBpuBJhqrYRfiYINSF4
   3oqgx2dJeC084UWIDG2LeoSJChZKnSwFrUjEAQ4c/SaFhhX57geXQDZn/
   AePY9IO+XuH47xUdQPGBmD28scPyG/OIIvjMYquGKPzdHjY0gDdtx6ETd
   6Shzw0ILn+At+FJ7RAlMLBpCBgwac1wOrwxBeCYOBn3IoJUwHepPj5Z+H
   Vm/BCIm5xlJVmGqQAjl0XXDr0+r3b+KRsTwRAnLb+xtT6oZkGZDwy8jdd
   esBWLGkTNLh9cDhPpELhtrnkEmqlWjvD2uHQOmp4y7b0ub8Nktgqzw+5i
   g==;
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="188647684"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2022 05:16:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 25 Nov 2022 05:16:39 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 25 Nov 2022 05:16:36 -0700
Date: Fri, 25 Nov 2022 12:16:18 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, Anup
 Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich
	<philipp.tomsich@vrull.eu>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 7/7] soc: renesas: Add L2 cache management for RZ/Five
 SoC
Message-ID: <Y4CyEkzn2rqRqx+t@wendy>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y3/ivrvx4A+OImtW@spud>
 <CA+V-a8uBrx-+S59_zMz6kyLurVs4z0f+WxuUKc8k3VQWuZYWWA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8uBrx-+S59_zMz6kyLurVs4z0f+WxuUKc8k3VQWuZYWWA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_041644_261775_0499ACCB 
X-CRM114-Status: GOOD (  12.70  )
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

On Fri, Nov 25, 2022 at 10:50:01AM +0000, Lad, Prabhakar wrote:
> Hi Conor,
> 
> Thank you for the review.
> 
> On Thu, Nov 24, 2022 at 9:31 PM Conor Dooley <conor@kernel.org> wrote:

> > But yeah, this is basically the sort of stuff that'd be nice to have in
> > the previous patch!
> >
> Agreed, I'll include this in the binding patch too.

I said "the previous patch" but I meant "the previous patch that I
commented on the commit message for". I can hardly expect telepathy, so
sorry for the poor wording.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
