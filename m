Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A62C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Apr 2022 08:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzaJaHn1G4BejBAwuggJb21EVND5dUrxXcqVXbgp7QA=; b=r2tPxotb5n/ehz
	x0R2xTsLpeYi7VK7nt+1vFRqjtA+VZ+cKAL+4MdwUmUxucvlZ7SR+3OmWH0aSD+XvzuudMUqwFNwu
	rhIUEkYl8mvKxzHJmfl+fWwFWW3MFCkHPNOQS8EgQkh3WWlVtmfdWhGnUWu7GShl4TMpVDJjegCtb
	D5BqLvtV5JxHM7E8YFRssy68jAkCBAdxTj3o0GvjlvhjwjunguEi9PLExkB1sTvUeu/HX4ob7SFRu
	IrSXJoHvCZtxwgpPBm4N3GHryE0v1TOtNIpuAp9EwKY6E87bkMhWmVH7GYo07+AOYTRkqH4DQmzra
	lYnyQvMj0r2404D7Rn8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ng0Ww-00E7JQ-PH; Sun, 17 Apr 2022 08:45:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ng0Wt-00E7Gl-AA
 for linux-riscv@lists.infradead.org; Sun, 17 Apr 2022 08:45:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id y21so5754042wmi.2
 for <linux-riscv@lists.infradead.org>; Sun, 17 Apr 2022 01:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7wWS6noHLcNsU8scVbVVSUAGOxSaanswt4nimge22b8=;
 b=RJg5KyIpRAK0Ho2i/k1FafodyQ9j6XIcg+NURJxgo66fSFH8y/P1U1IwyIeZv2opML
 c45X2rwADSaZoKuR4jbi+gyHJlVL8xFv/9tUHBE8fJ+xjlDKUsPJv9+Aztti9pO6QFaU
 ISRaGaea2S4L+cSoDveGP/xxC+kLLhpXVYczwItDJZ1rSiDY0OKV6zC2dFBnqIpFuaPx
 8hVUO2SNs0knLK7XgdpKmsRlcGSlFvXS9Zod2wFrhxshUrn0/Ia498wvCezAh31ohvFS
 QKWHXLF2VmvgBa/Lwiw0x15TdYhk2EZLniUL6c91LmfJkg38ep4UyZBFPc5V/am1FbMW
 K0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7wWS6noHLcNsU8scVbVVSUAGOxSaanswt4nimge22b8=;
 b=05jjgltB4YviML75sKua91QxfUXPgSt9zOngakztK9rNzWmJt49VWMKbQZi/TEL2/1
 LzsyxesveQkQiZ5D3+/a2IZ7Ti9dE6OzsaITfDmusa7UndqdJgH6wOWWFLUOFq19hPtp
 Hy0iqFbLxL8PngS5ZCS3I3UCqQfzAo2XXXCEJCt9s9vPv+KoVyMzwQkSdvT8BsNqC5gd
 lRrUFU038mFea85U+2Uwoa6W5A+5mhfLCq1QytotM61OCs27wlShMXnnSq/MMp36fcin
 CGq0TUUENbvIyMf/H++ARIW1hVLrL9/yAvXA28zCvFgcBW+tuORyNUWtHTQz+Y3Hb7iU
 qs7g==
X-Gm-Message-State: AOAM532+akWRHSb+gc98i6Rp/kxYsHeCEoxNtTtDRMgarNofXEhJii0s
 TJYA+8uXKBjMWzVE6+5TPIc=
X-Google-Smtp-Source: ABdhPJy0X7/oCDY4Yf3RbA22FQLnuwgS4px/fhnSP8iHYTFC1msOKWeHpKY6R5yfbWh6eoieriHBXg==
X-Received: by 2002:a7b:c5d0:0:b0:355:482a:6f44 with SMTP id
 n16-20020a7bc5d0000000b00355482a6f44mr6287455wmk.58.1650185108105; 
 Sun, 17 Apr 2022 01:45:08 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id
 j36-20020a05600c1c2400b0038ec526a0e3sm16509818wms.9.2022.04.17.01.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 01:45:07 -0700 (PDT)
Date: Sun, 17 Apr 2022 10:45:05 +0200
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
Message-ID: <YlvTkfIO9Oz3ib5i@Red>
References: <20220307224620.1933061-1-heiko@sntech.de> <YllWTN+15CoskNBt@Red>
 <70da24dd-2d03-fc49-151d-daabb315a5f6@sholland.org>
 <YlpxsYREWv/LQ+HY@Red>
 <849a3728-7e84-4f26-0c73-4d68eae9ae01@sholland.org>
 <YlsZxVjgt3ZNQ7Ub@Red>
 <CAJF2gTSNzLfon7yH3zvOJfYwQnVRvNWW7KygShLqcagRfbyAkg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSNzLfon7yH3zvOJfYwQnVRvNWW7KygShLqcagRfbyAkg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_014511_418714_EAABB207 
X-CRM114-Status: GOOD (  36.87  )
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

Le Sun, Apr 17, 2022 at 10:17:34AM +0800, Guo Ren a =E9crit :
> On Sun, Apr 17, 2022 at 3:32 AM Corentin Labbe
> <clabbe.montjoie@gmail.com> wrote:
> >
> > Le Sat, Apr 16, 2022 at 12:47:29PM -0500, Samuel Holland a =E9crit :
> > > On 4/16/22 2:35 AM, Corentin Labbe wrote:
> > > > Le Fri, Apr 15, 2022 at 09:19:23PM -0500, Samuel Holland a =E9crit :
> > > >> On 4/15/22 6:26 AM, Corentin Labbe wrote:
> > > >>> Le Mon, Mar 07, 2022 at 11:46:18PM +0100, Heiko Stuebner a =E9cri=
t :
> > > >>>> This series is based on the alternatives changes done in my svpb=
mt series
> > > >>>> and thus also depends on Atish's isa-extension parsing series.
> > > >>>>
> > > >>>> It implements using the cache-management instructions from the  =
Zicbom-
> > > >>>> extension to handle cache flush, etc actions on platforms needin=
g them.
> > > >>>>
> > > >>>> SoCs using cpu cores from T-Head like the Allwinne D1 implement a
> > > >>>> different set of cache instructions. But while they are differen=
t,
> > > >>>> instructions they provide the same functionality, so a variant c=
an
> > > >>>> easly hook into the existing alternatives mechanism on those.
> > > >>>>
> > > >>>>
> > > >>>
> > > >>> Hello
> > > >>>
> > > >>> I am testing https://github.com/smaeul/linux.git branch:origin/ri=
scv/d1-wip which contain this serie.
> > > >>>
> > > >>> I am hitting a buffer corruption problem with DMA.
> > > >>> The sun8i-ce crypto driver fail self tests due to "device overran=
 destination buffer".
> > > >>> In fact the buffer is not overran by device but by dma_map_single=
() operation.
> > > >>>
> > > >>> The following small code show the problem:
> > > >>>
> > > >>> dma_addr_t dma;
> > > >>> u8 *buf;
> > > >>> #define BSIZE 2048
> > > >>> #define DMASIZE 16
> > > >>>
> > > >>> buf =3D kmalloc(BSIZE, GFP_KERNEL | GFP_DMA);
> > > >>> for (i =3D 0; i < BSIZE; i++)
> > > >>>     buf[i] =3D 0xFE;
> > > >>> print_hex_dump(KERN_INFO, "DMATEST1:", DUMP_PREFIX_NONE, 16, 4, b=
uf, 256, false);
> > > >>> dma =3D dma_map_single(ce->dev, buf, DMASIZE, DMA_FROM_DEVICE);
> > > >>
> > > >> This function (through dma_direct_map_page()) ends up calling
> > > >> arch_sync_dma_for_device(..., ..., DMA_FROM_DEVICE), which invalid=
ates the CPU's
> > > >> cache. This is the same thing other architectures do (at least arm=
, arm64,
> > > >> openrisc, and powerpc). So this appears to be working as intended.
> > > >
> > > > This behavour is not present at least on ARM and ARM64.
> > > > The sample code I provided does not corrupt the buffer on them.
> > >
> > > That can be explained by the 0xFE bytes having been flushed to DRAM a=
lready in
> > > your ARM/ARM64 tests, whereas in your riscv64 case, the 0xFE bytes we=
re still in
> > > a dirty cache line. The cache topology and implementation is totally =
different
> > > across the SoCs, so this is not too surprising.
> > >
> > > Semantically, dma_map_single(..., DMA_FROM_DEVICE) means you are doin=
g a
> > > unidirectional DMA transfer from the device into that buffer. So the =
contents of
> > > the buffer are "undefined" until the DMA transfer completes. If you a=
re also
> > > writing data into the buffer from the CPU side, then you need DMA_BID=
IRECTIONAL.
> > >
> > > Regards,
> > > Samuel
> >
> > +CC crypto mailing list + maintainer
> >
> > My problem is that crypto selftest, for each buffer where I need to do =
a cipher operation,
> > concat a poison buffer to check that device does write beyond buffer.
> >
> > But the dma_map_sg(FROM_DEVICE) corrupts this poison buffer and crypto =
selftests fails thinking my device did a buffer overrun.
> >
> > So you mean that on SoC D1, this crypto API check strategy is impossibl=
e ?
> =

> I think you could try to replace all CLEAN & INVAL ops with FLUSH ops
> for the testing. (All cache block-aligned data from the device for the
> CPU should be invalided.)
> =


With:
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoheren=
t.c
index 2c124bcc1932..608483522e05 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -21,7 +21,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t s=
ize, enum dma_data_dire
                ALT_CMO_OP(CLEAN, (unsigned long)phys_to_virt(paddr), size);
                break;
        case DMA_FROM_DEVICE:
-               ALT_CMO_OP(INVAL, (unsigned long)phys_to_virt(paddr), size);
+               ALT_CMO_OP(FLUSH, (unsigned long)phys_to_virt(paddr), size);
                break;
        case DMA_BIDIRECTIONAL:
                ALT_CMO_OP(FLUSH, (unsigned long)phys_to_virt(paddr), size);


The crypto self test works and I got no more buffer corruption.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
