Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AABBC07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 17:25:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0B2560C40
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 17:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0B2560C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5NaYbKVD0B+gyWK7YkE5Tr73ybE3mUwZIdvC9UcAOM=; b=WZscMD6LieD2Ki
	pseG/NdO5vC/1/ISCTiZQQjyip3ISbCwyKteeTpu2jakI5HWUMuVKGxcfrLWjpyDSykdeMVB8wqlb
	FafXe/Kft69zDAQoQN3RCxBwoX0jIDGLaEo10p78tt54Wu4xUxx1VBGUgdYVoWauVsz7kRFaKSAzA
	I3oyLJ41UW3hf8hAv79qtYUFjJa8bjjxUTgSLdfCOFCDrTHJ75E/gL+eGPER/Kkiviyrv3t/5MOCN
	jl6B5Pus7/3BJVhJ1s67hZkcebMYhBEPwXo7opu3LZqqyHRQLnM+ZLbGsunwxpAf1+HOyycgCARm4
	5Hp8dACXnXv/bwSBarSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5tUe-00De5Z-TW; Tue, 20 Jul 2021 17:25:20 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5tUc-00De3N-8q
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 17:25:19 +0000
Received: by mail-lj1-x230.google.com with SMTP id r16so32017471ljk.9
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 10:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F4UXYuNXgawQaMgau7qJ5CfzGLXLNsQDo2jFc0jZS8I=;
 b=HXh4GQwt45EpylrmNMDeBkBxuy7e9GSHz0lUuA4KnEVRd0rcXgAZjsP4Eb+G6OjGMp
 TZk4ZcZr3y5ZaSJJVRJU/pmsZBDiL9G0rQtwG4DCXl+CgG28fI5HZGH0ZrFvutuGb/Oc
 pmdrTwbBhw6Ag6JCFpA/ZZ33OisDxfYV2whOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F4UXYuNXgawQaMgau7qJ5CfzGLXLNsQDo2jFc0jZS8I=;
 b=lKQi60OHBRSxPftzC57fTq9Na4HqFvuLvWhoLokQvjt6qEMESY6E58kFOjH5FXBNi5
 /6VH1X/AGLtLxw0PclkqiTsi2tQ6hU169lNPKzOuJ3C1TXdp+2hoNntRDX9SxOhsv1jx
 MoVXOnYOurfghVca+6lHJh8yCG6uAGgoXsUKWBnWdrqdVF3k4afHyvCX9m1Iz03fMkCm
 CqKrkJm8PcRsXb28+pE+i6OQdU77jn5I7AmqzzVGccxRl4rtQ/G5SeoSXT+iw8Msf6ps
 98ZyQ4DE5ocUlaLXDcA1yhhMvuc7B/GKTGzpb5JV/FWjnIqRzMvZh0W1QnFitdtx8EbW
 gthA==
X-Gm-Message-State: AOAM532rWGAATJDT1rB1pzptPeQkXOV0EHx3N+7twLLqGQJw58W84yxI
 /pj4UL2u9clnnvf35zwsLh0D10BWjYZZ3DG3
X-Google-Smtp-Source: ABdhPJy2Q6nNziQ5/Tg/lgUaPN89Qfa/K/B2HzU+D3XXtu0+n6SxIcRW/nADvvbES4KiADYdY8dsNg==
X-Received: by 2002:a2e:950:: with SMTP id 77mr27605095ljj.438.1626801915931; 
 Tue, 20 Jul 2021 10:25:15 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id v19sm1087425lfe.31.2021.07.20.10.25.15
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 10:25:15 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id i5so36956890lfe.2
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 10:25:15 -0700 (PDT)
X-Received: by 2002:ac2:4475:: with SMTP id y21mr22279136lfl.487.1626801915105; 
 Tue, 20 Jul 2021 10:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wjYghA5O+ZsWKVNApMK3j4V1EibO5P+c4MrHnqp8YhY=g@mail.gmail.com>
 <20210719140437.GA2178213@roeck-us.net>
In-Reply-To: <20210719140437.GA2178213@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 20 Jul 2021 10:24:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wivYZGxR4oumBk_rTAstRx=WWpwBAgS7n3M5ydbd0rTzQ@mail.gmail.com>
Message-ID: <CAHk-=wivYZGxR4oumBk_rTAstRx=WWpwBAgS7n3M5ydbd0rTzQ@mail.gmail.com>
Subject: Re: Linux 5.14-rc2
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_102518_354911_9ECE7927 
X-CRM114-Status: GOOD (  12.57  )
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

Don't know if you guys saw these mainline -rc reports:

  https://lore.kernel.org/lkml/2c03b355-86dd-1fa6-dbaf-5857f4a45a66@roeck-us.net/
  https://lore.kernel.org/lkml/20210719140437.GA2178213@roeck-us.net/

On Mon, Jul 19, 2021 at 7:05 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Failed builds:
>         riscv32:allmodconfig
>         riscv:allmodconfig
>
> No major change here, except that arcv2 images now build.
> For reference, the riscv build problem is:
>
> cc1: error: '4496' is not a valid offset in '-mstack-protector-guard-offset='

and from the -rc1 one from Guenter:

> The riscv:allmodconfig build failure is not new. It is seen if both
> STACKPROTECTOR_PER_TASK and GCC_PLUGIN_RANDSTRUCT are enabled.
> See
> https://patchwork.kernel.org/project/linux-riscv/patch/20210706162621.940924-1-linux@roeck-us.net/
> for details and a proposed fix.
>
> riscv32 images fail to boot due to commit ca6eaaa210de ("riscv:
> __asm_copy_to-from_user: Optimize unaligned memory access and pipeline
> stall"). I reported this a couple of days ago, but have not seen a reply.

it would be nice to have these basic tests all passing again.

                     Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
