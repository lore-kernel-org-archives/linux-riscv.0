Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E86C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:21:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 951F0206B6
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:21:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I7tij+oS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewfQav9n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 951F0206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wZJwukH7bAD2qeBN/wOXqBObycnegooCDVvdDFunZlw=; b=I7tij+oSVPjSIqj0t+mCDAvJI
	qsoxAAMvo4NrIJYsKcYys48kMnC5MGYdNpIjVogqmedlR7k+rT2DGCLaYG5DNsSVvVQFJkr/THqNl
	lpIQm5pe42uEzFZHn0lrUxrzSvPrZ8PNnohGWmdjumr59yweHnsTQWL5a4i5efvtM4hrIBQ4bUWTl
	iAD7Qd55VXQyZytzNe3XloMF9nLf2xkxLA2y1SU3uMAWkB8zqwbmzSx9RbORkkzodVTeR18yC7Ann
	bFLmlWgFjtSEWc5ADouU0N3t3cl+7QiF0cZhpom3I4RKKO6f7l/slfZsKsSADrAyh3aSIBFqFxboX
	ha2fXxTsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqGCD-0002IE-E7; Tue, 30 Jun 2020 13:21:09 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqGCB-0002Hn-0b
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 13:21:08 +0000
Received: by mail-lf1-x141.google.com with SMTP id c21so11363095lfb.3
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2020 06:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KWkVGicphwK1OxmLpzetvb0uUbv6wWAa9xI/ZfZGH/M=;
 b=ewfQav9ng3ArYRXxMQJn8NjDlhNjtzk6/mEyk4fXdozgaVXVm3F1HkQwpdhNGiK36q
 lqcxPAVAip/JBBJgbprbRmFEWde/F4Ul0ZBGMGILuv9VD2fsiNjwOm44mvVl1cPwB/3Q
 hNplYBeqyYP8R6Bg44aEaOoZ8bknPtsxOc6MxvfmjrJ+zPCEBwVhWQqF1qIiZDl1wY5r
 1dpwpNFRFGmrQdCsQy7j3deoxxWgbVSGAQxmG10/1EuxsKXJlUaYrTG40MeEWw5UcPq5
 fzcra7of8QmaVCYRbnOkrlIcHbfhmq/CBAWLo6XvtolNGaBIAOLajuDOwwm92SurIcft
 XtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KWkVGicphwK1OxmLpzetvb0uUbv6wWAa9xI/ZfZGH/M=;
 b=YJiqjS7bgHZGw8h8nlw1D/Buxr2aA494SHL3AR2AoIXTaeaRVcVJNQZorBndfIWzl3
 F9yVcs5wL6vUCCJ7ioHDLJ+GXW88hr/QKch3bNhZ1Ia43HycKL6/ubzN+3XmNAO8JSQv
 F4yAzzCz1xM2reEAludsTfuiLsE4Pzjnthuvfuo8cgYZRUzGjpXJVeRZ5zunWtsUxz0I
 ldPRZf+7O0VfeEIqCN608HoW7CVkMSC8ldBxwyTKtuvCOYsHBSqoSMRQZ0WrrHVYSyxT
 cD54s6LgB0CAw0wvvkldY+zDUzHqOBkjlef5U8OaE/g8TeSxE4SabdR440FVJ7+NTaMN
 8PSA==
X-Gm-Message-State: AOAM531+OhB1zseFfP+IE5PmZN0u/xO+XRcRrkh1l120MIEOAt/7c0Gh
 sWzBLIamkItTC2Ni3f3jf9iD14dVKLrOaGA7IyA=
X-Google-Smtp-Source: ABdhPJwQDn6dZoyHu7mDPIr8/JgWPGBLhoctctfImjK9hpSJXzY96y09pkchSxH3FeO5Blontx8H3V3HGtPLXMEMAhs=
X-Received: by 2002:a19:bc2:: with SMTP id 185mr9798763lfl.204.1593523264016; 
 Tue, 30 Jun 2020 06:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmlfk4n1mj.fsf@suse.de>
In-Reply-To: <mvmlfk4n1mj.fsf@suse.de>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Tue, 30 Jun 2020 16:20:26 +0300
Message-ID: <CAEn-LTqVR4CXk-q=7zwFKvgmHEZpP+AO0XiycKf9mDAHS60_yg@mail.gmail.com>
Subject: Re: syzkaller on risc-v
To: Andreas Schwab <schwab@suse.de>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jun 30, 2020 at 4:07 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Jun 30 2020, Dmitry Vyukov wrote:
>
> > Maybe it's a known issue? Should we use tip instead of 1.14? Is it more stable?
>
> Go is still broken, it doesn't even bootstrap.

Could you elaborate? I have Golang available in Fedora/RISCV and the
bootstrap process was fine (after the TLB bug fix was applied in
OpenSBI). The current stable release is missing cgo and buildmode pie
support, but otherwise seems to work fine. I was told that cgo and
buildmode pie is supported now, but not sure if that will land in the
next release.

david

>
> Andreas.
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
