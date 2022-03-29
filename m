Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BEDC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Mar 2022 01:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwj42bPuvlnsou1UlwTRbbzMDlwP/sgmWeMDoT5nUBQ=; b=PrvA7El7UttFJV
	L8nnFYwaD4yhbncZYC9mI0l18LP1SmKvp9CnVnCcFzhe07yWLcIVPDPlYlCQuetn2neQp475Bg6sQ
	Iq8UWz4WJTHUZ4G2NHrdy2trcBZ4I8II7QjTyuh0YNJTIQw6sg+b3FLCBhhdDwnMxX1MLqNIaJ1dz
	OpoyLiWRrVvA5+3D2vm0VzMC0w4g01NdfGk81bQ01YhLOwjNMVeSJZ2rofMhkccRrsAr3wvL3KEpq
	6Lm/pM5/h0GAlIIYlAEBsLb71ijTyLpCn4vHE1uYYddz5w18Uum7u5MUMpabTqajLIFrd5KAvC7DW
	uZvqGkFosvBNu3E6ktjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ0mD-00AfQv-2x; Tue, 29 Mar 2022 01:36:05 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ0mA-00AfP1-Ar
 for linux-riscv@lists.infradead.org; Tue, 29 Mar 2022 01:36:03 +0000
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2ea1b9b3813so63138387b3.2
 for <linux-riscv@lists.infradead.org>; Mon, 28 Mar 2022 18:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j37M+3SnCtzKCPAGBbMVoXAMH6upORtmVyfM4Y9Ajqw=;
 b=LdpfSVSStPvoqgkN42VPQ/Prmd3SQcVf09RDFyX0Ofr7N6uTn4TAvi/GglNoh55J4c
 kizpyEYOB+BT1g+Cj54nrVBnfPxJ8c00/I+qrQxIVQAEONk+AanrINYwU8RaMOzsudvd
 ZK5lIO7YEtDC2B9mNvHFTcNgWOaDEyy/mOdYSKuE07fibuIctiCdaxfMbsouquyokygb
 b+7N6UhZg5/4uKL64LRGAeXxvdeGFMlx795vocVKVpxB0MdWowEs9HsE8jk4u37RvtPx
 QM2yAPFuF0XNV9CIJ7LGsbHe3elDRFbDEgsarsjNZDq7xBFadgNGi164PDtXBcLK5XEz
 5Now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j37M+3SnCtzKCPAGBbMVoXAMH6upORtmVyfM4Y9Ajqw=;
 b=exPWe9ECwCVmh93XaWFtB7V9GfA+p1gnGS9y/tN8beQxgRenxjRomiqgs6Q3Sv7HUN
 76IEoOKM982dS4YdcIeL+OMRv5IvJtKP1vQboF+RJF/Xxhc+FcHiCusEIBhRIsx/2eNT
 ddmH2TaD6O5ec8OJNmXuno5LrV8V1XN/wTt6Ukhicvnh5vaCx6u+tcyGJH6/35sHO1nx
 b+oFWIRu5lIi+nbc5EN0HoRdF+DKf+YmZY4SsS9eJht//ewNlNBmwL0wwam2rNbxSbn8
 OYVbL6OZIf1xhwocXUJNJdrEwMMOhjxmeqfAuxPdUXCAjpxXv0hRxaW0nSfrMSC/eGdk
 vQoA==
X-Gm-Message-State: AOAM532E6yvxKMM5Botwq0w5xsPGtw32oYnK8y2HJfJWun8jZa7WWWpb
 xcF8mt4jqhTKbd+96wgeAA6KjD17RpPS/qbENz4=
X-Google-Smtp-Source: ABdhPJzyJyT8X5V51e1K7fepR+2L9t0VvsuCkYfjExKl36NXoz3ygCpGWYsGmK5WiEfbRk5sPEfWgqLr3sSg5hGWAP0=
X-Received: by 2002:a81:8343:0:b0:2e5:b43c:86eb with SMTP id
 t64-20020a818343000000b002e5b43c86ebmr28290460ywf.153.1648517761368; Mon, 28
 Mar 2022 18:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648461096.git.zong.li@sifive.com>
 <f08a95b6582a51712c5b2c3cb859136d07bfa8b9.1648461096.git.zong.li@sifive.com>
In-Reply-To: <f08a95b6582a51712c5b2c3cb859136d07bfa8b9.1648461096.git.zong.li@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 29 Mar 2022 09:35:49 +0800
Message-ID: <CAEUhbmU9ZYniNNv-WYmeTfxh5MXN1NB_fL32FiOxPpx3d2e1_A@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] dmaengine: sf-pdma: Get number of channel by
 device tree
To: Zong Li <zong.li@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 krzysztof.kozlowski@canonical.com, Conor Dooley <conor.dooley@microchip.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Bin Meng <bin.meng@windriver.com>, 
 Green Wan <green.wan@sifive.com>, vkoul@kernel.org, dmaengine@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_183602_393627_EEE947EA 
X-CRM114-Status: GOOD (  11.71  )
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

On Mon, Mar 28, 2022 at 7:38 PM Zong Li <zong.li@sifive.com> wrote:
>
> It currently assumes that there are always four channels, it would
> cause the error if there is actually less than four channels. Change
> that by getting number of channel from device tree.
>
> For backwards-compatibility, it uses the default value (i.e. 4) when
> there is no 'dma-channels' information in dts.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  drivers/dma/sf-pdma/sf-pdma.c | 24 ++++++++++++++++--------
>  drivers/dma/sf-pdma/sf-pdma.h |  8 ++------
>  2 files changed, 18 insertions(+), 14 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
