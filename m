Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44164C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 07:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=viDy3nxNF4XJZlct1NyM5NPTaI0JYhhW8D0DO6Yg1Og=; b=zVOldF5mz9zo/6
	4vfpXWSEzPMJPgc+/5CKdyh2mJKUG2CrevL+amLDgPp/1A2zpaJraS3YlWUi1J5CmPDDUpAfG0SNh
	EZFCEYxb0V6UBhciTrHlEJknr0uAvhvPo1Nj2V4RzXe9WK0QxyGQod1+O9PyB1vFMNBfsMkhPIED1
	ueKT0nHUSLvlUXf31J3wXuCB0qx/PPdK0S1jnvaAU+hqg0hEOd2QS2mq7jY0oY8wtEvf+wHTujVic
	EhUaTzqpqsfVbGF2m2OEd9/tVUqKQo2vxpxKDPt34qndK1RckCq6EfFTsNRqOdiAOpRwCLqUEiLo9
	LYWt7xH6HC4CU+wYjfVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngiai-0028p7-TF; Tue, 19 Apr 2022 07:48:04 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngiWx-0026bk-Ac
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 07:44:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id w4so21204547wrg.12
 for <linux-riscv@lists.infradead.org>; Tue, 19 Apr 2022 00:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Td4Hy43R6SEG1pSO6X3vGzswl7vCz1dgDqCHGi0vEko=;
 b=amXfhlUYJ0+KM8IxEq4FT8n4km/zvVadqRbfTjwrztbRO8AjAy9ooKFJu1tnjVihT5
 bNW2u/auAZA6P2JiXMtrqZsk9sN73gFbu6/60Ls4TV0dm1xmqSEy6ouZ2Q75O8byGRQW
 6caopDBH0jU7rXoaf/3OXByzjLbC/UmnEJUkGl+3qFDw7clw2haCYusMnkmFH8tnyBcc
 tcQ4Bus1Nk2FSeEUUGyx/V9lHEJSKO9IYx1hgRshvUZ0bspAaH/FdX6EfmH7Wt5yqTpu
 Nq8i9BdrOq01JnXs1TQK6oCGq0KED0opFguEMn0wJ0/1ByIF9DuIhlN/g+DoRBlVWPu7
 xRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Td4Hy43R6SEG1pSO6X3vGzswl7vCz1dgDqCHGi0vEko=;
 b=HZnAQvzouDjWS6w05Cn3N4kWKjgMw7GiGYAE7mFtsElZqMXJCmzseZydgIVUKwkhV0
 nBBe54Mv0LOHMELMKZxFwsTBK6N+0SvmBKLKy/ZlKuXRldUU894eWoWqg0C2ewIVs8gx
 87kXlZTV00tFxK+hhxcS6fh8SRuWTx+7Gq5+6nxsZTJQcQHB+MgNgE+ViJLE9aJOiacj
 CDowC7Dtvasy4Wl2th2HsPS1i5fFmKMyAwgJ0ktuBFMoSbm75w52Uk/xEkbAg7XnB5GV
 OmfcBvUGgJzPBJPGT7e1pYZ83xdW9E5tlusD7SqWfUtcnZhtgQZ9O+hkU1d8n1A5qNfC
 4eyg==
X-Gm-Message-State: AOAM5302x7s8Fuuaoy5KhMu7AQl0tPgfMtBuA0lvP1ALW19bVYcyXEP7
 87l1o0pzQKudS3Hwh3FLYRI=
X-Google-Smtp-Source: ABdhPJyPmfPsbf+yNodLgTbvOFCNxRsuD75a/3auxzXxSukB3FUe2LejoxHw+cdrH2+O79tXHPG8Ow==
X-Received: by 2002:a5d:6650:0:b0:207:ac24:a825 with SMTP id
 f16-20020a5d6650000000b00207ac24a825mr10545728wrw.97.1650354246817; 
 Tue, 19 Apr 2022 00:44:06 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id
 l8-20020a5d5608000000b00207ab405d15sm11882256wrv.42.2022.04.19.00.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 00:44:06 -0700 (PDT)
Date: Tue, 19 Apr 2022 09:44:04 +0200
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
Message-ID: <Yl5oRPuNC3w+UI0q@Red>
References: <YllWTN+15CoskNBt@Red>
 <70da24dd-2d03-fc49-151d-daabb315a5f6@sholland.org>
 <YlpxsYREWv/LQ+HY@Red>
 <849a3728-7e84-4f26-0c73-4d68eae9ae01@sholland.org>
 <YlsZxVjgt3ZNQ7Ub@Red>
 <CAJF2gTSNzLfon7yH3zvOJfYwQnVRvNWW7KygShLqcagRfbyAkg@mail.gmail.com>
 <YlvTkfIO9Oz3ib5i@Red>
 <CAJF2gTQ5rYATTHj2UtwxKw0dpvdHBUAih1RJf0XuGM8b6euZwQ@mail.gmail.com>
 <YlxP26dklDj2y+cP@Red>
 <CAJF2gTQNBVBGqbtHckwtB59wjrPoN-Li32BcUJpLahaYDnU3WQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQNBVBGqbtHckwtB59wjrPoN-Li32BcUJpLahaYDnU3WQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_004411_409959_FE42C880 
X-CRM114-Status: GOOD (  51.51  )
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

Le Mon, Apr 18, 2022 at 06:50:57AM +0800, Guo Ren a =E9crit :
> On Mon, Apr 18, 2022 at 1:35 AM Corentin Labbe
> <clabbe.montjoie@gmail.com> wrote:
> >
> > Le Sun, Apr 17, 2022 at 04:49:34PM +0800, Guo Ren a =E9crit :
> > > On Sun, Apr 17, 2022 at 4:45 PM Corentin Labbe
> > > <clabbe.montjoie@gmail.com> wrote:
> > > >
> > > > Le Sun, Apr 17, 2022 at 10:17:34AM +0800, Guo Ren a =E9crit :
> > > > > On Sun, Apr 17, 2022 at 3:32 AM Corentin Labbe
> > > > > <clabbe.montjoie@gmail.com> wrote:
> > > > > >
> > > > > > Le Sat, Apr 16, 2022 at 12:47:29PM -0500, Samuel Holland a =E9c=
rit :
> > > > > > > On 4/16/22 2:35 AM, Corentin Labbe wrote:
> > > > > > > > Le Fri, Apr 15, 2022 at 09:19:23PM -0500, Samuel Holland a =
=E9crit :
> > > > > > > >> On 4/15/22 6:26 AM, Corentin Labbe wrote:
> > > > > > > >>> Le Mon, Mar 07, 2022 at 11:46:18PM +0100, Heiko Stuebner =
a =E9crit :
> > > > > > > >>>> This series is based on the alternatives changes done in=
 my svpbmt series
> > > > > > > >>>> and thus also depends on Atish's isa-extension parsing s=
eries.
> > > > > > > >>>>
> > > > > > > >>>> It implements using the cache-management instructions fr=
om the  Zicbom-
> > > > > > > >>>> extension to handle cache flush, etc actions on platform=
s needing them.
> > > > > > > >>>>
> > > > > > > >>>> SoCs using cpu cores from T-Head like the Allwinne D1 im=
plement a
> > > > > > > >>>> different set of cache instructions. But while they are =
different,
> > > > > > > >>>> instructions they provide the same functionality, so a v=
ariant can
> > > > > > > >>>> easly hook into the existing alternatives mechanism on t=
hose.
> > > > > > > >>>>
> > > > > > > >>>>
> > > > > > > >>>
> > > > > > > >>> Hello
> > > > > > > >>>
> > > > > > > >>> I am testing https://github.com/smaeul/linux.git branch:o=
rigin/riscv/d1-wip which contain this serie.
> > > > > > > >>>
> > > > > > > >>> I am hitting a buffer corruption problem with DMA.
> > > > > > > >>> The sun8i-ce crypto driver fail self tests due to "device=
 overran destination buffer".
> > > > > > > >>> In fact the buffer is not overran by device but by dma_ma=
p_single() operation.
> > > > > > > >>>
> > > > > > > >>> The following small code show the problem:
> > > > > > > >>>
> > > > > > > >>> dma_addr_t dma;
> > > > > > > >>> u8 *buf;
> > > > > > > >>> #define BSIZE 2048
> > > > > > > >>> #define DMASIZE 16
> > > > > > > >>>
> > > > > > > >>> buf =3D kmalloc(BSIZE, GFP_KERNEL | GFP_DMA);
> > > > > > > >>> for (i =3D 0; i < BSIZE; i++)
> > > > > > > >>>     buf[i] =3D 0xFE;
> > > > > > > >>> print_hex_dump(KERN_INFO, "DMATEST1:", DUMP_PREFIX_NONE, =
16, 4, buf, 256, false);
> > > > > > > >>> dma =3D dma_map_single(ce->dev, buf, DMASIZE, DMA_FROM_DE=
VICE);
> > > > > > > >>
> > > > > > > >> This function (through dma_direct_map_page()) ends up call=
ing
> > > > > > > >> arch_sync_dma_for_device(..., ..., DMA_FROM_DEVICE), which=
 invalidates the CPU's
> > > > > > > >> cache. This is the same thing other architectures do (at l=
east arm, arm64,
> > > > > > > >> openrisc, and powerpc). So this appears to be working as i=
ntended.
> > > > > > > >
> > > > > > > > This behavour is not present at least on ARM and ARM64.
> > > > > > > > The sample code I provided does not corrupt the buffer on t=
hem.
> > > > > > >
> > > > > > > That can be explained by the 0xFE bytes having been flushed t=
o DRAM already in
> > > > > > > your ARM/ARM64 tests, whereas in your riscv64 case, the 0xFE =
bytes were still in
> > > > > > > a dirty cache line. The cache topology and implementation is =
totally different
> > > > > > > across the SoCs, so this is not too surprising.
> > > > > > >
> > > > > > > Semantically, dma_map_single(..., DMA_FROM_DEVICE) means you =
are doing a
> > > > > > > unidirectional DMA transfer from the device into that buffer.=
 So the contents of
> > > > > > > the buffer are "undefined" until the DMA transfer completes. =
If you are also
> > > > > > > writing data into the buffer from the CPU side, then you need=
 DMA_BIDIRECTIONAL.
> > > > > > >
> > > > > > > Regards,
> > > > > > > Samuel
> > > > > >
> > > > > > +CC crypto mailing list + maintainer
> > > > > >
> > > > > > My problem is that crypto selftest, for each buffer where I nee=
d to do a cipher operation,
> > > > > > concat a poison buffer to check that device does write beyond b=
uffer.
> > > > > >
> > > > > > But the dma_map_sg(FROM_DEVICE) corrupts this poison buffer and=
 crypto selftests fails thinking my device did a buffer overrun.
> > > > > >
> > > > > > So you mean that on SoC D1, this crypto API check strategy is i=
mpossible ?
> > > > >
> > > > > I think you could try to replace all CLEAN & INVAL ops with FLUSH=
 ops
> > > > > for the testing. (All cache block-aligned data from the device fo=
r the
> > > > > CPU should be invalided.)
> > > > >
> > > >
> > > > With:
> > > > diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-no=
ncoherent.c
> > > > index 2c124bcc1932..608483522e05 100644
> > > > --- a/arch/riscv/mm/dma-noncoherent.c
> > > > +++ b/arch/riscv/mm/dma-noncoherent.c
> > > > @@ -21,7 +21,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, =
size_t size, enum dma_data_dire
> > > >                 ALT_CMO_OP(CLEAN, (unsigned long)phys_to_virt(paddr=
), size);
> > > >                 break;
> > > >         case DMA_FROM_DEVICE:
> > > > -               ALT_CMO_OP(INVAL, (unsigned long)phys_to_virt(paddr=
), size);
> > > > +               ALT_CMO_OP(FLUSH, (unsigned long)phys_to_virt(paddr=
), size);
> > > >                 break;
> > > >         case DMA_BIDIRECTIONAL:
> > > >                 ALT_CMO_OP(FLUSH, (unsigned long)phys_to_virt(paddr=
), size);
> > > >
> > > >
> > > > The crypto self test works and I got no more buffer corruption.
> > > No, No ... it's not a solution. That means your driver has a problem.
> > > From device, we only need INVAL enough.
> > >
> >
> > For me, my driver works fine, the problem came from dma_map_sg(), proba=
bly I didnt explain right, I restart.
> >
> > Example:
> > crypto self test send to my driver an AES cipher operation of 16 bytes =
inside a SG, but the original buffer is greater (said 32 for the example).
> > So the first 16 bytes are used by the SG and the last 16 bytes are a po=
isoned buffer (with value 0xFE) to check driver do not write beyong the nor=
mal operation of 16 bytes (and beyond the SG length).
> >
> > Doing the dma_map_sg(FROM_DEVICE) on the SG corrupt the whole buffer.
> > My driver write normally via DMA the first 16 bytes.
> > Crypto API check the last bytes, no more 0xFE, so it fail believing my =
driver wrote beyond the first 16 bytes.
> >
> > But even If I disable my hardware operation, the buffer is still corrup=
ted. (See my sample code which just do dma_map/dma_unmap)
> >
> > So the problem is the dma_map(FROM_DEVICE) which change buffer content.
> >
> > So if this behavour is normal on D1 SoC, how to fix the crypto self tes=
ts ?
> Actually, FLUSH is safe for all, but more expensive. Can you tell me
> which arm SOC are you using? And which version of linux is running on
> your arm SOC?
> =


The SOC is Allwinner D1 (RiscV).
I am testing linux from https://github.com/smaeul/linux.git branch:origin/r=
iscv/d1-wip


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
