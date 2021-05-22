Return-Path: <SRS0=Qta6=KR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F41C04FF3
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 00:36:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5484613E6
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 00:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5484613E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLvcGLu5dzk87rHKQUOWRk4BqUg5SRsbI3H7vJPEmCY=; b=ldvJr3gARs2JHdad/Qou6+aHDt
	mLASONRET4f+jKBNrGeMk9LKGJSubQ4buhs2r3ekCZd7YLLZSWHnVWI2EaWZ74lJLnx7ZUG+/ib4x
	MTdM3fHL4dSFZKrBD7nNH5JROnyU1VphNCeMwHq4mAyAHD7KebY7c3FkSEC9pfhl1k2+h3zfcPnK0
	DPrnYKuBs6MFzqLEg9f8mzOsNRF/7SYmhHWVju6VnLMME6QOH/xqJ7+ILIN+IFQjytlIB4zxYEjAF
	o1/6A+r+P66dbFXKcj29p3EyaUExZ244fZkBPg4lEKtqUclJMCGtc7XM0XQXjdDdj7Euh27n7jsZg
	P553oJIA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkFcy-001UPx-1a; Sat, 22 May 2021 00:36:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkFcv-001UPq-ES
 for linux-riscv@desiato.infradead.org; Sat, 22 May 2021 00:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=78UBCgWTtYV3p4sgz4vUFD0pL15CSosCbP1DaT0GYx8=; b=Bu1ia0B5WC3Q0XqcSbt6hKJ+ZH
 1s9xQCp1yGC5EuCZHMUTPzJRIscgsGIjh22R+UbupbL+IVuTQOv/i5Ma4oZ0uFr6R+BiFkGTGsd2l
 f6jDnqwcLbW6GE6N07TqDEgj+DZ2w96zG+VMnkFeLu1ym3tu+SdLJUEf6QE1OCklFTmHjNOe/PUvW
 aJuIs1VxQOu/YLB+cXx3qsTfaj+Nb1r5bNHuHdS4h3PhxLeFVV/hjhty1QuY+g4jLzfu61aLZrDqS
 OO4q148WRagbDTM7CJuTbciKCwgDBhHv4jT1MUciL2XJDedS6wuFKzlSjO2mRAXzYfw3TdsbU5zOF
 vyvSWvew==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkFcs-00HW7e-QF
 for linux-riscv@lists.infradead.org; Sat, 22 May 2021 00:36:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2113613EE
 for <linux-riscv@lists.infradead.org>; Sat, 22 May 2021 00:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621643781;
 bh=HaoAEb5QnxGwVYmtRURFgpSmH16cCBITcqMVRG2/0Gg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MPqbJhBH3RstH9EWKnNxymskz2Pl/C3W0gZMrlE5YCNKDUTrUUl6zCvDVB5k5XAYV
 Y9reX8ayEACS9y0c/FUtyyh/u4B9uR1QqFmPsWzjNryQn+mrf9sJS0gsybWWjctN+6
 8t3HtRVEAhAQbtaZt0m0Y2ipK9Ky6/a///tbh5LM0ggxxkxKSCYeUmhmxi04t5zUHH
 3VoiVihlCbU5yRaTI00Hz9NhwohX5X6bXsnRYyv2VKYnPnCyVijAyx6eVeIE/4yuTU
 2Obo3xiF4iJYCtUfU9lO4WLwiZEypzFDL6/ggllWhgtf/ABAN9PNqOCTmfMo2TyWaN
 ElcxbVijfWhjQ==
Received: by mail-lj1-f174.google.com with SMTP id e2so19663100ljk.4
 for <linux-riscv@lists.infradead.org>; Fri, 21 May 2021 17:36:21 -0700 (PDT)
X-Gm-Message-State: AOAM533HVW14AUrHPg4L8KrdgIpgK1yWqGHxEqFjbv+bkv47ZO5L/yUs
 dEZX+VeVa7xJ8W3TNivTMzq1+IFB3ZdmtjwKuMk=
X-Google-Smtp-Source: ABdhPJw+FdoqB7wdUwCy62OFrQ1DY0Cf6ne6oubJWNeuhIRENTiVKgOFAcEA/5SJUwdF8GiK/Z3FCxIVMCSO7UivrSQ=
X-Received: by 2002:a05:651c:502:: with SMTP id
 o2mr8602037ljp.105.1621643779980; 
 Fri, 21 May 2021 17:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTR5838=Uwc5P6Xs=G7vk80k0yqWcSsNe0OFcwc9sDBBHg@mail.gmail.com>
 <20210519060617.GA28397@lst.de> <20210519065431.GB3076809@x1>
 <CAAhSdy3C1owsbY_9gkxkhWfCXnL_noow7F4t=5+j7q+AJO3pZQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3C1owsbY_9gkxkhWfCXnL_noow7F4t=5+j7q+AJO3pZQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 22 May 2021 08:36:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTBAKTBY5AF9jd8tfT-33Y+McyFis_xk_aMvZZpLsvVxw@mail.gmail.com>
Message-ID: <CAJF2gTTBAKTBY5AF9jd8tfT-33Y+McyFis_xk_aMvZZpLsvVxw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Anup Patel <anup@brainfault.org>
Cc: Drew Fustini <drew@beagleboard.org>, Christoph Hellwig <hch@lst.de>,
 Anup Patel <anup.patel@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_173622_938990_CDBFBA5B 
X-CRM114-Status: GOOD (  27.16  )
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

On Wed, May 19, 2021 at 3:15 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, May 19, 2021 at 12:24 PM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > On Wed, May 19, 2021 at 08:06:17AM +0200, Christoph Hellwig wrote:
> > > On Wed, May 19, 2021 at 02:05:00PM +0800, Guo Ren wrote:
> > > > Since the existing RISC-V ISA cannot solve this problem, it is better
> > > > to provide some configuration for the SOC vendor to customize.
> > >
> > > We've been talking about this problem for close to five years.  So no,
> > > if you don't manage to get the feature into the ISA it can't be
> > > supported.
> >
> > Isn't it a good goal for Linux to support the capabilities present in
> > the SoC that a currently being fab'd?
> >
> > I believe the CMO group only started last year [1] so the RV64GC SoCs
> > that are going into mass production this year would not have had the
> > opporuntiy of utilizing any RISC-V ISA extension for handling cache
> > management.
>
> The current Linux RISC-V policy is to only accept patches for frozen or
> ratified ISA specs.
> (Refer, Documentation/riscv/patch-acceptance.rst)
>
> This means even if emulate CMO instructions in OpenSBI, the Linux
> patches won't be taken by Palmer because CMO specification is
> still in draft stage.
Before CMO specification release, could we use a sbi_ecall to solve
the current problem? This is not against the specification, when CMO
is ready we could let users choose to use the new CMO in Linux.

From a tech view, CMO trap emulation is the same as sbi_ecall.

>
> Also, we all know how much time it takes for RISCV international
> to freeze some spec. Judging by that we are looking at another
> 3-4 years at minimum.
>
> Regards,
> Anup



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
