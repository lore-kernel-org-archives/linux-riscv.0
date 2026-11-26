Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA8B606A323
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 01:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yCwwRs1G;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=j26QCY9i;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BnDVZwJL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RDvRoiTZ/hdGre6E6gT8ky0qxGj+THQoYt2HB4IWHGM=; b=yCwwRs1Gg/87YRy+kCnDc2ciKw
	uuQ7tgpMv5jkX6nCz4psY7OjVBUK9njoblfK4ZQpHasKQYAPbEYbftrr/945iqgcZOJO2DxgRJgG/
	2kkhrgpVc5+lT6YaUg2cOvBU3V4iLojJyRFeKhByZ7xoW6ja8dzIisdksrJwzFm7NHERXuRBoUQC/
	YSFi8AxYL7XZzN8YvhpH9+AAkwhfcDssHtxRSCwnR/td9YaTpGNR0MlYql/K+/fS3wOlgdJ4Bh7zc
	Mvfh627qfFDEKndYQCjoa/KsYm+7HSL7LUwD0YqbDCoI+oO7K82NKVegYcFN3fKRj34N1FG4WobRF
	clwiGmUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWO74-0000000Bmw3-0ciw;
	Thu, 26 Nov 2026 01:17:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWO6H-0000000BmY2-17nO
	for linux-riscv@bombadil.infradead.org;
	Thu, 26 Nov 2026 01:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QlSPO9+8YS67Tn4rbTFkn+Zhwur7gCmRYFgUkoNRUs4=; b=j26QCY9ioCZbdbuBGZUdbM5LtQ
	FtjySE0v7mgLacxdBfOO3uNZNw8sZeBKPtS3+Sr1XTtkxcvmd6pnN51s83tujcXZPFAsFNR99fX9x
	PrPw36ZKkzYqZULu1fflDl4XNHC61W+SebDGBE5i/L8PtjuO04kJH/aaqVvIkX4vbxxPBOl7rIABk
	504gxVLIFvoI1w8MRdaXzEgfO8YqBDjZdu6N2zGU+d2ZaHu/t6lBvRMTM3CUaF5YDypQzzRlRPVik
	puWdeTqAp1gXd2RtAWsftDnWz5GcR0l26Q6CTFw7yD4Gyde9PVAtJbYKAFxz6hE/ReEZ843CwW61R
	h8m0p/nQ==;
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWO6E-00000005whk-0iHb
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 01:16:36 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8b4c2da74c0so42485947b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 17:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655791; x=1796260591; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QlSPO9+8YS67Tn4rbTFkn+Zhwur7gCmRYFgUkoNRUs4=;
        b=BnDVZwJLbIDgYnD2Vqu7pgmruQpoY0ER0xLYdiPG8CalFGgOrceE3Q8l444DhLTOSk
         HgbMfcnWUwqOzhtYrNM99mvauHQ8UbCt+3GVKntQQcCp9NTnL3G+cVfmMQBMg852N+pP
         hxAlJUHiSW8MNt3CIXcbOCuPIv1gj25TDEcbr7xcoK1HpLSl2fraqUD0gujeyzGwlRj9
         zTPkc2eiS60fzsXBvnjf7bXsxgQ/Dx2vx7oC3++p/XFaI2hgymXXJ7yS/hjpCrDao1UE
         f2irHm1md9XiFKaKZpjyFiohalvgHdJqzz1IK3uxIRNrw9t6b0YYpJj1NfTRvoEpGFs9
         QVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655791; x=1796260591;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlSPO9+8YS67Tn4rbTFkn+Zhwur7gCmRYFgUkoNRUs4=;
        b=DkxfxB2IIrwvKYdNwyrKYgD1BYTymVr4ZRztBBKlFQJrveM/tQnpCwy5Sq8FTc3i0a
         c+FVN08PxLQKsvKNx/GXNFTjRTqldc4IqcZbQr9M+FWXgI4haCYkgtzK1ghEMz54G05E
         DhPrsMuG9bu8ZElBqIH08oYB8VsmRQF8MfSzMDWlvVhFn7643rSwvWPyIar5yfzrwDGS
         3QSbydRHMKrwwo6gBaXmN/og7u6I7+Kz3diE8JCpi9zxGVHEoHfaPc1pLx1zaXWvfyN9
         SpMVAOmWCzs0DM/j2DQULQBsaSPXIjH5KFNAj2d5h2XLViPRj3KIA/SnjtgCNnZIthMh
         +OLQ==
X-Forwarded-Encrypted: i=1; AL+hErHvwY9K40ODLoeI7eOZwnRUHb6LEuTZZg0RGGSx7FhZnAe3Jluz8EMbjv5/EDzG9MkADZCKcloQEDqkwA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+YjojTit2TajVv2YPAME0sspXkYFN+jC8CsbE6YEKi3GKhFwf+
	VAcila5X2LwpG2xCJBDQ1JVP4Ar0NL9fSNd5+BeWXpMss4hq5Ck8ZNPi
X-Gm-Gg: AZFdTZeRrr0P1COx+pqYGgJQNnIX5xaFnw0So52rMYukNtWlSjQ70v+GrQtAfHglPHV
	5wpCtN167mjIU9sjgH+oCeYjvz9ZXDXUnw7ogP8nC+CWGeLtPHlgqHwW29iHT8KtTzSfILMTnVN
	zQt7p2qWGr3ByFrHE22klPBaiNdB8OLOb8p6mJihCrJHPKwMZJ9Mdjp/92MNRK1ED+nug+Hol9Q
	gUI84O7ngH87iYXAmQT3JoXitlPsIKduzjMa6mbMLWj+bOHit2VqzODl5gsTGRs69lhPaYT1vS5
	vVpr2vMxzANQsSDik6sbOd51ln+Eug+9vvXS1Zl6FN4XpjVA2zETf1lOzRrpvmIH3mrFi9luiMV
	qNskRI47vkcZ0o5gsPnKdcyOBhu5gwwcQLVncxaH6DjVXpr/OPQem7e2zO6AsfvehPvcXmFPYbF
	EWPYxxh2+/+prmY+4gn2LvlwBbSJJUEW6BMR2FhqtLcMa5hMD74zLJYUCGod7Gliw+uesfeA3Gs
	mre7a75Q9jByWVbden5ngG41BardWKX10quTu4XKXhxq2AjmMqVllZDVH93kdbk1FXtjHONWqTm
	dfGo9Q+a+GoW4YlZAAC8WMOp
X-Received: by 2002:a05:690c:6a06:b0:8b4:d0ea:ca9d with SMTP id 00721157ae682-8b52045f6c5mr70876907b3.25.1795655791098;
        Wed, 25 Nov 2026 17:16:31 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b575ff89c0sm12140497b3.0.2026.11.25.17.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:16:30 -0800 (PST)
Date: Wed, 25 Nov 2026 20:16:25 -0500
Message-ID: <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Cody Kang <codykang.hk@gmail.com>
Subject: Re: [PATCH v3 12/17] drm/spacemit: add Innosilicon DP/eDP controller
 bridge driver
In-Reply-To: <20261121-k3-display-v3-12-ec419e8e96b8@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-12-ec419e8e96b8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_011634_311353_91987475 
X-CRM114-Status: GOOD (  16.09  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Yao Zi <me@ziyao.cc>, Michael Turquette <mturquette@baylibre.com>, Sarah Emery <sarah.emery@canonical.com>, dri-devel@lists.freedesktop.org, Ze Huang <ze.huang@oss.qualcomm.com>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Thomas Zimmermann <tzimmermann@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Cody Kang <codykang@vsit.ai>, Brian Masney <bmasney+clk@redhat.com>, spacemit@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>, Dmitry Baryshkov <lumag@kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Cody,

On Sat, 21 Nov 2026 15:40:51 +0800, Cody Kang via B4 Relay wrote:
[...]
> diff --git a/drivers/gpu/drm/spacemit/Kconfig b/drivers/gpu/drm/spacemit/Kconfig
> index 8326a7b98151a..4667cb624401a 100644
> --- a/drivers/gpu/drm/spacemit/Kconfig
> +++ b/drivers/gpu/drm/spacemit/Kconfig
> @@ -16,3 +16,22 @@ config DRM_SPACEMIT
[...]
> +config SPACEMIT_INNO_DP
> +	tristate "SpacemiT Innosilicon DP/eDP controller support"
[...]
> diff --git a/drivers/gpu/drm/spacemit/Makefile b/drivers/gpu/drm/spacemit/Makefile
> index b3b148000cf7b..260d316a271b5 100644
> --- a/drivers/gpu/drm/spacemit/Makefile
> +++ b/drivers/gpu/drm/spacemit/Makefile
> @@ -9,4 +9,7 @@ spacemit-drm-y := spacemit_drm.o \
>  		  dpu/dpu_saturn_hee.o \
>  		  dpu/saturn_fbcmem.o
>
> +spacemit-inno-dp-y := spacemit_inno_dp.o
> +
>  obj-$(CONFIG_DRM_SPACEMIT) += spacemit-drm.o
> +obj-$(CONFIG_SPACEMIT_INNO_DP) += spacemit-inno-dp.o

I noticed a corner case when testing module unload on v3.
spacemit_inno_dp can be removed while a process still has cardN open
(say Xorg or kmscube is running and somebody does rmmod
spacemit_inno_dp), and the DRM device then still holds references on
the bridge. When that process closes cardN later, the kernel oopses. On
a CoM260-IFX:

	sleep 20 < /dev/dri/card0 &
	rmmod spacemit_inno_dp

  Unable to handle kernel paging request at virtual address ffffffff01ac5188
  Modules linked in: spacemit_drm [...] [last unloaded: spacemit_inno_dp]
  epc : drm_bridge_put.part.0+0x72/0xb6 [drm]
  [...]
  [<ffffffff01b0b142>] drm_bridge_put.part.0+0x72/0xb6 [drm]
  [<ffffffff01b0b19e>] drm_bridge_put+0x18/0x22 [drm]
  [<ffffffff01c41318>] drm_bridge_connector_put_bridges+0x34/0x7a [drm_display_helper]
  [<ffffffff01b23400>] drm_managed_release+0x86/0x116 [drm]
  [<ffffffff01b13cce>] drm_minor_release+0x68/0x80 [drm]
  [<ffffffff01b1ce2a>] drm_release+0xd2/0x102 [drm]
  [<ffffffff802b325c>] __fput+0xa8/0x248

An open cardN pins spacemit-drm only. The last drm_bridge_put() comes
at the final close and reads bridge->funcs, which was in the module
of spacemit_inno_dp that is already gone.

Other DRM drivers with the same structure, rockchipdrm for example,
put the bridge driver and the DRM driver into one module. I think doing
the same here (add spacemit_inno_dp.o to spacemit-drm) is the better
solution.

Luca (added to Cc), is module unload something your bridge hotplug
series [1] is meant to cover?

[1] https://lore.kernel.org/r/20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com

Guodong

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
