Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1765FC27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 21:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58xCSfsRywwITeBkhGnDOATPq7c/fOJUf7RXrPALrrI=; b=qmLSfDO920l6kFLu9a7HmXuHS9
	g4LoWiyRsC2ETQpsYpVHA9HTVhBg3CVUm0nMLFS0znwieDj38KwJ06phDTACoHvb004PRmMidOGas
	lGzTlBdi7x0hm5b+SN7YKwdLM/Jsxg5/xQbM0gaCM2wOKDgCBFxJ47VL2kRS6RMTX+QfnKbR9G4y0
	q1o0e2ZOZqZBiDVLVn9AIZUIcWfmkxj2O45VuD77EW2iOydlFWD1fSQoMIh97N10XOv7C7qggDsSw
	3v1pI5kLKM7Oz7VRl8rMr/oyrkGiu+tEshdWtyXAr1dYfLBmjhq9BaZWgYqv2R8TGHG2tgLFsGhon
	ogBdlqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFhLL-0000000FlSz-1R67;
	Fri, 07 Jun 2024 21:41:51 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFhLI-0000000FlSJ-0XrB
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 21:41:49 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7041e39a5beso501976b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jun 2024 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717796507; x=1718401307; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kVMBxgOZvhcZ4lZh/IEF1Kc1tCSw0EaERqV8JO3osOo=;
        b=hxac8QWmnItue/1a/Cwyea53BZFmQC0l3Yv227vmDrnqRuTBOzI/oXNzufD2lUTLl9
         TjSc0WoNv6TwIBOjQFOp7PDHq1ESdYp64vhJV70PRZMlRqiSz5Xsusuhf3gkp6FxHWpW
         tUTSxsZeDEaeA10Rc/4pcbNe3N7c0NQ9FupZ65Hlyr8dLnuLbUFmDnXWOTP85RM9mBGU
         sXRbkeymzHzoKjjuC4tivJSvjnLt0GthaDiwOBAePDR/Fzx/uZ4Fig4hlCRG080y88rk
         CsMg9tdW3HRi/BkVraXdy6YE3imLW9cdTLFR/HPeEMgr6id5zdtD73opaDswFZ367wDT
         amtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717796507; x=1718401307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVMBxgOZvhcZ4lZh/IEF1Kc1tCSw0EaERqV8JO3osOo=;
        b=q3TfFHmAmnJHU5UJ7HOPeS2rRqdqGfo8UC62A5Zhax1goRbnkTkEEo80bT6kb5JHKm
         rg2dBl+5fnhcMbCP7/WHMrMYOj5sKrSgKaa6EIMTmM6blpPebmyOPJBgzYlBLld2qZDu
         i4tIR1MWsJMpTc6nZ3BuTXEH5PgQjN+tvt42PoZqiMC26k4WU3FSox6efKEY91a2AHPG
         0opvUtwf5c8Qw19s714tsrTtqXodY9ezEBgjx9azTX8RvYogsNa7bMqxck6L7jAUgxRM
         yHnDKQqUm1OKNyMK0+smCmiGTi5mQ9eutj0wm4PMXDL5km3lC+aQelFxTO6GzCZW683e
         iOBA==
X-Forwarded-Encrypted: i=1; AJvYcCUy3AFU5cp7MhbyhkVahD/xKyqDp1HNL4Qo/B5BDVmEkDPx1Yg9WsHs6R3LFtY6AfUTANWeoyInn7RbjX6APy74pYUC+tSngjhkR7X+eWzR
X-Gm-Message-State: AOJu0YxI+E0JDY8ajGgcTVLw2P8s015aKMMIki+Br31PnUZ2qjqyGIvV
	DLPFaPP+xuentobP98p8YqSEw3OTcJ6uBgS6jyhJlghqwMVgj7YukdRoCrJm0SA=
X-Google-Smtp-Source: AGHT+IEON1DUv8NlmIa4hw9K9kVfTrFWzqHWzvt9nCJEWjhynBx9I0jhBPbJAq1+9gf/doFtH0t1RQ==
X-Received: by 2002:a05:6a20:6a07:b0:1af:6911:7ff4 with SMTP id adf61e73a8af0-1b2f96b3617mr4004313637.7.1717796506812;
        Fri, 07 Jun 2024 14:41:46 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd3b2e71sm3087103b3a.90.2024.06.07.14.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 14:41:46 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:41:44 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: Enable cbo.zero only when all harts support
 Zicboz
Message-ID: <ZmN+mKC3Mr213rvU@debug.ba.rivosinc.com>
References: <20240605205658.184399-1-samuel.holland@sifive.com>
 <20240605205658.184399-2-samuel.holland@sifive.com>
 <ZmNu9AkHOTGj9uvw@debug.ba.rivosinc.com>
 <20240607-unwound-ethics-b6bf97cddc3e@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607-unwound-ethics-b6bf97cddc3e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_144148_195086_CCCA8FA9 
X-CRM114-Status: GOOD (  41.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jun 07, 2024 at 09:39:50PM +0100, Conor Dooley wrote:
>On Fri, Jun 07, 2024 at 01:35:00PM -0700, Deepak Gupta wrote:
>> On Wed, Jun 05, 2024 at 01:56:45PM -0700, Samuel Holland wrote:
>> > Currently, we enable cbo.zero for usermode on each hart that supports
>> > the Zicboz extension. This means that the [ms]envcfg CSR value may
>> > differ between harts. Other features, such as pointer masking and CFI,
>> > require setting [ms]envcfg bits on a per-thread basis. The combination
>> > of these two adds quite some complexity and overhead to context
>> > switching, as we would need to maintain two separate masks for the
>> > per-hart and per-thread bits. Andrew Jones, who originally added Zicboz
>> > support, writes[1][2]:
>> >
>> >  I've approached Zicboz the same way I would approach all
>> >  extensions, which is to be per-hart. I'm not currently aware of
>> >  a platform that is / will be composed of harts where some have
>> >  Zicboz and others don't, but there's nothing stopping a platform
>> >  like that from being built.
>> >
>> >  So, how about we add code that confirms Zicboz is on all harts.
>> >  If any hart does not have it, then we complain loudly and disable
>> >  it on all the other harts. If it was just a hardware description
>> >  bug, then it'll get fixed. If there's actually a platform which
>> >  doesn't have Zicboz on all harts, then, when the issue is reported,
>> >  we can decide to not support it, support it with defconfig, or
>> >  support it under a Kconfig guard which must be enabled by the user.
>> >
>> > Let's follow his suggested solution and require the extension to be
>> > available on all harts, so the envcfg CSR value does not need to change
>> > when a thread migrates between harts. Since we are doing this for all
>> > extensions with fields in envcfg, the CSR itself only needs to be saved/
>> > restored when it is present on all harts.
>> >
>> > This should not be a regression as no known hardware has asymmetric
>> > Zicboz support, but if anyone reports seeing the warning, we will
>> > re-evaluate our solution.
>> >
>> > Link: https://lore.kernel.org/linux-riscv/20240322-168f191eeb8479b2ea169a5e@orel/ [1]
>> > Link: https://lore.kernel.org/linux-riscv/20240323-28943722feb57a41fb0ff488@orel/ [2]
>> > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> > ---
>> >
>> > arch/riscv/kernel/cpufeature.c | 7 ++++++-
>> > arch/riscv/kernel/suspend.c    | 4 ++--
>> > 2 files changed, 8 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> > index 5ef48cb20ee1..2879e26dbcd8 100644
>> > --- a/arch/riscv/kernel/cpufeature.c
>> > +++ b/arch/riscv/kernel/cpufeature.c
>> > @@ -27,6 +27,8 @@
>> >
>> > #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
>> >
>> > +static bool any_cpu_has_zicboz;
>> > +
>> > unsigned long elf_hwcap __read_mostly;
>> >
>> > /* Host ISA bitmap */
>> > @@ -92,6 +94,7 @@ static bool riscv_isa_extension_check(int id)
>> > 			pr_err("Zicboz disabled as cboz-block-size present, but is not a power-of-2\n");
>> > 			return false;
>> > 		}
>> > +		any_cpu_has_zicboz = true;
>> > 		return true;
>> > 	case RISCV_ISA_EXT_INVALID:
>> > 		return false;
>> > @@ -724,8 +727,10 @@ unsigned long riscv_get_elf_hwcap(void)
>> >
>> > void riscv_user_isa_enable(void)
>> > {
>> > -	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
>> > +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
>> > 		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
>> > +	else if (any_cpu_has_zicboz)
>> > +		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
>>
>> `riscv_has_extension_unlikely` will check bitmap `riscv_isa[0]` which I think gets populated
>> by boot cpu (correct me if I am wrong here). So as long boot processor has the extension, it'll
>> try to set it on CPU which doesn't have it.
>>
>> How about doing this
>>
>> `riscv_fill_hwcap_from_isa_string` checks and enables bitmap for all CPUs.
>> So make a check there and if any of the CPU dont have `Zicboz`, then set a global bool
>> `zicboz_cpu_not_homogenous`.
>
>That is what riscv_fill_hwcap.*() already does, we track both what each
>cpu has and what is common across all cpus.
>riscv_has_extension_[un]likely() is a test for whether all cpus have the
>extension.
>

Thanks for clarifying that.

Samuel,

Ignore my comment then.
This patch lgtm.

>> Now in `riscv_user_isa_enable`, check following
>>
>> If `zicboz_cpu_not_homogenous` is set, then you already detected that some of the CPUs don't
>> have support for `Zicboz` and thus you wouldn't set for CPU which even has the support and
>> print a warning message.
>>
>> If `zicboz_cpu_not_homogenous` is clear, then that means all CPUs support the feature.
>> You simply enable it on hart.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
