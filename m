Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA97CCD184
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Oct 2025 20:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfFUbsO4+k29oeG0E7+9vCk/4ktxqXyngDiL2t/d2bY=; b=PNibmC9UVqWsQv
	xv/MUsBuTRtzhgK0nSokH6JE3l5i2TCoQD+YpAVbNvZ77rehYCEDdLvC+fOnf3+vnvQjN+VWGbybR
	la4sY4HiCSOiB2CcyIyyLBi/U/szUwwPiQXR+nmStqix4nWLoA+xrMR/EOkyHJVa2XHS18L4IKZNQ
	VQw+iMfTJi39T8+oOW2ivr4cDIfcW+cskNcZJ7Nu1yizd1vH15+7FWUT3tyPuQeJfFYL0oHxqN9Tz
	5z/9rggdeJWblcPR/JNQ0AD/F845RvWHRhsa1ip5C5atdPPYgcexKHfEgmQI3CFBPrLrQZdbt52Rg
	UZYGjL4BlAYfHVyAfkRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAaPV-0000000BPun-3l1L;
	Sun, 19 Oct 2025 20:53:49 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAaPT-0000000BPuL-03jY
	for linux-riscv@lists.infradead.org;
	Sun, 19 Oct 2025 20:53:48 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-7849f01e56eso2835187b3.0
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 13:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760907225; x=1761512025; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bLIclD2aF84lUbWy0CIM8XnSXp6AC1BEWNN7dbQyLN4=;
        b=RkvoiVcrz2d8rLhujKPsTbvxUkD8ACYmnbuPwJGCqyBpEZ7sQL17tNkGoRleU97u4e
         HuULS9Myg6iXgxkFtEsHweHnF5vG5hsBpFpDcs6T9cQC6vWFg4HfpZPmA4F/8uREklQQ
         anfhDpan8+AsEOGBgug5+IFUWFJSiPk8lpezfhqTthCjl+VP/7xFZW9QwgHdZwwVede5
         eb2w4pV/y/VOsrKixfkJvFzkH4BQM0LA9yL1/FRwIjj7W+/ZNb7JWXac2lAHLej8TuJI
         1Uha6PrPlnStbe04o8iRCwNC3Sol8gzO5GFz4qCda1h0wpA1PSAA22qwr2BjLc8Ny9t2
         Lu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760907225; x=1761512025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLIclD2aF84lUbWy0CIM8XnSXp6AC1BEWNN7dbQyLN4=;
        b=IxsSGEhVCAuvg2pYXSNPnHzLcMQaSGWlzb6yGExFdHXgOI6a9N7vZehBGBMXRuH0qf
         aZGO1UKyXQrdK3AsL57AeSZrM8EK2XMO39IAFwOYrxObulpZy8pjxC9yr2RW68fngufH
         nHFdUT9sqy/SaW1zKRKLvtlwguBcbc8T8MXYBAwk8XJ6tJLZdHu1b0p6rfOZONI6xGpW
         xEfa0goVfSzZBl0YeRu1OiOZgl0+0hTgphqUWxCEGN4vO3/fU5e+eDxMhOGwmi2p8w3S
         qAQoX2m4M7OpDWlUJe+IHRMPs4J6pmDh4jQZwheu+L1Egjvx7p7L8saP6t4LL6O8RFyS
         RPzg==
X-Forwarded-Encrypted: i=1; AJvYcCVRnibneo8/KvMcbHkccRwveMjOGJ3TXiZFG74YZLQrVFKDD7lhMjbzQ0kIJ2D3gbSnipCxLRXvSdtbPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmUdy2UNt8qhVutUu+mPfFMFbbNBB4o/P2cWspkDG5NqtpokXu
	DRWm8eQsi3QhMNnz1Ro/7801yXoLffgAB5e5RioJEXBzawGv/OtKlldVroc8p5hJa8YSOsPuJYF
	4SscNy8jd69AGgEevcE3Y8Ya92wOY1dA=
X-Gm-Gg: ASbGncupWWlH6CtohdvJgqT0mB8q6pZPVSfIMz+TIP2H53leZinvNKo8Pz5KhWmFGdY
	BLO7whXNaxF8KaMG4/k4PKgcO4wd/V14stOxeCw9bzclEc3BrMBqPBqBsMqIAuyjX4ixMYyPU5w
	zz9jvClWx2qKmLnE1xM86q+JATJEGXbn/Pfqw5UqkUhwrmxwem9KxlpCrzLEyomS2kGfNguItn3
	hgIfQ6t1FOtmUejBohabv7Wb0FYIu86RSXDWICLhxbo1mAsYaQcZ13Cfkv0Xal0U/2NQM9LqXHT
	kCN9
X-Google-Smtp-Source: AGHT+IG+VnVg4eeqtni24th+c8XSTz9bZ4o+eo5ggxBTkXyndw/uiD4XSbKqdvbqo7rPEXjxfr8g73d/jXS/Qyg3a7c=
X-Received: by 2002:a05:690e:4091:b0:63e:3c2a:c33a with SMTP id
 956f58d0204a3-63e3c2ad83fmr192995d50.12.1760907225531; Sun, 19 Oct 2025
 13:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251019191519.3898095-1-aurelien@aurel32.net> <20251019191519.3898095-2-aurelien@aurel32.net>
In-Reply-To: <20251019191519.3898095-2-aurelien@aurel32.net>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Sun, 19 Oct 2025 22:53:34 +0200
X-Gm-Features: AS18NWC8mas1vOpzBcYTdN6WQn4JlQUKb553pLiF9PjWnggz16K-ukTapFmx2g8
Message-ID: <CANBLGczi3GeaC4aWECV8NS-zqSHgRa-5onynz9fGsZeN8qgysg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] driver: reset: spacemit-p1: add driver for poweroff/reboot
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_135347_059824_2B08B80F 
X-CRM114-Status: GOOD (  21.23  )
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

On Sun, 19 Oct 2025 at 22:34, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
> chip, which is commonly paired with the SpacemiT K1 SoC.
>
> The SpacemiT P1 support is implemented as a MFD driver, so the access is
> done directly through the regmap interface. Reboot or poweroff is
> triggered by setting a specific bit in a control register, which is
> automatically cleared by the hardware afterwards.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Tested-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> v2:
>  - Rebase onto v6.18-rc1
>  - Use dev_err_probe() to simplify the code
>  - Fix indentation of patch 1
>  - Collect Acked-by and Tested-by
>
>  drivers/power/reset/Kconfig              |  9 +++
>  drivers/power/reset/Makefile             |  1 +
>  drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 drivers/power/reset/spacemit-p1-reboot.c
>
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index 8248895ca9038..063202923d95d 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
>         help
>           Reboot support for the KEYSTONE SoCs.
>
> +config POWER_RESET_SPACEMIT_P1
> +       bool "SpacemiT P1 poweroff and reset driver"

The driver code looks to be written to work as a module, but here it
says "bool" not "tristate".

> +       depends on ARCH_SPACEMIT || COMPILE_TEST
> +       select MFD_SPACEMIT_P1
> +       default ARCH_SPACEMIT

If it does work as a module I'd prefer "default m" here.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
