Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2563C43461
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 13:57:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95B492073B
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 13:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LqAhL7Ki";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="fdRk2pV/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95B492073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3SdFsxqpCMMSEIgiJG2Yb+ztJ97BIFbUjM5LenNC2c8=; b=LqAhL7KiLAGZ7IpDwAJ2ECe9/
	oR6uR2zUyWY6L/QlLbLPKwjnolD+X7VPtpLuzrtKKSQFvuwmmKoQ/UuYir9WpIusfUt8XN8kSYFS6
	Sa4LaAf37PxvBudruXLX2MrnpcZoBE20u9h7adFGRp2e+N1RQ+h378EDrH9XzhNvsmD8NNOZ1k5i0
	aOiveoRE9IN36c2S9a8g0NVHdbmKjFYaKnXxcuEKlB27ipIu2t6s0wgMm9R4S8MPcv6IFy171zg98
	fdlfai1Godj4QQ+xwoKrjkDCtCrOAID2OdbvF9tpg6oz7gUEFYBKVEYPSHiNSFuAX06zs5hedIb/S
	5P2FV4lIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kECD2-0002yr-Fc; Fri, 04 Sep 2020 13:56:56 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kECD0-0002y4-GT
 for linux-riscv@lists.infradead.org; Fri, 04 Sep 2020 13:56:55 +0000
Received: by mail-wr1-x442.google.com with SMTP id w5so6850085wrp.8
 for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2020 06:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B3CfhOVBGf9H9WuZ53+AjLGNuQZrbQHmVtlD/DJasis=;
 b=fdRk2pV//7myN++zX937AgchN/lF0cwlO5vO83mfaGxBG4q2HNIp6zqYMK+Zt8XOrY
 NjIrgYIWeNUh7JSDxmG4kHraRhjqpHbzpktsGfa+SbGMh8a1sbPyoF7IpXSqtyfgCZgb
 FjYvTaKTlO6LYbE6ZfU35PIcl9HijlW13E5wiZ3iwZzpaAqnbWl0F90OQZckY/wZU1gf
 A7VBE9ubp+vKLCJg6fKumSbKRAtz1MrQAzug3FVEuNdgU48dFmCQgmCLn7cJ0gcWBPA2
 7tqETp6BTfcc3ari0Ghn5Ue2uktePy4RJzl6OEpDYyEMYCo7NS+BaGeEN2Hb/6BUmrOC
 /SQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B3CfhOVBGf9H9WuZ53+AjLGNuQZrbQHmVtlD/DJasis=;
 b=YOtna+31z4GHUNocuPvuuA8JTofL3jGnzcHI80uZm6aWcGBxi0es3CyLcEtVs8OBwn
 srwFmiUSqAILoSO9o8UEzwsGz+HhtG63rxd8TqqeDWy9vWz2HvkIH38Xqvnv9sZ/M/Q0
 atLOCI2Z54oGVp+DiL+l+1d++ynZ8oNIvF34+dzlcBxm8mwH692foDAMexcfrsT0v11N
 ozPB30D3v6DQXaCITFvxhUNMLMR4xo0N6p85tRUrH2UpY1cDZmKDXkA68PmzJJTn5SZ/
 NEcFAD0UJKbh69f0GVR257wfcos9HHKHQEO0kHGZWtbGi0g6KWCPfDidYyZZF/sqPidO
 uweQ==
X-Gm-Message-State: AOAM530msMBUYliGirGLV8Zvnvek5lLDiJJFuZZfPAzCAzyviuLvmdAc
 BKDvPxIYYWL5lUXqFlAh13SmLVRkcTK3/Z/1xvxOKw==
X-Google-Smtp-Source: ABdhPJy/VGdC6pW/0FhrX+k0bZPZot8TzrPX4TwKJOQtaQsxu0J0wg1pUbQsc0YgMyp5M+kryqPhp8FcaB2m6mL+Fk0=
X-Received: by 2002:adf:eecb:: with SMTP id a11mr7878596wrp.356.1599227813312; 
 Fri, 04 Sep 2020 06:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-32c8d053-acbd-4c72-b41d-8d6042ac639d@palmerdabbelt-glaptop1>
 <CAHk-=wi_tf4qsiBj5UD0GG3wz8Hi5NrHzqdrx+CwtfAY+_UiGg@mail.gmail.com>
 <20200904083109.GA9182@infradead.org>
 <CAAhSdy3S8FfMAWih_VoBHw0xd-7c=urzuJ+PPdug9iX_pWyTsQ@mail.gmail.com>
 <20200904094617.GA27846@infradead.org>
 <CAAhSdy2x0ROqoTzzZRZgKCTL99WPy-8e4CQ921sf-=GQDm_gxA@mail.gmail.com>
 <f1be6ee1-0802-82ca-ffdb-4c294925cd9a@kylinos.com.cn>
 <20200904130044.GA7842@infradead.org>
In-Reply-To: <20200904130044.GA7842@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Sep 2020 19:26:41 +0530
Message-ID: <CAAhSdy2N8L015z0-RirjXLjdzt+OrCtzzKzivsMeQXoH9Nc8Cw@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Fixes for 5.9-rc2
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_095654_679184_7C08FEAE 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 4, 2020 at 6:30 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Sep 04, 2020 at 08:58:25PM +0800, Qiu Wenbo wrote:
> > I can confirm this patch also breaks K210 support. It seems that
> > csr_read(CSR_TIME) will trigger an illegal instruction exception on K210.
>
> CSR_TIME is trapped by just about every implementation I know (which is
> explicitly allowed by the spec).  That is why we should never use it
> from common M-mode code.

Finally, I was able to replicate this issue by manually hacking QEMU to
not emulatie TIME CSR for virt machine.

It seems this issue is only seen on older QEMU and Kendrtye K210.

I am working on a fix for this issue.

Thanks for reporting.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
