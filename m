Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D86D33A22
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 18:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmYIGgNkArafgSmcfRW0jXY0PR9gT8qQ39WRgiKXG7A=; b=iQpqsdgrdG+0N5
	QAXXacKANB+G8YpasLXoSaUiD/cpdkTc5JrPddhyUZJaJoayQIS3d2hrOBqL5BEo7nqepUVNZJXuy
	260At1Id66zWjojBrQDd3GP9I5Z1wB9WLtJzqFfqanuA40moZjecaSIll8w3SNb4HNfDNbkAgVu0T
	1znbJHCQUERxioQkXw66J6liyiubs2QtQFD4xU3e+eiaUQz0LM3H5LV01Qbv1ZOeuW4yhJCSF8vr9
	JGDQDUqay/pYONL693m6IJ7wphwdgtZz/6oN1AMoYOAN5y6Ba8nKxrwElmsuRd6f7CTNg1NL32+fV
	sCOonqaVvjc/tOFgDB4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OY0-00000000R3A-35sQ;
	Tue, 05 Nov 2024 18:45:00 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OVi-00000000QBK-0Hdg
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 18:42:44 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3a6bf539cabso12011495ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Nov 2024 10:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730832156; x=1731436956; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/5k2rLKTo7KgnD4BR9+2dIjyjzlQVVkq8ThtV9wFto=;
        b=MzHOhaibyZhL6RpROdjkZWnt2KBGOyUm0RgOlT5FIyhsYtvh98fz1/oLNV8L52VKul
         HtiOUlDruj9+XkS8BdpDuBcxuePmSHpz4VAU9TCAhYO0lchn5goZ7sH5qNtdQsi8FS16
         f5IoTV2sw2Bf330uj3sYS4TIgd3KksH9m45ErvLIt6pnt1Oz4ncKPBhAhpFBCDe70rMy
         BF+6x4o8R72qZ7KV+Yl0QCJyT24P7sQrLG/maADC5f5jFvk04My68/lZhzDu8bHB2JFQ
         hlwuSXJsYD+ntsE+cOm5q1ZKNlLyV1/mmhZxkAtjd7+3HdJZuXttGcqC/DxVyVOM5aKK
         oQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832156; x=1731436956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/5k2rLKTo7KgnD4BR9+2dIjyjzlQVVkq8ThtV9wFto=;
        b=Eifyl2hHq83eu1fjqLdCYQ+z4FayiVEeD/43b9OAN/a3yOyx1CWbmWV1ExKS15t2Vg
         k9L2opwV9vSCkzXSNA47jTVSSq1ITUK5JyIfqiueQo+7WU/qq+rx+t0zJ/B48HHVSIi7
         2KIZulTbQdKuY9YyuIhBtodL//JX4fZ10ulLCF+5yZmJ8pm3v5MUD3n8Bc4gKDlYjj/R
         rxzQqiAfCFFyu+ltZGPw5mBhPpNthE06S9d+jBTcjQblfjR6aPItsrbXyUK2UFvA5InF
         b13JMRiY3VodjxcgUgzMsiLBHeOzeVS1zU6Hkw0r0Sjn/YWfAi82LIi1cxgZ0n/iAdW+
         ZVEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbCorVSS+cQ0USxM3g1OudFRqvxXdiYn7iZe7kfWlVObE6me7d7bo1u0uYUbyCWfjCIohKRTBzoNYKwA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4eZ6FmzIW4W59TlD/KdTYxEG/P6QY7ie5IfOQpdGkCxDtJuOy
	dNhBJA2UeRucR4dvQB35bkmOpphfPtQKsRPfcd/ZsUeFZF62GHMFAw3bULfTkPivZWqQZbp0cuj
	3rcDhpz6Uglp37p5QLNncyYaXcrk93LlygJ4uAA==
X-Google-Smtp-Source: AGHT+IHafiE56RLycAX61PwBNuvy4TPzSnAPrcXkk0qt/3LnY4O4q/UmngQM9Vlm/dj0VEmvvCeNfFq4tqlEFF5LAvc=
X-Received: by 2002:a05:6e02:152e:b0:3a6:b445:dc9c with SMTP id
 e9e14a558f8ab-3a6b445decemr144631815ab.3.1730832155951; Tue, 05 Nov 2024
 10:42:35 -0800 (PST)
MIME-Version: 1.0
References: <20241104064650.799122-2-u.kleine-koenig@baylibre.com> <6b5b4f25-0f42-4f83-b6b5-82c1adbefe83@arm.com>
In-Reply-To: <6b5b4f25-0f42-4f83-b6b5-82c1adbefe83@arm.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 5 Nov 2024 10:42:25 -0800
Message-ID: <CAH2o1u77TViePZ2eh+FY7oQXxFAp+SEVM38ROP1uKfeMZ9E7hg@mail.gmail.com>
Subject: Re: [PATCH] iommu: Switch back to struct platform_driver::remove()
To: Robin Murphy <robin.murphy@arm.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Rob Clark <robdclark@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Michael Shavit <mshavit@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Georgi Djakov <quic_c_gdjako@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_104238_810576_C1C6A5C5 
X-CRM114-Status: GOOD (  11.68  )
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

> > diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
> > index da336863f152..382ba2841849 100644
> > --- a/drivers/iommu/riscv/iommu-platform.c
> > +++ b/drivers/iommu/riscv/iommu-platform.c
> > @@ -81,7 +81,7 @@ static const struct of_device_id riscv_iommu_of_match[] = {
> >
> >   static struct platform_driver riscv_iommu_platform_driver = {
> >       .probe = riscv_iommu_platform_probe,
> > -     .remove_new = riscv_iommu_platform_remove,
> > +     .remove = riscv_iommu_platform_remove,
> >       .driver = {
> >               .name = "riscv,iommu",
> >               .of_match_table = riscv_iommu_of_match,
> > diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
> > index a2f4ffe6d949..e84806eee281 100644
> > --- a/drivers/iommu/sprd-iommu.c
> > +++ b/drivers/iommu/sprd-iommu.c
> > @@ -531,7 +531,7 @@ static struct platform_driver sprd_iommu_driver = {
> >               .suppress_bind_attrs = true,
> >       },
> >       .probe  = sprd_iommu_probe,
> > -     .remove_new = sprd_iommu_remove,
> > +     .remove = sprd_iommu_remove,
> >   };
> >   module_platform_driver(sprd_iommu_driver);
> >
> > base-commit: c88416ba074a8913cf6d61b789dd834bbca6681c
>

Thanks, LGTM for iommu/riscv part of the patch.

Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
