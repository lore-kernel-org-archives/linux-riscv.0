Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81DC108E1E4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 10:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxSeX58aNslnV+wYu1OXHnMp96+KbNYbRwFVNpTM9mg=; b=oiwugH4vCN93AF
	xRZbdLViWymVxLi++s0kSEvPAWYzoyERCLa1eCqp4ST9sqTFFzzSWhksX56x0At1J4QGBwzkHKkx1
	wzbEOZTEDRFpPfYZOFzkOcKrUv7Rlrj0qUz03JpTRJmsUrd4rSjS3oRqJnldxykD/4DxJKFzWRxc0
	8KwCddtCpnAvd++5/9cSb/LPmJJJyEmyJS7mE7JmkMvDPw+BezHZ+NkSXFMtT9r7iY+AGxJC9OgB+
	K+RzKhvUCvfjIdVUGHRjRJqf1cE+MEyrRi744wZUkA30lLyAdwBuu6uO3klo0Zfr7CDNPtVWrLagc
	EueVZwhwF6tlBGz/8rTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3As1-0000000ASH3-0KMJ;
	Thu, 19 Mar 2026 10:44:53 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ary-0000000ASGC-0oe4
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 10:44:51 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-665634cb208so1523865a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 03:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773917088; cv=none;
        d=google.com; s=arc-20240605;
        b=NtmNj83NCdFVfbvtk/1oPtIMDO0k5SZG9hog23mkzJ6MBSRQOT0w68+okjE6gIVExr
         B8lk+bkXAHtHKpnuEqSuIKsZX40215mEZbGO3V6Wppuo6KdeoxrE73WnFXbvUw5ldMst
         Td0CcNMOktOSt6H71SSt88oEvOw/kxp+2g3XMB4G7JsSIFDUIYzoX3E0UR9ZK3+125hI
         6UhCdIz10VJGpHLYMf04Si7OZ3XUSjsSuybRT5aJxD/tbhlv9aFjtumTNRUvl3nFe3DX
         C9yBNAdTj5WEttlaSW+KzXHBuGqg+jaTgLH1xWA6+KINcWOavabEbWXMW96Ip3YCva0p
         ArWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8nsXLrCC8XRALmE6EP9wDlaUdJlORBZ30G/UqxIe1EE=;
        fh=gwu+F2RfEJYa+JKKQTlousWDkrCSAjxxP1uuLJdQgwg=;
        b=DWdtzpTE1vNJQ7PN0Abpa1DiDmsVEvSzCsLgAwyPkKEDfQlhmqlipbwyGZeTwtXX44
         1vOzyznEcb4irivCMoWtz5FdZRnwi0jRC6i2VovS2MMidIgY0G08xdvx3I1DpONUlAFj
         Ag7Z8TzXHgaFAF0faFKKPc+87vPttQ4lNIHRI4/x0qEND6D4Sbx7jm7twpkmWvoWP4m8
         N70V++ZMNt0+wPayqvcQAsM5uD2K4PUAWKvQKiB+kQQuPVpJ2p7WekcfsjHyqz+ydc4e
         mvaPcfXVRZBNdCNrNb7bRFwUfkGQQxadAOBG83gxD2Eau28nqKDZ/2oo5TQfMBXjskFo
         LmQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773917088; x=1774521888; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8nsXLrCC8XRALmE6EP9wDlaUdJlORBZ30G/UqxIe1EE=;
        b=ho6If0VT6kb4RNbpkZrhv1j981JQ3qUVU4qlU8WAUaPjvBkXbnAD3l1PSuJsDE3klN
         cjOPeZrJLA1MYmUbF5XjnRBGjsqMTDKKHFiQDTMn1GPuKvfj1sWEECGX9l3YCJFaKuIZ
         uYasZFPHJLeBptHAfBVIWwCqrWc+5xJ4KeRgOO6rZmhH2+o3KUJSkg/OSphwxj4IBdHH
         4cpn+A/fiQfUMe9JkOdmFaBJiHl2UZk+DUXd076PgroNX0kzhSPzLJsdl7kRcVhoR8qu
         codcWeyKnVYNWXiJK1ZjY7rk1fnnH5Ur700kkDzdEvKkUqT7SUswrySjFk+9ykOE65TI
         +OSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773917088; x=1774521888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nsXLrCC8XRALmE6EP9wDlaUdJlORBZ30G/UqxIe1EE=;
        b=pyfF4ZtoviKTqRg7Wd0wDyPqNA8QHjegk8naqpNw5mKzYxUqBgxP4zrXhG7wK4xrQj
         eTRZPF5r4KK6QNH9arnQvD/hqGlmcSia7/WOQWheyw9wHnJF4GApAqxsJ4BgBK2NIhO3
         CljD0Pp2JgFsMp9tWdM1UC4HZakilVD1A6gTVsIpnGoOAaMC+sJKtgAq/8aKu8rMYHzV
         NmXMtZ4O6zbv0GgEy/2crzxhq5sB4I3uvwN5ibxkaSYnE/7zh98we98oSdjtNLR8gvk5
         vTokKX3sgr8nRDY6RYQgi8+o0NAalkke7AE03/TBGSfi+RxcR6yduJVYJ4eI0XkjkCvD
         OkuA==
X-Forwarded-Encrypted: i=1; AJvYcCUEAS9UW7D0W/8Xa/QOvMre2VCEYn4IXfuxaidlBCoz0mOdHo3TvW7z0UzUVF0PkrCd3ooBeo2TTuYATA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOnQP0PeBw5gTjY1vfh/YdPuurizBNmy2bQFxmqFns38+d8w6Q
	ZkxVpC+6lzxDdNTZU/Gj2ZBe0G9Iu16Rnkai26VR3Pew1jGXnyXGTc66j4UH87NgU8ki1CInQGw
	7Msc1keW4gZ75k2nlciFm48t/1+aaji8=
X-Gm-Gg: ATEYQzytddvyQ9yroiB62Oh7C9vcsXdcwhC7BJx243WENmjuDMRa6mnzZywvup48pti
	FHCEg/nxXRB9PsE9jsueAEQgOgwB3eWX1OufQJccsnziXM3c6e87iPudZLW4ke4wbNKOxpp0KCj
	SPv+k9kiL8bAED8xS1n30HV+16lZEwd+4wT868HhWfs+PIv+0vmoPu0R4DyIHi9R32lU0g9zanS
	v1oLr6qrqs9+IIJseP7Fr69jH1WbMtnXFxSuaU7SXn7gQQEupUuqoVVNK+L0B3rgL4TJPKM5eBx
	jhJB3g==
X-Received: by 2002:aa7:ca56:0:b0:667:ddf7:7d9d with SMTP id
 4fb4d7f45d1cf-667ddf7835fmr2510617a12.10.1773917087638; Thu, 19 Mar 2026
 03:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com>
In-Reply-To: <20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 19 Mar 2026 16:14:30 +0530
X-Gm-Features: AaiRm52C7IQCXAwHh87UFE9OwrOumGbtL8uwoXCOsBJxz_0fqoGXY7qT2wiZr5Q
Message-ID: <CANAwSgTp6urWYT9H96XR7viKv7Sy16L4exS2KR5PLq_FJ91xbQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC
 thermal sensor
To: Shuwei Wu <shuweiwoo@163.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_034450_249171_DD3AA55E 
X-CRM114-Status: GOOD (  17.65  )
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

Hi Shuwei,

On Wed, 26 Nov 2025 at 17:27, Shuwei Wu <shuweiwoo@163.com> wrote:
>
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
>
> Best regards,

Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

> --
> Shuwei Wu <shuweiwoo@163.com>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
