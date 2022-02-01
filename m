Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF5DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 03:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mIBq2a05ev/VN86RfIsCZOvsRtTXWzTeosozXR1PPM=; b=bvmDQuFpAqhNXY
	66PS+wqLGiMbthLUwhfxeo8XFWfL/yf78oKOHyfozPl7+mSZWnGOn6mfgYfgdjqKWai4+PjP5B0g2
	0MpBy8/5DPVmF3B6yBYBtAJy/x62xVHvu3dST9XaHZV7BSCP05GigPRVbgJXowk/8IGl9xYYc+NdX
	IK0cgyJwhKdsY7d9JgHSX1GQDxFPaOj3htaxQchYBh0jaZkQ5nJuIF7C13Fa90r4bq1g496cX/91r
	yxCbpBryVQCDv2yKO8U/xgzTr97bX+3XVaca/2G4IMciFbYqc5Uiq2wb9Yr2aBxs+rRmozBQJtbvx
	T4koc3/ZJb54Wm4RkPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEjgq-00B484-7K; Tue, 01 Feb 2022 03:18:44 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEjgm-00B47M-TW
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 03:18:43 +0000
Received: by mail-pf1-x432.google.com with SMTP id u130so14634251pfc.2
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 19:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=7ym4guToR5s6XJh+Gyaw0SuEv+LKx7FC/++SseskIfM=;
 b=E++ef+Q5iBCT3v/I5Xsw8Z42hgWOa0/CD59TDIXkDMY0W82NoIdVaA2wlQHAOqNgPW
 HVlfHK7n3vd7hCpdQvMsLK+QRFDHf+nMqZyVlPoR39FJ9/sq7mok7WbE7LsSq4UA96gB
 y4d/Dw5IEj6UGsD60pfH56R5yEmEtlkHe/oa+JG1q70MRkM214E+Q2ZVc2fM23xLE0Rt
 nhKk1G3dW79j8cHJpcnHjsPzWteJo7l2qH3qiSzZnoOBl9BjPaFQed0VBv+B3JHC4XOO
 dXEN0f2BkRCdaUQwNKxUlXgbqy2rWF2PXQUOdD42KKaisUfUC2EeMsCfLbv2tZHgtZuT
 824A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=7ym4guToR5s6XJh+Gyaw0SuEv+LKx7FC/++SseskIfM=;
 b=wrJgeLwllo/mHCjDK8nJj8Kw1eK7eLVMjiAq0zUnbiCvWSf66JNrR0AFk1KgZhybln
 pScmAdkER/WixJ/Ol0+CcI6iKq92r8HVcIIfceCFSEFHl0kxzru4pbtpdMSr23yrieL+
 pHVQyS9cmYIaM0SE3FGq4lysiznSUcYmS8H+FhFYrGPw4Gcpq8k1oTg/lGO8UJnbWXy8
 9AkqmwCBaYK5EHAYF6V2YSuZ3xm9j37zFjEP99OrGx81NXoZgxnkSIisCuVuZ6qaAg+5
 SzuIxktvI8XpYeirQYulOp+DJB3Wpusl9/bM1wrGbJ5U5iT5DPjjbxzWWS5IQEA0VO+0
 JUbQ==
X-Gm-Message-State: AOAM533P2EUWfkeRKdLKPqmf62EfInfCYnwgT3zB72QLjjy/hV5Fes9T
 6kl7eqtYOdU2OuqtmiKYSKvfLQ==
X-Google-Smtp-Source: ABdhPJz49oSgsvYX6rVkuwCkpBFyCD/1vuYWgent4FpvFLEF81sRjkDpqWZmQXP+xsW7pCXULByM5A==
X-Received: by 2002:a63:2c83:: with SMTP id
 s125mr15529210pgs.265.1643685516138; 
 Mon, 31 Jan 2022 19:18:36 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id c8sm13261985pfv.57.2022.01.31.19.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 19:18:35 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Saravana Kannan <saravanak@google.com>, Russell King
 <linux@armlinux.org.uk>, Neil Armstrong <narmstrong@baylibre.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Tony Lindgren <tony@atomide.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Damien Le Moal
 <damien.lemoal@wdc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-oxnas@groups.io,
 linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
In-Reply-To: <20210929000735.585237-2-saravanak@google.com>
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-2-saravanak@google.com>
Date: Mon, 31 Jan 2022 19:18:35 -0800
Message-ID: <7hk0efmfzo.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_191840_980838_7D6540E1 
X-CRM114-Status: GOOD (  16.89  )
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

Hi Saravana,

Saravana Kannan <saravanak@google.com> writes:

> fw_devlink could end up creating device links for bus only devices.
> However, bus only devices don't get probed and can block probe() or
> sync_state() [1] call backs of other devices. To avoid this, probe these
> devices using the simple-pm-bus driver.
>
> However, there are instances of devices that are not simple buses (they get
> probed by their specific drivers) that also list the "simple-bus" (or other
> bus only compatible strings) in their compatible property to automatically
> populate their child devices. We still want these devices to get probed by
> their specific drivers. So, we make sure this driver only probes devices
> that are only buses.
>
> [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Ulf Hansson <ulf.hansson@linaro.org>

This patch landed in stable/linux-5.10.y as commit d5f13bbb5104 and it
broke suspend/resume on at least one TI AM335x board I'm testing on:
upstream dts: arch/arm/boot/dts/am335x-icev2.dts, upstream defconfig:
arch/arm/configs/omap2plus_defconfig.

Bisecting between vanilla v5.10 (good) and stable/linux-5.10.y (bad)
pointed me to this patch, and I confirmed that reverting just this patch
on top of stable/linux-5.10.y makes it work again.

Also interesting, this same platform works fine on vanilla v5.15, which
also includes this patch.  That suggests that either 1) this patch
should not have been backported to v5.10 stable or 2) there are some
other dependencies that are missing in v5.10.

Since vanilla v5.10 works fine, I'm leaning towards (1), but if you have
any ideas for deps that need backporting, I'm happy to try.

I haven't debugged exactly where it's hanging yet, but, enabling
CONFIG_DEBUG_DRIVER=y, and suspending with "no_console_suspend" on the
command line, the last line before it hangs is:

   [   28.129966] simple-pm-bus ocp: noirq power domain suspend

Any ideas?

Kevin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
