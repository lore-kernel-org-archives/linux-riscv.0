Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2499D107760E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 20:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMSI6XqG7SZ9ufgI1W9um6HiJLLq2b7tGqt+mqVGPQI=; b=DRB2hHKWvvq/2V
	4FZlW/Ft4mIHN67Lhxb3qrNTcYKL5joqnoA9DEi7yoc/ovEj5ADa8v783dvJZ+6j54PxaYexdcWcB
	XV9SzikqJ7oJZrA7Caf7jVbRHOqONMB211VxbIEzmg4Gz56OennU/LuEHoIleHuz9ILkH8MZwEWNd
	YKjP+l5fHVjfch90kIdidlyHM7MSptJywCbbT1Hwg9cxdgPyOLdhHIjIWCW+AvPathzXwyvZcJvSG
	hU6Jw4IJgjoJEjF/wJMpcM9Oc59rrwqnXnaaQC1eqhQHRP+LwBktt6J7b9KrN5sPn+F6iYw+B/xom
	HsF2cRMRBtVBpRjOkr3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xW5-00000009Im5-1ARv;
	Wed, 18 Mar 2026 20:29:21 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xW3-00000009IlW-2m4x
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 20:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=kMEfzXsB7JKireizXoIe2FQNbvVD/n2jTrp8b4fyj/U=; b=hnjfVKeqsuUHHVlJjlufr4M1xX
	3YovllmITe/ZWh4+FMjnO+5wyV/T77V6hjaclb5ivDNcIu8I5YZUxrJjkdQHiXnek7vcUxmVMrbFV
	0UTFYzqE9ua9w/z+ekkp1rrchw9iw9LgybdJE2jTWfCRtrPwcftAc08XdcmbVKmcufWOmUtzevYnQ
	3iSCNiqL93YKMlS8mjAovmYCrVo54Gs54uulkmjHwBeOLZAOX97rLV4KyBGPpIYuA8iJFEEhyaba5
	HPgAdWZx8xHoYXW0fBkO/J78RIBzMXIG8zOlTNLPP0zNJkrbmuFGnG3/fK2dzGENRkrB08fTUm0bL
	b8dU98SQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w2xVu-00000005fov-192c;
	Wed, 18 Mar 2026 21:29:10 +0100
Date: Wed, 18 Mar 2026 21:29:09 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Shuwei Wu <shuweiwoo@163.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC
 thermal sensor
Message-ID: <absLFdJ8GypLh8te@aurel32.net>
Mail-Followup-To: Shuwei Wu <shuweiwoo@163.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_132919_697405_8EF5AFF3 
X-CRM114-Status: GOOD (  13.85  )
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

On 2025-11-27 02:44, Shuwei Wu wrote:
> Introduce support for the on-die thermal sensor unit (TSU)
> found on the SpacemiT K1 SoC.
> 
> Include the device tree binding documentation in YAML format, the
> thermal sensor driver implementation, and the device tree changes to
> enable the sensor on K1 SoC.
> 
> Test logs:
> Hardware: OrangePi-RV2 integrates SpacemiT K1 SoC
> Kernel: 6.18.0-rc4 mainline
> 
> Verified that all five thermal sensors are registered and reporting
> valid temperatures.
> 
> $ cat /sys/class/thermal/thermal_zone*/type
> soc-thermal
> package-thermal
> gpu-thermal
> cluster0-thermal
> cluster1-thermal
> 
> $ cat /sys/class/thermal/thermal_zone3/temp
> 28000
> 
> Dynamic threshold and interrupt tests passed via sysfs trip_point
> manipulation.
> 
> ---
> Shuwei Wu (3):
>       dt-bindings: thermal: Add SpacemiT K1 thermal sensor
>       thermal: K1: Add driver for K1 SoC thermal sensor
>       riscv: dts: spacemit: Add thermal sensor for K1 SoC
> 
>  .../bindings/thermal/spacemit,k1-thermal.yaml      |  76 +++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi               | 101 +++++++
>  drivers/thermal/Kconfig                            |  14 +
>  drivers/thermal/Makefile                           |   1 +
>  drivers/thermal/k1_thermal.c                       | 307 +++++++++++++++++++++
>  5 files changed, 499 insertions(+)
> ---
> base-commit: f5f2e20b1cbc5f9ea20b372d15967b24921ede19
> change-id: 20251124-b4-k1-thermal-eca906e6dd7a

Thanks, I confirm this works fine on a Banana PI F3.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
