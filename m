Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE892C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 07:15:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 365F06135B
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 07:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 365F06135B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2j/T5rnMJfW5pTtqifugoawDiYr9CQT2jcv/d0OSB8M=; b=VvP+9sq+ymEoBbw2F9lbLD/Vq
	FJTxDSuIo6Kzs4rSQ8s7PN1LiP+tre5S3tPKUHZgHPqLo9pbo32k84wcHUPS6NMIRQih09zP3M7Rj
	RSWnfPgFqopsDJExcjgeTidjMkt+XJCCWLVP8qnCMV2F36chr5J1xFTrAVLurVu0oFw8d45nctXt8
	EPeMcEK8xXb2ipVdRsI6Xaw5mPKRB5LhVwPI6x1st9MTvA9WPDDYUNxKu8zRkSLRLNlOytpJycJl6
	O2AqjBJIcSPJ4n+gQGM0HxVo0NJuxFGzIqVdgNHqGc12Cw11E6QT7s+FGziPTSN6WRLPKHodnh312
	m1OIJ8ygw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljGQF-0037qs-VE; Wed, 19 May 2021 07:15:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljGQC-0037pv-Oa
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 07:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9okw0AivC/GodUAOgdSjrzNrGvlF7i2iJnuU6Q7Ckhk=; b=OIP+qJqYe3uOFjv6Nd1NP3HUah
 PMBYvZGiQ98JXyT/eOCsbXspprJQzdyv434CtIg3xRWLLxH63omMPts0A2zowNzurwAwd4VH5nhUY
 79wIB0J49nomJ3gvJ9ARtkYtTLNTEgd4TZKAqhGTb/dSUJhG6fNkV2DXYxX36LRdGKYHlobnVYxGA
 tVfqZj946BMjM98zcNKr6B2MsiL37YEExgLREjJavFlaAYTeN55Ze6T/HibschXlu26Bi3SMcxmzm
 g4KlOVkezl09XvUIfJ7O5OuyCcyZ3jj6TR6y2Uws76svm76ruGHh62mtiEAA1JlxP8+0F4b0G+cvm
 oj5ZW6ag==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljGQA-00FD8l-7p
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 07:15:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 h3-20020a05600c3503b0290176f13c7715so2698758wmq.5
 for <linux-riscv@lists.infradead.org>; Wed, 19 May 2021 00:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9okw0AivC/GodUAOgdSjrzNrGvlF7i2iJnuU6Q7Ckhk=;
 b=GLdq3bNPUG1jVbmGuXT/73WV/H4ct0JC+JPyO1eIGy+uxrXeIrrgUTBkgOyB79PHc7
 wLFK19VrpLW3+QR7uumz7VfegumO/03BPjeaHthtleLjPv4rR5sZsZKmnwKaMZ0UMMQE
 gr/wpNE/p3phdRl/HBhMBnnG7Ceqfv4Un6Qh9OMLUWnILbaOcsufq7QT6gVJNkALrDj5
 LvEedY1AAT0Wpovo/BsutzLeeNlF70WhAFXjf5wfegQAs7idnoCE+88T76OnTfUMjnqY
 mZBt11ZLbg81ZNLfNeOqHoJde6wljGw5DprysPeWSQuaCaOg7bKP+7E2aaqYKQ3qBy0R
 wFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9okw0AivC/GodUAOgdSjrzNrGvlF7i2iJnuU6Q7Ckhk=;
 b=EuTPkKyOB7PhAWCQskgl5wuYGUclMg8B6x1gS8RJJ6nYPfAYMbUb+ZFkqR6JlFpQn/
 4mko3/bGzkzoXe8xzYmlO0/uMI5bPkgToz8QaiDHbjaHV+AYvLNFW7DQyOx03ASMC6vn
 sh3zT1UBbYW75jMTL5UHOIFW2VZWgjE4IHCUIGK39ae7qjNcoGVo1ytZuoei5v6kPhjK
 lk/J4PywxIrhAh0XhKQIPPmAfqiakIc/KkS1W79vFV59de9oXYG6qUdZsY3xWwG+jSiR
 aKt3sNCNKjYsn/RuUMioq1pIJmzz5W0EHbj1n390nyneAzLjUpYL5pQfAMH3yPxWTW8B
 zdWA==
X-Gm-Message-State: AOAM531kQLHp1TUtxS8lcPeU07Jm77gHkJsmUJ1dRMtLvgkrOHIvqiUw
 SOOhhVpkqkcyDUsCTl6E/Ro75nUq84aM5QDUPiWhLQ==
X-Google-Smtp-Source: ABdhPJw/naptBUbx4b3ptbfbXhmKN+TgrAcgi05rNO45VadkiPEcCxSc5SrssSarObHWl3KVpfRHtcRUN81TCIYDW3E=
X-Received: by 2002:a1c:4e0b:: with SMTP id g11mr9882524wmh.3.1621408508509;
 Wed, 19 May 2021 00:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTR5838=Uwc5P6Xs=G7vk80k0yqWcSsNe0OFcwc9sDBBHg@mail.gmail.com>
 <20210519060617.GA28397@lst.de> <20210519065431.GB3076809@x1>
In-Reply-To: <20210519065431.GB3076809@x1>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 19 May 2021 12:44:55 +0530
Message-ID: <CAAhSdy3C1owsbY_9gkxkhWfCXnL_noow7F4t=5+j7q+AJO3pZQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Drew Fustini <drew@beagleboard.org>
Cc: Christoph Hellwig <hch@lst.de>, Guo Ren <guoren@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_001510_368990_C7BBBD81 
X-CRM114-Status: GOOD (  21.65  )
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

On Wed, May 19, 2021 at 12:24 PM Drew Fustini <drew@beagleboard.org> wrote:
>
> On Wed, May 19, 2021 at 08:06:17AM +0200, Christoph Hellwig wrote:
> > On Wed, May 19, 2021 at 02:05:00PM +0800, Guo Ren wrote:
> > > Since the existing RISC-V ISA cannot solve this problem, it is better
> > > to provide some configuration for the SOC vendor to customize.
> >
> > We've been talking about this problem for close to five years.  So no,
> > if you don't manage to get the feature into the ISA it can't be
> > supported.
>
> Isn't it a good goal for Linux to support the capabilities present in
> the SoC that a currently being fab'd?
>
> I believe the CMO group only started last year [1] so the RV64GC SoCs
> that are going into mass production this year would not have had the
> opporuntiy of utilizing any RISC-V ISA extension for handling cache
> management.

The current Linux RISC-V policy is to only accept patches for frozen or
ratified ISA specs.
(Refer, Documentation/riscv/patch-acceptance.rst)

This means even if emulate CMO instructions in OpenSBI, the Linux
patches won't be taken by Palmer because CMO specification is
still in draft stage.

Also, we all know how much time it takes for RISCV international
to freeze some spec. Judging by that we are looking at another
3-4 years at minimum.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
