Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46870C87FD3
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 12:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1tC+uoSbwrQPh/DLuZkITOQduw1u/dZOA/XewWEL0o=; b=O78ZZiJBf4i+PU
	pB/+Xc9ImnvYTOOxpLVyWPIIH/gZHRZeRrprs20IecSHop8+w6rodTpJIBuLE16C88f0/VpfLJufT
	svQhX4c/XrRJDhiza1nMcFN6t8umoY8FlW/NwxECiAZjWTbPTd4dCqel/pswYTup8wuBZCXW8jIgc
	yEe0XHLh4EFBSAB9NZEdvCPOhiHTsBAo+K90vbsbCOrIgTfCS+dchihTLQlclo2BmVOGnOxS4i5y0
	Ul3JIPGBDJNJPAlw2NNtm4i1wzEkSr+TIewAGbZTUTz51FI0S/b9INr66a+aDDjiojDg+c5kVokYE
	9j8w3JpKggBaTBFudW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMQN-00000002pb3-2ApV;
	Fri, 08 Aug 2025 12:42:19 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukML0-00000002oxc-11T9
	for linux-riscv@lists.infradead.org;
	Fri, 08 Aug 2025 12:36:47 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7e809baeef7so240802585a.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Aug 2025 05:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bluespec-com.20230601.gappssmtp.com; s=20230601; t=1754656604; x=1755261404; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=So5R9ZlnKJJ4obt5mEmMc4Ho0dKfaA3unsl38Yws8b8=;
        b=g6/1rDQaAt7RRgW5hFO/K0Xp86UdAxRmv7ecLXv8qVY0ocpuoAKXZjsR1gSeBx4EIw
         0pzCJtWPiA1D117Pk9MtXKeS4VhZvTwxiV3Cu41Oj42nX/VxUZlYONyN1SneVTZVBfSF
         ZeMM5HyB1pqX1ZNsbB3eEL0waTDaMQgQ6Cxw1QuT3Y/oi4xQiTc7V4tFEZ9nsam65nMc
         CslQme6yZoTbO/rU7621cIc18cKC3Dw9EsF9SnwHcFu3cv+Dr11+LyNCkeYIRX2mcxct
         DFys1uYFULUoriJh7FPWcnoxoeg/QVDoFpAxJqkTdgMKH0VgDzkAaqjOOUN1sWKCBrYU
         6Lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754656604; x=1755261404;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=So5R9ZlnKJJ4obt5mEmMc4Ho0dKfaA3unsl38Yws8b8=;
        b=iCCEguNBe6Q+nRup0U9SB8vwhT3huTZQj30+4K5Puc7/S/k7diyb6M1S1eRovs6fti
         DejYD/jhnVRtxnJAGmOaXWmrsF+R/3Qm8GAdXn+2sVRklGuEPxdVcJksY+d5B26wrI4y
         ywnhaJYy4pX8BU4YPC4ib/u/a4aokM74vqJkWT1ZVKaWEfZvUr5leLNAhLSf5D0lY7HA
         40S4vNEqrnvItVmPH7uFWAL4kqZXmqNhZi7fdYR5ahBp1Hw4sKCqFRS36Z7fFd8IJgi0
         kCWNiSszI9Dkg6CRFQGPOIVWLjxykl6D4Vidf9SQ7JsK7HIW44W3kF11selL/uObtkvc
         M9rg==
X-Forwarded-Encrypted: i=1; AJvYcCVmReswJx3sOGEzxHkzdntzEtDBqBluCdu7mG+n4aqlFOqACFSc+XvbU0Wt9sgqqxb+iNZXnUl9vtJlxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxerTyEz/TrYwCagxiuSHZ6GjDwNK/kVYkcty3X/F3Fx2J2Q641
	JotpATURRte6iaugkQLvQe7p9xFagJH4RqgHWxt4z2hVWfULxIcXl6TySSz/uSd6
X-Gm-Gg: ASbGncvN9FkwnchaaU5Z0w8zewqSj9BBeuSQyP6XrrK+1alN4YlY59oMvIO8X9YoPz/
	kadTx9JgPoLmOkeXdOA370xAPF6kDzp6xbsfkdZSIe5RyiJoXdGdqEaTSjlzY/3gXGmYOaN2b3r
	sqgnjErbj5/+I23OqWrRwYu73PGoqhqjsH7JUvJqJKv4+Yo/y1b4HLBGMOMLyhu+SFcaGXL4jmK
	KLkK8RtOz6edJuNAiUu2u0J1dwQKT40v65V4bNZUpikFC9YUYjeLyegIVYWepYxWkvMTkb9sTcS
	vYEc1kJVcztOhbeAEahvuXhrbJuCznbN+P4YsnZFXqmxwvGSJUYMnyB5OiZG+xIpnVNH2OBX1Wr
	oxGIUXeTjBUE7lMwC8XJbTQ0ilxuJUSM3APpSmH09AQ==
X-Google-Smtp-Source: AGHT+IH2lbmFHZqNHJVGHjy4ogO2VYhO6V47Bv3oIaip42J0xoV/NzCukHATaOzfImBWGhmprpzXeQ==
X-Received: by 2002:a05:620a:2910:b0:7e6:67b3:ebf2 with SMTP id af79cd13be357-7e82c68965dmr374630785a.27.1754656604365;
        Fri, 08 Aug 2025 05:36:44 -0700 (PDT)
Received: from localhost.localdomain ([37.19.220.61])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f72b045sm1102877685a.60.2025.08.08.05.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 05:36:43 -0700 (PDT)
Date: Fri, 8 Aug 2025 08:36:42 -0400
From: Darius Rad <darius@bluespec.com>
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH v2] riscv: Add sysctl to control discard of vstate during
 syscall
Message-ID: <aJXvWuPKIc2lCSX3@localhost.localdomain>
Mail-Followup-To: Drew Fustini <fustini@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@tenstorrent.com>
References: <20250806-riscv_v_vstate_discard-v2-1-6bfd61b2c23b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250806-riscv_v_vstate_discard-v2-1-6bfd61b2c23b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_053646_373270_AF501D40 
X-CRM114-Status: GOOD (  19.61  )
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

On Wed, Aug 06, 2025 at 07:03:28AM -0700, Drew Fustini wrote:
[...]
> 
> diff --git a/Documentation/arch/riscv/vector.rst b/Documentation/arch/riscv/vector.rst
> index 3987f5f76a9deb0824e53a72df4c3bf90ac2bee1..b702c00351617165a4d8897c7df68eadcd2d562e 100644
> --- a/Documentation/arch/riscv/vector.rst
> +++ b/Documentation/arch/riscv/vector.rst
> @@ -134,7 +134,25 @@ processes in form of sysctl knob:
>  3.  Vector Register State Across System Calls
>  ---------------------------------------------
>  
> -As indicated by version 1.0 of the V extension [1], vector registers are
> -clobbered by system calls.
> +Linux adopts the syscall ABI proposed by version 1.0 of the V extension [1],
> +where vector registers are clobbered by system calls. Specifically:
> +
> +    Executing a system call causes all caller-saved vector registers
> +    (v0-v31, vl, vtype) and vstart to become unspecied.
> +

Perhaps:

Clobbering the vector registers may prevent leaking information to user
space and aid in debugging, but can significantly increase system call
latency for some implementations.  [...]

> +However, clobbering the vector registers can significantly increase system call
> +latency for some implementations. To mitigate this performance impact, a sysctl
> +knob is provided that controls whether vector state is always discarded in the
> +syscall path:
> +
> +* /proc/sys/abi/riscv_v_vstate_discard
> +
> +    Valid values are:
> +
> +    * 0: Vector state is not always clobbered in all syscalls
> +    * 1: Mandatory clobbering of vector state in all syscalls
> +
> +    Reading this file returns the current discard behavior. The initial state is
> +    controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.
>  
>  1: https://github.com/riscv/riscv-v-spec/blob/master/calling-convention.adoc
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 36061f4732b7496a9c68a9a10f9959849dc2a95c..7bb8a8513135cbc105bd94d273012486a886f724 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -656,6 +656,16 @@ config RISCV_ISA_V_DEFAULT_ENABLE
>  
>  	  If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_V_VSTATE_DISCARD
> +	bool "Enable Vector state discard by default"
> +	depends on RISCV_ISA_V
> +	default n
> +	help

Perhaps add the following paragraph:

Discarding vector state is more robust, but has negative performance
implications in certain implementations.


> +	  Say Y here if you want to always discard vector state in syscalls.
> +	  Otherwise, userspace has to enable it via the sysctl interface.
> +
> +	  If you don't know what to do here, say N.
> +
>  config RISCV_ISA_V_UCOPY_THRESHOLD
>  	int "Threshold size for vectorized user copies"
>  	depends on RISCV_ISA_V

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
