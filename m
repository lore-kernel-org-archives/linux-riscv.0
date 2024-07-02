Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB1DC3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 05:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xVpZcvu0wJikj3N8Ic5ETW7hr5/Y3lV8ZJpa3LWDWc=; b=UeDl1LEAyPNGDz
	qXWzKEeHkddXLJoR7126pWSFnobjX+7v1DjAOMcDWNq/ZXfbHwbYJ6hMciUKYEYO15aRTcTnutRfQ
	xJ7DBQB3iQWO+U5GxjRPDMv42FkAsCGWT95oRQlT0qkQQO40PvYGT3tVawNDvF6m9MdjDckEl8UdF
	/kN4dUo0gtchprk8tA6nGzYbq4cBk0ZonWHPKTBsTipBhqnEAelZFHR/9IjOl4s3ITvyQHClS1gg2
	56Ov+578jZQhVzUiKPo9ddk73VWntXPwBYKaSy3kX2uVDC90OOyCJhtf1mLCUU/VJinoIGUFHWkBv
	0gszXRaBUOQxD2yXrLsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOWLJ-00000005cbF-0aKu;
	Tue, 02 Jul 2024 05:46:17 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOWLF-00000005cat-2nfL
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 05:46:15 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-70673c32118so2393400b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 22:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719899173; x=1720503973; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BGGBEWgqwliEqnZATHjMM1K2Xkz4OG63sXpZDZIsbfo=;
        b=wBsR1Kzi/W4x5Oa4A2crAQO3nc8rvCh+OuaHzjd17MzIo3VhKCt51ZvqPW5P5hWvzu
         OSvpr69O0aHm/UVJt5KQy7Lly+7Q30p1NtvSYMcF/fkhaxxRK3hR+KJcQWcNdjSBzYKh
         VhxOtBNWYMOxfom1GCOgSN1AMB4MqFZZIDEMiLK2Vg99Oc+pytfdmV8WWus7TWGTKQFb
         ehnyyb+PtkepUeHW0H3WK3Ev0IJECGdHo7Xl7XzgwvC+kxhV6ZMq5FdoYFi1tIGnkXjX
         AtetYTRCuvmOgafZL3muVSs5XU/nu9u+zGQg67n6VAs7SGlGukFwfVL6CkGKkLoo4bgx
         J7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719899173; x=1720503973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGGBEWgqwliEqnZATHjMM1K2Xkz4OG63sXpZDZIsbfo=;
        b=LqTFc+VrFDfVppYqsPm/NufQij5OzAYzTI+hqPHuH143J/bB7Rw5E5yIVvx06g7D4a
         76LBWIbGBUsZsQnq4WUIb49M4Xdg24qqdZetICnu0SyiZgILBSSTEoWXq87DmKlBHVXI
         fX9vt8cpVLxbdZMEMnQpvxddp/UgkoUyJc2IhaOOh9fk60nmdAAwOKlJJhEki9HxZDpN
         lyEswP31kPpu2K62ZOOZ5JV52vevoWHwMObXGfnD2QxkrNrYuKhryQDSCynGB8dzKZ40
         wXP2lB+lhA6Ivu/GpwM14cen1D52Mpvw46pP0xQpiSWv79UJIVThUwom2Pq8IpJGBKy7
         Nc0A==
X-Gm-Message-State: AOJu0Yy9mJOlW6YOrpNRAxNenw6NM6mIq//A7faYxkHo9ZmQi4mHgS4q
	awZuNa1FDc/jQ9Gbp/sVZJyM2xw4i1DvbK26NrxzK1S7Ol03uvxOPqrcX6sSTjE=
X-Google-Smtp-Source: AGHT+IG2WieA6d2VXCXPEULk6bM4rk8RGnz2VXlb5+XlqbXE2HDHRrkVhtC3A7gynucOeClBzA/BEQ==
X-Received: by 2002:a05:6a00:3e1d:b0:705:9a28:aa04 with SMTP id d2e1a72fcca58-70aaaefd5ddmr6625232b3a.23.1719899172664;
        Mon, 01 Jul 2024 22:46:12 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:a569:328b:99ad:ce17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecf95bsm7787118b3a.140.2024.07.01.22.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 22:46:12 -0700 (PDT)
Date: Mon, 1 Jul 2024 22:46:08 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v3 07/13] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
Message-ID: <ZoOUIJIxnwpqxBHR@ghost>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
 <20240619-xtheadvector-v3-7-bff39eb9668e@rivosinc.com>
 <54232f3e-4fea-4996-a90b-6de51e1c51e0@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54232f3e-4fea-4996-a90b-6de51e1c51e0@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_224613_727861_87F80266 
X-CRM114-Status: GOOD (  17.78  )
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

On Mon, Jul 01, 2024 at 10:49:23AM -0500, Samuel Holland wrote:
> Hi Charlie,
> 
> On 2024-06-19 6:57 PM, Charlie Jenkins wrote:
> > The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
> > has an encoding of 0x9.
> > 
> > Co-developed-by: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/csr.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > index 18e178d83401..9086639a3dde 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> > @@ -220,6 +220,8 @@
> >  #define VCSR_VXRM_MASK			3
> >  #define VCSR_VXRM_SHIFT			1
> >  #define VCSR_VXSAT_MASK			1
> > +#define VCSR_VXSAT			0x9
> > +#define VCSR_VXRM			0xa
> 
> These are normal CSR indexes, so the prefix should be just "CSR_".

Ok, I can change them.

- Charlie

> 
> Regards,
> Samuel
> 
> >  
> >  /* symbolic CSR names: */
> >  #define CSR_CYCLE		0xc00
> > 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
