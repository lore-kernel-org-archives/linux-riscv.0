Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F7AD637D9
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 02:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyyN5uj1wAJvlXVCoKTazPRNqg2NupyBtJVBZeqYl8s=; b=wJm2JVRGOdgAjd
	5fB7fy8nEbQQfM7cWSFnpk29qo7bl4vV6oFhSSIiWrsxsf1B5QQM+EbBd3JPqFj7v9+WXEre3BDAE
	BnELEm50To5zMSwOJyIXAqnvcyC8SnKws/XnxyU6sKXUPmv/O3R/Y6Ea2qroY6xNUiJJ7lkrYRSEA
	6WHmNJbyCoHGizrT8y+4R8R8e1Z4wDPG9Wbbqcbt3QSmARt+yOsnosgvGp8Se20YgkBODL51Kn2Xt
	A/7jUDCoe7E+/zBvpOa+GZ7dvhQ4L/q5Jf/FEmBV92w1EZ8Pi7UjX1IYzjH5r+m4yQ+Bp8nsHNDKD
	3tdaq9jEsrvKnA/qeu5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPqu-00000008aZf-1wpX;
	Thu, 14 Nov 2024 02:45:00 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPqr-00000008aZC-0ySG
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 02:44:58 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20c8b557f91so797565ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 18:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731552296; x=1732157096; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WdcMkjrb+r2dQccNRSrDbaweDAz3Ck5sldx466oumbU=;
        b=dn4lX7xraOjiYhNWm8rTlwZEpdk7uPkBYbu0pV1G7fNJJiIWWJr70ctHWvXDMhc1w+
         QpaqOj2Osjai4qUyH7xms42X96QYJ5U4+U1UktQt+BJHUnmZWm+/Bb0MZqUdeOFWMrhO
         kzjHsI67kCDuIozQeHfQIjJPqQv6CE9JM840nC983Qjt0ea4qsdmEZ13/gHDpC6r2iOu
         5y3E3yWWJqpsXMbe5pFwhSrWbgbtqpHUNYcMj9TcmJUCOosOYAYFKwQpPkVeqDrLYd9g
         P91CLLQkGc+kVGnlHemwvt0qS4OWNBQ5DtjdIinDeyo/L5YD6I18YanJp2oqzMSQk8+K
         7wJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731552296; x=1732157096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdcMkjrb+r2dQccNRSrDbaweDAz3Ck5sldx466oumbU=;
        b=J33ZLVW6MJ7GTqlFRs9xPBJfrITaFUqriWM0n9VqmAavGkoj9IsUDleLNegMtfdSUX
         Cuf9Rrip7KqjO4/m1PsEFW6V4sg67/0/Jgt2gFW6FpFZ2B8YHNWuZhKW0smUEw/xTCLS
         et1CYPY//aXRnr5K3qmHnz+oi2hxsLsCGpf8ZoIEkmz6HPQTUkOJmp9S1MF2jYQFERlO
         BOheEC/ji5KJmoBewgTVf6Pp3fPfajpm8e7MwnBhBeSnmqofdyoImoTexk4FeH7L4MWD
         HMnoeJi/6gPVJQCuRGmG2C1WGYIqTxAnN9bdmdbvPuV0n7MLcIG555U5SaeYXNw+0xCU
         os5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOqVG5kC3vvYq3/dbOLS884uwWcp+HsX8eHYPIQEEhn2NdkvboRQJmSpkE95qS1PQTqhvpFHeFWv4UGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDAzaiVBNvoEMGQ6fgnvLMbbzn5J6PACswWwuJ5QVi3wo41m/M
	L+7/Kg0M8beHXsPeQGycuF15qSIY7VnSU85yRaRqoGdFwesfx1lQnWyiQw8CXzI=
X-Google-Smtp-Source: AGHT+IH6Xs4lgFv1oaN0XsNLzEkI58lA2wWDcm8+Ghq4CJS+XaUEnnYNsa0MMfbyvikgvl0OdnFK+A==
X-Received: by 2002:a17:902:cf02:b0:20c:af07:a816 with SMTP id d9443c01a7336-21183d087c7mr317119425ad.31.1731552296485;
        Wed, 13 Nov 2024 18:44:56 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7d395acsm525455ad.271.2024.11.13.18.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 18:44:55 -0800 (PST)
Date: Wed, 13 Nov 2024 18:44:53 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Aoba K <nexp_0x17@outlook.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>, Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Samuel Holland <samuel@sholland.org>, Shuah Khan <shuah@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v10 00/14] riscv: Add support for xtheadvector
Message-ID: <ZzVkJd1lGy0TsjlW@ghost>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
 <CH0PR20MB393254369E401BF068005C7FCE752@CH0PR20MB3932.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH0PR20MB393254369E401BF068005C7FCE752@CH0PR20MB3932.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_184457_303000_CEB96769 
X-CRM114-Status: GOOD (  41.26  )
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

On Mon, Sep 30, 2024 at 12:07:23AM +0800, Aoba K wrote:
> 
> On 2024/9/12 13:55, Charlie Jenkins wrote:
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
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > 
> > [1] https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc
> > 
> > ---
> > This series is a continuation of a different series that was fragmented
> > into two other series in an attempt to get part of it merged in the 6.10
> > merge window. The split-off series did not get merged due to a NAK on
> > the series that added the generic riscv,vlenb devicetree entry. This
> > series has converted riscv,vlenb to thead,vlenb to remedy this issue.
> > 
> > The original series is titled "riscv: Support vendor extensions and
> > xtheadvector" [3].
> > 
> > The series titled "riscv: Extend cpufeature.c to detect vendor
> > extensions" is still under development and this series is based on that
> > series! [4]
> > 
> > I have tested this with an Allwinner Nezha board. I used SkiffOS [1] to
> > manage building the image, but upgraded the U-Boot version to Samuel
> > Holland's more up-to-date version [2] and changed out the device tree
> > used by U-Boot with the device trees that are present in upstream linux
> > and this series. Thank you Samuel for all of the work you did to make
> > this task possible.
> > 
> > [1] https://github.com/skiffos/SkiffOS/tree/master/configs/allwinner/nezha
> > [2] https://github.com/smaeul/u-boot/commit/2e89b706f5c956a70c989cd31665f1429e9a0b48
> > [3] https://lore.kernel.org/all/20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com/
> > [4] https://lore.kernel.org/lkml/20240719-support_vendor_extensions-v3-4-0af7587bbec0@rivosinc.com/T/
> > 
> > ---
> > Changes in v10:
> > - In DT probing disable vector with new function to clear vendor
> >    extension bits for xtheadvector
> > - Add ghostwrite mitigations for c9xx CPUs. This disables xtheadvector
> >    unless mitigations=off is set as a kernel boot arg
> > - Link to v9: https://lore.kernel.org/r/20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com
> > 
> > Changes in v9:
> > - Rebase onto palmer's for-next
> > - Fix sparse error in arch/riscv/kernel/vendor_extensions/thead.c
> > - Fix maybe-uninitialized warning in arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
> > - Wrap some long lines
> > - Link to v8: https://lore.kernel.org/r/20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com
> > 
> > Changes in v8:
> > - Rebase onto palmer's for-next
> > - Link to v7: https://lore.kernel.org/r/20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com
> > 
> > Changes in v7:
> > - Add defs for has_xtheadvector_no_alternatives() and has_xtheadvector()
> >    when vector disabled. (Palmer)
> > - Link to v6: https://lore.kernel.org/r/20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com
> > 
> > Changes in v6:
> > - Fix return type of is_vector_supported()/is_xthead_supported() to be bool
> > - Link to v5: https://lore.kernel.org/r/20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com
> > 
> > Changes in v5:
> > - Rebase on for-next
> > - Link to v4: https://lore.kernel.org/r/20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com
> > 
> > Changes in v4:
> > - Replace inline asm with C (Samuel)
> > - Rename VCSRs to CSRs (Samuel)
> > - Replace .insn directives with .4byte directives
> > - Link to v3: https://lore.kernel.org/r/20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com
> > 
> > Changes in v3:
> > - Add back Heiko's signed-off-by (Conor)
> > - Mark RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 as a bitmask
> > - Link to v2: https://lore.kernel.org/r/20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com
> > 
> > Changes in v2:
> > - Removed extraneous references to "riscv,vlenb" (Jess)
> > - Moved declaration of "thead,vlenb" into cpus.yaml and added
> >    restriction that it's only applicable to thead cores (Conor)
> > - Check CONFIG_RISCV_ISA_XTHEADVECTOR instead of CONFIG_RISCV_ISA_V for
> >    thead,vlenb (Jess)
> > - Fix naming of hwprobe variables (Evan)
> > - Link to v1: https://lore.kernel.org/r/20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com
> > 
> > ---
> > Charlie Jenkins (13):
> >        dt-bindings: riscv: Add xtheadvector ISA extension description
> >        dt-bindings: cpus: add a thead vlen register length property
> >        riscv: dts: allwinner: Add xtheadvector to the D1/D1s devicetree
> >        riscv: Add thead and xtheadvector as a vendor extension
> >        riscv: vector: Use vlenb from DT for thead
> >        riscv: csr: Add CSR encodings for CSR_VXRM/CSR_VXSAT
> >        riscv: Add xtheadvector instruction definitions
> >        riscv: vector: Support xtheadvector save/restore
> >        riscv: hwprobe: Add thead vendor extension probing
> >        riscv: hwprobe: Document thead vendor extensions and xtheadvector extension
> >        selftests: riscv: Fix vector tests
> >        selftests: riscv: Support xtheadvector in vector tests
> >        riscv: Add ghostwrite vulnerability
> > 
> > Heiko Stuebner (1):
> >        RISC-V: define the elements of the VCSR vector CSR
> > 
> >   Documentation/arch/riscv/hwprobe.rst               |  10 +
> >   Documentation/devicetree/bindings/riscv/cpus.yaml  |  19 ++
> >   .../devicetree/bindings/riscv/extensions.yaml      |  10 +
> >   arch/riscv/Kconfig.errata                          |  11 +
> >   arch/riscv/Kconfig.vendor                          |  26 ++
> >   arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi      |   3 +-
> >   arch/riscv/errata/thead/errata.c                   |  28 ++
> >   arch/riscv/include/asm/bugs.h                      |  22 ++
> >   arch/riscv/include/asm/cpufeature.h                |   2 +
> >   arch/riscv/include/asm/csr.h                       |  15 +
> >   arch/riscv/include/asm/errata_list.h               |   3 +-
> >   arch/riscv/include/asm/hwprobe.h                   |   3 +-
> >   arch/riscv/include/asm/switch_to.h                 |   2 +-
> >   arch/riscv/include/asm/vector.h                    | 225 +++++++++++----
> >   arch/riscv/include/asm/vendor_extensions/thead.h   |  48 ++++
> >   .../include/asm/vendor_extensions/thead_hwprobe.h  |  19 ++
> >   .../include/asm/vendor_extensions/vendor_hwprobe.h |  37 +++
> >   arch/riscv/include/uapi/asm/hwprobe.h              |   3 +-
> >   arch/riscv/include/uapi/asm/vendor/thead.h         |   3 +
> >   arch/riscv/kernel/Makefile                         |   2 +
> >   arch/riscv/kernel/bugs.c                           |  55 ++++
> >   arch/riscv/kernel/cpufeature.c                     |  58 +++-
> >   arch/riscv/kernel/kernel_mode_vector.c             |   8 +-
> >   arch/riscv/kernel/process.c                        |   4 +-
> >   arch/riscv/kernel/signal.c                         |   6 +-
> >   arch/riscv/kernel/sys_hwprobe.c                    |   5 +
> >   arch/riscv/kernel/vector.c                         |  24 +-
> >   arch/riscv/kernel/vendor_extensions.c              |  10 +
> >   arch/riscv/kernel/vendor_extensions/Makefile       |   2 +
> >   arch/riscv/kernel/vendor_extensions/thead.c        |  29 ++
> >   .../riscv/kernel/vendor_extensions/thead_hwprobe.c |  19 ++
> >   drivers/base/cpu.c                                 |   3 +
> >   include/linux/cpu.h                                |   1 +
> >   tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
> >   tools/testing/selftests/riscv/vector/Makefile      |  17 +-
> >   .../selftests/riscv/vector/v_exec_initval_nolibc.c |  94 +++++++
> >   tools/testing/selftests/riscv/vector/v_helpers.c   |  68 +++++
> >   tools/testing/selftests/riscv/vector/v_helpers.h   |   8 +
> >   tools/testing/selftests/riscv/vector/v_initval.c   |  22 ++
> >   .../selftests/riscv/vector/v_initval_nolibc.c      |  68 -----
> >   .../selftests/riscv/vector/vstate_exec_nolibc.c    |  20 +-
> >   .../testing/selftests/riscv/vector/vstate_prctl.c  | 305 +++++++++++++--------
> >   42 files changed, 1048 insertions(+), 272 deletions(-)
> > ---
> > base-commit: 0e3f3649d44bf1b388a7613ade14c29cbdedf075
> > change-id: 20240530-xtheadvector-833d3d17b423
> 
> 
> Hello Charlie,
> 
> 
> Apologize for the last email, when dealing with pastebin it deleted the last
> version...
> 
> tl,dr for the last email: Patches not boot on Sipeed Lichee RV Dock (with
> same D1 SoC).
> 
> Logs here:
> 
> https://fars.ee/XFzR
> 
> (the board resets without kernel panic)

Apologies, this thread slipped by me. This looks to be the same issue as was experienced here [1] and fixed here [2].

[1] https://lore.kernel.org/linux-riscv/ZoydV7vad5JWIcZb@ghost/
[2] https://lore.kernel.org/linux-riscv/20240820034850.3189912-1-apatel@ventanamicro.com/

Since you are on 6.11-rc2 that patch is probably not in your tree, as it
was merged in 6.11-rc4 unfortunately. Can you try updating your kernel
to include that patch?

- Charlie


> 
> 
> Cheers,
> 
> Aoba K

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
