Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1826CC4743C
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 22:12:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF93561028
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 22:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF93561028
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=paoPmvYS96fsV7pOVbIoELZ2wuSNnlfRDA9OA2xGOUI=; b=GEj1zYqMOVGMtzUBbnGvEi6Z5q
	Mqa6GjL40k6UxJIzraqjZwMcIMAX4dvGf65Y3pzFLadKsj9XSjA2KorA8cZAUeiCuNyQV6EYoub7S
	Kpipobpat8HcBcoP4gCKsCBtCcgtWnsoS/Mfy/AaBmAcehNYHjBNJCBwnekKDMT0L3xFv2BkHuzCv
	1TZJ68xQIkcTmI+3MfSzoOgdRVFHKwDzUi2eVKpCpn2Oz3/Om/6S/cAri49cvcIi19fmJC40zegBC
	1zKsSVyR2juXHVSWnZCjnbRbBO42BnUElIxrJK2bfdOcnmkzpLnltrCQbpxR4EXBKB0jraUjzFs46
	EGXSTF8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpI1P-00FQ5c-QW; Fri, 04 Jun 2021 22:10:31 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpI1L-00FQ4C-2y
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 22:10:31 +0000
Received: by mail-pg1-x52b.google.com with SMTP id v14so8937024pgi.6
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jun 2021 15:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Kl/E6sm1Hy5waa1ESIZ6GAoJ0uFLqC7+4leUJX1UReE=;
 b=e1C3eBAJo533STH89elp7a4H+e6DnBllnlpNPkSJ37AUtSa9D2fSu0R9qPHRWFpoUB
 dyKBlwyR2c9ha5qH37lC+zWEtaBtf/3ujqhuCkHBVKkpFXmVRfB052qGmbX6QEROyzD5
 3piThQCpvPoTNvTgpwAYjppQ7qiFBb3tZhJuG3A4soIr6mSQh9a2WrqXG2sMAvkf4lAr
 VShOLXtWlvCnxX+kxgqH+shj8nPlrteBjpNkyAbKPqD3c8r53ZkiFSt9/f1WtmOKJCE+
 lnqhimh/cKxstXt7srO9gYkWhdjTgZ6M61MALsrXBsMcUtD9cVabUQh9b9yd6ovsvTxK
 9GbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Kl/E6sm1Hy5waa1ESIZ6GAoJ0uFLqC7+4leUJX1UReE=;
 b=HbZd8/dgLw9aDa2CrM2xUFd2sI5Rj7gIll/X4eUEM1D390SdhbkEEaxmadS3vvfVDp
 kmOxumjIsGq1Ai/H01Cjmf+korZtOqcxNWC7BHdCeIrrOxsihxHmMlyJsuOj4w9U3eBQ
 GIGUJDTs7KklCX/bF4D4BRLivevYVeGRrcCCc9J9NFmR8aNWjgerhHp9Ne1coPeJKBIo
 RBhFR3RQ1R/sFr8PL4mIMrMEqMtld9Fe6bVRcNhievL2gHMNpK5haTEc3HjwAmZoOBUu
 jWe6mqQZll/s5JQ2793xLrpCW8HqlV5Hyf299GbnF3UsX6ltFsJ5K9cjRWjkB8JDnavt
 ixAQ==
X-Gm-Message-State: AOAM531DWJ2gQ94yEXXrTCE/xsI48s8TIADbUhhgOVLYCUoXjTLPNsyF
 4XLv7Dyr5Ki9wrkVB3buNGBDUw==
X-Google-Smtp-Source: ABdhPJx6gnUDtLRP5p/Mj/1tsX2DdzihHec2VB3/gPJAOwx7MOtdoF07gdAgTqrtYn6zBIaIbuTF9w==
X-Received: by 2002:a05:6a00:139a:b029:2e3:db98:9ae3 with SMTP id
 t26-20020a056a00139ab02902e3db989ae3mr6785904pfg.81.1622844626154; 
 Fri, 04 Jun 2021 15:10:26 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 35sm2768481pgq.91.2021.06.04.15.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 15:10:25 -0700 (PDT)
Date: Fri, 04 Jun 2021 15:10:25 -0700 (PDT)
X-Google-Original-Date: Fri, 04 Jun 2021 15:10:24 PDT (-0700)
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
In-Reply-To: <CAK8P3a04C8HObpSHNYqQpe4V96MoSLs7sEpiPvp4OpvyAU1_fQ@mail.gmail.com>
CC: guoren@kernel.org, Anup Patel <Anup.Patel@wdc.com>, anup@brainfault.org,
 drew@beagleboard.org, Christoph Hellwig <hch@lst.de>, wefu@redhat.com,
 lazyparser@gmail.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, guoren@linux.alibaba.com,
 Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-82cca177-11c3-44d0-a0c3-37df6a40bb6b@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_151029_621535_465D175B 
X-CRM114-Status: GOOD (  28.57  )
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

On Fri, 04 Jun 2021 14:26:11 PDT (-0700), Arnd Bergmann wrote:
> On Fri, Jun 4, 2021 at 6:14 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >> To give some common examples that make it break down:
>> >>
>> >> - 32-bit vs 64-bit already violates that rule on risc-v (as it does on
>> >>   most other architectures)
>>
>> Yes, and there's no way around that on RISC-V.  They're different base
>> ISAs therefor re-define the same instructions, so we're essentially at
>> two kernel binaries by that point.  The platform spec says rv64gc, so we
>> can kind of punt on this one for now.  If rv32 hardware shows up
>> we'll probably want a standard system there too, which is why we've
>> avoided coupling kernel portability to XLEN.
>
> I would actually put 32-bit into the same category as NOMMU, XIP
> and the built-in DTB:
> Since it seems unrealistic to expect an rv32 Debian or Fedora build,
> there is very little to gain by enforcing compatibility between machines.
> This is different from 32-bit Arm, which is widely used across multiple
> distros and many SoCs.

OK, well, that's what the spec says already.  Maybe the right answer is 
to just add that "be compatible with the platform spec" Kconfig and have 
it also enforce rv64gc like the spec says.

>
>> >> - architectures that support both big-endian and little-endian kernels
>> >>   tend to have platforms that require one or the other (e.g. mips,
>> >>   though not arm). Not an issue for you.
>>
>> It is now!  We've added big-endian to RISC-V.  There's no hardware yet
>> and very little software support.  IMO the right answer is to ban that
>> from the platform spec, but again it'll depnd on what vendors want to
>> build (though anyone is listening, please don't make my life miserable
>> ;)).
>
> I don't see any big-endian support in linux-next. This one does seem
> worth enforcing to be kept out, as it would double the number of user
> space ABIs, not just kernel configurations. On arm64, I think the general
> feeling is now that we would have been better off not merging big-endian
> support into the kernel as an option, but it still seemed important at the
> time. Not that there is anything really wrong with big-endian by itself,
> just that there is no use case that is worth the added complexity of
> supporting both.
>
> Let me know if there are patches you want me to Nak in the future ;-)

Sorry, by "added big-endian to RISC-V" I meant to the ISA, not to Linux.  
We haven't had any interesting in adding it to Linux.  The interest has 
all been in the embedded space.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
