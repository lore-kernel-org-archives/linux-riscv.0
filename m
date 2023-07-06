Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB77EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 17:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=8anJ9i4B6yxZuKi/CTWmhvX6fC0rYg/2+PAZm1TA0Io=; b=2UlCxdtYwFJy89VPeVjuoW+9Ov
	qG/tIf4acQFop9Crbp31rtyAX6/m+WtjUjAtvxxAngvw2MuS5chZYZOxZdTtcMJ/dGas18kpsltUu
	zffl2jOLmtIi42lA7DZiV+2mRdkAyvngoOO1ViwT13TKdcej3Saz11XgUKAg939yp4uhsF7dE4oGE
	Wh902G+RmuJZ1jOkz0fIgGRwkMrrVQG2IbuNoQiVujehG7FOOeM8xvqfAcYpiMHUieRliID8M5mb1
	FqTNZZqvwkgzx4W9RtavP89LIJuGBppwBd98BsnQFbQ0WifhWnVaSzS1GMB99GOxi5RTO9U5xXvR5
	jV84GAbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHSlH-002HXD-15;
	Thu, 06 Jul 2023 17:27:23 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHSlE-002HWW-37
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 17:27:22 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b89b75dc1cso15090985ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 10:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688664439; x=1691256439;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jn7a2xeSOCay/dfZF7fwDabuNtAa1pZY11og1PISP7o=;
        b=iiQ+SMcyzSGrF/OXkZ0ynReYpKtMKZ0y0KTGoqTMo6wj7LWaQxw0z5jrVOvbH58TTg
         +N0U8PwreurjB5vVwFH9fXYJNWvRbmTRctfibbcyIYqbrUA4jTbc/Z3dAQ/5MprxDTGt
         7u084BXwAky1m625fwmIHNhkWTTHM8bi5k6mcNrCG+se3g8/+bm9vBberW5VtkXqIdxT
         aodLfXEGxeET0tBuCnP1803Az+pVNyKlcAyoQzVfFuzvTEGIYaJbYz1Km6QS4zFK5xD7
         9O0IZrbUp9uaCA7B3O6svuVhAsKLm33sopcJcweXt+u98ytGaP3ArwiqIPbHHzp4PvW4
         7ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688664439; x=1691256439;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jn7a2xeSOCay/dfZF7fwDabuNtAa1pZY11og1PISP7o=;
        b=W1m0/tSqR29fcipa09Hm1CnjS8bNT7x1ra5koLwExcCp4Sodj8HgHNyb4lzYVx+0s0
         rL2oUTN6TiRnpbRdR9r9nRqd0OjVQ+v2HzAUaE1rmwPF1YuqTjCcLWkav0Cw6hlXOGVN
         574+oqg1hHSgdBV5UD8g/bHhb4Ra+HEEOe20ANnBL+MMnKKOWZU5suslShodoKmgXph8
         A5mgmEMACH0OpaZ2uQlSTJsBipKWqtNmX4QFe0S0+NrmBZvpdjPuM3jvcaQg+pQ5IQF6
         DP0D+XmL+ohs6XWvOALx3ZolNIwhX9NxAzZckI68frV9TOY8p72OreQy46vOpZUPy6Z/
         lS4g==
X-Gm-Message-State: ABy/qLbggKXRTb78dKNH026ogTu5yq/4AJdm0HLGNYCoaq6mdnhirQmU
	uU/RT/6+neevNA+we7Pru0m/5g==
X-Google-Smtp-Source: APBJJlE3KGdR0bMX6GYwQVcPoEOOedKCRiHGchyo57OKOouToD0llxWDSI4fWwVmCNS6bQ2O3EB6tw==
X-Received: by 2002:a17:902:dac9:b0:1b8:76cb:c6a4 with SMTP id q9-20020a170902dac900b001b876cbc6a4mr8323507plx.21.1688664438768;
        Thu, 06 Jul 2023 10:27:18 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id y10-20020a17090322ca00b001b7fabe8b0asm1694210plg.2.2023.07.06.10.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 10:27:18 -0700 (PDT)
Date: Thu, 06 Jul 2023 10:27:18 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 10:26:32 PDT (-0700)
Subject: Re: [PATCH 1/1] riscv: dts: Enable device-tree overlay support for starfive devices
In-Reply-To: <20230627080620.329873-1-felix.moessbauer@siemens.com>
CC: kernel@esmil.dk, robh+dt@kernel.org, daniel.bovensiepen@siemens.com,
  jan.kiszka@siemens.com, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
  felix.moessbauer@siemens.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: felix.moessbauer@siemens.com, Conor Dooley <conor@kernel.org>
Message-ID: <mhng-6b374b17-9e75-4ae5-b614-f89fcf8b64c4@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_102721_028771_333BBAAC 
X-CRM114-Status: GOOD (  20.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 27 Jun 2023 01:06:20 PDT (-0700), felix.moessbauer@siemens.com wrote:
> Add the '-@' DTC option for the starfive devices. This option
> populates the '__symbols__' node that contains all the necessary symbols
> for supporting device-tree overlays (for instance from the firmware or
> the bootloader) on these devices.
>
> The starfive devices allow various modules to be connected and this
> enables users to create out-of-tree device-tree overlays for these modules.
>
> Please note that this change does increase the size of the resulting DTB
> by ~20%. For example, with v6.4 increase in size is as follows:
>
> jh7100-beaglev-starlight.dtb 6192 -> 7339
> jh7100-starfive-visionfive-v1.dtb 6281 -> 7428
> jh7110-starfive-visionfive-2-v1.2a.dtb 11101 -> 13447
> jh7110-starfive-visionfive-2-v1.3b.dtb 11101 -> 13447
>
> Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
> ---
>  arch/riscv/boot/dts/starfive/Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index 170956846d49..0141504c0f5c 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -1,4 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0
> +# Enables support for device-tree overlays
> +DTC_FLAGS_jh7100-beaglev-starlight := -@
> +DTC_FLAGS_jh7100-starfive-visionfive-v1 := -@
> +DTC_FLAGS_jh7110-starfive-visionfive-2-v1.2a := -@
> +DTC_FLAGS_jh7110-starfive-visionfive-2-v1.3b := -@
> +
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
