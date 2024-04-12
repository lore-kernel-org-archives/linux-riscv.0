Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC09BC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 21:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omBmIkTrDjjdMMUkyTdb0P2ShLAGuBgaSGTkGc0mqxA=; b=FRhn1nJF/59DiA
	0Hc3fd0jNy+nl66o7OzaoFNJ3XZx+BUuznEmxGLJyvHZ7uQRmjev4mbG+rvb9SIU4r0puonHtG1oV
	ma6h0f6GdZnvqxVPCGj576ISPGs8/vQxcf2yc5JTfQfXs/ium0f0KNXd30aTzC3GD9t5OD+/0jybJ
	Dh9vBU6pgj2maMFCIDrCDc+pk7yFHIEQHj4T+1YbYKPjwBz0lFszF7Am3D/5kegudp799NV71yGTI
	JnXNgfQ4W3/FTTQ5rb35b8sb/KbmHhYhpkiHG4ZL1MrhqYR4QXAIJMOhc98bAXjOEnL+QaLpgXQwq
	xhgIPMTAhFSU3nbi+yng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvO3y-00000001JBk-0bQE;
	Fri, 12 Apr 2024 21:03:58 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvO3v-00000001JAa-1cy2
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 21:03:56 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5d8ddbac4fbso932161a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 14:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712955833; x=1713560633; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aSqmAxropEDfNCG6GQv7daH4xVtfVuXJw9jJz7os0WU=;
        b=cCMjfg7DFBHjRHWNJhJStfoj12yaes7LdxBnypoMzbSlLgAhzyP1i3CfU72N+Nr9jk
         fPXGzkztFuVXAPjDmh3WVqwRz4QPbqmbEMamYSyiHrggSTK6YM0O7AFvzLyUYci02s3o
         zB/wvwOpGRn7XplIeh9wI2JiBeWD6tRmxCZwsNkfKsOJUper0JfIDxp/QGS3Iceh6O3I
         8ieRRd0h+BsGaZVrtrd32VKXwOq8FLYQUb3htVgVuEFbKZb06AlYtYrCXDQBL4+lkS5L
         8REkmInu5qL5/Cw4jfyTqAdXJkeGzUd666CDQNNDJsF1/MYA8ABVYsxUCwcYNkMTtzzA
         QYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712955833; x=1713560633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSqmAxropEDfNCG6GQv7daH4xVtfVuXJw9jJz7os0WU=;
        b=Ad46jel7mGwrbc4QLN3aL4btmzFm0ZRw6+id7xoDn2PL+9G/G/XU0vF8/9KwHLtCoq
         GVPMyh+h7vxTTxtvJFSjTvLhSicEq07L55JbSSbsygpTyx9+hMR8N0uQhFh9HD4uzfdW
         QDEKvIz5QXYhu9d3rzQfCiO6uF91JgtTzI7YsqQYcKV5XJ4oMrLQjTxoSB1Xns45EmkI
         QrZGYOBCTWUKfyrPzEhC6T1H7UB4XMSzdqCTM+WJY+TQKfeTIuZQrObIJhl37/drRUhw
         BABWKO1AziIDYmdfb7N1X/HIUoaZXNOlQwT+CDPNOZTKfW24hhwzwP9aK02MCVYUj4+b
         Vb6g==
X-Forwarded-Encrypted: i=1; AJvYcCXxR4nbHgUs6zJFDqnmPrRZctYeu1wsmJZxXjjOYNmAIYPVIZIzAWJuw9+GVjgrw0a2HbhQ+wwq37615zuVjq5CmwPWnMCf6WGiTZRp7NOQ
X-Gm-Message-State: AOJu0YxxfilSxUfNnN4OPTWvjHHYQ0/KbwNB4gBnVL/Q9MYyIhvrjkee
	T5enAQymC+ISF2Nf8hRmSe5jz8v0th3rCmd/eZjQ02GnsFOLYGFO1KsoicRxO68=
X-Google-Smtp-Source: AGHT+IEOtfsrGOvmFZobDx+oZIyIEnB1hXJRroDDmgDp9zSXNOuvWX12AXzBQuPGec6sDnDDhBi5CQ==
X-Received: by 2002:a17:902:e5c6:b0:1e2:adce:9139 with SMTP id u6-20020a170902e5c600b001e2adce9139mr5386874plf.44.1712955833353;
        Fri, 12 Apr 2024 14:03:53 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id f18-20020a170902ce9200b001e511acfd0esm3424844plg.140.2024.04.12.14.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 14:03:52 -0700 (PDT)
Date: Fri, 12 Apr 2024 14:03:48 -0700
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
Message-ID: <ZhmhtLS5NuRrPOfu@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-8-4af9815ec746@rivosinc.com>
 <20240412-dwarf-shower-5a7300fcd283@wendy>
 <ZhlypvTdsFPZBr08@ghost>
 <20240412-drab-french-55d8ff2c8cfa@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412-drab-french-55d8ff2c8cfa@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_140355_445760_2D7D7945 
X-CRM114-Status: GOOD (  30.70  )
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

On Fri, Apr 12, 2024 at 09:40:03PM +0100, Conor Dooley wrote:
> On Fri, Apr 12, 2024 at 10:43:02AM -0700, Charlie Jenkins wrote:
> > On Fri, Apr 12, 2024 at 12:49:57PM +0100, Conor Dooley wrote:
> > > On Thu, Apr 11, 2024 at 09:11:14PM -0700, Charlie Jenkins wrote:
> > > > Create vendor variants of the existing extension helpers. If the
> > > > existing functions were instead modified to support vendor extensions, a
> > > > branch based on the ext value being greater than
> > > > RISCV_ISA_VENDOR_EXT_BASE would have to be introduced. This additional
> > > > branch would have an unnecessary performance impact.
> > > > 
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > 
> > > I've not looked at the "main" patch in the series that adds all of the
> > > probing and structures for representing this info yet beyond a cursory
> > > glance, but it feels like we're duplicating a bunch of infrastructure
> > > here before it is necessary. The IDs are all internal to Linux, so I'd
> > > rather we kept everything in the same structure until we have more than
> > > a handful of vendor extensions. With this patch (and the theadpmu stuff)
> > > we will have three vendor extensions which feels like a drop in the
> > > bucket compared to the standard ones.
> > 
> > It is not duplicating infrastructure. If we merge this into the existing
> > infrastructure, we would be littering if (ext > RISCV_ISA_VENDOR_EXT_BASE)
> > in __riscv_isa_extension_available. This is particularily important
> > exactly because we have so few vendor extensions currently so this check
> > would be irrelevant in the vast majority of cases.
> 
> That's only because of your implementation. The existing vendor extension
> works fine without this littering. That's another thing actually, you
> forgot to convert over the user we already have :)

Oh right, I will convert them over. The fundemental goal of this patch
is to allow a way for vendors to support their own extensions without
needing to populate riscv_isa_ext. This is to create separation between
vendors so they do not impact each other.

xlinuxenvcfg does not fit into this scheme however. This scheme assumes
that a hart cannot have multiple vendors which that extension breaks.
xlinuxenvcfg is really filling a hole in the standard isa that is
applicible to all vendors and does not appear in the device tree so it
is okay for that to live outside this scheme.

> 
> > It is also unecessary to push off the refactoring until we have some
> > "sufficient" amount of vendor extensions to deem changing the
> > infrastructure when I already have the patch available here. This does
> > not introduce any extra overhead to existing functions and will be able
> > to support vendors into the future.
> 
> Yeah, maybe that's true but this was my gut reaction before reading the
> other patch in detail (which I've still yet to do).

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
