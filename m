Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEF0C021A4
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 15:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyRUJqhO5ZpN4rh0/Gjxme+rSrkQqbKFUQwJppjJAHw=; b=T7zNRHzUrvy8+L
	qnToMQ6MnmF/7tR1gE9Gz94x7ISdgRpzfiCyOlaEXKOwpt3aXderJChR49zba/eLqMM1BAV2JZfTO
	xb0Eo6ZIzWVvkNK0EflQSbLUQCQ7dZG87KZVzuf0ofBTBRQ8FedrEPZdZ/8WaWY7Szlpb3LyUx7ku
	WuUI4uGHhjLJHY8GXbtvn7OYj4ZyyciHk75Sl3bn7T9GzeqBKIUQ0xx099ootS+V0gGsAP1U6TEzt
	lMHWfhBk8PDPA4A1LOmhkkpfhfLUxSyZ9Et/IYWhqlbAHmuUUt1Lt7izTgLYBNixc/0eBY7EXNUS8
	Vb2YI9SoaMcuaRss7hIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibL3-0000000BZxf-1pnh;
	Thu, 13 Feb 2025 15:41:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZNo-0000000BAnC-1red
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 13:36:02 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4395f81db4dso5337125e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 05:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739453759; x=1740058559; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4lyrHtSipeKghn9xCx+8COWh0BWty29N6DnBPAUwOek=;
        b=pCJ4iEXS5joeF2Or9EqZRJ6vS57XWxqme9Zwgau6MR85+SzNlAYBtghDGJXjs9qIam
         N6hGBvaLmcVr7BHw+H0ADIHk0H7he+2RYkKPU00uwdjXwGY0NAXDR1xYnvA7gQurKE84
         vqZAAMyBFKxB0XJ2umhzes3ExgqM8tR0yh8TCGGzju4P7YP0ARu566z1FEUVvSf8SCwb
         GlwP32OaL92hUS1klQfSQ/cm3Vg1YFEKvGzJK4JL4qffrXGHMXNGVe6sQE0eSBcrDpXU
         lczSzGCTEyjMNznpCkCAxg1tdyDzlXmTaApMHpQc7FYC5na0jRgIU8K/sZsev7e87x2o
         snhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739453759; x=1740058559;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lyrHtSipeKghn9xCx+8COWh0BWty29N6DnBPAUwOek=;
        b=LO2VvBHRndJicv9J3D11WVlEZjPnJHseyrNzxBZ4d7TJSCMqkGO+9hfIaPd17BhFya
         6q5oUScDqyYlkt91NbqLowmJkdsAYBehqxazDJJIgDyE8nAj0j+JZb/1mtYIvDzxMFbP
         Xc23n6fnWUMIs3hEpbWk+0k/cX5W3jXoHD9A93JdKL15Q7pVaP+kgnagHOUdD4puTrSJ
         0u55nVyePQSXiowlCcKWuQWGSdx8KSF+bOBFOAwSLR2FRkRRHCHvJ2gshMHh5hinZDp0
         Mot026n4DaDF7bPEoVg85crFHkFALAp4Hnso0C4g2Wprv45js120TKKZ/EO99wnbf+pp
         YdLg==
X-Forwarded-Encrypted: i=1; AJvYcCW/arVDwUcddsry+7TYn7+tNZFX9llg9mpzvT1/8yA20nQjAZsaR4M1OJMQK+Nw/JOHWJJ7mDyfB3P9Gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeU1VmmhGqPLZj+/aQyuKuVgoyjqv0i6fnffk4dJwx3yToTk+/
	L+tr652j29/1VkXerp+xQUW+n+EFercfolONoZ3u7GHmnvcNv7R4Jo3pw9AbF5M=
X-Gm-Gg: ASbGnctMj32JG9hVmRgL27hLkmhHRqZnT7NA0OMKLi4XUXiLtgVLYnhluQ5Sm2dp2cf
	C3a2zec9gMtYQ7ac5sa63gVmJ/lIz3StUSLOs8gjvJ9L7+D4tY9mQI1ZiPb1wzQDv5pRcJCavpf
	Z968B1jTeOpRd6cClMyRkZJH48nHxdaXnhYMSgF0LIh2R4cbCIMxpEZKGCVCxSasQGG4V8y1HYO
	4/UBDLK3KQIJXAInvoi9MD9oYFTdcd6i6YH5Oj6s+33Y3b/6U8IZrnNYqWB2r6vD5DUtoMo+bdi
	MSTU4F4t1C3FeQ==
X-Google-Smtp-Source: AGHT+IFlyyROQN/jp5N25OPHAwGGncnJ/FLwqH6qkR/P/8dmal2Zk5G/l0wZieziiMnBJNT5H1Y22g==
X-Received: by 2002:a05:600c:a0c:b0:434:f1bd:1e40 with SMTP id 5b1f17b1804b1-43960e81b92mr29235125e9.6.1739453758160;
        Thu, 13 Feb 2025 05:35:58 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a056151sm49618825e9.16.2025.02.13.05.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:35:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Dave Ertman"
 <david.m.ertman@intel.com>,  "Ira Weiny" <ira.weiny@intel.com>,  "Rafael J
 . Wysocki" <rafael@kernel.org>,  "Stephen Boyd" <sboyd@kernel.org>,
  "Danilo Krummrich" <dakr@kernel.org>,  "Conor.Dooley"
 <conor.dooley@microchip.com>,  "Daire McNamara"
 <daire.mcnamara@microchip.com>,  "Philipp Zabel" <p.zabel@pengutronix.de>,
  "Doug Anderson" <dianders@chromium.org>,  "Andrzej Hajda"
 <andrzej.hajda@intel.com>,  "Neil Armstrong" <neil.armstrong@linaro.org>,
  "Robert Foss" <rfoss@kernel.org>,  "laurent.pinchart"
 <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman" <jonas@kwiboo.se>,
  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "Dave
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,  "Hans de
 Goede" <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>,  "Gregory Clement"
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  "Michael Turquette" <mturquette@baylibre.com>,  "Abel Vesa"
 <abelvesa@kernel.org>,  "Peng Fan" <peng.fan@nxp.com>,  "Shawn Guo"
 <shawnguo@kernel.org>,  "Sascha Hauer" <s.hauer@pengutronix.de>,
  "Pengutronix Kernel Team" <kernel@pengutronix.de>,  "Fabio Estevam"
 <festevam@gmail.com>,  "Kevin Hilman" <khilman@baylibre.com>,  "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 7/7] clk: amlogic: axg-audio: use the auxiliary reset
 driver - take 2
In-Reply-To: <73c1ab6b-fd5e-47e3-8815-8f74758535f1@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 13 Feb 2025 13:26:12 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
	<73c1ab6b-fd5e-47e3-8815-8f74758535f1@app.fastmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 14:35:56 +0100
Message-ID: <1j1pw20xxf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_053600_482427_B9CA9912 
X-CRM114-Status: GOOD (  18.99  )
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

On Thu 13 Feb 2025 at 13:26, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Feb 11, 2025, at 18:28, Jerome Brunet wrote:
>>
>>  I also think this is more readeable and maintainable than a bunch of
>>  'default CONFIG_FOO if CONFIG_FOO' for CONFIG_RESET_MESON_AUX. This approach
>>  also would have several pitfall, such as picking the value of the first config
>>  set or the config of RESET_MESON_AUX staying to 'n' if CONFIG_FOO is turned on
>>  with menuconfig.
>
> I still think you should just drop the 'imply' line, all it does it
> force reviewers to double-check that you didn't make a mistake
> here, so it's a waste of time.

Arnd, you've made you preference clear and this note has been added
specifically for this reason, and transparency. 

I've exposed a technical reason for my choice. Going with the 'default'
approach makes things more difficult in the long run for those
maintaining this platform, me included.

The trouble of having to coordinate changes in 2 different subsystems to
have an appropriate configuration and the pitfalls of using 'default'
outweigh the extra review trouble of using 'imply' ... especially when
the pitfall mentioned in documentation is explicitly addressed in the
description.

If there something wrong with 'imply' existing and being used, maybe the
Documentation should be updated to reflect this, or the support be
removed entirely.

ATM, it exists and it makes things a lot easier for me to support and
maintain this device.

This all started with a maintainer request to move some resets away
from clock. More requests have been added along the way, making things
more generic. I'm more than happy to have contributed my effort and
time on this and I don't think anybody's time has been wasted so far.

>
>     Arnd

-- 
Jerome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
