Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2551C021B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HxSEu8IuDaJ3yuuMNIjIs43r6ZmG5K7W2UMy6M3lHBg=; b=OER4srOQHsh61OnXX7UO8PpreM
	0Lh08HBTsjS74dpoltubyH6MGFn5wcYTFx8jJTRS+TUIM2GkhCAq/gh84d1NQE3twP6/28a1EM7EW
	vYPMYWQsdcd2BulY/PiRtvuWJN+R3w5QlKgg6G4IY076vaE8DAiWQ7ExQ3Ij/yegUqn3Q6FEr6MWk
	rBkpp0uVl6XU3adg0zn0cLyK6ykv/j5naCHfLXHgT5uK8oXLPBn2Io1IU01HVkxneuWQQdcC5Txr8
	2Rm1VdSOBSfBDXDWgixDfBBLKSnnKQJ2arYFH22Vm+IwMoY+46RUsSuDwUGiK1euSatwHgI3h/lKr
	SRLTApow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkTK-0000000D4i5-262q;
	Wed, 19 Feb 2025 13:50:42 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkT5-0000000D4aY-3UtS
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 13:50:29 +0000
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 59FB13F2C5
	for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 13:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739973026;
	bh=HkThrHww5O7217vswgEm19Ksu4iUBCwcKWWe4XYtKbw=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=iOjKkdySiO15H/owhS+6RlWbTaM7qWbj/4SbkVh+GTb6k7Ome6jhwOVeyqSiYJ0CN
	 8wsi7Xh49BRWqybkMhmMJ7OXQIIRBxU7WaFU8um6IXpgHggOu8TH9S4/ch+6DpwWtV
	 BmDJU1m3OuH/tT5NAya4xB7Z5QDS5WJ5BW1JArIh/vp4Z11Y3Ag36c980Axgskm4kk
	 YA8MhzSAoYzW44t0RbwFe+9HRBzgFqyjw/2G/ytcLrUDg5ynE6nOUrrHVNgRXGqrS7
	 taELqWiW9iFAw9i2MG37l2FOW2mcSdw4wNlKeWaJTdq5Qpl3+G7gcw9AYVahisF33R
	 xqfnhjmByjTQQ==
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3f3fbe10227so2603829b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 05:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739973025; x=1740577825;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HkThrHww5O7217vswgEm19Ksu4iUBCwcKWWe4XYtKbw=;
        b=q2jukXDUtfDWG/CdtTW4K3ElOoYPnb1X56I7+z8HQ17gLXHaJAoRphamWeBujl9adl
         LY4WYdbNhJfcTBu4TKxKCeFXZ4Iv84uAIGZkN2KsypKfumTzHbDImDjIorkABTnIgO20
         +n5sUDZ9/ffrNmFPerSJyUMm2f0d9w111lgxCnMmN7FfRz+s0WNXzV20QrQtN+JA5kfB
         pWVQuXGSXA5eqNCtlCijuZ4v1HGcjcofOKkZUpNrVy9OOgXVR8k+LUWDdWGB+xUX/zXn
         HwaqDdmWOe/T6Siur6X2ufZ6Vp4ioZMBOKAbiuXB69gvR2041dM/RfoNQcOxNYVKdGen
         mbjw==
X-Gm-Message-State: AOJu0YxoAvl2COD1ZRkWNa4/aaLNiOhzvCQXmzcM3qiPer/vFhM68Ax3
	KeGQExMhTmk1olDraWFiqKxuRWr493q/KbAyDqvqn9dR5SWVzfzwUfDRQMa9y8PPt4Sj6NyfdYW
	1xLuBDeeqF9ldjl7YUS//B507BsEbcQO5pEVkE990CnyMlf7JRQa56gfymZZLlvYosX30UOekfi
	fzeE2JOqqGd7eX/JeVLvv7vtdMVbhCOGG+YoxLf47kaWf+lFSyJ0azhoDN
X-Gm-Gg: ASbGncuFOAeOFwkpLGpKVXH8M4pvw6+EIRXWVFguquc8ImcxlhrCGaBDML7j18v5jcL
	pIMVs4U1pCAEQ4lM9klVZ+w7Ec2bb86gu6nQzKaMZnq/2uD9WfXCcrtHzYpfhjOZFgk07hNuUT8
	Tp0z1XEvwtco+7Lxw=
X-Received: by 2002:a05:6808:1404:b0:3f3:fca6:e780 with SMTP id 5614622812f47-3f40f1d80damr2677734b6e.4.1739973025300;
        Wed, 19 Feb 2025 05:50:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELzb0relCMdxW2h9gdJIHGCHMAFy7OUi/2S7r6jAP4Sq1/PdQCSb8BJv9iB/UP1miQ71opDlKqPQcOB0oF060=
X-Received: by 2002:a05:6808:1404:b0:3f3:fca6:e780 with SMTP id
 5614622812f47-3f40f1d80damr2677715b6e.4.1739973025019; Wed, 19 Feb 2025
 05:50:25 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Feb 2025 05:50:24 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Feb 2025 05:50:24 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250102183746.411526-3-e@freeshell.de>
References: <20250102183746.411526-1-e@freeshell.de> <20250102183746.411526-3-e@freeshell.de>
Mime-Version: 1.0
Date: Wed, 19 Feb 2025 05:50:24 -0800
X-Gm-Features: AWEUYZnjj3UcLpDwY9vHo1V6-acr0oNVHmkQ82SwWdTmAkFxnAuNPZAUCub5EJA
Message-ID: <CAJM55Z_b2qf7NsvKm5mVjS4O-hqqsDNhpohcvJ_myasOL97oSg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] riscv: dts: starfive: jh7110-pine64-star64: enable
 USB 3.0 port
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_055027_998262_3ADFBF0B 
X-CRM114-Status: GOOD (  11.85  )
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

E Shattow wrote:
> One of four USB-A ports on the Pine64 Star64 is USB 3.0 which requires to
> disable PCIE0 and change the mode of PCIE0 PHY to USB3.0 operation. The
> remaining three USB-A ports are USB 2.0 with the USB0 PHY and do not
> conflict with any of PCIE0 or PCIE1. PCIE1 (1-lane) routes to a PCIe X4
> connector.
>
> Signed-off-by: E Shattow <e@freeshell.de>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Thanks!

> ---
>  arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> index b764d4d92fd9..31e825be2065 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> @@ -100,3 +100,8 @@ &usb0 {
>  	pinctrl-0 = <&usb0_pins>;
>  	status = "okay";
>  };
> +
> +&usb_cdns3 {
> +	phys = <&usbphy0>, <&pciephy0>;
> +	phy-names = "cdns3,usb2-phy", "cdns3,usb3-phy";
> +};
> --
> 2.45.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
