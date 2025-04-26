Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0308C369CB
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 11:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9J654m64CnMrIPjbvjzn9e5WfSTPlk50Gsk9zALUWX0=; b=bi3ts33EXwMqsD
	6UcH4zbier8I+Nv+DYEXhW+eWIeVSJerhcz28o1ANgthe+M0AQ5ZcQFWu8QAcxFoRw+9FKxa7TVTC
	hclB2qxbcDHjHmGK98fELksxaV3a0rwWMrkPczjcr4rQDn13fIp2siLczx/Ri9X+DQ6G6WxA7wwbL
	gjhQfhcevUzGlfolpG8KNoQF2qjiTRRgxvnJXxLqBrmLSaa849TmrgmQFPfb9+6xFLGVNFCLcXRVG
	2Q0FS9TqJ2M3HFq0KcHkAoGKuq0qG6h+Z9a2rmWyx+P+duCoJHy16LZCNQRlinjDo+P4z1k0nOcf7
	FzpYJBv4Ndmr04h2vs5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ddn-00000001vOx-21uk;
	Sat, 26 Apr 2025 11:24:15 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ddk-00000001vOT-3DNd
	for linux-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 11:24:13 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7c0e135e953so371658785a.2
        for <linux-riscv@lists.infradead.org>; Sat, 26 Apr 2025 04:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745666651; x=1746271451; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pqnzJpyxKOv8D4bjtcYPnfE8mIr/LA4bSJZ1glU6cV8=;
        b=RlHTEi4RQgx1mYqJmspb01BUrdc8+bOVNBRzHEAf5eRkcZiXLTOwSo9FvK0VmdBre2
         gp0cLhh6uyIQUQl4iNWJon9jUh6nxfYz9CrZymFUUCVbT2nCAKYc2jiLMtMFaVc9kcBJ
         gNrKV1Q+8hDj6tNGE+dkGFjtKCITa0Ez9OqTtEzeuGwkyD/SZMfdyXJzrq+7gfeUtXEC
         IB8M+pS00WSEnq7lLllmEmEMkwvMPPa2O+6bOv1ih+leS8ZlSSyWpwhueqr8PrBEpMQN
         r5AjIobtGZZVB7RO47EcZVyJageIcf1/j5KmkiIkhNSM25i24+jEPnuaRJH8M0O2KhUp
         nN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745666651; x=1746271451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqnzJpyxKOv8D4bjtcYPnfE8mIr/LA4bSJZ1glU6cV8=;
        b=SA77ouByglGVJ9gMOLf3dvU5K8gnq71AE5AFJLp8Kh1pJvaRI7kPC8gd51ZDJxGlZG
         uI5c/0j17PP3yvCZlgdP6p01DgTfTTvisuZyfsC7qjIOq5+WtJEr4raAD8C4gaJM59HU
         qIBxKedSnH07ZM8tHLY5Y4CZpf8d1Lsz11o0zytGt4XBAVlOp5KVMUCeShBQKS8QRHw0
         6F5w4uqNtpXVnklwmO0Qg/viv6OJgE83+uvhPCrckRkrZf7M/bJ1sQuweR4v/VHBoZe/
         Pe9KSVQ8jUc8gMU/vVEGwGqEWlT8c5npvh+C3fN8DPfKY7ci9Y1UmQqN/2/VhvuNUGYT
         pfHw==
X-Forwarded-Encrypted: i=1; AJvYcCWJY7QC/AczkxISs/rkXu/fET1Q78MVsbDjVWRq/YYYE9YYQZVweNgwu0EdQRjJkWLbsBJJx00X0xcJ9A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7RONyuLCEbOPJOOYyY/VGGqteXDOaJyr+vPDhRvh81srZ0Ohf
	GCOyqzXHvPz0Ff/VfufqfRrH4WfPa0e9CFfzDZJW9jRd3zSdLCQ2
X-Gm-Gg: ASbGncv1QDe3DU3MdZmhiD+oWkIFALjq0qT+KBMUJFzAtFdMdoMW8Bb6YGFjtnQUaxs
	NfdpUfTyfvm22ufrgKZEppEuDLGZqHnDwZxI9mAlwGksPN9dyjFiELghZlN/UgiH2aThKJNJRPH
	usRha+aQjWhZOhXCTB4F5J6HbjHHaRm3Gx7guDfFCP5NMbPb902fR6nFyGNVSVu/HEWLCkPv8my
	pIEssCvJ0bOmi+71UlY3avDA3A8J5tCccg1k4PnN/GW9qPGf1Snd+5GAaQMogj1j5VuejcoyK3h
	6haWlkyuvjUcv+SQ
X-Google-Smtp-Source: AGHT+IHTJyjJW4zRKKH13NlfTIwZIg4GsuvT7hEkrKwp+YV3SS8iaJApxOfdun7TkRMs5S8LELbrRQ==
X-Received: by 2002:a05:620a:460a:b0:7c5:562d:cd01 with SMTP id af79cd13be357-7c9606f9a48mr802679585a.16.1745666651286;
        Sat, 26 Apr 2025 04:24:11 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c958c91a10sm337284985a.22.2025.04.26.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:24:10 -0700 (PDT)
Date: Sat, 26 Apr 2025 19:23:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
Subject: Re: [PATCH v2 00/10] riscv: sophgo: Introduce SG2044 SRD3-10 board
 support
Message-ID: <2feyvebloqdcxxzmywe6azmwnz7zqulh2lixhw53ciw2ldisch@n2q3duucrp2r>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <MA0P287MB22626253965E96829B7371A1FE872@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB22626253965E96829B7371A1FE872@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_042412_875652_B05A8069 
X-CRM114-Status: GOOD (  10.58  )
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

On Sat, Apr 26, 2025 at 03:36:41PM +0800, Chen Wang wrote:
> Hi, Inochi,
> 
> Will you apply this patchset on sophgo/for-next? I see there are changes
> just about dts/bindings.
> 
> Chen
> 

I can only take 2, 3, 4, 9, 10 for now. The left I think they
should be take by the subsystem maintainers.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
