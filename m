Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB7CC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Apr 2022 19:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgkv85klWmBerjIOd1lkbmm3bDiw1d2ostA+EmSCiTA=; b=s/Qc5XyKwwxLw0
	ooFoI2+Sd6E6w31g9eC78cTG42R3kXp79bX5JSxbT/sD6wc9LGoL5aME0HviDjZVXGOd/uY2w5S+M
	PiW4UD80l598T45kAwYuyf06d5l2Oeay+7VrEbMTxN1SpcZ/hM8tZtFejJ9wWdzVVBbE8K9WH/NZ9
	w0aK6DIP7oOPOfxo196hXyLXloOB37gFQYVst3pQd+TyM033K9Ya2gVOFmLLjH5Pbhb5NrfgfcGF4
	1vOTE1cStYn5PxuGPIGpUABIwSWu3R4FkBwR+Elnv6uvL05cP9ooCTdowKvoy1BGTSLMAMnvtUJ6y
	UWKgWacWw0muAsfIUxDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfo9o-00DQZB-4R; Sat, 16 Apr 2022 19:32:32 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfo9k-00DQYc-Lz
 for linux-riscv@lists.infradead.org; Sat, 16 Apr 2022 19:32:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id x18so6395443wrc.0
 for <linux-riscv@lists.infradead.org>; Sat, 16 Apr 2022 12:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=zKq3t9+WVckk287gJXVdTxBsvDIgk8B6FZnSS1BTPL4=;
 b=hFNxStPk6ljDQwSVsjzOkbywBaCgUHFTMhRf8KLzWQKkAK634TFpEv/iqqflmNmc+4
 H5nPQkWkiCU5YeKVCZyn9zW2a0IzF5fciuEckFnKEkxcMmv/IliYbvr7PY0OQC8wO1J7
 D5duSREpTHMOB/N5dyAEucbZIv8PnD3VrVhYI1hMKM8jNKMBLBmrtXkpuLAJsMzQUJHx
 kpO7aJeENbJYmrwewNwsbiwZirIGezWs9INOqa0rj/PUxb3hridsT8SLJtx94UvJ+/Ps
 B7zYWz90bX9w/cGmPrCiyYRos0wXG13wi8iUXmqdoaEhqNEpJqz/StjpZHP4ZnK7rHKI
 p4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zKq3t9+WVckk287gJXVdTxBsvDIgk8B6FZnSS1BTPL4=;
 b=P9ZL6f5yI0+nP+01vqX565EwNLWq1lXs8snCJByUSDrJzodpOEaGdsp5SQvPxhAYK1
 ZvD1UomRrfulGC3zgAHtj4+xwWcmz6OlUxjKTuCQkswwQ1ZnGwekz/uCmFV9QsJrhD4c
 3jDE7trhKUdXyC3miG6jJWJjvVNCdbJDdinS+5BcYEJPOaK/x0rdx5xgwysEur9B3DFV
 nTSPOXk0pfRjlsRF11PMT3gtRVKr9w08ktDlG4YYorPExEmKE3f7OUeLSQFvH9NuvvBD
 4SAW+a2XhAq08l95uwshHNXveX/SXWN6ol2MrSiSuegx6PpaB2+ghlXswYuExN21Ro+z
 gpyA==
X-Gm-Message-State: AOAM530aFFtXJtI2HIpY3n6V47Klx5SszVFr391VGHPzuO2NZplNJHWq
 cDZnmfs43diEn+g8V280NWQ=
X-Google-Smtp-Source: ABdhPJwXXdg4aIH03y8wvyozMGxucmhHV8S1YG4lSMDVE8AYMR7NHA91JGYnlXTGTd4gigMfa1nlvQ==
X-Received: by 2002:a05:6000:1568:b0:1f0:250a:d3ef with SMTP id
 8-20020a056000156800b001f0250ad3efmr3322201wrz.402.1650137543384; 
 Sat, 16 Apr 2022 12:32:23 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id
 p18-20020adfba92000000b001e4ae791663sm6798423wrg.62.2022.04.16.12.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 12:32:22 -0700 (PDT)
Date: Sat, 16 Apr 2022 21:32:21 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr,
 cmuellner@linux.com, philipp.tomsich@vrull.eu,
 herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: implement Zicbom-based CMO instructions + the
 t-head variant
Message-ID: <YlsZxVjgt3ZNQ7Ub@Red>
References: <20220307224620.1933061-1-heiko@sntech.de> <YllWTN+15CoskNBt@Red>
 <70da24dd-2d03-fc49-151d-daabb315a5f6@sholland.org>
 <YlpxsYREWv/LQ+HY@Red>
 <849a3728-7e84-4f26-0c73-4d68eae9ae01@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <849a3728-7e84-4f26-0c73-4d68eae9ae01@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_123228_761828_E19F8BB4 
X-CRM114-Status: GOOD (  25.43  )
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

Le Sat, Apr 16, 2022 at 12:47:29PM -0500, Samuel Holland a =E9crit :
> On 4/16/22 2:35 AM, Corentin Labbe wrote:
> > Le Fri, Apr 15, 2022 at 09:19:23PM -0500, Samuel Holland a =E9crit :
> >> On 4/15/22 6:26 AM, Corentin Labbe wrote:
> >>> Le Mon, Mar 07, 2022 at 11:46:18PM +0100, Heiko Stuebner a =E9crit :
> >>>> This series is based on the alternatives changes done in my svpbmt s=
eries
> >>>> and thus also depends on Atish's isa-extension parsing series.
> >>>>
> >>>> It implements using the cache-management instructions from the  Zicb=
om-
> >>>> extension to handle cache flush, etc actions on platforms needing th=
em.
> >>>>
> >>>> SoCs using cpu cores from T-Head like the Allwinne D1 implement a
> >>>> different set of cache instructions. But while they are different,
> >>>> instructions they provide the same functionality, so a variant can
> >>>> easly hook into the existing alternatives mechanism on those.
> >>>>
> >>>>
> >>>
> >>> Hello
> >>>
> >>> I am testing https://github.com/smaeul/linux.git branch:origin/riscv/=
d1-wip which contain this serie.
> >>>
> >>> I am hitting a buffer corruption problem with DMA.
> >>> The sun8i-ce crypto driver fail self tests due to "device overran des=
tination buffer".
> >>> In fact the buffer is not overran by device but by dma_map_single() o=
peration.
> >>>
> >>> The following small code show the problem:
> >>>
> >>> dma_addr_t dma;
> >>> u8 *buf;
> >>> #define BSIZE 2048
> >>> #define DMASIZE 16
> >>>
> >>> buf =3D kmalloc(BSIZE, GFP_KERNEL | GFP_DMA);
> >>> for (i =3D 0; i < BSIZE; i++)
> >>>     buf[i] =3D 0xFE;
> >>> print_hex_dump(KERN_INFO, "DMATEST1:", DUMP_PREFIX_NONE, 16, 4, buf, =
256, false);
> >>> dma =3D dma_map_single(ce->dev, buf, DMASIZE, DMA_FROM_DEVICE);
> >>
> >> This function (through dma_direct_map_page()) ends up calling
> >> arch_sync_dma_for_device(..., ..., DMA_FROM_DEVICE), which invalidates=
 the CPU's
> >> cache. This is the same thing other architectures do (at least arm, ar=
m64,
> >> openrisc, and powerpc). So this appears to be working as intended.
> > =

> > This behavour is not present at least on ARM and ARM64.
> > The sample code I provided does not corrupt the buffer on them.
> =

> That can be explained by the 0xFE bytes having been flushed to DRAM alrea=
dy in
> your ARM/ARM64 tests, whereas in your riscv64 case, the 0xFE bytes were s=
till in
> a dirty cache line. The cache topology and implementation is totally diff=
erent
> across the SoCs, so this is not too surprising.
> =

> Semantically, dma_map_single(..., DMA_FROM_DEVICE) means you are doing a
> unidirectional DMA transfer from the device into that buffer. So the cont=
ents of
> the buffer are "undefined" until the DMA transfer completes. If you are a=
lso
> writing data into the buffer from the CPU side, then you need DMA_BIDIREC=
TIONAL.
> =

> Regards,
> Samuel

+CC crypto mailing list + maintainer

My problem is that crypto selftest, for each buffer where I need to do a ci=
pher operation,
concat a poison buffer to check that device does write beyond buffer.

But the dma_map_sg(FROM_DEVICE) corrupts this poison buffer and crypto self=
tests fails thinking my device did a buffer overrun.

So you mean that on SoC D1, this crypto API check strategy is impossible ?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
