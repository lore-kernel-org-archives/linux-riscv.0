Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A7BC07E95
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 21:23:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D2360FF0
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 21:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1D2360FF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ikRS5Ibv3fa+SiGeF31daV1LoGlL07EEU4g8A8N0+A=; b=By6a0Pe5R4wUMl
	LIuOjKLc1oeLnX440O8EmsP8xjQT6RnAqdpFnbF3e2TnrkppSDSwT3Ri+PoBLZ7JagaF73dW6XsVN
	cMdMMCvKaVLkWUsI19HERJc0D7i38uu8VyQxNqLhxp7vHQfPopzrhAXdzeNS4vk4MyQVL5qFI13jh
	YSJsIUz2i21HwV4Ih/uKeRzsTuP5FRXU4CgsFG/oBQqMR0UzIJOpnkwTGqajkbsgUAqkg4YwiVc48
	JjTM8ha9EB5ijgM33/CX/AgQJCRfYqM7akEfEmtY/0Z30iw+ONtBx8kgDf0Zucdy4XGNuWvlihmMG
	TaGpfymhZeeCVtFi/Z/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5ajN-00BMTu-H6; Mon, 19 Jul 2021 21:23:17 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5ajK-00BMTR-7A
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 21:23:15 +0000
Received: by mail-lj1-x236.google.com with SMTP id y7so27912315ljm.1
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 14:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jZcZUjf3tmEhyauXe1rgMd6qpf0c12SROnc8Sngydds=;
 b=bIWoZCkWn1U8XnMypnMuSCFfKYmPHmp2pELBQqbsVZ+lLfh0RPupcLxAOaA+NMcghA
 LblvS3HOc+WPyfC7dMDdVPFQKQZP35nsiDozVOQCl3HZRJ55V/uUCJVRB5WpdqDoBqmK
 P+YBnoR8sTYDrODT97LTlPeyY+588ZD7yaXXOp4cvfk12ThdEkOqEsJAHZsB45zhM9jI
 GD8/vmYXa4exbRduTVFLCPyQHu/EJfwKs90E6vXQoe98ObPThLgVWO3zNqNeMyM7GeX3
 bmPefQzYKzebbCx750wSPeHum5xlnPYuS5zTQG+TEtHTb51ZA8p4b4NzX1IoaAEZER0S
 XkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jZcZUjf3tmEhyauXe1rgMd6qpf0c12SROnc8Sngydds=;
 b=U8Jp5g4FQYWdcVkucqGOLPxYq32EDUIjKyE+S14059b1Sfd9F76kr6VWbe5NU+k3IA
 cmmialZ7eZgqMEKyGm4kZymSK/BKGAyA61PaYNosFUUme/qLmOK11oWyN2xQSOc7H5cX
 p6TwKFeHmpRyS7g4ZqZ/zVQOTErDQ+trKKKuR2U8Uo589dj4X7PhP3S1gZmlkdu9huuF
 YXlAsQkHexbVNWv0IGclKk17OZxX4375XeNSL3aQZxY3xSCVRg9js6OVVhvXgakdfgvt
 DhJ6/jSGvSjjF4dHPGtixyv02rlQ1fE99YoEeff9Xym+/bhtZB0ZDy0tceO2sn4G613o
 cWBw==
X-Gm-Message-State: AOAM533EjRRwUHicWKdUugBuc94BXF0OmOTPux2XssV7T5NnUUnx8yAl
 GpolUwwAfGX2Bu2hirjQ/gtRI+hdU1so76AMxp47rSbzfDg=
X-Google-Smtp-Source: ABdhPJzMdHRMVOlQxxYCHjMRpLG4Iba2W9mR1krQJtwoMDDU3sO7kIshoz8C4PsyvVicQgQbJ9fAa2scrU+t85Z+GZ8=
X-Received: by 2002:a2e:8247:: with SMTP id j7mr23659305ljh.495.1626729792388; 
 Mon, 19 Jul 2021 14:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210719205208.1023221-1-twd2.me@gmail.com>
In-Reply-To: <20210719205208.1023221-1-twd2.me@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 19 Jul 2021 14:23:02 -0700
Message-ID: <CAKwvOdmy_YEdXhqa0qNGZSo+acm97QL3v6fkwmpibgim=6jOxg@mail.gmail.com>
Subject: Re: [PATCH 0/3] RISC-V: build: Allow LTO to be selected
To: Wende Tan <twd2.me@gmail.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com, 
 Saleem Abdulrasool <compnerd@compnerd.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_142314_326310_907C4684 
X-CRM114-Status: GOOD (  12.44  )
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

On Mon, Jul 19, 2021 at 1:52 PM Wende Tan <twd2.me@gmail.com> wrote:
>
> This patch series first fixes some build issues, and then allows LTO to
> be selected.
>
> Wende Tan (3):
>   RISC-V: build: Pass `-mattr` to `lld`
>   RISC-V: build: Disable LTO for the vDSO
>   RISC-V: build: Allow LTO to be selected
>
>  arch/riscv/Kconfig              | 2 ++
>  arch/riscv/Makefile             | 7 +++++++
>  arch/riscv/kernel/vdso/Makefile | 2 +-
>  3 files changed, 10 insertions(+), 1 deletion(-)

Thanks for the series! It's definitely interesting to see this!  The
thread isn't showing properly on lore, if you're using git send-email,
you should put all 4 files in the single command line invocation to
get these to show up together in lore.kernel.org.
-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
