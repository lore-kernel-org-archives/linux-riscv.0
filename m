Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B76C52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 23:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9KCc2uT8TRvlkxOziOpqLRJwP3sIDDxHr9BTed6bsY=; b=x7N+UEmaoClXhe
	dzK17OvM+cO1CsPsHpYI1weUqmNqZ3dNgyew/5QrZbA3cT7npdvj/qbDjaZ5SzUnhasEyMKSLQ1AL
	VaPQwrB96lboZDOd6YP4W1TcQFO8P1tREMd/cDMIJ/nfMDG34/+o+grJQepXzY/54eofGf0YpgHVr
	9fJqC6nAbeg1RtWC2mxS8brt202xjzCv1WWcVP3oBPcXtcC2+xxawFgeN7zSs/+vQjJtMwnbMRvw1
	jX0xdeHSOaoz5Y7GGkArrZ5EWLLVJYY9GswyAtdiWqhAx6NHibEc8Hqu88sB4siAB0e5y8Z/ScXfN
	h6iPzrYL3HQJ4iT8/r5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgBS5-00000003BsF-0Dsm;
	Mon, 19 Aug 2024 23:06:17 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgBS1-00000003Brk-2YMJ
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 23:06:15 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1fc47abc040so37388735ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 16:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724108772; x=1724713572; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RAaL9iLsfBr3KmkxqVCqI8crZ4M3zG1jsxZQrqUkREk=;
        b=dxTd7uhrt32tM6tQayHz2XbA9Jv6Q1zC+MChdBBdmerzn5T2kWyK6DpFjCDxVgKAj8
         dGlORxbZ3+4trzvHVy+3pdaaJlX00tw8lUCWIxIrqFab3uvJmRb8/amd75AkllsjNV8L
         9RFy+p0/HlMFa8X4jIukdIzeh+yadCb+7bUbLCanYyz40BIhpr8sL5BlyiI9KBRtv+3p
         Ws3JsNolSXNSJFfxlieRvR4fOqNpbEag0ubMG79vESdIKHTJjPRNOUq3ZzzD7lJ9plVw
         JkunE6VxCaMc9HXwXbWbiko3+wZFamBRU7stXeYUw3QQi2dXta8gBzT3zWDThseKVW84
         WCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724108772; x=1724713572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAaL9iLsfBr3KmkxqVCqI8crZ4M3zG1jsxZQrqUkREk=;
        b=dgsY+v7TdamA+fVmUGiEweFWMsDU+zTbDo2YVd8I4jQ5z2WwDNUfwn9+lZ3eZpGsaC
         CVTairFum2BlkAaDqeaGBdehh1SmAO7W3YroNXVxcgw0nNGdD7kuHMz9+8jbbTcQmcoR
         C61I76Fe6C4FRDMxJOZBoweb9/EF6KxEeR98Cnn/BIzKRNApelwy4hmWjZ6WyNhygmPc
         wPWa2IOQaKp1MgndJgwv2POyIYyWKXJwSEVyi7LY/PDIP4+392IUOAVSaRqUeZz1/IDT
         o+gfJbraJDmDnSGecZDNR4pvc10S2fhGXuaWtjV42cXQTbLpYFfd/GDz77WySUwGQ2md
         9lLg==
X-Forwarded-Encrypted: i=1; AJvYcCU1UP97cqno0EDkpIwzpkoV8CuyfLXc8ZQ4AWaFGF8IScbKa6PR556kxh4rQYmHHTGG3RdAq1BIYGHd10nnjYX8he/Jb0F0ndtFu1bj99Tb
X-Gm-Message-State: AOJu0YxpQQq4zDmow4c3dBns5rpMU9r3MvcXzzAqTx+NlsRe8HnpksMW
	PCb/PG8pUAM7gZrTO+o9oVjNbQH2KJwWy68jJw1p3PAC8mqzDXF6gPwPPWtsO+g=
X-Google-Smtp-Source: AGHT+IHBfVyuiRiWWmeZGAb3eMUhDH5U34j0O0Tsptrx7dedS32uu6dqmeIX1/j/vghFFG3MWZ8Y4w==
X-Received: by 2002:a17:902:da84:b0:201:fac8:ff68 with SMTP id d9443c01a7336-2031517e5bcmr5848595ad.50.1724108772271;
        Mon, 19 Aug 2024 16:06:12 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f037592csm67028215ad.142.2024.08.19.16.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 16:06:11 -0700 (PDT)
Date: Mon, 19 Aug 2024 16:06:08 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v9 00/13] riscv: Add support for xtheadvector
Message-ID: <ZsPP4GMwPVBfq+fL@ghost>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
 <20240809-slapping-graph-461287bac506@spud>
 <ZrqsqsCtKwfG4Q5B@ghost>
 <20240813-strode-revival-07b8556a8bfe@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240813-strode-revival-07b8556a8bfe@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_160613_818858_7B12BA17 
X-CRM114-Status: GOOD (  30.41  )
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

On Tue, Aug 13, 2024 at 04:55:27PM +0100, Conor Dooley wrote:
> On Mon, Aug 12, 2024 at 05:45:30PM -0700, Charlie Jenkins wrote:
> > On Fri, Aug 09, 2024 at 11:31:15PM +0100, Conor Dooley wrote:
> > > On Tue, Aug 06, 2024 at 05:31:36PM -0700, Charlie Jenkins wrote:
> > > > xtheadvector is a custom extension that is based upon riscv vector
> > > > version 0.7.1 [1]. All of the vector routines have been modified to
> > > > support this alternative vector version based upon whether xtheadvector
> > > > was determined to be supported at boot.
> > > > 
> > > > vlenb is not supported on the existing xtheadvector hardware, so a
> > > > devicetree property thead,vlenb is added to provide the vlenb to Linux.
> > > > 
> > > > There is a new hwprobe key RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 that is
> > > > used to request which thead vendor extensions are supported on the
> > > > current platform. This allows future vendors to allocate hwprobe keys
> > > > for their vendor.
> > > > 
> > > > Support for xtheadvector is also added to the vector kselftests.
> > > 
> > > So uh, since noone seems to have brought it up, in the light of the issues
> > > with thead's vector implementation, (https://ghostwriteattack.com/) do we
> > > want to enable it at all?
> > 
> > I can make it clear in the kconfig that xtheadvector is succeptible to
> > this attack and that it should be enabled with caution. I think we
> > should let people that understand the risk to enable it.
> 
> I think the clearest way might be "depends on BROKEN"?

Sorry for the delay, I am not sure if BROKEN is the best way of doing
this. There is the generic CPU_MITIGATIONS config that I think we should
use to handle this at boot time. This would allow generic kernels to be
used on the platform, but a kernel config of "mitigations=off" would
allow xtheadvector to be enabled. I'll look into this a bit more and
send out a patch. Palmer merged a patch into for-next to enable
GENERIC_CPU_VULNERABILITIES for riscv so I will add ghostwrite there
as well.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
