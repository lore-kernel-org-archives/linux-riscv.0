Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4C9C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Apr 2022 17:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvP+w9oP+tufUgksNYtgVISyf1JsLB36la1USa4sBqU=; b=fBiL+nHBK1wl5n
	fVnxUXuCRHwVKOR4scPii4+YmrtQwSrZo8fCmN8VnZuAHaayANtD5ZNkVT6vCUkTJJ9R5TBMTGIHq
	VRI+lXY2xyd0KE2tfyzk1bHmH2ri47ib2HoRzxgMLnjHKF3vdyZzuvbELEIIHT45p15nKbuBXAqkz
	xQqhnusACQRwbZOnPVeURPijN8ItAYq37HwbtaAOG12o9MRVZ9Eh0Po0tu2Cm+TvIsH5nC1JtTfth
	3E+oTlJCQZgMhKvupfKJSkl1IdZuNUQqcBIy7DxGRPFfSsOA6yD7S+qk3XqX3HeDTBJktSxzmT4hA
	r8TBP04CGciinZfhcxZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ng8o7-00Ejkw-OF; Sun, 17 Apr 2022 17:35:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ng8o4-00EjkZ-0D
 for linux-riscv@lists.infradead.org; Sun, 17 Apr 2022 17:35:30 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 133-20020a1c028b000000b0038ccb70e239so61022wmc.3
 for <linux-riscv@lists.infradead.org>; Sun, 17 Apr 2022 10:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=KMZt2bVJM1zLo0DjhLeNEZmiJ3z7y7UdEFlYZgbQlFo=;
 b=q47vSOyXrisZAu15yZ/0sW7h8Q1Lfy+mVgQNnOiQuxL7ftDD6Mgqi91ddqdMfJTXNQ
 QCggWtKnMC2cOJwFanDTSNBGXgoNwRCZ4W0Ng+/sqKvinwD1rRKcVJir4FfI94iEqgwL
 gJP2tfvpK+Qyzaem3XUao6rcSukVIwBDS1O4ahoRBQi6pHfJDvQlaOxvmElPmoW+oxta
 j1TItDP0/MVQjSZV6zR685EPFhlUEqLab4+f/2p3zWMi9iUQ8vOaOMcVcqwjT5UOB+eJ
 G8ya2Kbe88YDUrbkSwd8a5snLJqn1QjrSl7Bms1Y4MQh6kF+JfXheULQlrb89+PUSyWW
 mdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KMZt2bVJM1zLo0DjhLeNEZmiJ3z7y7UdEFlYZgbQlFo=;
 b=ww3ulZy931GsT7PAbFkVo7uo/zLIkZxwp8InSPXoGcytHbBzLVxNjnheUDyeJzTZva
 S1pyzIjrOaW1RYkV1pSdZMz+qe+swpJjLxTQvT5MyI6Z5AP9gZR0pjNMeRMmGm9HlA9k
 ixEWRcg5qZV8jcrmve+OC3mJPMwJj/gD9n6sJ4E2ms0GZ6Qq/fOB6kCjFrcQPesrhyNt
 spkFpAk0m2AaeyXp/E8AmZNIvazOEXrWabS9yw+VI3+o/rNh8EU6n4LCirhSb7KdxA1e
 nmSmPFjKtqZh9X+a4GSyV5rFJAm73ns5+vgyoAeV9qTDeu2L6WHXWTJ95mRCcfWspAni
 EhVA==
X-Gm-Message-State: AOAM530arx3PoMmEE09/ByKRWKbMZTf9SPm8mtEVilertcVMC1oqrlyF
 50n3X5xL6SuEgVnIzr/V4nI=
X-Google-Smtp-Source: ABdhPJyzBVGsbyJQgmx7ekA8ANp0KKP/jg8CuPLV7HzroOXyLwKn/H/m+WZRFyk65/0ebFnQ9bF/JQ==
X-Received: by 2002:a7b:c016:0:b0:38f:53c2:b8b3 with SMTP id
 c22-20020a7bc016000000b0038f53c2b8b3mr11677148wmb.13.1650216925713; 
 Sun, 17 Apr 2022 10:35:25 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id
 e1-20020a05600c4e4100b00392910b276esm2954901wmq.9.2022.04.17.10.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:35:25 -0700 (PDT)
Date: Sun, 17 Apr 2022 19:35:23 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>, Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Nick Kossifidis <mick@ics.forth.gr>,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: implement Zicbom-based CMO instructions + the
 t-head variant
Message-ID: <YlxP26dklDj2y+cP@Red>
References: <20220307224620.1933061-1-heiko@sntech.de> <YllWTN+15CoskNBt@Red>
 <70da24dd-2d03-fc49-151d-daabb315a5f6@sholland.org>
 <YlpxsYREWv/LQ+HY@Red>
 <849a3728-7e84-4f26-0c73-4d68eae9ae01@sholland.org>
 <YlsZxVjgt3ZNQ7Ub@Red>
 <CAJF2gTSNzLfon7yH3zvOJfYwQnVRvNWW7KygShLqcagRfbyAkg@mail.gmail.com>
 <YlvTkfIO9Oz3ib5i@Red>
 <CAJF2gTQ5rYATTHj2UtwxKw0dpvdHBUAih1RJf0XuGM8b6euZwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQ5rYATTHj2UtwxKw0dpvdHBUAih1RJf0XuGM8b6euZwQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_103528_108513_B60B7224 
X-CRM114-Status: GOOD (  44.14  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le Sun, Apr 17, 2022 at 04:49:34PM +0800, Guo Ren a =E9crit :
> On Sun, Apr 17, 2022 at 4:45 PM Corentin Labbe
> <clabbe.montjoie@gmail.com> wrote:
> >
> > Le Sun, Apr 17, 2022 at 10:17:34AM +0800, Guo Ren a =E9crit :
> > > On Sun, Apr 17, 2022 at 3:32 AM Corentin Labbe
> > > <clabbe.montjoie@gmail.com> wrote:
> > > >
> > > > Le Sat, Apr 16, 2022 at 12:47:29PM -0500, Samuel Holland a =E9crit :
> > > > > On 4/16/22 2:35 AM, Corentin Labbe wrote:
> > > > > > Le Fri, Apr 15, 2022 at 09:19:23PM -0500, Samuel Holland a =E9c=
rit :
> > > > > >> On 4/15/22 6:26 AM, Corentin Labbe wrote:
> > > > > >>> Le Mon, Mar 07, 2022 at 11:46:18PM +0100, Heiko Stuebner a =
=E9crit :
> > > > > >>>> This series is based on the alternatives changes done in my =
svpbmt series
> > > > > >>>> and thus also depends on Atish's isa-extension parsing serie=
s.
> > > > > >>>>
> > > > > >>>> It implements using the cache-management instructions from t=
he  Zicbom-
> > > > > >>>> extension to handle cache flush, etc actions on platforms ne=
eding them.
> > > > > >>>>
> > > > > >>>> SoCs using cpu cores from T-Head like the Allwinne D1 implem=
ent a
> > > > > >>>> different set of cache instructions. But while they are diff=
erent,
> > > > > >>>> instructions they provide the same functionality, so a varia=
nt can
> > > > > >>>> easly hook into the existing alternatives mechanism on those.
> > > > > >>>>
> > > > > >>>>
> > > > > >>>
> > > > > >>> Hello
> > > > > >>>
> > > > > >>> I am testing https://github.com/smaeul/linux.git branch:origi=
n/riscv/d1-wip which contain this serie.
> > > > > >>>
> > > > > >>> I am hitting a buffer corruption problem with DMA.
> > > > > >>> The sun8i-ce crypto driver fail self tests due to "device ove=
rran destination buffer".
> > > > > >>> In fact the buffer is not overran by device but by dma_map_si=
ngle() operation.
> > > > > >>>
> > > > > >>> The following small code show the problem:
> > > > > >>>
> > > > > >>> dma_addr_t dma;
> > > > > >>> u8 *buf;
> > > > > >>> #define BSIZE 2048
> > > > > >>> #define DMASIZE 16
> > > > > >>>
> > > > > >>> buf =3D kmalloc(BSIZE, GFP_KERNEL | GFP_DMA);
> > > > > >>> for (i =3D 0; i < BSIZE; i++)
> > > > > >>>     buf[i] =3D 0xFE;
> > > > > >>> print_hex_dump(KERN_INFO, "DMATEST1:", DUMP_PREFIX_NONE, 16, =
4, buf, 256, false);
> > > > > >>> dma =3D dma_map_single(ce->dev, buf, DMASIZE, DMA_FROM_DEVICE=
);
> > > > > >>
> > > > > >> This function (through dma_direct_map_page()) ends up calling
> > > > > >> arch_sync_dma_for_device(..., ..., DMA_FROM_DEVICE), which inv=
alidates the CPU's
> > > > > >> cache. This is the same thing other architectures do (at least=
 arm, arm64,
> > > > > >> openrisc, and powerpc). So this appears to be working as inten=
ded.
> > > > > >
> > > > > > This behavour is not present at least on ARM and ARM64.
> > > > > > The sample code I provided does not corrupt the buffer on them.
> > > > >
> > > > > That can be explained by the 0xFE bytes having been flushed to DR=
AM already in
> > > > > your ARM/ARM64 tests, whereas in your riscv64 case, the 0xFE byte=
s were still in
> > > > > a dirty cache line. The cache topology and implementation is tota=
lly different
> > > > > across the SoCs, so this is not too surprising.
> > > > >
> > > > > Semantically, dma_map_single(..., DMA_FROM_DEVICE) means you are =
doing a
> > > > > unidirectional DMA transfer from the device into that buffer. So =
the contents of
> > > > > the buffer are "undefined" until the DMA transfer completes. If y=
ou are also
> > > > > writing data into the buffer from the CPU side, then you need DMA=
_BIDIRECTIONAL.
> > > > >
> > > > > Regards,
> > > > > Samuel
> > > >
> > > > +CC crypto mailing list + maintainer
> > > >
> > > > My problem is that crypto selftest, for each buffer where I need to=
 do a cipher operation,
> > > > concat a poison buffer to check that device does write beyond buffe=
r.
> > > >
> > > > But the dma_map_sg(FROM_DEVICE) corrupts this poison buffer and cry=
pto selftests fails thinking my device did a buffer overrun.
> > > >
> > > > So you mean that on SoC D1, this crypto API check strategy is impos=
sible ?
> > >
> > > I think you could try to replace all CLEAN & INVAL ops with FLUSH ops
> > > for the testing. (All cache block-aligned data from the device for the
> > > CPU should be invalided.)
> > >
> >
> > With:
> > diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoh=
erent.c
> > index 2c124bcc1932..608483522e05 100644
> > --- a/arch/riscv/mm/dma-noncoherent.c
> > +++ b/arch/riscv/mm/dma-noncoherent.c
> > @@ -21,7 +21,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size=
_t size, enum dma_data_dire
> >                 ALT_CMO_OP(CLEAN, (unsigned long)phys_to_virt(paddr), s=
ize);
> >                 break;
> >         case DMA_FROM_DEVICE:
> > -               ALT_CMO_OP(INVAL, (unsigned long)phys_to_virt(paddr), s=
ize);
> > +               ALT_CMO_OP(FLUSH, (unsigned long)phys_to_virt(paddr), s=
ize);
> >                 break;
> >         case DMA_BIDIRECTIONAL:
> >                 ALT_CMO_OP(FLUSH, (unsigned long)phys_to_virt(paddr), s=
ize);
> >
> >
> > The crypto self test works and I got no more buffer corruption.
> No, No ... it's not a solution. That means your driver has a problem.
> From device, we only need INVAL enough.
> =


For me, my driver works fine, the problem came from dma_map_sg(), probably =
I didnt explain right, I restart.

Example:
crypto self test send to my driver an AES cipher operation of 16 bytes insi=
de a SG, but the original buffer is greater (said 32 for the example).
So the first 16 bytes are used by the SG and the last 16 bytes are a poison=
ed buffer (with value 0xFE) to check driver do not write beyong the normal =
operation of 16 bytes (and beyond the SG length).

Doing the dma_map_sg(FROM_DEVICE) on the SG corrupt the whole buffer.
My driver write normally via DMA the first 16 bytes.
Crypto API check the last bytes, no more 0xFE, so it fail believing my driv=
er wrote beyond the first 16 bytes.

But even If I disable my hardware operation, the buffer is still corrupted.=
 (See my sample code which just do dma_map/dma_unmap)

So the problem is the dma_map(FROM_DEVICE) which change buffer content.

So if this behavour is normal on D1 SoC, how to fix the crypto self tests ?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
