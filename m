Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72071C2D0A8
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 18:10:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9621E25412
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 18:05:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P2SPwq7f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9621E25412
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gJNx3macYAJqVZRGLA2RPUxE645Jxo76mVaJFpI9JMs=; b=P2SPwq7ftogdimuhAp/ceZHPT
	JzeU2Fuq5KRg/g8mGffB7FOshtQkQr8Uq+J5dJuMGd0zVsT9RawPPm/4MX13YkB08BAd3npFNo1Gy
	Q37SV1N5sAmiQ6kFYOnmiy/d4m+dspOGVo8Q4zF5vGqKUHN4HlVKsAtFh+6lR7vADRKeDioIFaUJ7
	8mfiZfl63jorotK8ua13hMyXzTO3lyq+7z/A8FsTEKTEvSxCa9IDPfq7H3cYNsLi3Dp07/HPnCWXq
	y/VqFoQghqk5vq+HH8szXFSbREUUfMNTkjpQ4Oc5jQFFX9HYXdcFLLLwYQZOAOz2YC3bV36fD3OF0
	Qlg1eXptw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEG5C-0008Pa-81; Fri, 04 Sep 2020 18:05:06 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEG59-0008Oj-Ox
 for linux-riscv@lists.infradead.org; Fri, 04 Sep 2020 18:05:04 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MxE5Y-1kTc6v3W5w-00xZnf for <linux-riscv@lists.infradead.org>; Fri, 04
 Sep 2020 20:04:54 +0200
Received: by mail-qt1-f177.google.com with SMTP id 19so3820688qtp.1
 for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2020 11:04:51 -0700 (PDT)
X-Gm-Message-State: AOAM530aUojfVfbiERd4+Hlkn1LlDauNUTiR5c4LLstjpezCdU7J6qZA
 cLI6ZXVYZpP9bntvZcBHtZmeQSYtKjiHiRQhuus=
X-Google-Smtp-Source: ABdhPJwKzhgqFAMC09LYvzrY70ahhbEpa/CeWyBR83Ccx3AuOB1/vZONwnfNbBWCJD4p/77P5oC/C+vZjOmK8LQVsYA=
X-Received: by 2002:aed:2414:: with SMTP id r20mr9970750qtc.304.1599242690288; 
 Fri, 04 Sep 2020 11:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200904165216.1799796-1-hch@lst.de>
 <20200904165216.1799796-4-hch@lst.de>
In-Reply-To: <20200904165216.1799796-4-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 4 Sep 2020 20:04:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1=udSEq8kpsmLk-b7ye0p=6eKTvBV74jBoGYmufL2oEw@mail.gmail.com>
Message-ID: <CAK8P3a1=udSEq8kpsmLk-b7ye0p=6eKTvBV74jBoGYmufL2oEw@mail.gmail.com>
Subject: Re: [PATCH 3/8] asm-generic: fix unaligned access hamdling in
 raw_copy_{from, to}_user
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:kOG3PBDWV3xFu4ak5a+JzYXtfHoaUgY7yebUpeNUvE7uFyl0mtI
 5k/u5oK3jIEHTL5G1SHnzwetBddE6Af1NOB2CvYKXXY0L8nTZ85OfFsoD0iRbLoXXjqDvw3
 0wL/IwwDEDm+qv0pTEPyZGbBCUfVKvJz02cjxAW7Pk+DOdPzgXAH/6rQUQRddqDxy+Tfm3P
 HMzsshCD11ApBL8wX3TiA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eV2tmCmo9Fw=:POIvjXOYdkHotZ5VObjuY6
 KkMJhIvOo5uQw5TAZrqb4luXacjntpXVpKdFkpFyNKYCMeEU67rOkogJlvqI2xxrbPJF0ADm6
 E3zLWBJ5YV+9psHqHfHFYpv3pyK8Nw6lXb6WoHKl0vqqX4Vvat1kJ0tQ+/DaJSGOLSek7b5Fk
 rCHezO8czdxWkx4zyATue37UJZ0DtyDqDuugvN40PnsjPohxW6L6lPgFgwp5jB/LYuDdlh0y4
 yhJ3P9220+74Dj2JoX+wXmAO2HTzZtuiPja3V2LEtUtpu4pSnSVOHGitX1oh+wcqH8oUT3JjG
 lv7n4TilMS+5TnxdwsmkVJ32XBx57otKLrPTHt7rCVZxDRimG88Wt9fqQH63o8n9Y1kS7TYy4
 gsn2M2ng30h4j34FO8zDLE0hKgQI8J4aI7PrpVQ2CbR80ApWm6JhIZbPlW1SfAjDjpCBHdcCt
 QR+AZWxez0tbVjFQVXRvk/R4KKz9llWRrCygZVBKUW6o+Xj3TmKNlVhxVZc5G0mzCN2PjtaGI
 ydNNlPGF7RWCg2QeB9T0RE6gLJxERk6sOOI9slvUAZQI6BxRYFrwFjy3PjJLBCgaoHPA1o0Nk
 DyMzuxi7vmydVrVjtJ4aaMea16HLk7OaU5gVpbTeAIoUBE1JDbBypGxmXTgFYTLbzRnm+GB+N
 uUnDLgSw4sa2XcPzDJoA1I+IWJNvG7fzV6U+2O7T4Mk3Ip84KZqyzLQQnyZXyHafpqr3bhMD/
 hKt55RrAzRhjsV312kGbUW3wTmfMDoDei4naydJ+UwaxkHN0eb7axvp08GSye6N/a60Cit6lM
 fTuY3xC10TqcyeiS0xuePKBAPVWc1Mze+TvnyHsHU0G3IjyXk48/jkosEIY0zSRDWYHAXpXxc
 IOf7LvDEeXuRGB5u4bpgZ6O2X/r/SA5c/QQvpMHulbooiJ/gpfYRo2nJ/9VRzIWCYhtlQrYCe
 Cr7Yr1KsXLcjOa73g2dhN8l+RcT6OjQ3ag3jNHRDVZw38B96qaWzL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_140504_027486_2F35CFA6 
X-CRM114-Status: GOOD (  21.10  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 4, 2020 at 6:52 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Use get_unaligned and put_unaligned for the small constant size cases
> in the generic uaccess routines.  This ensures they can be used for
> architectures that do not support unaligned loads and stores, while
> being a no-op for those that do.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/asm-generic/uaccess.h | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
> index cc3b2c8b68fab4..768502bbfb154e 100644
> --- a/include/asm-generic/uaccess.h
> +++ b/include/asm-generic/uaccess.h
> @@ -36,19 +36,17 @@ raw_copy_from_user(void *to, const void __user * from, unsigned long n)
>         if (__builtin_constant_p(n)) {
>                 switch(n) {
>                 case 1:
> -                       *(u8 *)to = *(u8 __force *)from;
> +                       *(u8 *)to = get_unaligned((u8 __force *)from);
>                         return 0;
>                 case 2:
> -                       *(u16 *)to = *(u16 __force *)from;
> +                       *(u16 *)to = get_unaligned((u16 __force *)from);
>                         return 0;

The change look correct and necessary, but I wonder if this could be done
in a way that is a little easier on the compiler than the nested switch/case.

If I see it right, __put_user() and __get_user() can probably
be reduced to a plain put_unaligned() and get_unaligned() here,
which would simplify these a lot.

In turn it seems that the generic raw_copy_to_user() can just be the
a plain memcpy(), IIRC the optimization for small sizes should also
be done by modern compilers whenever they can.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
