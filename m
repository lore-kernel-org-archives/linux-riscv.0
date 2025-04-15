Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74332C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 13:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1/XKjrw2DYJwe4xgfsRJbGVa8B0XSTIdEoO2n0pGmE=; b=uAtsMjpvXZcc42
	n4lj+KeLimzoIDjTRWFAllef4Qy8jRcOqyfvlH75wG0cgoWiOB0lCNPlBk/dnOTmfbyo3lUmij9Ni
	AOWu44cQ1B1oD1xgOF9oY++CGS0nxsmW8ABnvQ7f/sYnBFJ9/ebTZ1EGYIgYXRtYv9tBxpTWP3f4g
	wMHSxOtg0uak99e6IMxCVsJgKpEXZVP4bv3vIayIC/xqIrNNWkyedNywxIEw1pVHS23sg7KTMM6vp
	B6BJhQF5yd27MB3PMrm2ZlMji3D3iYuHDHkGxYbAvJHspiA07wV/mLadE+0Z3RMTtoiWtijyj8fnu
	UdQgxmLEztIK2otquvhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gJ5-00000005u59-1Lh4;
	Tue, 15 Apr 2025 13:26:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4g3m-00000005rX6-0kSF
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 13:10:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso27776445e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 06:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744722640; x=1745327440; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zs7KnnfZKLyJy3tHcV0Bgj/q4jqUjfal2AfLl4HBPO0=;
        b=aMLmdqIdfnd6nx5FuiFJ0BZVXHf1CO7exna9eCpGv2tTHWIptuMdv2bCilyKE5fmUB
         as8PIS/LfncKZmaXgRZX4Hft9SU78HMW8uZyFgKX1OvwqU2VSE5znUtZzFn4nAc7vOht
         uBbmp60pcoIqsusq16i5te8KyfhinBvVNfpdzmVH/lkGo99czicskWg8YChYEIaus1cZ
         majZaXPg2CiwxaYJKZtuJ1X/Ub1i3zodQh0QllfZegYU+EtkiPtQMkfzxfEi2a2C4zDB
         GHB9wS/0V4VKP4qMx1kF8DSYRq/yoCnF98/9gm0bFM2RW3bRRN682UBBI+uziZEXfeyg
         LtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722640; x=1745327440;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs7KnnfZKLyJy3tHcV0Bgj/q4jqUjfal2AfLl4HBPO0=;
        b=VRUZnTYTH7Fp+1I2cxBT2FvkvpBby26Zro4ulrBrxrPmC/m9DXpBkQqZK6dq8VbZZK
         Xrm29Rxplgx6vl6OsYIC0Qzfij0pgDgkb0OB8Ek1/17wxK3zik6/QhDQuTa0ZlvMk7i1
         nkXAhJwqzOpGGaFgBUAPvFX3mVRU/SlbK4PGZHOLBYsezI+uOqKNNDK5q23zxrfKjmar
         N8YLlggTGFY+yiBf8iypHoN7iuaCjgGdj8ZszA1XgRGwWIQXxEu3cMZx/0BF6ILtY1yX
         GgRv5rlk4Aefs6bPZHlix+KUnG50kTNZRdty2G8IWN4sClAXJxObZ3jqKcZwlto8Epj1
         XphQ==
X-Forwarded-Encrypted: i=1; AJvYcCWou9aLuxenHJJ0FrWLVCzSoivTwWSkZugOj4OeFyBnG9cg6WCTJLMXqGUKQd6Mhdo2GqfAQcqFLtwBDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIanr5vBF3PGpDWyyzcML1iDnXEbmkszV7HwVyPcTtVVPhE9bs
	QKVWwOYg0YgPMQu48WU6CpgSraET9xSF+X0KpN1v0GN5du1rptZWAOBipqJv8j4=
X-Gm-Gg: ASbGncumAgN3ULT91HSjsihrpFhY42pzhVWEcdJvCEStCYTj2PvakSUCxCl2aO9/XsE
	YPi/zs0hILXPa5RVKIRhHCNzMCnwe2GPgansD3K3xcCNFHN0Q40M5C3QMC6HReJEZ8qK40HOgyQ
	c34GBRFhrvEi1sA8TfrhhpVnPNZcncP9YURMQvrDKYh1pDFLuq+zBCLpEr3do1JGYWh6p45+OLX
	BYQkmjHLeFvDSQevqqc4Hl/BIKts93VXf4BJ+IsFi/JjxFKct/HcKRGqL2SSJIr3ye28+ZaFbXD
	CTfYoqVdBlBlRYYo6liQ5qf6Uimy16GfeEoD67s=
X-Google-Smtp-Source: AGHT+IGLzdEuk1QDPXYsF98Ye9BX9xDuqaq1bbiDW34OCl+7dp6Go4ivXszBVPBh1MuXNgGiw13DfA==
X-Received: by 2002:a7b:ce16:0:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-43f4aafa80dmr77256645e9.17.1744722640535;
        Tue, 15 Apr 2025 06:10:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:357f:4855:d5d:eccb])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f233a2c46sm208119145e9.13.2025.04.15.06.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:10:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025041508-remix-plasma-cd47@gregkh> (Greg Kroah-Hartman's
	message of "Tue, 15 Apr 2025 14:59:30 +0200")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
	<20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
	<2025021938-swan-facedown-e96a@gregkh>
	<1jecxtwpr4.fsf@starbuckisacylon.baylibre.com>
	<2025041508-remix-plasma-cd47@gregkh>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 15 Apr 2025 15:10:38 +0200
Message-ID: <1j8qo1woxd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_061042_215695_AE069927 
X-CRM114-Status: GOOD (  18.24  )
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

On Tue 15 Apr 2025 at 14:59, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Apr 15, 2025 at 02:52:47PM +0200, Jerome Brunet wrote:
>> On Wed 19 Feb 2025 at 15:20, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>> 
>> > On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
>> >> Add helper functions to create a device on the auxiliary bus.
>> >> 
>> >> This is meant for fairly simple usage of the auxiliary bus, to avoid having
>> >> the same code repeated in the different drivers.
>> >> 
>> >> Suggested-by: Stephen Boyd <sboyd@kernel.org>
>> >> Cc: Arnd Bergmann <arnd@arndb.de>
>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> >
>> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> 
>> Hey Greg,
>> 
>> Do you need me to do something else on this topic ?
>
> I don't know what tree it is going through, do you?  If you want me to
> take in the driver-core tree, just let me know.

For patch #1, I think driver-core would be appropriate, unless there is
something more specific for the auxiliary device support ?

I'll wait for this sink into an rc1, then resubmit the different driver
changes to the appropriate tree, no rush.

>
> thanks,
>
> greg k-h

-- 
Jerome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
