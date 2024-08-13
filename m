Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB40C3DA7F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 00:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmt5vs56pMzdWEHYJawd5HK37SVY0KpeACe1Wsj1zQQ=; b=293K40cjMJzRUa
	nAXmwIb+Sit6Wl+H9EmPZayV/5OmBHXpB5tDgYCwM4ganvFWNwkT0kzUtkfCOU8PvK2J244AyKS5v
	ZY7UBZFwirZUgCctw2fiB/QKTuO90GY3bgybx5/pI7VfYUV8pa28rVLlor/QygTZFwpWRwEQyo7Jx
	fph8bVMBAweerytESD+ce3CImw8FKuTzZ1BYUIp4nb/MwDf9d3X6h9r5nb56Be4wS466ZTbweUacA
	QS7wBmKpjzsjXCoC4pFto6jNj4Ox3KJ0HXwmn4TEs1FhLsXGrAbjmfG3ZTXZDd4CE7q4EQUdko6Ds
	kesspiYeFw6uWCKihS8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdffP-00000001w0z-1eC0;
	Tue, 13 Aug 2024 00:45:39 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdffL-00000001w09-3pV0
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 00:45:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1fc4fcbb131so37404975ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Aug 2024 17:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723509934; x=1724114734; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Beo73jI8KH5p03NxQPXLaupS8Ut84TtJmPr0+Y+H6g=;
        b=E7uANOSzQIHBiA4xM/U7GzHxoUkHHrYf74Qd/IH/fUuxL8j0l9tRB2Pj0gq5CKny2O
         EjenQnVXmRbTpG+eaQ9QH9lFUosuy2RFDmLpp5purUp+MxgkFIBH9MS8HwT4plK8T96u
         /AeGCXNYRZO8Rb6/GzveBPejNtB0C8apWqnIh6ZNeLB1Hp9caHg+Xvmss7VjwptJYXw2
         Ev8eFhTS0bUnIRY5EoeJ+U9H5f7DkTsFAf/vLQDhzV+c0OArgCp94rLEInapca4hE6zE
         AzMffMLIrn6JDqQqfqXeBgEIS3QF21uYmgoVPdS0Z9uWWs/L5xdBcIxNZErGuPVgbvIt
         ndhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723509934; x=1724114734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Beo73jI8KH5p03NxQPXLaupS8Ut84TtJmPr0+Y+H6g=;
        b=BXOwgFZ7ed8fZB1elf01qfvJHMC3Gli14W3r6/FMWvPcqMhpgZ3I/EaaRwFDN71xuM
         DVzje5oK/7mu+UnqrtYynnSSwNSGDNzSXVmzZLHjCos1TZ+ATKOhmDGUIstHV3Ygqvz1
         5x3YDW434lWVTNC+a7Br+SRUzwLqotBHek66PpOcNlL3tm7774IgNwOWOX2K1hKWKbkI
         cJlGFFafuFArJURaX/xTs829ZdBjFIOQUIf3U/Iy7zxI3labMyFjhuOj3zNo9120wBRf
         tZ/AxicarR//aIkDBOUq6knNqrEvUhtjyAH4wP3f+KP1/bQ7dJHv0p/75JrWk9iraRQa
         hAAg==
X-Forwarded-Encrypted: i=1; AJvYcCVn/WtCswcbGhvv4LlRrlblSbIXfspzsYy5Qjg8sS3IfFLrHRZBe5nZsajtB5NZhL6/OVZgUwu0J8qN0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJtK8ur2B4RjA0O0xnO4QqavmMb39WgwBA4fM32OI55LNug3N1
	FxFeVVtrzXa4zCZlsXSvdKUGevJIoamd42z4knFvuZRIq9Jq1vUusZrywpmU4J8=
X-Google-Smtp-Source: AGHT+IHdEc1RzSfknb4O0tEELFITV1/FMiLC99gVJNOSQQB/c+hZmMPVy98DA8PMYeZcE4ZXSNQJNQ==
X-Received: by 2002:a17:902:e80b:b0:1fb:57e7:5bb4 with SMTP id d9443c01a7336-201ca1831c4mr26201755ad.37.1723509934094;
        Mon, 12 Aug 2024 17:45:34 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:239c:9f30:d4d6:f989])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1c86ddsm2537295ad.263.2024.08.12.17.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 17:45:33 -0700 (PDT)
Date: Mon, 12 Aug 2024 17:45:30 -0700
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
Message-ID: <ZrqsqsCtKwfG4Q5B@ghost>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
 <20240809-slapping-graph-461287bac506@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240809-slapping-graph-461287bac506@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_174536_233362_D4901A33 
X-CRM114-Status: GOOD (  19.93  )
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

On Fri, Aug 09, 2024 at 11:31:15PM +0100, Conor Dooley wrote:
> On Tue, Aug 06, 2024 at 05:31:36PM -0700, Charlie Jenkins wrote:
> > xtheadvector is a custom extension that is based upon riscv vector
> > version 0.7.1 [1]. All of the vector routines have been modified to
> > support this alternative vector version based upon whether xtheadvector
> > was determined to be supported at boot.
> > 
> > vlenb is not supported on the existing xtheadvector hardware, so a
> > devicetree property thead,vlenb is added to provide the vlenb to Linux.
> > 
> > There is a new hwprobe key RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 that is
> > used to request which thead vendor extensions are supported on the
> > current platform. This allows future vendors to allocate hwprobe keys
> > for their vendor.
> > 
> > Support for xtheadvector is also added to the vector kselftests.
> 
> So uh, since noone seems to have brought it up, in the light of the issues
> with thead's vector implementation, (https://ghostwriteattack.com/) do we
> want to enable it at all?

I can make it clear in the kconfig that xtheadvector is succeptible to
this attack and that it should be enabled with caution. I think we
should let people that understand the risk to enable it.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
