Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA95C5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 06:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xokoDCaR+2PYw+zGzKJeaAOOzFmCplTRG03qZh+3XV4=; b=jQu6GgU+TB9hr6HzeUz5YiJTbZ
	miYZ9JCTKAwSPmCtdceANzxUNsdaNYbMdEGMjApr45BbuyPXIK6FynVJsS3RTyEA0gTD0B9FqFOR8
	TMqaduQzUa8lxOT7XRJtDQ4CXYLW61pxqWIyQuD2KcRrx1cLuY/Zqcs3dNKTjN4O87/H6HugqJumV
	w96uHTnd3BNHDWIqMqF+Vl9FBrN5UbjKAJtVKREaUWOWp2zPR6vVUPhutJKwnKiljI9H94MNBuKEF
	j4xCDD5jS3YugEi9oUp96vd/6tzebL7rwvUpVZW1nolmDqMYOUah3NZkqzZznKDKTVBzhtAWYPOsP
	z/K4uc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsESl-00000007CBV-0625;
	Fri, 07 Aug 2026 06:53:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsESh-00000007CAY-3zFz
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 06:53:49 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4957eefd361so22336015e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2026 23:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786085625; x=1786690425; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nUIF+ZoBfnPhDtlVbHIbfV3H6x1dAyvkNT/RRT7NjLI=;
        b=pETEp/X67WV1Pq3Hn9+mM6dPd+On+nmMihue1f8NyvG8QgovGGWMRVTlQLwt2XwOsk
         uPR07bap09m0ZdLdA4Tzkhyelh/kSzOSq5n7tmauoujuuDNOunRwl1E8GUWTeWX29vh5
         SXEScR99TrCRcLZb7KyVLDIGcILbVHxJi1rtYtIWOfAQiBtomA36sIWKfYvS1uhcn7IR
         3lXU6Qds4XG8qFxQ1O84m+98NHS9TxPF7hUylE/R4SoMDlZ5k+ZDewJzRE/i3KES1dNy
         cV5XF2w40Ox5nd2IEW9y1fV0rLyx5jdx8r2UqIRvN6j4t2Ge8+E6O7XcKcI4LMfpquj6
         hW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085625; x=1786690425;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUIF+ZoBfnPhDtlVbHIbfV3H6x1dAyvkNT/RRT7NjLI=;
        b=giv/XbeYyP/pZZywAKCFR+zo0k/zLeTiVm4EecyLR3+4jTJgHBRW71WJxZyveCTiHq
         wrKWctZL0zC6ccCGYVH4S/40fdIooL1rZEr6dBfLJUfVwL7ipG1Nu0YP2El5Woj7Axly
         vJmlPlBAEU9OtBngMeOtcyATJrwgknAiU0+5msMDYZc+v3EOmEncIcTHhUafrGHATZno
         kUstydPpg3iQwIXD6nKNQbeGnGvCQ/JLe2kLJZYmd4LyJqgWHuYBzJIlrS6iGZbWXb1q
         vt1r+3envHY1fooByWpbYvSVBZbABEQU8LNHAH8F9aMBQL5NZQIQyTvCJJAJBiQux9QP
         vFpQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMOIGjqR5EN0Nn6BGN2A2vAwtlNxDTzNS5VgiWg/cpy3z1lychmParhIbC6ap5bO2wb+imRvQVZke8+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvG+aBjZNJWYNHOHnMi6duoWa4/kVGXuGifp6zoFX+Do9ARnhj
	6pCkbQbJgmB27N0WfqewVFoUq752w/Bs2aWr36BIj3y1TfbofYhxtgN86LEzXq7UJew=
X-Gm-Gg: AR+sD13WJXwe3JMbL6Qy/RfB6uwlfqqjBPUpV1MeNdyOJLXH9214HKIAcSK9Owv2j3q
	8JmY6iPFcm7r1fTh08O9+yG07G23MfxbEeBh+SpVBu15xHTeuN72lybdU3e0hKbOchOX0Oo/PwI
	13+XZMw0Ce3VM0Li8TLUTJMoxDUDF9s3tNhuS04L9G5wD21rt55g7pIq815NuOpy799OlCIMtf+
	AIt1+XsskgUY/ONjeT2VMYFiCD+Wd36UYaZYEf9gPW7ZJ8omzyrB7GYVpJFGsJZwcvph2/Wo8E+
	Azakdw2U1HymYYLeRxW72euNarQ5IIPNrTvNmkf+WDiO2Dz77WHSzL3c+PmHnbt5e9jlq8QOVjz
	R+I5EZLvQlltIItnCAicSwTILHnEBwpb+hBEL2mzwrAuqJow6R7NJMZ9aFf+D1hHwIwTQ0VaGWf
	IiE46RdbiIS2WY5F8lKt7kYUQWvMPthQ1hkRrDW5EZybMtQaw5YsJIZ43Ccq7nHb5bxpc2qDE/A
	ooLMbjPIuZ1ImaJFRH8w71EKDOJwVvFg94wVJnZuIg3Fxvn6/eh
X-Received: by 2002:a05:600c:4fcb:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4995e084875mr16392445e9.7.1786085625549;
        Thu, 06 Aug 2026 23:53:45 -0700 (PDT)
Received: from localhost (p200300f65f017104bf0aa590e17c3201.dip0.t-ipconnect.de. [2003:f6:5f01:7104:bf0a:a590:e17c:3201])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4995422016fsm98840415e9.8.2026.08.06.23.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:44 -0700 (PDT)
Date: Fri, 7 Aug 2026 08:53:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Cody Kang <codykang.hk@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 05/17] phy: spacemit: add Innosilicon DP TX PHY driver
Message-ID: <anWAmitXSFRUw1W2@monoceros>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
 <20260724-k3-display-v1-5-f22a10a52867@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260724-k3-display-v1-5-f22a10a52867@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_235348_001849_6BAD2EE6 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============1487319697725161569=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1487319697725161569==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pjrvltbz7ftd6xiv"
Content-Disposition: inline


--pjrvltbz7ftd6xiv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 05/17] phy: spacemit: add Innosilicon DP TX PHY driver
MIME-Version: 1.0

Hello,

On Fri, Jul 24, 2026 at 11:16:37PM -0400, Cody Kang wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please drop the include for <linux/mod_devicetable.h>,
<linux/platform_device.h> already provides of_device_id.

Thanks
Uwe

--pjrvltbz7ftd6xiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp1gPUACgkQj4D7WH0S
/k5t1Af+IUdmJ1rwWz3XTKVvTnkiumXy+BBJlthTfpRB3pFeiGILfF6fTXLHen+q
HI5KuCh4tnAo/jb3zLCDqO0RRmh14m5WlEgbMnFB9NGgBsbmj77K/WjLo2asTvFN
zTn9nrSjAtcmoJs0h4hIB3zaaueCYiWTGq8S2lIKH5D3xMUy61+006h2s5Dtrzlc
fHv743vCRkGoaGQWxHvpsgkx8Sp7WXEwZQyMaRvSggG2FiskKlV5pyM35siiJuAA
re4sCShFRtGFOhGjKK+mM7y8skzgBNqDocWT4sYp0QYeW6w8nwNHyKh3KUN//afs
1fDWRTlDMEJQqbI9K3OToPHbVguUIA==
=glOr
-----END PGP SIGNATURE-----

--pjrvltbz7ftd6xiv--


--===============1487319697725161569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1487319697725161569==--

