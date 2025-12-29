Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378CBE92FD0
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 20:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkkX8gnA0DrQvTK6DGdxmMykz+WXQkY11pdxolc5cy0=; b=lOFO9T2s0kUGud
	PqOJLLnY9N+wQPLL/py5Ww/mkvbGZVgSGwjk+NmBj7vh3Ysst6Ji8qqEubtHR3+OWBIzvGlMhGTlG
	gpknRSNenEPIssGQrb2Ox4TbvPn/TLhpa3t3QqH4n2Pe+gGc6rMQsL7hrLSEKT0LyKjeJ8PAOcL2P
	bI45ch3tjZg2ImmXuWbNWj+R8q8FzBBFDUjYCudwDs8O06ET6XcCDJBsKgMe5clnx/FuunQMYsLge
	jcLmqr7LMeT6Ct5mkVMuVaLbz+Oaw44PBpAG+/OECbB8N8ol/xeU98s5k7SXJknOKPt8wcoKwax7m
	NhuTZwL0yhRv/JGu6e1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaJdv-000000042Ln-2P6S;
	Mon, 29 Dec 2025 20:15:03 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaJdt-000000042L3-2uL9
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 20:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=bEEUJVfxLVTTxjkHipHATe6EImddwPLUCuwideZLEw8=; b=gfLhfqRize/eRRS/BDZh55+6je
	mVyUeI6SdYH4q++FKnkHq/XL40pqWaCcK6xHZ52N5EImUBgLLb6IO5hqO9oWMg71hEh+E2rUQx0Jk
	dFed70DloaP/4djHySE7IB0qB4zaFlqGD2RibN2HhX2NtbgPusxHXB4SKuNnDpY8CBAOMniCcjuu1
	lJqWSmTatvds7H4HkE1qsjWQozMgKn1Eot/LgNBiRgMMsqxJ122x8FjBuWgIJmnJilG6BMmuCV+2a
	0RketsO6gb4dqyIOIO7Kf44qT3rmtdPezdPZn2qZW5kvtMku2XyyQ1ouN0af0z4D4k959S1i0NWg4
	uhJ0Mytw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vaJdq-00000003dMY-1TXH;
	Mon, 29 Dec 2025 21:14:58 +0100
Date: Mon, 29 Dec 2025 21:14:57 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Ze Huang <huang.ze@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add USB 3.0 support for K1
Message-ID: <aVLhQQrYQ0T2rBeq@aurel32.net>
Mail-Followup-To: Ze Huang <huang.ze@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_121501_733904_66A47621 
X-CRM114-Status: GOOD (  12.78  )
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

Hi,

On 2025-11-01 17:03, Ze Huang wrote:
> This patch series enables the DWC3 USB 3.0 host controller on the
> Spacemit K1 SoC, and enables it for the Banana Pi F3 board.
> 
> To make USB 3.0 work on the K1, we need patches for the USB2 PHY [1],
> ComboPHY [2], and DWC3 [3] driver, also, ensure enabling the following

Note that the CompoPHY part got merged in the meantime.

> configurations:
> 
> CONFIG_PHY_SPACEMIT_K1_USB2=y
> CONFIG_PHY_SPACEMIT_K1_PCIE=y
> CONFIG_USB_DWC3=y
> CONFIG_USB_ONBOARD_DEV=y
> 
> The series is based on v6.18-rc1.
> 
> Link: https://lore.kernel.org/all/20251017-k1-usb2phy-v6-0-7cf9ea2477a1@linux.dev/ [1]
> Link: https://lore.kernel.org/all/20251017190740.306780-1-elder@riscstar.com/ [2]
> Link: https://github.com/torvalds/linux/commit/e0b6dc00c701 [3]
> 
> Thanks,
> Ze Huang
> 
> Signed-off-by: Ze Huang <huang.ze@linux.dev>
> ---
> Ze Huang (3):
>       riscv: dts: spacemit: Add USB2 PHY node for K1
>       riscv: dts: spacemit: Add DWC3 USB 3.0 controller node for K1
>       riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3
> 
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 47 +++++++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi            | 32 +++++++++++++++++
>  2 files changed, 79 insertions(+)

The whole series is:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
