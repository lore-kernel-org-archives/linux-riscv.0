Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13484C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 05:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2Xas4b5/+I9pbbT5xHMSOj5SWfgTQ8ftIkzmrgwHmk=; b=sNpfsuIERxM5CT
	3knY4jO3YgslS843Ix6XLrmE2kSzZJpNyUkViDOlFomyp6+vmDTeEgv1zOh8RRQ/JiwnyxdOVle3F
	EPYN896jVDtSSj3iQBl9g3ZbNZXAbIMa2YX3qJjr0AIsc3ym52lg3FV2rzSR9omMgZ4kTCglHxCQl
	/5exQ9JkGVcLcPOd2pcxw/pHsurwyLkhMbf2nYuZrXH3aNY8ogtnCUO2ynWXsh2yiEBa1fF2Sj2g+
	VYOkeziiEORENl0nC4M3BV2sDfHyJkOYUhRhM/jDIeKDwC05OW89PKECD1kg/q9Ay5jl7SZ8myv4J
	YJ5hNKerExMFygBPJxkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naABh-004b8e-OX; Fri, 01 Apr 2022 05:51:09 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naABf-004b85-Aj
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 05:51:08 +0000
Received: by mail-lf1-x135.google.com with SMTP id k21so2950557lfe.4
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 22:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qA1v0A7dc3FV4RuMv5ZQV+qnRwKmp9V+QFkq5cmpENY=;
 b=RMf4MzqPShODxLhq+sO4cUVTL3s/BrBvRG/EaMjOanqT3bAMiyKedu7D3sCrExpRdk
 nYKSZHJq3Y3KMEff96G8lFu3QcAjZT0UNIGroLdVSmjshBRp3CQ/VIgP+wZtFK73kk5Y
 1Gr1qpQNLItoN5zU/4GjpZlzsKTMTduLnNfTxZ/F6Y2GOiQPkeb/5071tQGXYLH2e5iQ
 Hlps5YemK2FlkjzWe0fmiMtXBDFUpmwsCqVPY8oTlM8hFaIRi42+tbLBP68BWhiIf+kH
 9pVGm4jItuyZf7pyIMruxC/4uuZSRvpMuGpySvAHCtN0fT58BvcfJQmUBmyG3Lls5Wml
 93Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qA1v0A7dc3FV4RuMv5ZQV+qnRwKmp9V+QFkq5cmpENY=;
 b=ZRR4JuCKN29amnI19dgdsFAcmXuTaZHMorhKuJs6WDkWfD5FIGy5OJp2VC5T1bnM3I
 DPb0t4YxQ8WKC0dNEs5WVPsirYrJy1JVKG+793AsOgaETniDXMa+dASVni+L/lkboD6I
 uASM1pWq51522jwbzI+fqlJIDfmgTaCPJWyIJeu4AXyhkek0oTXVyWWd17R6fUQG+W4K
 YSmrR282vvB3PeKD47XvPTCxfeF6NKaOfivWCC+mBlykCaPWAQJiDdYoMz9QaRWyPDV+
 GnXaavDAmX2qi0oYwocoi5N/om52cIual0lNiIIItwh8PER3uZ1sRySQHR9G1lr5yWZo
 3Yjw==
X-Gm-Message-State: AOAM531L9XMSnbF6JT1cOdYX7ZwWM02GAlSgk7bxF0bUVAEtwYEwamXH
 KWnBfSfqFrwkRGOnss4Vm14F3dNi6dbsgEZxVn0wBA==
X-Google-Smtp-Source: ABdhPJzV5rjeNDxGrh06Y6/j6ua7W2u+B+s3R9VuN1ozC2fonLH2ANgH5N2/XarDXlE09XwQEepCNwQd97y3piadpjo=
X-Received: by 2002:a05:6512:1051:b0:44a:5dcb:3a74 with SMTP id
 c17-20020a056512105100b0044a5dcb3a74mr12761841lfb.51.1648792261524; Thu, 31
 Mar 2022 22:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-c6a04a4f-1e85-49e9-baee-b56b0e78c602@palmer-ri-x1c9>
 <mhng-5afad1be-9b06-4cd1-95e3-c21605b9086a@palmer-mbp2014>
In-Reply-To: <mhng-5afad1be-9b06-4cd1-95e3-c21605b9086a@palmer-mbp2014>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 1 Apr 2022 13:50:50 +0800
Message-ID: <CANXhq0oJKRVV2QyzJ2WV1fjcw3piyoKeiR5U-=DqsyDayixTGA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] Determine the number of DMA channels by
 'dma-channels' property
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Vinod <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Bin Meng <bin.meng@windriver.com>, Green Wan <green.wan@sifive.com>, 
 dmaengine <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_225107_422104_3261605F 
X-CRM114-Status: GOOD (  24.65  )
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

On Fri, Apr 1, 2022 at 6:42 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 30 Mar 2022 22:54:47 PDT (-0700), Palmer Dabbelt wrote:
> > On Wed, 30 Mar 2022 22:21:56 PDT (-0700), vkoul@kernel.org wrote:
> >> On 30-03-22, 20:15, Palmer Dabbelt wrote:
> >>> On Mon, 28 Mar 2022 02:52:21 PDT (-0700), zong.li@sifive.com wrote:
> >>> > The PDMA driver currently assumes there are four channels by default, it
> >>> > might cause the error if there is actually less than four channels.
> >>> > Change that by getting number of channel dynamically from device tree.
> >>> > For backwards-compatible, it uses the default value (i.e. 4) when there
> >>> > is no 'dma-channels' information in dts.
> >>> >
> >>> > This patch set contains the dts and dt-bindings change.
> >>> >
> >>> > Changed in v8:
> >>> >  - Rebase on master
> >>> >  - Remove modification of microchip-mpfs.dtsi
> >>> >  - Rename DMA node name of fu540-c000.dtsi
> >>> >
> >>> > Changed in v7:
> >>> >  - Rebase on tag v5.17-rc7
> >>> >  - Modify the subject of patch
> >>> >
> >>> > Changed in v6:
> >>> >  - Rebase on tag v5.17-rc6
> >>> >  - Change sf_pdma.chans[] to a flexible array member.
> >>> >
> >>> > Changed in v5:
> >>> >  - Rebase on tag v5.17-rc3
> >>> >  - Fix typo in dt-bindings and commit message
> >>> >  - Add PDMA versioning scheme for compatible
> >>> >
> >>> > Changed in v4:
> >>> >  - Remove cflags of debug use reported-by: kernel test robot <lkp@intel.com>
> >>> >
> >>> > Changed in v3:
> >>> >  - Fix allocating wrong size
> >>> >  - Return error if 'dma-channels' is larger than maximum
> >>> >
> >>> > Changed in v2:
> >>> >  - Rebase on tag v5.16
> >>> >  - Use 4 as default value of dma-channels
> >>> >
> >>> > Zong Li (4):
> >>> >   dt-bindings: dma-engine: sifive,fu540: Add dma-channels property and
> >>> >     modify compatible
> >>> >   riscv: dts: Add dma-channels property and modify compatible
> >>> >   riscv: dts: rename the node name of dma
> >>> >   dmaengine: sf-pdma: Get number of channel by device tree
> >>> >
> >>> >  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++--
> >>> >  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  5 ++--
> >>> >  drivers/dma/sf-pdma/sf-pdma.c                 | 24 ++++++++++++-------
> >>> >  drivers/dma/sf-pdma/sf-pdma.h                 |  8 ++-----
> >>> >  4 files changed, 38 insertions(+), 18 deletions(-)
> >>>
> >>> Thanks, these are on for-next.
> >>
> >> The drivers/dma/ should go thru dmaengine tree. During merge window I
> >> dont apply the patches
> >
> > OK, I can drop this from my tree if you'd like?
>
> Just to follow up from IRC: I'm dropping these from my tree.

Hi Palmer and Vinod,
Many thanks for your help. As all you suggested, let's go this
patchset by the dmaengine tree. Thanks a lot!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
