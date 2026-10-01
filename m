Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908E9CA5FD2
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 17:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yshk8foU44FGcSjGEsX0CYknF19XhvIxhyW0kSl9nUU=; b=LNZxuNuqCQfZmc
	zB2vu7rOJcyV0JV+0S/U9A3LXQTXBMncIEgJuWzhl5BSgG1i5p0+hzw6h0mjqN6OnYt8S5tPKQTPz
	UCoZu81jkD+ueCjiBChJJvxw+JqqaIpc1Rom4rSIDHB1iCKxUgxeqKX9Y7U8+QkaCZVHY7zA+pPmj
	EGNEfkt2zUs9ew0BJlO1GfajrZkX1BEHio2J7VWK07uTdE0hpCCdtJmmsHvvTMitJj0NI5RzfoEe2
	tXgF3ALnorHAkKklxFWZXs6O82MBMOhTsCRR4CZc2cH/7rQBiHwkKCUSrPGteVs4KRV1W1vaMonBC
	WOdVQTvPeyv2oghuJ+bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKBe-00000009o7W-1PcV;
	Thu, 01 Oct 2026 17:03:14 +0000
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKBZ-00000009o6Q-3neF
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 17:03:12 +0000
Received: by mail-yx2-x0c.google.com with SMTP id 956f58d0204a3-6756a6320f6so2885446d50.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 10:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790874188; x=1791478988; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6YmMQO9LMPUNWHq4u3cbpwC28RlhwiegEC8VRXjjLP4=;
        b=JiBGj9/M4PvR8kbapXC1oIsvQ6pZwH4Zu7xTy37vFppYSTDusUAuHQzplyA29UPTFC
         GfMT8lvmr9vOkx7G2+ihr2QsdAoHfSxo6kJOlVsqexVqIMm2G8+ZCplc9877iI0OuN++
         YBRCtVG/WFcXwKRctmVpI0dod/WISqWUz/zzCN95hzOF29zqbyIVtOsxw1ZX6A1VqXdw
         weCKz945tR49eA9pvxntzg0NeXy5+T1uXaHx5DnrAbRUtVlCzN1UjdcorSa+vI4iIKQm
         Uf61x1JE8ktiwOcSGTDKg0liafVO/9aoyU/F+vAGF0jDlB23nN29kP8qc8OqTtnnOWhm
         dEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790874188; x=1791478988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YmMQO9LMPUNWHq4u3cbpwC28RlhwiegEC8VRXjjLP4=;
        b=a/K8rhxmUffI3KYIDNyqDotHvwXZ1yLerZrpZy2iDCw0ZYOLkJbd0g/d27LB7fjRWg
         8UTXasMdmmZNELT2yHq1Qt5jV5vZByxBUOa4CW5gKYLaXVjb9YGogMNohJBk/BrsXCfI
         cTLPRFUK2onKoNqlZ+cF8kNRO7h3a6PyB9WJyCHafDFLrsysYjM7K/zm4XwjtZ/TpwaR
         tPcoyfdU0qCZJTxcm1Iyf0qUzOKSntIzIhucuN7dVJHRvtVX6POSHrfn7tC8MEJsn3Jf
         TyP4o9F1LYIIod0f5l30V58/D1PzTRvAIvjG7vnyjrNbMYUrADRIpLxPP5IqXKjDLe5i
         tHow==
X-Forwarded-Encrypted: i=1; AKwUvBzwMR74WNVIsRIedv2hAQX4e2iTHXgnmEAil9SOQrxdvNr21j/Gp0WwPL5qW/bzHEVmSxDXR4YfAJNu8Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYKCr2qCr5QsnwDoXG8RyfUqSYymyFtlVahKZmibQCnwMD59EGtf
	YotNA1qeMKXrYC2kgOlw92QoSunV4/hPS4BJP1atLUSQhuGZmwyh8RY8EylTdvmC8AM=
X-Gm-Gg: AYBFou2bFm5NQwi4OKWpg2oF39gMs4GT8ZTbjkgCmm1Kubxm2VCBXsAPfCIOQufWZu3
	WNgllfXQsupr3EtZgUSwhM3zC1PARQOtnFAwST5CwdoIcvghX3V6lcC4sKsvXVzCzWtDj4hnrUB
	v843b06C8vaVdvLpLNtmacz3vkHgb6FjEDXh0HGydA+LW9PokjKCTOgPcJJhqVEQ3mlIJsF7dlp
	UTPy6HSO52938VeIeWA35WKnaIN8n6pxB9MRHcST6W7WgSW6Rhrzr7ug8FNVCj6/dPAV0Yc7G4A
	AsQJvHIWvBinVBIlo/CHKLWh7RHK9GPp9DJYKoaTGD4Qjg2dAXb0RAktHLSLqqFZbOIuP2A6074
	otlOOP8ENw6gmP2o15o+SdafSt0lV87fEz7smrKeYx3zxYvhKWlCrVKttlW0cyCZdsK0hyIJDL7
	OXOlXgbqvtFnkZtQeRNOrLhbaaX46jHPbxK+I7PWQeybHpTP+LTtZ3KN3zTxS5rpVIjOKg/lShK
	2DyNclzm1nAgzsqNiw/kWdubDZgqIYx
X-Received: by 2002:a05:690e:480b:b0:675:67be:3251 with SMTP id 956f58d0204a3-6768349058bmr1756658d50.62.1790874187795;
        Thu, 01 Oct 2026 10:03:07 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:8bf0::ffae])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677abafb2easm26948d50.4.2026.10.01.10.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:03:07 -0700 (PDT)
Date: Thu, 1 Oct 2026 14:03:01 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet
Message-ID: <ar6R5Df_uliYg1l6@hiagonb>
References: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
 <20261001151447.12076-1-andrey.lalaev@gmail.com>
 <ar6E4bQAKonCW3st@hiagonb>
 <e5f84c5e-e281-45af-8d25-62bbf585c94e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5f84c5e-e281-45af-8d25-62bbf585c94e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_100309_952976_DF5E862E 
X-CRM114-Status: GOOD (  17.04  )
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

On Thu, Oct 01, 2026 at 06:57:08PM +0200, Andrei Lalaev wrote:
> Hi Hiago,
> 
> On 01.10.26 18:08, Hiago De Franco wrote:
> > Hi Andrei,
> > 
> > On Thu, Oct 01, 2026 at 05:14:47PM +0200, Andrei Lalaev wrote:
> >> Hi Hiago,
> >>
> >> Please take a look at the patch [1] and the discussion.
> > 
> > Thanks for letting me know, I missed this patch. Do you happen to know
> > if any overlay was sent? I was not able to find one.
> 
> I haven't seen it, so I guess no.

Ok, I will sent this patch as an overlay.

Please, forget about this patch. I will soon send another one.

Thanks.

> 
> > If none was sent, I am happy to send one. Sorry for all the noise here.
> >>>> Thank you!
> >>
> >> 1 - https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
> >>
> >> Best regards,
> >> Andrei Lalaev
> > 
> > Best regards,
> 
> 
> -- 
> Best regards,
> Andrei Lalaev
-- 
Best regards,
Hiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
