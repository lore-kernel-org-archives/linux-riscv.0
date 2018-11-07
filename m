Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A12FC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 21:12:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5CD92081D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 21:12:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f0ZbAC8a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0Y1X8wK8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5CD92081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6B8TREVMAKN8WyP5hRiPp9IqH7X9Xocfg0Fem1znoI=; b=f0ZbAC8aT7Lukc
	wohFKKNaE3/tiXSNyuCeoQtd6WKmfH0Nv7cuuvv7hjdn5GGQfpVgLpfBDyTNaQWOMGQvxN7uUYStp
	sao2NV1dyugmV5WxVREiWzXsjmJOkoADQP5rJeMTqvBZJhUUQVODCLxFumOHSoUG78Sdr4hq5rXzD
	b4FUIC/BQ/fQ6yzpGfV7H4n8YWvyOCGQ64tTeRx9abCH+s3AVxUbK8Mfe8fpWRP4z85fgw9thizlY
	7rg4Pb/mCUEc0aM5O+xkSjnqSLcehmR09bxKNdSdhz0MoLNrZChw0vGZmHoHpDoRtn3rmb5E4Xg3t
	wRwnhpOZclto/lKVHaxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKV83-0007G2-6H; Wed, 07 Nov 2018 21:12:47 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKV81-0007Fw-NH
 for linux-riscv@bombadil.infradead.org; Wed, 07 Nov 2018 21:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wGzliLx73ZwkIJWijndfyA/4H3dDPiVRuD5SVTlXJTw=; b=0Y1X8wK88tBmwLnhBweSgOCQa
 SVR7VT16GxAzQikzxt0G2ENvFR2Vq/9wQ+XVSkbIaFh9dyJfgi+fzcSoL509gH0KUsgvNYqKbL38R
 nZxCsNHF2oFQwNVbqaG4uNksQO5ghnr9ccyJ8fZX3NntRyDTfTZFAaMMCYyfa6/jFIeNjocouBuhr
 nbDKlsnUn/hdUE0WawnmMtqyZprhpcWK1QxLC7LXZ74DpcinEphffrT3zPEo27iGwmNT/1KRE4axa
 38Z3hdohuqe4mMieYGGh84hh94ccUmZI2XUt/RXdTvbbi1s2NCP+te0IEsHR1SiAOGWAkQZxuSedz
 pPt9nAhwg==;
Received: from mail-qk1-f195.google.com ([209.85.222.195])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKV7z-00035u-2n
 for linux-riscv@lists.infradead.org; Wed, 07 Nov 2018 21:12:43 +0000
Received: by mail-qk1-f195.google.com with SMTP id o125so23015024qkf.3
 for <linux-riscv@lists.infradead.org>; Wed, 07 Nov 2018 13:12:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wGzliLx73ZwkIJWijndfyA/4H3dDPiVRuD5SVTlXJTw=;
 b=Z6H7IJ4Ojudlbz0khMMrjpTu3/13Kz7U/vXhCaIZNDNRCchaV8hHbfrRy3D61DyHHz
 8tWAo7G9Or4XBnGjb+WY8umi8imaxqwYHWhI1g9QnDDArlm6WeXaCCvTz8MWt3sHfVxI
 jBb07H+bFj9rjA4lCzTLjHlPrCO++WDqr+w/HSTw3RbVdKUsba43veCxHFcEZABAGPUi
 qBpkLJTVnBAHmYC44wMISzz2ZgvPfu5KOgx68En5dhQPCRCudky4pCdQDrgy+Dn5k3zS
 NkN3DSKhd+tUFYqBdRZwOXFqLWzRbcz1/23fcb9DVlRwZHgQzIQ/gSi85H18Z5vL0kRb
 apuw==
X-Gm-Message-State: AGRZ1gIh56t3A/73kMfUck5Lmw3R91R2BSEKd5Xc8b1iL6RhmWLpuloD
 nCv8ifjlXs6y2tjhTdzuNN9segKNysj1Ud7Ed6o=
X-Google-Smtp-Source: AJdET5czEjtRspTpIdzbmYUUm0MfdoTZ38lGEl3NgTkQTh5x7niGeN0zPzF6/ljoq95FmjEl4LAY226oC7bxurR2L5s=
X-Received: by 2002:a37:324a:: with SMTP id y71mr1798545qky.291.1541625151764; 
 Wed, 07 Nov 2018 13:12:31 -0800 (PST)
MIME-Version: 1.0
References: <CAEn-LToUoaA0H=_boLUi6SPXyo5Wfge293GbOhgxw2-JcZDKmg@mail.gmail.com>
 <CAK8P3a3KgBq72763QQauKNWdSv9ZRRUWMDxt1RycV6RxAJsCng@mail.gmail.com>
 <CAEn-LTr__59kApb=kkm7aH0z4w-J9xG1rzhK1xDk3xCGSis9SQ@mail.gmail.com>
In-Reply-To: <CAEn-LTr__59kApb=kkm7aH0z4w-J9xG1rzhK1xDk3xCGSis9SQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 7 Nov 2018 22:12:09 +0100
Message-ID:
 <CAK8P3a1hXOkL69qyu6PP3KM=ax1kVUtm5QQn1+xoExjONC_1fQ@mail.gmail.com>
Subject: Re: warning in ./arch/riscv/include/asm/module.h
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_161243_196530_693180E7 
X-CRM114-Status: GOOD (  17.13  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107211209.jRo-JQlhstnYl7u0YkyM6KqSBWcm4zmWjnPnuprYFwk@z>

On Wed, Nov 7, 2018 at 7:26 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
> On Mon, Nov 5, 2018 at 10:02 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On 11/5/18, David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
> > > BUILDSTDERR: net/core/rtnetlink.c: In function 'rtnl_newlink':
> > > BUILDSTDERR: net/core/rtnetlink.c:3224:1: warning: the frame size of
> > > 1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> > > BUILDSTDERR:  }
> > > BUILDSTDERR:  ^
> >
> > This may be much harder. I've fixed this type of issue for arm and
> > x86, but it requires a much more detailed analysis of what's going
> > on. This is often a compiler bug. Which compiler version are you
> > using?
>
> Ops. I didn't indent to copy this one. This one is expected as Fedora
> has CONFIG_FRAME_WARN set to 1024. Only couple architectures
> set that to higher number (2048).

Om 64-bit architectures, setting it to 1024 causes lots of extra
warnings, since we have certain functions that put an array of
128 pointers on the stack. The default value in the kernel is 2048,
but I've managed to reduce it to 1280 in the past. I never managed
to get all the patches for that included, but I think that would be
a useful number if Fedora really wants to have something lower
than the default (and then fix the outliers).

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
