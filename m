Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6C0C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 07:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8oS3Q1sklrwJg/n9V5DKHtWLgPlC/gEM7KENmIDa7Fs=; b=OiF8M8k/9LDAKx
	yrxNiAfpt65XfVXNcx3kFjICn8bEf3j1NpKtXKmYJJ2usHBGsDPiH2dYZokoHuGwqKUbHHdKBCeaU
	1cFSCZyx+viImzlTRKpLaQQhOqZY33K/+++0dogZbWvBJ+7/qlrUrvbAr+yI0wbCGuHN5qkpA5CdA
	C5kqrPc1rp/2gWn8uflVdr2OWUR1OwsOnFkv1ms2MPJ+rMuLivB7a1Aj/nBwEeNsYBuNDm4SHrpEL
	V24GXFwy6IBo5ML5/q2WLt8VtzW2BQFtds9eohMKHYD+jKOYg+d63dTcATyZV+qsvW/8KWPYEXBQQ
	w38HKdJA5+Zm8BXRyVUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofcPm-008lHw-5w; Tue, 04 Oct 2022 07:32:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofcPj-008lG2-Jz
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 07:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664868747; x=1696404747;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B7CtfrCbolV18LxT8S0d6Hty+iGNajgoYldBeI1fZ6g=;
  b=U+GNsGI2220Uit9QUsyvs+teHXMoFedMlgrj+oiHw24bt9DrGRfsJp0J
   w3QWn0ZHs5AT5CPa7jy/NwsDJrz/7EI34auHnXXlheqRwjv2YxALNHZyl
   Q8LMO9U0ihFnQpf8RRPMmwHFJwlnEwGMRoumsthM+zFGK6nJTFuys59hM
   3I0df4T0ZJXx0bTa/ZL160MWUZdJLkWWPaV4eUWhJZBwAnQ8Z4KI1aRP3
   W4GXdxP/rklhFeUOZWAcGwpBOSRNqSe7/9kqsiQ+6WdbDMNnUSZp8oqIP
   kw8JDhVIYMM8PhOJyv2ApfvV2HVh3rdsuuD9pPMW9NAGowCQgKKwUJRCv
   g==;
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="193694898"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Oct 2022 00:32:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 4 Oct 2022 00:32:20 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 4 Oct 2022 00:32:17 -0700
Date: Tue, 4 Oct 2022 08:31:55 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Magnus Damm
	<magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren
	<guoren@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Nathan
 Chancellor <nathan@kernel.org>, Atish Patra <atishp@rivosinc.com>, Anup Patel
	<apatel@ventanamicro.com>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: soc: renesas:
 r9a07g043f-l2-cache: Add DT binding documentation for L2 cache controller
Message-ID: <YzvhaxuZbeCwLZ5m@wendy>
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221003223222.448551-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX1BuvHz46QWd+ajEcwmWMeSmvN4AtODuFEysRk14ArZQ@mail.gmail.com>
 <CA+V-a8vnNQDMgjhJfz91g++dVVv5Z5FTuFrNRHLW3PjPump0Mg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8vnNQDMgjhJfz91g++dVVv5Z5FTuFrNRHLW3PjPump0Mg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_003227_684831_6C2EEF88 
X-CRM114-Status: GOOD (  20.63  )
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

On Tue, Oct 04, 2022 at 08:26:01AM +0100, Lad, Prabhakar wrote:
> Hi Geert,
> 
> Thank you for the review.
> 
> On Tue, Oct 4, 2022 at 7:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Tue, Oct 4, 2022 at 12:32 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
> > >
> > > The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> > > Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> > > describes the L2 cache block.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
> >
> > Not andestech,ax45mp-cache.yaml?
> >
> I wasn't sure as we were including this in soc/renesas so named it as
> r9a07g043f-l2-cache.yaml if there are no issues I'll rename it
> andestech,ax45mp-cache.yaml.

I may be guilty of suggesting soc/renesas in the first place, but should
this maybe be in soc/andestech? I have no skin in the game, so at the
end of the day it doesnt matter to me, but I would imagine that you're
not going to be the only users of this l2 cache? Or is it a case of "we
will deal with future users when said future users arrive"? But either
way, naming it after the less specific compatible makes more sense to
me.

Thanks,
Conor.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
