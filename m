Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB280C36000
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 10:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ncsK05ep9oqTVJzV/D2nZLAji7fy6gf23T34O6w/9A0=; b=jh30rIMOERlxtR
	r+dAJsJDOrsktA1LRky41ejSiYX+JHVRUA3I41TDZ2SgWE6vSJnKkjJI1yPVWpWOMZFyMDBossFEk
	EKs5vygE+iCStduSSr2XipPsFcZXk1pzYA+DkU2rjjRtTp3sRVlT3UYH8BmrZjiF6q2e0iIP4FNkH
	j6dYGbNKZ4DdbyiHi5t/6P4RQfs9QTNUTLOrmRuqkgUgouLIqdekE+koCLKYY0Kli8tY9dQ3fzU1v
	u9Lf4Qr35tNEEL0xCYBd9yDJwzQhJtsRaga21rNL+jEUakXep3E6oKWlzh+ykt7KtRv3NGGebL19L
	rVWBqzKE3E/m8X8cXB1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqX6-00000008dlN-1JuW;
	Wed, 19 Mar 2025 10:20:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqX3-00000008djr-1y0f
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 10:20:18 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-399676b7c41so1932176f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Mar 2025 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742379616; x=1742984416; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWxtYxkS3ZmfTDBR3Ubow/eGPhpGRxs9B2tOpbPHly4=;
        b=Y0E83llGpBM5YjX2IGa0YIsRGPiOeSoGZp8b3JqqGdO1iNBRnIM2ZM0YSVaUybilNU
         wGQ6vuTB0vwAX3FtjhN+C9qB8JAkJscBvUgOd4rbCODLwQeTX6y5NhLAE04kj59IEQmq
         Spgzs0VMCquB8H5EK9PLu8n9L2sWknbWxGKj7D91o2V/pN/xXL0+/x86fLIsX2A0Q677
         XyygoAV8fqm4XdU+ItR1Qa1tls5+6vob8/X7+pdPA/3s7k/dv+J2sCBVpMEF4uNITwTK
         2Dx/PZ4jRGZcVyId2+scX792kY6p881xtOMQuIuK/eNhWYK4SiEnBcsX/uLTgiYxC4Vx
         hO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379616; x=1742984416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWxtYxkS3ZmfTDBR3Ubow/eGPhpGRxs9B2tOpbPHly4=;
        b=Qvn0veh/2haJmt6zH/BvBiWYm0G6u5iY7udFZo4QDrdLJbibbsDv5m9HNFIkk/lkJS
         3Bo+LWR9HuW4M9+FJQJceSMKVhdF22z/K7a+2EpNPvecD/Bhe7HeNtUmnM0Bld+bf90k
         EQEqCKCIFlNBiCR9K5QSrUj7319sf9gGjljXCJUGtM0EL2L2R4rcW2DWyr9iIwUOIi9B
         FjD6D2Os5WB5v4eISEXK7bepG9c8Ypu5U1SdTPd6IkRi228TXbSxBrhMZcpq7pkdmghc
         bYHpB7bQWw7wbSSp6HVS0kDTqzKozp48veHn15PxOhQXDHvAUfwcteevfqudLmhwc3BB
         1q+A==
X-Forwarded-Encrypted: i=1; AJvYcCWXq4npu3FVMrf/eUwRHveBY3qcrFTs9izOv25u7GH1b+EdvgTdHND7vfCTeS/IH3ZvQdKEnexyVEhvFw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsd9IXL9ly0SIYScAnqEteDY2mnllveiYgMrJqwJH+p7JeS/LB
	PwVEfGDLTwLJ4MhPbe9mRrAlNQK6KeTiZIdTHM5tIfjSjZOuo7l0fKnJ/WkPIuo=
X-Gm-Gg: ASbGncsbbNswcvzcKKUgThydEsrv6K8d9LnRpa7DTfkEZmDxpGFXUuxV//t0BElQRI9
	++meKrvXjP4+1DYt8IJgSPKC1uXljRZIudpks2t+zxwNSN2CvRC6QOvRmWVgaOXE6QBtgK/7UeS
	kP5qhm1jTVD8Cukbu+Sshg+v0GctTnHdcGkak6qYOolinkjJeTnzAs8xeK+HjkR85sU4ceLHIB1
	MBRYfc5XA8jHBk5LmPTIBw+JS8YHaesY+uSvOrNMZ773xZ6XRTk5RhpXAFvJvN2ygm2E9jaxlEW
	AIU8Bzty5AI1RED0cISna0J2l1B26fTGZ4kICm6r2OsmDrDmRQ==
X-Google-Smtp-Source: AGHT+IHjcG6/IeV2BOfDblPqcpvGjw3L7kajd7hg9EDti/4DwNoU0L0nZRG8X9Tat0FLH2nt55nwLg==
X-Received: by 2002:a05:6000:1541:b0:390:e655:f998 with SMTP id ffacd0b85a97d-399739ca2a8mr1441536f8f.26.1742379615798;
        Wed, 19 Mar 2025 03:20:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395c7df3506sm21189338f8f.11.2025.03.19.03.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:20:15 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:20:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Will Deacon <will@kernel.org>,
	Alessandro Carminati <acarmina@redhat.com>,
	linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
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
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
Message-ID: <fc197abf-e65a-439f-9d35-83f4665519f3@stanley.mountain>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
 <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
 <20250318155946.GC13829@willie-the-truck>
 <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_032017_581148_769C046A 
X-CRM114-Status: GOOD (  10.46  )
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

On Wed, Mar 19, 2025 at 09:05:27AM +0100, Christophe Leroy wrote:
> 
> Doesn't sparse and/or checkpatch complain about 0 being used in lieu of NULL
> ?

Sparse does have a "Using plain integer as NULL pointer" warning, yes.

I can't apply this patchset and I haven't been following the conversation
closely (plus I'm pretty stupid as well) so I'm not sure if it will
trigger here...

regards,
dan carpenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
