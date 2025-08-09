Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1B6C87FCB
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Aug 2025 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiHpzqkIYpWL0ASK5ltqD8n9hGCF8FyCoMlxRxZmFc8=; b=388ol1PHC+bO1I
	UvvknIHjoUcMm0LoNRLXEjXn7GoWrUm86xUJ2Fd9HZ0u7Noj9Q0Ju+WTkmE5HyqPIW8Ae9yfipGuQ
	YeVEIncZDUQQ1W8DKB1DhlGgl/YPVCimw8SmdIbvelolSimHlrTVFZmFCyAjc+NNj112isp2RvIid
	92ZCkWpT5Pw+/7/Py3k+g+bFryA+FQoUMmBrWvPEVuVoXE2M0QyTy1jTgON+EKBGor557r9qX4DbD
	06R3W3/UZXc+nwnD0+8q9xcZsJ99dzSZw8kFotBnyMFy5p/RecQpkf20SW/nA69ZA96A5vZlEEi24
	whXokkc+JrE3/SgW+IDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukjXP-00000004VrU-2Cwq;
	Sat, 09 Aug 2025 13:23:07 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukjXM-00000004Vr8-1loM
	for linux-riscv@lists.infradead.org;
	Sat, 09 Aug 2025 13:23:05 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-7076b55460eso31279436d6.0
        for <linux-riscv@lists.infradead.org>; Sat, 09 Aug 2025 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bluespec-com.20230601.gappssmtp.com; s=20230601; t=1754745783; x=1755350583; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m1HWAIl/l6Jo/icoJcFI/eQvHLHYv3eOCzqgLsh2+qQ=;
        b=lGNgMFnGB7nKldQGQpMHd6YycR8HWOLSrU8jhRH/8RUHnXx0AleFkGd+tQi312RNov
         7aWDMDletBqBNn8KWOdgXPyMIgTXWSr+y7cFCZAms7cO+KieplJ3jCg2qZ+/EWMdqKyq
         u9k90kw5s16qHltpiVXmvRaOkZe1/0BEiDijWY/x7LTXtSIOaDgYBOmTZClJQJcvFu57
         pS/3Gwp73BzFhcmjdFkTBvvRkRKvEV8+45EinNzRzq1P3HZHe6A+83K4bkLZ8mkcE213
         0oApI1TkhxVxxLuAaYgN7FGkunx8J45OZBlV95bV4wwjuXDbSrABfEaj43OJyUVsHQOz
         8RQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754745783; x=1755350583;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m1HWAIl/l6Jo/icoJcFI/eQvHLHYv3eOCzqgLsh2+qQ=;
        b=h5TDUj97mhOIUS6rXbnYf9O9rBMmNqxePisoXmCD7BadEru+wX15yNHVxH2eMcHdSh
         8moCPAxRRqualpK+GIe5xMST0WD77v2NLKaBfxAPILSIJpmrIyl8oygN4OQfLq5Gfx9D
         tNBjjYWqcPg7qe2NvFDZWnJ3ZRpBivo98pGx8QB9lJobCfNUUMt/xA4Kce2llXQab9dH
         rVdQTa4mOoKjJwtjvMCQoZs3OmEDTzBVrOhZIyk5eg29vZHcQkYTqGaOqbFdcVv0m3bM
         Av5pvgW/Lz5EcXtbJCKNcPCzhISvsQpksQcP8Gk0HbB7wlnebZbn8k4w9KlJw3TLrYxA
         CNjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9AOeU2OQ7Emr9ucm1M6SGXutcyLioHaqG+cozyvH7fSHLvGa31bptseIdaJfJUWNvKCS6OCHTGi43ZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9wjo7tsHD/GjJuPMoT1SNtAdwFu6ZNY5TeAlySPRrLfXJ5yGL
	39gj0+Z29JuQRS3e54bTGs4x+G7r9+vq9PepvUyuHeRijzSfhcDbSnLzhyN0BTqD
X-Gm-Gg: ASbGncvDsi5yB16WQD6UgSMjTJ1NTWCg2i5Adeu37vJjUjCumI6FxD85aV7RakH0yDH
	Owy+m4BoaTiIp5WZ1jxx3wfKqxfCvXKkAI1XeRF4XZyUXycr+Lezm5ucRGGYRFRQbnV+poCi02L
	cB39efuMAkGtWIS3DfvB1asKDyYOsEy1Q1vlbMAF9Wh2Id+7enbK7U7eKMxWmrjNhBiFTqlEzn3
	d6yDrmdtIMTFFcOyNVDQ01ljPWOeDrulPbTi4QKDVFmkHyqbvpQmJ4OKsX7sb9FaOfVY/X+KuIH
	L7L3HBkvRNpvLU53lcyBpOcBcU9APDhzAfH0yaFaPVXqzR8nskMHKK95tsRZvAdjjWgvQsXFnyr
	T9hMoC1oc0amun5GXgsyLvO6VrweAo+g=
X-Google-Smtp-Source: AGHT+IHnkjLCl6BuRx0vZJ+XlCeUb46kGhdYSIkBrOOBdb1kcWB7KRzOq298Msvi9tw1zh6I7RJfNw==
X-Received: by 2002:a05:6214:1d0a:b0:701:77a:88b with SMTP id 6a1803df08f44-7099a30586fmr77763936d6.21.1754745782762;
        Sat, 09 Aug 2025 06:23:02 -0700 (PDT)
Received: from localhost.localdomain ([37.19.220.12])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7094e245309sm88739056d6.1.2025.08.09.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 06:23:02 -0700 (PDT)
Date: Sat, 9 Aug 2025 09:23:00 -0400
From: Darius Rad <darius@bluespec.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Drew Fustini <fustini@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
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
Message-ID: <aJdLtG8jcAxT8idC@localhost.localdomain>
Mail-Followup-To: Vivian Wang <wangruikang@iscas.ac.cn>,
	Drew Fustini <fustini@kernel.org>,
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
 <aJXvWuPKIc2lCSX3@localhost.localdomain>
 <e4d21516-23b5-404b-a7da-cf6ebfd02dbc@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e4d21516-23b5-404b-a7da-cf6ebfd02dbc@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_062304_703205_3AFCD16E 
X-CRM114-Status: GOOD (  26.80  )
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

On Sat, Aug 09, 2025 at 11:58:24AM +0800, Vivian Wang wrote:
> My previous comment on v1 on prefering clobbering with VS = Initial
> handling aside...
> 
> On 8/8/25 20:36, Darius Rad wrote:
> > On Wed, Aug 06, 2025 at 07:03:28AM -0700, Drew Fustini wrote:
> > [...]
> >> diff --git a/Documentation/arch/riscv/vector.rst b/Documentation/arch/riscv/vector.rst
> >> index 3987f5f76a9deb0824e53a72df4c3bf90ac2bee1..b702c00351617165a4d8897c7df68eadcd2d562e 100644
> >> --- a/Documentation/arch/riscv/vector.rst
> >> +++ b/Documentation/arch/riscv/vector.rst
> >> @@ -134,7 +134,25 @@ processes in form of sysctl knob:
> >>  3.  Vector Register State Across System Calls
> >>  ---------------------------------------------
> >>  
> >> -As indicated by version 1.0 of the V extension [1], vector registers are
> >> -clobbered by system calls.
> >> +Linux adopts the syscall ABI proposed by version 1.0 of the V extension [1],
> >> +where vector registers are clobbered by system calls. Specifically:
> >> +
> >> +    Executing a system call causes all caller-saved vector registers
> >> +    (v0-v31, vl, vtype) and vstart to become unspecied.
> >> +
> > Perhaps:
> >
> > Clobbering the vector registers may prevent leaking information to user
> 
> No... Not clobbering does not "leak" anything. If you find that it leaks
> information, please report - that's a bug.
> 

That's why I wrote "may".  If such a bug existed, either now or in the
future, clobbering here would limit the scope of it.  But this may not be
important enough to mention.

> > space and aid in debugging, but can significantly increase system call
> > latency for some implementations.  [...]
> >
> >> +However, clobbering the vector registers can significantly increase system call
> >> +latency for some implementations. To mitigate this performance impact, a sysctl
> >> +knob is provided that controls whether vector state is always discarded in the
> >> +syscall path:
> >> +
> >> +* /proc/sys/abi/riscv_v_vstate_discard
> >> +
> >> +    Valid values are:
> >> +
> >> +    * 0: Vector state is not always clobbered in all syscalls
> >> +    * 1: Mandatory clobbering of vector state in all syscalls
> >> +
> >> +    Reading this file returns the current discard behavior. The initial state is
> >> +    controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.
> >>  
> >>  1: https://github.com/riscv/riscv-v-spec/blob/master/calling-convention.adoc
> >> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >> index 36061f4732b7496a9c68a9a10f9959849dc2a95c..7bb8a8513135cbc105bd94d273012486a886f724 100644
> >> --- a/arch/riscv/Kconfig
> >> +++ b/arch/riscv/Kconfig
> >> @@ -656,6 +656,16 @@ config RISCV_ISA_V_DEFAULT_ENABLE
> >>  
> >>  	  If you don't know what to do here, say Y.
> >>  
> >> +config RISCV_ISA_V_VSTATE_DISCARD
> >> +	bool "Enable Vector state discard by default"
> >> +	depends on RISCV_ISA_V
> >> +	default n
> >> +	help
> > Perhaps add the following paragraph:
> >
> > Discarding vector state is more robust, but has negative performance
> > implications in certain implementations.
> 
> "Robust" is too vague... I don't think this word is helpful for anyone
> trying to understand what this does.
> 
> Vivian "dramforever" Wang
> 
> >
> >> +	  Say Y here if you want to always discard vector state in syscalls.
> >> +	  Otherwise, userspace has to enable it via the sysctl interface.
> >> +
> >> +	  If you don't know what to do here, say N.
> >> +
> >>  config RISCV_ISA_V_UCOPY_THRESHOLD
> >>  	int "Threshold size for vectorized user copies"
> >>  	depends on RISCV_ISA_V
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
