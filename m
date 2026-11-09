Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F5A606EEA8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1mvKEIEI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F564/QOY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wcSVYMYfjGEzbdayXWy36pS2CxmYoo0mO7+8loV8Rk0=; b=1mvKEIEIeGv3+xMMY9zJ8cmMRN
	08xNX7cC4QXjcVyzAtyOPMItq/lPOVDzMbQJw0n8qKadUaP7Xe14HKgVb72GHLtV4I2wY8H5148kQ
	M39sJLR9QYHVVaBKm7IC2j+lkc0oKi1/hwmA2crAUoplkeovAZeR8iy0tbHLIrUldvfKAhzlKnQV+
	Z0a/md+xIF5pAxtxnoZy4vxIzY0wAJHtRcumJWF3N5VSFN+QTZqFGAPj6DZwWrM50NSGYWbBRFj5G
	+iOeGgqk6K0obx71SVl4RxpOuL4NwIo39B+gAVltxYi2yMc1ynX7+rwIeFjE6oDkb1wRNlrfKY0+5
	NU+RE34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRYO-000000013y1-2Iv4;
	Mon, 09 Nov 2026 15:45:05 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRYJ-000000013x9-01CO
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 15:45:03 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-36f6295304dso1256047eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 07:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794239098; cv=none;
        d=google.com; s=arc-20260327;
        b=ILsxYW5G/NQyRFD9rpQrx7xVqfmclSguiB7iXMIwlo+Dsi+TmyfsEt/JqZSBJHJ8os
         rz2UoyUlaITiDVAmpPEDNc6IoftrXskGho6VrZddye2DWH3f1RraKVtL0ZE0xU8Xe2Hw
         ubr086swoEeB5ItcVCG5HyzqhNicyNVNy1x89UryMCDhTzKIw4yTXTG9xGEOvHD7FKiX
         4sWtxS+EaQde0K97fYUpT04nmE9/tfGBiK2vrYsQ1ou00qJA3O+Rjzk50qDU3kS0pEiB
         LCKiZEdcZ/FkjSdrEN/kwQ+DwJH7i4fqlepxN9BeNdBwW6kPfWEna+fJwxNKZS4jEVnG
         kBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NUErs7NoE/3bV36QmlDjG5zSS9BL+CCDMLSs4x6fzbQ=;
        fh=MWl09FjsLuUvUdJ7g5tGQrD2kLgNgLoAXHmLAGslwxM=;
        b=OMeAVKIiC7Oq4ZhNP7GMB0vaca2ZANmsnhnwQyZMHVhSNuhUDcGPIAsSm2jKBZQAzH
         xMBQl0qPx70RCeH3fkQntOfE0wVn9pxNb4hwBoPVUci+Mb6AT8E2IsZ+4LVSdoBpa7Aa
         y+hzjH2K731a9QCe847LijQ9gS+DmtpdWabLSnDqbMxaBdjIXz1ERlu0lDCpKn4QPu2A
         TKgajq88Cxjo96fMGqYnFX1k/KG5j1vUgok5swx/Baz7JQFmu1DWnO++inbjKwHlL4Jd
         ciRwbVb1X4eZBbEhD8b3IdWJhZxn6nktREiVUmEiuLoruTh8Ky4+JYrGNVOQqHvASBTA
         re2w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239098; x=1794843898; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUErs7NoE/3bV36QmlDjG5zSS9BL+CCDMLSs4x6fzbQ=;
        b=F564/QOY5bA9lXcOyXbBGcHoy5P//0i9IF2Iks2s2cvKDikGGJNpG7pZxfjKnLWD51
         vRh3qp1QkcQ885ULoMIzpKHxk5tueo4dZCqjD7O2oRaljkZq299M/evlodzUWlE9i53G
         2KQN2l7wv9aFClkbR+cFU3D2rVNl6B9YOmbZgUFBcKrXNB0+Z+rlBYJoqglyqb4f0H6R
         GlrJA2UkzJX4JqXbpc3gC3dDNoxbYUwBuauluSpK8/Acwm2rFpnpbUNB4qzGNuso856B
         WvlP+KVJ2JRgmFsIMkOi/31syZXnTxHI+j4hWZIyaDsy6S3MSjzTA2RKohC8egQ+k8HO
         wS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239098; x=1794843898;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NUErs7NoE/3bV36QmlDjG5zSS9BL+CCDMLSs4x6fzbQ=;
        b=QTULiv0fYQA8yE23HBPeaUZ/FuZNMy3sqPObbzCMCWuWQelVxhL/RBrw8h4QGeZZu+
         vYsqik9tQtoF+9WY/ItguyCxndsGWpu+1dyUmMIuUVRksFsX91YsKy0vTsneQelBTjkq
         0dTKW28/nYJXnWqF3WtpgBEX7gJXRzek/fTYoVkFbXVgLERJ2dXW+k5AQZFBKsT5sWC4
         buqY394UgeccNfTEQCtIp4PEcl548umJGvVImi/8//wZ1uIbmTQ89coumiLbtRunuuJj
         4Tw20VF+eZ/IGEplRTJV4gys6z5ecXErQ64OJ5pER9wO2GZuHr6ItLmzwgvV6Xt/hRrv
         ZREg==
X-Forwarded-Encrypted: i=1; AL+hErGiPmc7pZb6e80zao4L+gh+2C0rlnJaI8nLV1IciQspoT+fb19QuHrj1aSsBt2Oer2lVjlQNJY368+n1A==@lists.infradead.org
X-Gm-Message-State: APuU4Z9tNYvQ2dd33Vu7M7dUcQsc4mqs/FxWR6rv0e/xu2uhzNX6uy71
	FvFfh29H0SYfrlHe/eykdXMYcWaR+du++qXE6vTJBlToO3WIAk7cAiYjlxXwCDA07ZjvBZwNqkm
	NXTs+azLzcpiTq8YaAqyu3ihXpNWM8Kc=
X-Gm-Gg: AYBFou1Ax1WaFInR6P6Oav9MrgIf1Rb4Y5OWTTsa4ClcBlNsblOniEb5b04QOMOWk4F
	3EpbB+Zq/6SKVefWuUfV8ZRR1XoYKPEYFU+saJA0p2ma5ULMSJxQVOHwY6099cPqwCITfbiMsqw
	Xw1MDQ3j7urtM1LeNx14QfaSELOgZTq7aC0dZBoFVb3ceCw8l/L/NEIw3F8EFSNnmoJW0Pjjvuq
	QnhmBrH74p/Dv/YEW1c3aNNsWgWYSFfcyM8SI5z0pWWnV0SYpwjk9nBawhSB2SPLH63BLrEwqjV
	mQUGyJP05xcCtN5qARp2tIBuuH8wsQiNykBNK7cqlCGB5gLPS+LXDfHUHvpqMDkzQ7eup148a7z
	C8gpXK42DL/14bBPuRv/MJYh8lll3zuXL3oBN
X-Received: by 2002:a05:7301:da8b:b0:36f:4d62:2884 with SMTP id
 5a478bee46e88-372575c62b8mr8103918eec.30.1794239097992; Mon, 09 Nov 2026
 07:44:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108212826.15890-1-oo.hehir@gmail.com> <20261108212826.15890-5-oo.hehir@gmail.com>
 <d9f4a750-5f9d-4749-929e-330c8776971e@freeshell.de>
In-Reply-To: <d9f4a750-5f9d-4749-929e-330c8776971e@freeshell.de>
From: "Owen O'Hehir" <oo.hehir@gmail.com>
Date: Mon, 9 Nov 2026 15:44:20 +0000
X-Gm-Features: AclHuK9x9EpRxZ7OnBIKVHuPQ20ucbS7TGPBTpDY5y8PK69Mzss7MIfYBHErfIg
Message-ID: <CALp3LZ6HRs9pxPHj-4TYPS483cEaVBJ_kOGYmaWr--MhfQ6hCQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: starfive: jh7110: Add the RTC node
To: E Shattow <e@freeshell.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hal Feng <hal.feng@starfivetech.com>, "ziv.xu" <ziv.xu@starfivetech.com>, 
	Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_074459_071265_54BFDE27 
X-CRM114-Status: GOOD (  10.94  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi E,

> Is status property applicable to SoC rtc? If not, then is 'rtc' label
> appropriate when there's no status applicable?

The RTC is in the SoC always-on domain and its clocks come from aoncrg;
the 32 kHz oscillator is set in jh7110-common.dtsi, which every JH7110
board includes, so no board needs to enable it. It is left enabled in
the dtsi like the other always-on nodes (aoncrg, aongpio, pwrc). Other
SoC RTCs do the same, e.g. Allwinner (including the D1), Sophgo CV180x
and i.MX snvs_rtc; the ones disabled by default, such as STM32, depend
on board parts that not every board has.

An alias is only needed when a board has more than one RTC, and none of
the JH7110 boards in the tree do. A board can still disable the node or
alias it through the label.

> Note that Mars CM / CM-Lite System-on-Modules may be used commonly with
> board carriers which implement a battery-backed RTC on the I2C bus, and
> so another 'rtc' label may be applicable, something to consider.

Good point. v3 renames the label to soc_rtc, leaving rtc free for a
carrier board's RTC.


Owen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
