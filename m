Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF94C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 21:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJmCno2jXsMCy/Oknh/t08duFbQUGpneuLY5MbM5Gp8=; b=Ed4RK7+98PRxKy
	8DKyuh855rtFCgcOjzx/R9AuUa76ha87IoEZhOZEFHTx3TjhG4CAqBC7cRHBUXxfHnItSbXG0sLN4
	slWCm/q6GmSKF7W3qwSMDaT+gJSmW7hmVviHMN2Kdva3id0LstvRYICFBI+39RKJ6uNbmBMRG3HOJ
	3FXwYvkA/UjQt01zZ2C7fQzYOFDCg4fJRgbHq9anchHPBcx0gf8b7Zu5uLBfo9sw2LryJL70DYegu
	NhoRIO20qXP/7cyfxAonG7KawjyvcDF/WwMPiU6BE37F8JhNVTaOjVoTnuatp9erXC0OSSu9XzAfS
	QrgBJbIZUD6X5Rm6sbOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvOtI-00000001T1k-2ogr;
	Fri, 12 Apr 2024 21:57:00 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvOtE-00000001Sz7-1D16
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 21:56:58 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1e3ca546d40so10252665ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 14:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712959012; x=1713563812; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KaHJoFfHeKcbZbr8DZBqF2w1WE3ebjk/glljyT7W9ZI=;
        b=3dcDACbioeYzNGrjA7buPEnPMLOyYfcDqwYQtiRkEYGwpKHaQuPv+6LwKGLe2snene
         iTRDFUktnM4q75Zp2C4xs+pvStU8pDGggyb4L5Mwk7f8fWcxc5ZgVuWSVLK4EKMMT09u
         psZdhXSlp3EIRFjhoWxFjrPvLg7QZhSJQnb3CnziwQmw/ZDtSe5QGS5Nz0WMxZAQV2BQ
         /mUDB8cK5bD/3TW6NwhqtygMo3PfICeLj7juUSxM3n6steCv2HvsGtshsJbL1nhzzHvg
         l8tD2tlgCheXVm7CMOQLvMmwm201O+zuY2LfVyYalsPBER4b0qqvxlnO/kuF10XEyfGI
         dJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712959012; x=1713563812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaHJoFfHeKcbZbr8DZBqF2w1WE3ebjk/glljyT7W9ZI=;
        b=BtLCEth6S7Vv5I5BL6NFOavp843pRBgnaVeJ6/30zHuQ3yALeL62jTUs2XSxUj/DEp
         WAKDXL08EuOpKJTL+ZkNhBk1FSoB/W8ZSF6GOaYH3GqTU6E7NRJoOfzXsjFjvFlUDnGW
         snTVG+kPX4aWQyMn/EDBqE3hXIkLqsSfKkhzr3Xv9KdLTlMpaMxV4pY+VK7TiAJt4gI1
         7dNWaNkRg7T0CZAm+pkulKPsiJocbnPepHEXEm+5bHrC+VIWYNPRVIP17u9uyVCRcnDg
         fd5Fs8s5BU3q0cASGhfD9QMGCddhg5sBd3k3rej+DsCjWRVNBFdXKeuTQj2c4p6Q3sGC
         2mVg==
X-Forwarded-Encrypted: i=1; AJvYcCU6a7b2z5CnH+Qq7XVC0tNbTGRoHxxCZZhZ7O8Qjn3LYj2ISM20u3L+fif8Dhug3m/r+9Gmu8gx9zvhRJpZT2Grph8ZXl0tO7NXZjasq2H2
X-Gm-Message-State: AOJu0YxL+4lKbqUcj93+2wG+wL+1uW2SvQif851MtvWTPNTbEtThvNIi
	8ztU47+kXG4le95sYVlOJ1Oe2mVBtfBJTTTMaBNS6nLL35ST3aL6f9biLpo4d7A=
X-Google-Smtp-Source: AGHT+IEWqFfAYkiXilmnZ21u0Vqs/Bc8kyXEc8OwbOgXHViFBz7n/2ViIbfUfkCfp7Uh0oJ1KjxbyQ==
X-Received: by 2002:a17:903:250:b0:1e4:b1ea:23ef with SMTP id j16-20020a170903025000b001e4b1ea23efmr4487004plh.49.1712959011683;
        Fri, 12 Apr 2024 14:56:51 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id o16-20020a170902d4d000b001e088a9e2bcsm3463749plg.292.2024.04.12.14.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 14:56:51 -0700 (PDT)
Date: Fri, 12 Apr 2024 14:56:48 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 08/19] riscv: Introduce vendor variants of extension
 helpers
Message-ID: <ZhmuIGX71THEuZWx@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-8-4af9815ec746@rivosinc.com>
 <20240412-dwarf-shower-5a7300fcd283@wendy>
 <ZhlypvTdsFPZBr08@ghost>
 <20240412-drab-french-55d8ff2c8cfa@spud>
 <ZhmhtLS5NuRrPOfu@ghost>
 <20240412-geranium-monotone-b47f414715d1@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412-geranium-monotone-b47f414715d1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_145656_371562_231BE1BF 
X-CRM114-Status: GOOD (  41.40  )
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

On Fri, Apr 12, 2024 at 10:34:10PM +0100, Conor Dooley wrote:
> On Fri, Apr 12, 2024 at 02:03:48PM -0700, Charlie Jenkins wrote:
> > On Fri, Apr 12, 2024 at 09:40:03PM +0100, Conor Dooley wrote:
> > > On Fri, Apr 12, 2024 at 10:43:02AM -0700, Charlie Jenkins wrote:
> > > > On Fri, Apr 12, 2024 at 12:49:57PM +0100, Conor Dooley wrote:
> > > > > On Thu, Apr 11, 2024 at 09:11:14PM -0700, Charlie Jenkins wrote:
> > > > > > Create vendor variants of the existing extension helpers. If the
> > > > > > existing functions were instead modified to support vendor extensions, a
> > > > > > branch based on the ext value being greater than
> > > > > > RISCV_ISA_VENDOR_EXT_BASE would have to be introduced. This additional
> > > > > > branch would have an unnecessary performance impact.
> > > > > > 
> > > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > > 
> > > > > I've not looked at the "main" patch in the series that adds all of the
> > > > > probing and structures for representing this info yet beyond a cursory
> > > > > glance, but it feels like we're duplicating a bunch of infrastructure
> > > > > here before it is necessary. The IDs are all internal to Linux, so I'd
> > > > > rather we kept everything in the same structure until we have more than
> > > > > a handful of vendor extensions. With this patch (and the theadpmu stuff)
> > > > > we will have three vendor extensions which feels like a drop in the
> > > > > bucket compared to the standard ones.
> > > > 
> > > > It is not duplicating infrastructure. If we merge this into the existing
> > > > infrastructure, we would be littering if (ext > RISCV_ISA_VENDOR_EXT_BASE)
> > > > in __riscv_isa_extension_available. This is particularily important
> > > > exactly because we have so few vendor extensions currently so this check
> > > > would be irrelevant in the vast majority of cases.
> > > 
> > > That's only because of your implementation. The existing vendor extension
> > > works fine without this littering. That's another thing actually, you
> > > forgot to convert over the user we already have :)
> > 
> > Oh right, I will convert them over. The fundemental goal of this patch
> > is to allow a way for vendors to support their own extensions without
> > needing to populate riscv_isa_ext. This is to create separation between
> > vendors so they do not impact each other.
> 
> The one that needs converting is xandespmu. As I said on the other patch
> a minute I don't think isolating vendors for the internal representation
> is needed and can be left in hwprobe. I also don't think we can rely on
> a behaviour of "SiFive CPUs will always have SiFive's mvendorid" or that
> kinda thing, I've heard talk of the SoC vendor getting their mvendorid
> for custom CPU cores instead of the CPU vendor and it's possible for
> the SBI implementation to "adjust" the values also.

Okay that may be possible but that is up to the vendor when that
happens. The vendor extensions are fundamentally different from the
standard extensions and have even less guarantees of correctness which
seems like it would invite more errata if multiple vendors implement the
same vendor extensions. I can extract the code into a different file for
each vendor so that is more clear.

- Charlie

> 
> > xlinuxenvcfg does not fit into this scheme however. This scheme assumes
> > that a hart cannot have multiple vendors which that extension breaks.
> > xlinuxenvcfg is really filling a hole in the standard isa that is
> > applicible to all vendors and does not appear in the device tree so it
> > is okay for that to live outside this scheme.
> 
> Ye, xlinuxenvcfg is an internal psuedo-extension that should be treated
> more like a standard one than something vendor.
> 
> > > > It is also unecessary to push off the refactoring until we have some
> > > > "sufficient" amount of vendor extensions to deem changing the
> > > > infrastructure when I already have the patch available here. This does
> > > > not introduce any extra overhead to existing functions and will be able
> > > > to support vendors into the future.
> > > 
> > > Yeah, maybe that's true but this was my gut reaction before reading the
> > > other patch in detail (which I've still yet to do).
> > 
> > - Charlie
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
