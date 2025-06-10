Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B787CC5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RLgK8SmAVYyzdz6jMWTCrmiLB4wcEogP0A4ZzTHxEQ=; b=vblvaePNGtZBjB
	AbNktJIJTxca0m/59NDP9sB4Ey26vSJLO7xjXeY0yI3nVaqMj7sL75ckO90hxgENZhhVzPUyoLQa/
	dSSy6WNMxbgU6cZhkfo/yp6xbMUDRGPFzBTl4j9Y2EQh88Wd5B6Ip6UUHfI4pfSP1i90e2McfOy44
	oIeqRtvw4aKiEah96J6b51JxPIEGK1JPZ60wTx6fxZxNMZ/OqvZtIX1zo42FsqOYnhloTfQPv3RRk
	VwTbLEyRCChZcNqVQ+cMCZdkakpMt3M4yMnv1GQpLhFDwoNfckM+t0dWwdR5IIVzlZ/cQk5T5uEy0
	nudOgkW9tM91t4XlOv0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwri-00000006cbJ-2gNh;
	Tue, 10 Jun 2025 11:10:02 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwcN-00000006Xp1-1Sf8
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:54:12 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6fafaa60889so35754986d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 03:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749552850; x=1750157650; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aciM/RtAI+o7KSDm0f9yisjYVs/6j85ozLAsY02zURs=;
        b=MzmwQXBE9lrYX7YxPheC3AvvYBhTPWXqP9VHhwvTg20bEAzBhX2ggLj7JjphqCg18W
         tZeLE9Xp3bwr1fSBxR0MDNuEL7voiTVrss3ocW5T2EqowPrJIX/ujZYi924nczQnNcgK
         9Yf3if642cfPBt+RQ0xAZXWtq1Vo3c8j7ecTtbB+imhfiuV7UPiw2CDLTqNXt+d3l299
         WT12VFwrSQgUmHlCPQBDCBcCpxoXmnDpYpRLYGDJ/8DW47/acp89Dh0LkpB/O0a2XHm2
         m8xaWPvGFNH+qMyeO4Qw451G5ieIQnyNOCrOX/SXKPc2G2MVIu9gqIbV5pqQRsVXMFWB
         lm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552850; x=1750157650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aciM/RtAI+o7KSDm0f9yisjYVs/6j85ozLAsY02zURs=;
        b=XyRqjJ3EO5im/I6LW0NMDv+MZ0oLxg/WkHfhl9toyxSccP5Sk1t/ksTrS8WcmNlkbM
         GVVMYwlYNh7rwddIU184eotOQyJwXHRYc1W8hUBaV0xxEYpzTiVh7GHgVWxZrquWoeNt
         lFHd2AvvW1JCOGw+xD1bm0hslyplJ7+6hU1HdMmbPqSRiIwuA5nWXAbNn/g/A8RQx6He
         CZVpN3V4n/hpWcUN4gQdHOyrWzS5kluRJjlIV+sbQ6JeP1TV1yVc9mjrHo+xBgJlF8Xd
         a16CEsgI70seU078HjAyYGUil0caIL9Z3puw710IOKSpoX9bemkRVc5P3PAGtdulJQOp
         SMOw==
X-Forwarded-Encrypted: i=1; AJvYcCXSUHO2Hwb3jiO0eGKa16oEx67NAiAbQVZDTBz0WItpO/fCNnKew0wrBxr0ilt819CXDMeEj2ZAUtiwvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzM//4BY1xzijL3Wngp1LSpCuNg25ZxBd9qn9PBF1w99Bf7HP/O
	dYJ1kEkFFQhJund6kr189ckU8CzNc3wwbb2ZGgTdWHMNHGKGKKFr3UX8
X-Gm-Gg: ASbGnct1MGQzo/pW055+ZVcxW3dcUUdIlWun5qhINn97K8cybD3BROxHecdpYndUjMz
	8sdZ1zYRE/UxWwZ4+AglTbinrlle4o4r5lk1+VcQin6R37j1k7/WF+V9ijrUxpT4c2NiZ6/pxbo
	ZXuH1rTpJh6gvknPRH2gYI8hnVJ1pXQ6o5WTdiccLDTuuqYoehUkjG8rVj//Pq9E6nWi7cBbTBm
	aBN9v3QGOeB3vGiGOMXc0cgeJnumGd+CaYY2mSBXUBXih9ZYcsv4imNbpDlJuFpRO1SUV1w+Yr/
	36KNdRCchJTB4mPPCJV79O8RWt736ewMoHKldg==
X-Google-Smtp-Source: AGHT+IEo8uu+V6aspY6hh94sC7blb0U3CV9AGlaOO83e1hYVMKVKokyGqG4hkNCz9kFeCPCNDFjT6g==
X-Received: by 2002:a05:6214:2022:b0:6eb:1e80:19fa with SMTP id 6a1803df08f44-6fb08f43185mr264918966d6.1.1749552850108;
        Tue, 10 Jun 2025 03:54:10 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ac94afsm64332126d6.44.2025.06.10.03.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:54:09 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:53:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
Subject: Re: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
Message-ID: <r5sdm4vs5wayictlhx2zfui76ksrei7bq7wpd55eo5o6ommkhm@lsx2mqsldlu5>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
 <iewyo4h3yiqnyn6qrgmckwcaalovpv2udf46jwpor4s5ni5bvu@eg2ikgmswcbg>
 <AS2PR09MB6296822D5ADAEAECCC06F976946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS2PR09MB6296822D5ADAEAECCC06F976946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_035411_384622_A63A7A52 
X-CRM114-Status: GOOD (  12.00  )
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

On Tue, Jun 10, 2025 at 10:46:23AM +0000, Vladimir Kondratiev wrote:
> >> +#if defined(CONFIG_MIPS_P8700_ACLINT_SSWI)
> >> +/* generic/MIPS variant */
> 
> >I do not think there is a must to add these defines
> 
> OK, if there is no objections from others, I'll remove it. To clarify,
> we're about removing both #if defined(CONFIG_MIPS_P8700_ACLINT_SSWI)
> and #if defined(CONFIG_THEAD_C900_ACLINT_SSWI) ? And, I'll keep logic in Kconfig to select whole .c file if one of variants selected
> 

I think all should be removed and it is OK to use old THEAD_C900_ACLINT_SSWI
as driver config. At least for now, I see no similar case about using defined.
Maybe the subsystem maintainer can give some more meaningful advice.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
