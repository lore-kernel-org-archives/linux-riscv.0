Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8AAC07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 09:48:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0D760725
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 09:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A0D760725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=X2BkqCx3Od9yKXzF+Gc2anOJ2CpvBWwOQwPQtz3s6Qw=; b=de5AHQSoLCarheoE1b/dIDH/Z2
	tF40aRbWN80YO/Y/RPczQM5JDG0H73HXYCAooMgOP/OPXw9OrdJCTvOHSbvJGIytUdNE/rGCarnrJ
	7GGVNNqaNbRkN7MC7tKOkcviJOqXK6kOJf/bJ9RWx3hAFUdHGtfkRN9Ufqi+CwXgcKrOMjw+2NQ1N
	FlzaA7z4b50lfPR3slsDy0KX7Sc2SjjQYq74Ssc+etkyDAhea5LYTS1isoSiEgIW24LNoKDxpBJdf
	FiIPfPoq5yHzPMXP4Dz79UgoPi141BlIyo1bj6tg52VaiwXqDWv+344s8EHlJIY1CfUTVr/EAuDQC
	iBFlj6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5mMA-00CQi8-Am; Tue, 20 Jul 2021 09:48:06 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5mM6-00CQhi-Sw
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 09:48:04 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 o3-20020a17090a6783b0290173ce472b8aso1576324pjj.2
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=9lZklnFLXGHgC8ad/UoOH3TanlFmLXF5QTGl3NJHfR8=;
 b=M+Y6HvmhLG09i/OY678Fa1VWRNuwfHWf90PXy0m1ci+jvEnPIFPz/GkLVQM3IiV76s
 7cDxv5j3Q6bbkSh/Hb0ePRx33NWNwSupZs+gjIfOjgJdTkbSmJc1rE1Hfvu74o28ORLb
 mue4zG9MMFZgA17VpX4GRhkS88cZ07UTCleWfjWKw7W8RxAcj18+uao23SXIBeZE/xLV
 HqbTthj/E73nXwV/zp3iC6oq7g7nA/wT9LR6Bj9kEugf87D9Yhre//KoY4K0Pp00CPV8
 g5iIdHFVr24vKxoqq62dMyC/LQDk+EEWNoUKDpaPXt4wRYGthNSeXVFwDjPwArVe687H
 kSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=9lZklnFLXGHgC8ad/UoOH3TanlFmLXF5QTGl3NJHfR8=;
 b=leqTv7dVNmUZuHw7+jMYD85Znc0kln2XOUisxCmFIynGBqukLgH/HREWkuogbtK7Rd
 sJv/C+VHLNP+LVOs8d6ajK+IoGMytEFyjKpUuS4h0ghUTiHbZPSQ8yZX7GLzRTlsItYj
 oz0XcdZjPIxqc1FD85X/RseoVL7gknXQsaL9PWyxrdvzL5ZdY0gJMgJoBxbyffwm0uXw
 00/QEx3EgAp7MWpUI1MZ7Cjexd/OA3PQzG7cvi9NoMISRkJVPw2Mwb4574BZVq97s6eC
 sTV50w5ReIlblhDVn2Of/5JE9j6rz7igU7cBpXf6sTWWRq/aBz/KfD2c/oTOxywtIYID
 lhag==
X-Gm-Message-State: AOAM532vEewcTsRlxzRBQMLZRPi7OVjzZaP2QVADuPGLD5RFB/t93hyS
 /0ZrE6rmr4TXHTrI6Pz9ClE=
X-Google-Smtp-Source: ABdhPJznQa5NPiyZ0P/xECApnaDiAFI7yS6oizVqEjfF8AZfC9IgMIxus8yOcoeB0mDC5AFo11dkAw==
X-Received: by 2002:a17:902:ce84:b029:12b:8c5d:405 with SMTP id
 f4-20020a170902ce84b029012b8c5d0405mr7624137plg.58.1626774482009; 
 Tue, 20 Jul 2021 02:48:02 -0700 (PDT)
Received: from [0.0.0.0] (jp.bgp.twd2.net. [2a0c:b641:571::1])
 by smtp.gmail.com with ESMTPSA id q31sm1291608pjh.13.2021.07.20.02.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 02:48:01 -0700 (PDT)
Subject: Re: [PATCH 2/3] RISC-V: build: Disable LTO for the vDSO
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com,
 Kees Cook <keescook@chromium.org>
References: <20210719205314.1023455-1-twd2.me@gmail.com>
 <CAKwvOdmanKSL3hLM4HjyeZg+K7pAWCHDuKeBfU4YSGzEyH_CaA@mail.gmail.com>
From: twd2 <twd2.me@gmail.com>
Message-ID: <182e9aba-252f-1be8-44b4-5dde90a92d88@gmail.com>
Date: Tue, 20 Jul 2021 17:47:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdmanKSL3hLM4HjyeZg+K7pAWCHDuKeBfU4YSGzEyH_CaA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_024802_994925_7DCE3B5E 
X-CRM114-Status: GOOD (  13.84  )
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

On 2021/7/20 5:19, Nick Desaulniers wrote:
> On Mon, Jul 19, 2021 at 1:53 PM Wende Tan <twd2.me@gmail.com> wrote:
>> Disable LTO for the vDSO as done for x86 [1] and arm64 [2].  This also
>> disables CFI for it [3].
>>
>> [1] https://patchwork.kernel.org/project/linux-kbuild/patch/20201009161338.657380-28-samitolvanen@google.com/
>> [2] https://patchwork.kernel.org/project/kernel-hardening/patch/20201211184633.3213045-15-samitolvanen@google.com/
>> [3] https://lore.kernel.org/bpf/CABCJKucpFHC-9rvT7uNF+E-Jh20fz69zdO49_4p8G_Sb634qmw@mail.gmail.com/
> It might be nicer to use the typical form for commits:
> commit <12 char sha> ("<oneline>")
> rather than a mix of patchwork and lore links.

commit 004d53f8c96f ("arm64: vdso: disable LTO")
commit e242db40be27 ("x86, vdso: disable LTO only for vDSO")

I can put these into the next version.

> Do you have a list of diagnostics produced when building this object
> file with LTO enabled?
Oh, this object can be built with LTO with no issue, but x86 and arm64
seem to disable LTO for it due to no noticeable benefit for the small
amount of C code.
>> Signed-off-by: Wende Tan <twd2.me@gmail.com>
>> ---
>>  arch/riscv/kernel/vdso/Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
>> index 24d936c147cd..4535a77792be 100644
>> --- a/arch/riscv/kernel/vdso/Makefile
>> +++ b/arch/riscv/kernel/vdso/Makefile
>> @@ -30,7 +30,7 @@ obj-y += vdso.o vdso-syms.o
>>  CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
>>
>>  # Disable -pg to prevent insert call site
>> -CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
>> +CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_LTO)
>>
>>  # Disable profiling and instrumentation for VDSO code
>>  GCOV_PROFILE := n
>> --
>> 2.25.1

Thanks.
Wende


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
