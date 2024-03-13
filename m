Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0A5C54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 07:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qmq0AP+be6awMS4hHrhBFaWuQTsxl83MoWgKpQDTdzY=; b=toLNGySXry7JNx
	uERX3LQX9HWLpnD3tIHXONCHOWzaE7ZQ8ZuqR3jo9YqZNNjlhAxJsMMBU3ZyPaxTD9ZM32MIPRKNA
	QY+ylGkg5duoVphufL3BDtJigD7R1j2q/3VpgAcJRsjefpE4VinlruucKIvQ0h8k7iTkP7/Of6Lpi
	SvCjBHRUaCFir/xlwfy1EBtODjn2tb4UTWHp7rytcxWF0GxDfNZ9JY4DSXCozxnP1NaIUAnRvahup
	Jt0BVf1930RjoWOkJf+L6XT5Ou2fFTWq/XkLcQWarzYF4pBl/CbFQWOukxBuYAAm7inm04Zfj5WDz
	WFs6ckJPVDqFM5t30cdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkJDB-00000009DfZ-0OsJ;
	Wed, 13 Mar 2024 07:39:41 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkJD6-00000009DdJ-16cX
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 07:39:38 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a4663b29334so1398466b.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 00:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710315572; x=1710920372; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
        b=MXnSxnF1t4yMMbg7pdDsD/ArFG5flEtfj9sVyHWgtDmx6BSNQaks2aP9znYqvc1F6n
         VQAYLgjDqAeHKw0O6ozZaM50smadiQQqr+NV9EtiClHikIqatB/HXDgvEv6Dlt5/72rd
         FLFGJ70s7BeQIi/0nD3iamIcPFE3DG2XdiF0Wnn25KgBo/bkXMPD5YXzQ4BTQfm+PPVi
         VUdDXCBiNQ1VIqqgQQZaWaTNq2Uh1hpdpQFu4mnuaMdnKqm6wWRD5Q9lI+RFCAtyM19Z
         5U0fg/Co2bmon/XLdeYBq1yZgvBFugjyDmmJSyZR5zJaqYmitR+Zew5AjhQrLIgDRIwe
         w3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710315572; x=1710920372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
        b=LDTVKZCX+0H05piXNb7Abv0ba5nwSRrejtSc6gzJwHGwyOVAqU4wT4IE+khGN4jZj/
         D8FWQ/sAwh6IYrUrd/OCARMTlScXMjHK51uSiXD8XFGCIf13NSeOoLSrbwA52SZUW1d1
         pCx1sUNffuzNb1p6AIq+K24QcXT2NgrIU8lbMoymbiA6RSozIDrzsiXNAjkY1UPIr7i7
         ScgYihc12XEwoH5gc4+7rVpNjJjf6vI8BHjKMw/Xe3YOvjrOtEB1XmSXgpvY1Y98QQnm
         NpKP5zJHkWQarUFtNE/3Nfs87w+Fm/Q5H4JBG2FeEZBPz3a373ZkA8CMpDW3pcaf9LbM
         HJOg==
X-Forwarded-Encrypted: i=1; AJvYcCVm+3T1mPjABRKTxXod1G7VMBDFlFyMEWtE/RzGL9CuCEOqM7PaYcOahukpuMG9x6fb2+qnUqPfStjBtl2jcakCgwDpfWc1ulaQFBwub8Vh
X-Gm-Message-State: AOJu0YznnOr8NwOdJcIxBSphAvDkRIMSVjqU3iwDQ6k2ZsbF41yqRUIq
	kYRCGPaGO1PckrlJf0xaAqQ1GYjoH8aq6UoF8O93AGPb/DGNAi7sXWdbeMqh05E=
X-Google-Smtp-Source: AGHT+IH38GneADkyKtRbEkb8+HLK5ZsZNpyhD22lE4uk6eUmiwmdHa00scLatPQEFNYx/T2Y2VkSUg==
X-Received: by 2002:a17:906:2ccb:b0:a41:3e39:b918 with SMTP id r11-20020a1709062ccb00b00a413e39b918mr7484516ejr.24.1710315572226;
        Wed, 13 Mar 2024 00:39:32 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qx26-20020a170906fcda00b00a45a687b52asm4578781ejb.213.2024.03.13.00.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 00:39:31 -0700 (PDT)
Date: Wed, 13 Mar 2024 10:39:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@lists.linux.dev
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
Message-ID: <43ef4ef4-303b-45c6-aa50-3e0982c93bd7@moroto.mountain>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_003936_330902_5822220F 
X-CRM114-Status: UNSURE (   6.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Thanks!

Acked-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
