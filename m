Return-Path: <SRS0=pMxH=G6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4FDC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jan 2021 05:46:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDA6820709
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jan 2021 05:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDA6820709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=VbGu7uQMtiBpS9EWfj4MAG+XthtAeQu+Ur5UO0P3Psk=; b=YYYY1TrJ58ZXT9/4MQUSY8sCA
	kVuH8Sfgl74C7sRnT1oloTOxN5XGVOhlHGUb+4opAsr8snE1yYwMj8fOrhmjDW9iehuqA5NV4elfI
	xkFXaEUZYVjM14UK3y1HT5VWjZUnQZ/fPc/6Hr+cgP/0FoYOI8T6B6a60/C3FI4v8lQLlN7UGHr5W
	jK1pWa3LxVV97wo7Sa4czF6ghpL0GplsEqSY5hVyCvMmp2fEG6XkEa96MC3LEPkXUtxlK8kcTrF5Q
	dm+7lcYESe0fEad8ExM9dBt3eiwkzv74u/PYgfJducIFluLl78zT47T9AmU2khQUsnJX/BhjKN4Uk
	bSvPX+JAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4deu-0000I2-Mp; Wed, 27 Jan 2021 05:46:28 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4dep-0000FH-H1
 for linux-riscv@lists.infradead.org; Wed, 27 Jan 2021 05:46:24 +0000
Received: by mail-pj1-x1035.google.com with SMTP id u4so645840pjn.4
 for <linux-riscv@lists.infradead.org>; Tue, 26 Jan 2021 21:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pGwLX141izLDvx1hQTGiiwKO086AeFCYCtYAmNWi9wI=;
 b=AmTdH3IG4UQzJndI1D27UQJWy8ntwz3x96fLaGYHHI8DDA6H+Y68FXg1U5+ek6ovCn
 BQskNvflja4Kqe4HWtn3w42joJ9YUlN577FkgtA2wn8h4A+gee/IgXId+fkal+R9QLJn
 Na2PxVzgvj5x+O52bGPuCVBbamCyvJdweyNcbR3LECVkeySnNjL82VUJ/YR5uOBQj289
 qijz8MXoF7zeIeGbr1pzM0INdKa2u6ikLS6t9DFsADUNGVZIqVyByhitCvhByTi3r9Cb
 GFO8v3dk3dOPI8NCgIEvoLfRAsoSe8tDBOqTLpl21rRUuC+KF1FC+PjiJRruBMdfA3J+
 e4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pGwLX141izLDvx1hQTGiiwKO086AeFCYCtYAmNWi9wI=;
 b=b8L7BXNIVU2k6fEda+sY8VuTLTwE6NoX1DoEGtv3iCeuS8fLlWU25HF+pdBMqNxuDk
 O4YT6gp9Nz3indTcS+7MV6bkqqOYtWhz/a6M0cdiiomuFE4YRaaCy7OP6c+fT7wn+Rij
 PKd3Dg5V3lqpfjvd6vAIq8rBzF/x5UFtt2bSm6UgQXK8c72exV8QEekWa+y7AscPcs+P
 4D6KK6UVXPNaOGksWtBGhV/XJSWjE4f4d2GsBsJbuMTzgT1bZNbE8u0OyouXMEs5xAOq
 0AmmD4PFJkWliBBNfVK9Yv3eU6CgWvaHxqWakN6nffw/64kW2+QLggf/fLV99AjPDYRz
 Tczg==
X-Gm-Message-State: AOAM533adc+fTaRoMgStHYdBm+RIq3P+PK5b+ADaDVn/ArcpcT5DERN9
 VsHf1tI40fKBtcK+v3F0Ly0hZw==
X-Google-Smtp-Source: ABdhPJzlYhGFSdTqcPKE8K2PIdYf+VA6n3sx73gQUwIFBNusPJfAV5LCpnY0tYvL1n4CZqElayMtXA==
X-Received: by 2002:a17:902:e8c9:b029:de:a2c7:e661 with SMTP id
 v9-20020a170902e8c9b02900dea2c7e661mr9611617plg.76.1611726379718; 
 Tue, 26 Jan 2021 21:46:19 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 145sm840907pge.88.2021.01.26.21.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 21:46:18 -0800 (PST)
Date: Tue, 26 Jan 2021 21:46:18 -0800 (PST)
X-Google-Original-Date: Tue, 26 Jan 2021 21:46:11 PST (-0800)
Subject: Re: [PATCH v15 03/11] riscv/Kconfig: make direct map manipulation
 options depend on MMU
In-Reply-To: <20210123110041.GE6332@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rppt@kernel.org
Message-ID: <mhng-0c84abc1-8ac8-4142-be1c-a269d8b345f8@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_004623_592879_A92BE815 
X-CRM114-Status: GOOD (  23.89  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, david@redhat.com, peterz@infradead.org,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, hpa@zytor.com, cl@linux.com, shuah@kernel.org,
 tglx@linutronix.de, elena.reshetova@intel.com, linux-arch@vger.kernel.org,
 tycho@tycho.ws, lkp@intel.com, linux-nvdimm@lists.01.org, will@kernel.org,
 x86@kernel.org, willy@infradead.org, rppt@linux.ibm.com, mingo@redhat.com,
 mtk.manpages@gmail.com, Arnd Bergmann <arnd@arndb.de>, jejb@linux.ibm.com,
 bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, kirill@shutemov.name,
 dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 shakeelb@google.com, akpm@linux-foundation.org, rick.p.edgecombe@intel.com,
 guro@fb.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 23 Jan 2021 03:00:41 PST (-0800), rppt@kernel.org wrote:
> On Fri, Jan 22, 2021 at 08:12:30PM -0800, Palmer Dabbelt wrote:
>> On Wed, 20 Jan 2021 10:06:04 PST (-0800), rppt@kernel.org wrote:
>> > From: Mike Rapoport <rppt@linux.ibm.com>
>> >
>> > ARCH_HAS_SET_DIRECT_MAP and ARCH_HAS_SET_MEMORY configuration options have
>> > no meaning when CONFIG_MMU is disabled and there is no point to enable them
>> > for the nommu case.
>> >
>> > Add an explicit dependency on MMU for these options.
>> >
>> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>> > Reported-by: kernel test robot <lkp@intel.com>
>> > ---
>> >  arch/riscv/Kconfig | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > index d82303dcc6b6..d35ce19ab1fa 100644
>> > --- a/arch/riscv/Kconfig
>> > +++ b/arch/riscv/Kconfig
>> > @@ -25,8 +25,8 @@ config RISCV
>> >  	select ARCH_HAS_KCOV
>> >  	select ARCH_HAS_MMIOWB
>> >  	select ARCH_HAS_PTE_SPECIAL
>> > -	select ARCH_HAS_SET_DIRECT_MAP
>> > -	select ARCH_HAS_SET_MEMORY
>> > +	select ARCH_HAS_SET_DIRECT_MAP if MMU
>> > +	select ARCH_HAS_SET_MEMORY if MMU
>> >  	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
>> >  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>> >  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>>
>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>
>> LMK if you want this to go in via the RISC-V tree, otherwise I'm going to
>> assume it's going in along with the rest of these.  FWIW I see these in other
>> architectures without the MMU guard.
>
> Except arm, they all always have MMU=y and arm selects only
> ARCH_HAS_SET_MEMORY and has empty stubs for those when MMU=n.

OK, maybe I just checked ARM, then.  I was just making sure.

> Indeed I might have been over zealous adding ARCH_HAS_SET_MEMORY dependency
> on MMU, as riscv also has these stubs, but I thought that making this
> explicit is a nice thing.

It seems reasonable to me.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
