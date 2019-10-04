Return-Path: <SRS0=3PXF=X5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E74C47404
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2019 20:26:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 934B8215EA
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2019 20:26:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hxIB74Bp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Cm3I98WO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 934B8215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2oZIxbLZeiMxeMVYDRiWBJNfme50Ft6ESF082W+F40=; b=hxIB74BpZ/Na5a
	EudbhZkvcfPzWJD7SsJnnpSg5M1xCVZlQG2Q5Ul0Og5Qd/UhgxUeLQ+t3VPQhzu/awgz8aDrz5o0K
	BzYbwmCZ8T+n6eLPXSZh4EAZLspaBF8lqJapW7C2oc7HNdwnRyjNB0TaKc2TImOCiGbk4LULU2gBa
	GWbvPm69BZcW1xjrqnmg2ugag/ixOnPqp/zfn2z0oZv5n5VLQvKGbQjUekAFnZ64HGqCgXeTQG7Z1
	ZD0+bQzOEUxP4xWmzpM+VDQt8qbIl/lQBDB8E8z1TWMETyZ6dJHMpTCL2Z03kwi1pKUxaFVG9o022
	SdoysdVTdLilb/aD10+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGUA2-0000vw-4u; Fri, 04 Oct 2019 20:26:46 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGU9r-0000fP-C7
 for linux-riscv@lists.infradead.org; Fri, 04 Oct 2019 20:26:36 +0000
Received: by mail-lj1-x244.google.com with SMTP id l21so7777589lje.4
 for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2019 13:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZsYBLeosgG67nHnpA9UFSWQuiStl1sE/t4aS6dfWhz0=;
 b=Cm3I98WO9VJ2gEAchiqSnXcfMomS33yaHkHBu8IWjlPGtMrH4PRP0yXEbeqQPW4Foe
 4KKAgooSz/Eo3cM3cNGdjpi632jSAX1QihEpm3jasmmntSgg4Vl8lwIorhfqt+YCfWnu
 7uBJqFj+Qs8nLZKj7IR6LVuVmdEKC7nRN9B1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZsYBLeosgG67nHnpA9UFSWQuiStl1sE/t4aS6dfWhz0=;
 b=CInvEVLYzP2JHsGGgSwvjFriZawVY4trDQstf4r+cP334EmQyylNZs1Qh3DKeQWofB
 ainesgoIVY4aZUPp2iMs5IT27f9kaNSC4eLpwr2KVvES6v7yzN2TOJi7VCOFI4ZVj/Fh
 0W3Gj7GN2wXsU5yhELK8unoF8HHw2StUFAjSZUzooV/xdX9uGWVbe8Zgy0bpXKS8swPk
 74n64Uw+Yq+RxH6lJgQg+RKrZZs+7KvNANh42OT6NRrPZBzndlAT5CuM+IjbndTTBvkP
 C1QIacbgxSAQhrpdQFfGdnR9X4mNHjnJBXEir8qWLNno7zx04H3JYTm9JUyyVjIl94jL
 wrkQ==
X-Gm-Message-State: APjAAAUMMkR58RkyBDlsZtXYYdnGANb3mn38sn11zgxIt7/KOtM8JhnT
 9dLuB4OUbefWMGywHdrJLEdpy5tumu8=
X-Google-Smtp-Source: APXvYqw4tMHQn1iYV4kHKwFmSKk/iD4loiuZSFIeGbXCpRz6ADmi5c7Ge8M3vp7yDiWByK0k8Wmk/Q==
X-Received: by 2002:a2e:7606:: with SMTP id r6mr10362387ljc.192.1570220792268; 
 Fri, 04 Oct 2019 13:26:32 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id r6sm1320674lfn.29.2019.10.04.13.26.31
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2019 13:26:31 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id a22so7791889ljd.0
 for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2019 13:26:31 -0700 (PDT)
X-Received: by 2002:a2e:2bdb:: with SMTP id r88mr10689784ljr.82.1570220791008; 
 Fri, 04 Oct 2019 13:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.9999.1910041036010.15827@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1910041036010.15827@viisi.sifive.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 4 Oct 2019 13:26:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi9S6PopwTdeFPybnapKwL17ux80e9mbLXNo52e4B8rHg@mail.gmail.com>
Message-ID: <CAHk-=wi9S6PopwTdeFPybnapKwL17ux80e9mbLXNo52e4B8rHg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V updates for v5.4-rc2
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_132635_464036_AB04C09B 
X-CRM114-Status: UNSURE (   6.66  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 4, 2019 at 10:36 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> - Ensure that exclusive-load reservations are terminated after system
>   call or exception handling.  This primarily affects QEMU, which does
>     not expire load reservations.

Grr. Can somebody talk sense to the RISC-V architects?

Copying the PowerPC model was broken. PowerPC has now become the
absolute worst architecture out there wrt just about any memory
ordering issues, and the exclusive reservation is just another example
of that.

ARMv8 and even alpha got this right, and clear the reservation on
return from traps/exceptions.

Why did RISC-V copy the power model? (Yeah, I realize that ARM did too
originally, but they learnt from their mistakes).

Oh well.

              Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
