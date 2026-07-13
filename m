Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C822CC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 03:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVaIoxhdDXXZ+AcQTHKwyf0mqF3eM2r59LCSPsbNq3I=; b=DKVK79pDOQKsyb
	OJbh4SNZxxg4HM3rzT3bOWFACf6fx56dwP6MaCsiI9Jfq4cAWTsXVHWadvMWT+XIXDvtve2NzfHht
	xAZULGw3+xU5YqcmLPghQGblR7wCjjMHqPRMARy7FFhNX+kreubThyCMuR49tyQc4X4g8Z3U+5uOV
	oeN6vC/RyHyB9SNMUscC4Oy02sxfqGKl9BC8Qzbzhb+/KaxV+EmvL1v25SRDKpy4uyx/ruFbs0haK
	oJvpNZT64CqAXbwbBimYpsfAMLmzpCFubnqEmr14FzwxoSVAf4OtpuT8gZmQnaduRXcElJPIK+rm7
	v01H89Vq7W1yxq/XhHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7XM-0000000838P-3gZ7;
	Mon, 13 Jul 2026 03:40:56 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7XJ-00000008381-3WyS
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 03:40:55 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-80bb41f7f3cso23022507b3.2
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 20:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783914052; x=1784518852; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DD337bllPU0qOfiBQScd86xJr2rrEeEQWd3DGNprvhw=;
        b=K+Z88GqrH88iZ0GcFrxYfpyHtGCdmpu2hKgjRDYsANlzPilVntFmyCfAXdcQRGRm7F
         9BmyimaWNaCEkjAtQUVXNxn3nCoiIxV0NAk2fbNL8HrLYrSWy7dveXhrVJrj1dpdIyro
         t7qUn8LqsgP8LZwX7+5KnWrsFaUwJi3GOQLWL2VGUgrrFEUi1bp6N/+xuuaEOYd/a4uH
         tUYrwGD7GnUw/FDJ8+FLkOGs7Ypt+pk/oz9EmEp5qLL12k9oJd4nFAH0OJOFztJ8GdVR
         YzoB5SyBScGF+Ua6mh2Iz8xl1H6n1qgECeGWulhKMoD2kVKlpbi5Nrippj9J6sP+aEk8
         bRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783914052; x=1784518852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DD337bllPU0qOfiBQScd86xJr2rrEeEQWd3DGNprvhw=;
        b=Narb6KNiFwWeU7eHK2cS+WdDrWygeeJ4kngRd8bOZuMIAFxUwc7UNjDIQ5ljy9YDAK
         nR/pSLwkZm5kXWy1qkijzBhJq/HfIjHB43X2MXWrcpbweMXeiDCDSquDMvAQspXOhK7H
         Fc68Sim3SVl7x1YE6y2Amwiblidh8GRgvH0qtngKLTZo7qerKhCokbg/xcWCtf1MUQne
         MNTKtb8TtxrRrJhviH+CZwvKaXFm6J6TEs/NPzoPGDrBmdCI75hpNauLbilP+IL26heV
         ciffJxRtgHzMrAstJtfMcX9FAtkKL+JbCOu9QLy3fjBzG+3np2BVOFsv+p06xk/Hbc9N
         iD6A==
X-Forwarded-Encrypted: i=1; AHgh+Rpyqn4TZZM73gMqqcaw8zTl8pq8nrw57YangONHmC3nBWJoZLeSz27hJdg62qy0XxnkCYne/yyW/6yDiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YweBUCkkIHUXJWa7FmXjJEBVuPe8MTl9LQoZ1ySAWt/MOKDnPzx
	hC4egm+KBpYhdsSotuvxJCZFpzFP8e2ZRVuo7CSNG75EyEEv7TV8uiVHC370GMeaypw=
X-Gm-Gg: AfdE7cmYq/bklmFnIQjv3v+I0gfK6DVb+yj+brYLYqSkN2+/80+24+78HOI7u7qnaGC
	4zwMpLYZHYgK6onT/McT364xoqel3vOrD7U7Gr8AweX7Qhggrtf40aowozVsEVHsovNqNxTy/d+
	voAMHXy4RXRMkLKDsTHg8Wd8lTk60R0JwFBgGQHLRVj80cQ1RtWjHIpRlm3BQwAMptpGkI3B/pS
	3S/qVhT7DazgJuzGEZZNYt+uWDk+o2/6SsWIadriP51Kv0YvY3MhhZRkAnXjUGQ8WY7DUpAnD9B
	lcuFrxkhykQzCS3gSNGJooFwbdVdxTgIUw3ZsouloklDZgE9ZeVg3uh2c1xtUShEMkkJ9blyQ2J
	Bgv8x7jQM/GNmzUEMAZC2EYjVGrIVNXGzcaHX7UcPkcYGhqe3iutnCRkQrU9nVWBWt+D7Cacc2i
	dkzpZcMxUuqz+q36rjiL9sGz5F9R9oujjbKT5p1vkxhua+n7BrF/dyLvFilw==
X-Received: by 2002:a05:690c:6981:b0:80e:2917:4b01 with SMTP id 00721157ae682-81e9003e955mr55511657b3.27.1783914052406;
        Sun, 12 Jul 2026 20:40:52 -0700 (PDT)
Received: from toolbox ([2600:1700:220:59e0:55c1:a162:6cca:b98a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm104348967b3.49.2026.07.12.20.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 20:40:52 -0700 (PDT)
Date: Sun, 12 Jul 2026 22:40:22 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add UFS Host driver support for SpacemiT K3 SoC
Message-ID: <wjbz5tp7vjrsjwjaiu3n7du5ksbrlsduuxhwg2wriyxshkrqd5@t3sdxr6ua2sg>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_204053_891058_24811E3E 
X-CRM114-Status: GOOD (  18.86  )
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

Hi Yixun,

On Thu, Jul 02, 2026 at 02:31:34AM +0000, Yixun Lan wrote:
> This series try to add UFS support for SpacemiT K3 SoC, the controller
> components consists of System Bus Interface Unit, UFS Host Controller
> Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
> Management Entity (DME), Transport Layer, Network Layer, Data Link
> Layer, PHY Adapter Layer, and M-PHY Interface. A more detail functional
> block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
> 
> Please note, in order to test this driver, the UFS clock driver[2] here
> should be applied first as a prerequisite patch.
> 
> One known issue is that the device will occasionally raise BKOPS interrupt
> when doing some high load test, log from dmesg shows
> 
> [  806.710763] ufshcd-spacemit c0e00000.ufshc: ufshcd_bkops_exception_event_handler: device raised urgent BKOPS exception for bkops status 1
> 
> Link: https://spacemit.com/community/document/info?nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/09_memory_storage.md&lang=en [1]
> Link: https://lore.kernel.org/all/20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org/ [2]
> Signed-off-by: Yixun Lan <dlan@kernel.org>

I see this during probe on a k3-pico-itx. Does the UFS chip on board
have an RPMB block on it? Is this error of any concern.

[    5.957864] ufshcd-spacemit c0e00000.ufshc: ufshcd_scsi_add_wlus: BOOT WLUN not found
[    5.963319] bus_add_device: cannot add device 'ufs_rpmb0' to unregistered bus 'ufs_rpmb'
[    5.971155] ufshcd-spacemit c0e00000.ufshc: Failed to register UFS RPMB device 0

Regards
Anirudh Srinivasan

> ---
> Yixun Lan (3):
>       scsi: ufs: spacemit: dt-bindings: Add UFS controller for K3 SoC
>       scsi: ufs: spacemit: k3: Add UFS Host Controller driver
>       riscv: dts: spacemit: k3: Add UFS support
> 
>  .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml |  54 ++
>  arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts     |   4 +
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |   4 +
>  arch/riscv/boot/dts/spacemit/k3.dtsi               |  13 +
>  drivers/ufs/host/Kconfig                           |  12 +
>  drivers/ufs/host/Makefile                          |   1 +
>  drivers/ufs/host/ufs-spacemit.c                    | 931 +++++++++++++++++++++
>  drivers/ufs/host/ufs-spacemit.h                    |  90 ++
>  8 files changed, 1109 insertions(+)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260605-08-k3-ufs-support-c8b308e415e2
> 
> Best regards,
> --  
> Yixun Lan <dlan@kernel.org>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
