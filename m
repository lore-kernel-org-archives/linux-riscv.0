Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B67CC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 01:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=p5UqEhouGvMe1mc7G3QGuoyEuWmIx1xihS587wLfr90=; b=pjxC278pVP6CszhSZFS/k7L7Tf
	inWoX8mC+P+joWYXdrvC4oWaqMx4AdWHC3A84giibNfYAtTUQl2szTNxorie+TRuKBBwGRjTec2mz
	R2R7+B0FbM+laoL8VhdoMe7TrtmI6F7qV6t+uISMmdrQFzUcLuykrBzpv6D0WP+hUj1T4h0qXBEuB
	C61BfkhiLaFJXapOOxinLcSDRwOwH0ON3rnj8Tk8krIMD87Cif5/nrsE6uxWl9tbDXH2AD3naxq1R
	pYwEDnurYnfsnXM1K3E+WUSooKZHqubGtLPV06G0YUW6/RGWDbotM6kOtPyBerl4YSkX8c0NX35LP
	VyJF84Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZjGp-000EWl-6m; Thu, 31 Mar 2022 01:06:39 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZjGl-000EVt-VS
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 01:06:37 +0000
Received: by mail-lf1-x12d.google.com with SMTP id w7so38773427lfd.6
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 18:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=pQin6zzGAuRacO9FVhrB5u1rqYNKK0HG35yvZRfDw/0=;
 b=LoZF0VUPCeyR0nPwrZ7ben+plaiet+DBjQmDF1p7B+WWSESHbWu9AsK7Zc43BNgN/w
 9AdEkpPqx5fOG+1e/cyBfU/ZYawfrMeJp95XaDhxSMkxVQXpqVmt4uq2hSevQzxorIA9
 wmZlE2Esg9QY3W6cjtFed7CZRvYiSKgDcIfnPCq+bKP3rj0M4V3IVZ6/OfiPyApAzmpF
 OafI3BTBfz0QF5VovF7+W35/N0qXM9WfYzYOpufuFo0RDKDgA7lsUQNv8WFuE3NCbA9+
 K2kEJTmO+4d89le22vJNdOXGCvFYybh3xqSMLzhQ6qRNuRno8rDIDiMCNbvcrSUceuC/
 qXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=pQin6zzGAuRacO9FVhrB5u1rqYNKK0HG35yvZRfDw/0=;
 b=VSj5iyFvoFXg4cGBCUjFy4SeHwFSsMNxBIBfGnEUVQoWlK7WEQKH23VoZgg972CnnG
 QAn/XsxcrUetb1lstWyobWtpLNeJYqmV5w2r+L48OMw6A93VdaTlmSSMWoH2lnq6zBGd
 ov40mRztdS34RIorc0Q56D30LMyLBFUVlVDg9MAJpS2C5+GD5KC70bKvOZBTmFEYDT5Z
 YOVdSbWBc436Wqt+v+TRncep3EJ1tvoFp1bpEqHc3wMeWmVolJN3MC0XizRCPXTfeE2c
 JNp/FqtYxWKyntTAOPZWMAY1yvNNEtOTHxup9d7oXlOzm6lowz9cdqHJ1L0vJ9LOhfZZ
 6Ojg==
X-Gm-Message-State: AOAM531ZM72tdlAxbt1XHEUx6Bc0Zx/NzFKHyMmvolaIn0YQP6PiK5ou
 KXJu0wPIBvfnXuUho1kXaH1Xzieg1pW4njXLnKCxTw==
X-Google-Smtp-Source: ABdhPJwRI/M8FbLpqXsPZDNWG2rFpgPuua67WqFCLmYKJgq6Z/6FsQGUHVJQ/05ReOq1eRD1RvJQ664QpAYl0Yz3Fus=
X-Received: by 2002:a19:c20e:0:b0:44a:375c:6eb0 with SMTP id
 l14-20020a19c20e000000b0044a375c6eb0mr8919131lfc.5.1648688793121; Wed, 30 Mar
 2022 18:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648461096.git.zong.li@sifive.com>
In-Reply-To: <cover.1648461096.git.zong.li@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 31 Mar 2022 09:06:22 +0800
Message-ID: <CANXhq0oRB6dEHM8of6pySWM-6CkJ3WZVsqDC5J1fKuFzJnVJKw@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] Determine the number of DMA channels by
 'dma-channels' property
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Bin Meng <bin.meng@windriver.com>, Green Wan <green.wan@sifive.com>,
 Vinod <vkoul@kernel.org>, dmaengine <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_180636_070374_866C9F63 
X-CRM114-Status: GOOD (  17.17  )
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

Hi Vinod and Palmer,
This patchset got some reviewed-by and acked-by, if it is good to you
as well, are you willing to help me to pick them? Thanks.

On Mon, Mar 28, 2022 at 5:52 PM Zong Li <zong.li@sifive.com> wrote:
>
> The PDMA driver currently assumes there are four channels by default, it
> might cause the error if there is actually less than four channels.
> Change that by getting number of channel dynamically from device tree.
> For backwards-compatible, it uses the default value (i.e. 4) when there
> is no 'dma-channels' information in dts.
>
> This patch set contains the dts and dt-bindings change.
>
> Changed in v8:
>  - Rebase on master
>  - Remove modification of microchip-mpfs.dtsi
>  - Rename DMA node name of fu540-c000.dtsi
>
> Changed in v7:
>  - Rebase on tag v5.17-rc7
>  - Modify the subject of patch
>
> Changed in v6:
>  - Rebase on tag v5.17-rc6
>  - Change sf_pdma.chans[] to a flexible array member.
>
> Changed in v5:
>  - Rebase on tag v5.17-rc3
>  - Fix typo in dt-bindings and commit message
>  - Add PDMA versioning scheme for compatible
>
> Changed in v4:
>  - Remove cflags of debug use reported-by: kernel test robot <lkp@intel.com>
>
> Changed in v3:
>  - Fix allocating wrong size
>  - Return error if 'dma-channels' is larger than maximum
>
> Changed in v2:
>  - Rebase on tag v5.16
>  - Use 4 as default value of dma-channels
>
> Zong Li (4):
>   dt-bindings: dma-engine: sifive,fu540: Add dma-channels property and
>     modify compatible
>   riscv: dts: Add dma-channels property and modify compatible
>   riscv: dts: rename the node name of dma
>   dmaengine: sf-pdma: Get number of channel by device tree
>
>  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++--
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  5 ++--
>  drivers/dma/sf-pdma/sf-pdma.c                 | 24 ++++++++++++-------
>  drivers/dma/sf-pdma/sf-pdma.h                 |  8 ++-----
>  4 files changed, 38 insertions(+), 18 deletions(-)
>
> --
> 2.35.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
