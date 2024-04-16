Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9308CC04FF6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 20:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77OSUYve4MvJGZ8rkMoVDTAPh9vQu1FfbOTxFEISbJA=; b=vq/cFlZvm4+f3g
	gMdAg7ccTEWA74h/EXHRLLRM6U2ldSqVjiVbqobNH+YcbwBevn4tWcVtR7fAHbbutJGkDcVYGYPQV
	Dl9aNP1EMxZPkKBn7KT49k9IqywUiMJ20pcFMGE8NBHTf4jxB1SHP20VI/4UsU1c7AtCRjhJI9ADr
	aHQoqm1hMROOaOXNTtgejRRkqXBfhZiyrAzyKcFQrR+hfX34twwGwuWydNUo8uvRgt+SSbHNiOqYd
	SUhtuQ5UNVh69TtIbkYz1UnZ9G0pTiauZtbCLfzcSHmf6Vd28go8RpfoaOfSlFCykfuEAcTu2WVwH
	PO/jJPZ4B4CeltuQEC+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwpaj-0000000DkKt-0SGx;
	Tue, 16 Apr 2024 20:39:45 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwpac-0000000DkIx-2NNY
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 20:39:43 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e4c4fb6af3so1181055ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 13:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713299977; x=1713904777; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BMsxIpE4Z9nqdYgum8o4M/KssYPkdpnJdREANM4LfZ4=;
        b=2FW3BlFi7sB4qqNSRpDWimD4h0DIfdf2p4MdzTTKoRjLj2QO8rdXUlNMo92jdurYV1
         byQR3B8y32f9bsNziu8xFlsqzUcQ8e2nKEVAPBwKGPHMuJR571PLDfqEzG+f6mW2+Z1L
         jYb9NA/VvcjzUr9cVKyMFe3P/9Kh9oThb3W1f2dFhvNqIxAXA7hN79SpdHuppdnZrrWi
         KdxxZq0yX75qxpCkf5i2SRO93O72Gx4atSDjQdNaU0zwxdEpt7KToBlyg6NnFd6KE9Aj
         eP1oNaKoHBGl4CzUFhrZn20SJSaF+02CnZwbceN8NqWcqPrwF+pHSAEFEnnc/xMOSHlu
         6l1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713299977; x=1713904777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMsxIpE4Z9nqdYgum8o4M/KssYPkdpnJdREANM4LfZ4=;
        b=GnZ1BAAtSCbXZFNmDTrVDIwCLJy4JNwhDwO/dizLiLPkeChG0YXrHWPr3Yair4h7V+
         nUbW+ntJi3IFBNSmqz1Jk2se74lCA14GBsVYY7zb7RtKilhJEJCTEOHtNh60BApiclzD
         b2LUUpbcTVO3r3SZ2qqqrhz8qYGtE1DEwqx2j1st57dOVJTRxp1ZbIyOoC+YHL7BdK9u
         HTbI1PB6Hee/R7krKFoOHLcP7TirhnVbqEg+Z0KxHdf94X1brViZQFDnr0RvYHTFhPYj
         uNd8nkNoIAWk5VrQficzxN1uCabXnfQzexUUfkStcyr8ikxmqpqk0OzTQSwsC9hrWQtk
         sV4g==
X-Forwarded-Encrypted: i=1; AJvYcCWcDzfWhOJuNp87TnQIinCaOLFiXh9KEko3EAPacB/3OrC4+cmWbh39wl5XZnihrVUZ7CWH1M1elTBU9UgEMlcUYF0DY18mJ0g5+dd2tcoe
X-Gm-Message-State: AOJu0YzQ4fDCtBL+JDe2JN8i491iUVQh+8e50RHl35hIM1oQwL0HtsUc
	7IaXwyxMEiySWPowq5Mp2oqfcWfjbUjTFilGkVqqZWIc+y3cP4mTq2bqlOrGIYw=
X-Google-Smtp-Source: AGHT+IH1gf91D0Jx8EX2o/Z8Zgr/8lKTTJMrgChMy1jkDn9GpdgrT/0VA+/pYw0KTlvpLVreUrkRWg==
X-Received: by 2002:a17:902:e811:b0:1e4:6cd7:30b3 with SMTP id u17-20020a170902e81100b001e46cd730b3mr4087832plg.23.1713299976719;
        Tue, 16 Apr 2024 13:39:36 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a1709026e1600b001e2ba8605dfsm8797603plk.150.2024.04.16.13.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 13:39:36 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:39:33 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 04/17] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Message-ID: <Zh7iBRUybq1BAReT@ghost>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
 <20240415-dev-charlie-support_thead_vector_6_9-v2-4-c7d68c603268@rivosinc.com>
 <20240416-scorer-easeful-4dae3c18465d@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240416-scorer-easeful-4dae3c18465d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_133938_767648_D6D6E2D7 
X-CRM114-Status: GOOD (  20.74  )
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

On Tue, Apr 16, 2024 at 04:28:19PM +0100, Conor Dooley wrote:
> On Mon, Apr 15, 2024 at 09:12:01PM -0700, Charlie Jenkins wrote:
> > The D1/D1s SoCs support xtheadvector which should be included in the
> > devicetree. Also include vendorid for the cpu.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > index 64c3c2e6cbe0..4788bb50afa2 100644
> > --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > @@ -27,7 +27,8 @@ cpu0: cpu@0 {
> >  			riscv,isa = "rv64imafdc";
> >  			riscv,isa-base = "rv64i";
> >  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> > -					       "zifencei", "zihpm";
> > +					       "zifencei", "zihpm", "xtheadvector";
> 
> 
> > +			riscv,vendorid = <0x00000000 0x0000005b7>;
> 
> Isn't this effectively useless given there's only one CPU here?
> We also already know the vendor of the hart, because the compatible says
> it is a "thead,c906" so this doesn't provide any new information.

Yes, it was simply to provide an example of using this field to make it
easier for somebody who wants to use it in the future. I can remove it
if it's confusing.

- Charlie

> 
> >  			#cooling-cells = <2>;
> >  
> >  			cpu0_intc: interrupt-controller {
> > 
> > -- 
> > 2.44.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
