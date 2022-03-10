Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A36C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsjBu8KzAbqY0xoJ4+ehIwi13ddrbbGpEiRQeEt9QO0=; b=ZF6jTvwlTTqjm+
	0rU8vLZyLpsrlQbG1Dq6WVf2+IJorafaLYKBrsZnTt0CjFRh5BlBAey0r6ZbgHM3SdtH4L13f7/dW
	gXgx5sd0jrRCrZSrfDU64ojPn7KBsmab0RVQilwX9jUdf7FHdmfxq/hMMtXuX91j82IBWSzmw7rxD
	G3lQ+B879FxOth7soZ7Kxtya5qMfppD9trtwxQd4Dfa/Lo2ko3ACneWun7HPk7G+m2pPvMv+pEdiN
	DyQeK6GlZ8K7WuQZ6r/y18DHkljUuUwIAN2qQgSSSSRDVSwIUdB3fessDfmOrVLK9Zrn8PBxnmgYB
	pfB41dgMxpAiarerfYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSDdB-00BoGr-8d; Thu, 10 Mar 2022 07:54:41 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSDd8-00BoG8-I5
 for linux-riscv@lists.infradead.org; Thu, 10 Mar 2022 07:54:40 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MPoPd-1noZrc15U3-00MwXg for <linux-riscv@lists.infradead.org>; Thu, 10
 Mar 2022 08:54:35 +0100
Received: by mail-wm1-f48.google.com with SMTP id l10so2742894wmb.0
 for <linux-riscv@lists.infradead.org>; Wed, 09 Mar 2022 23:54:34 -0800 (PST)
X-Gm-Message-State: AOAM531ElCKyIAWzXmmV4twcKEPnRTIwCCO5w1iaYRfcub7nQKoQeHQ3
 ZFZHGOZw25X+sZ47ZdpO4YIjBtuggZsd4JWP35c=
X-Google-Smtp-Source: ABdhPJw6lJK7oDWz/cNAeVzWeOPph+sSjK3afpc+MK4se73oxRJof+LBgbnocQ/Dt2GG0ZcchC+GX8WIOl1cD+k9HRE=
X-Received: by 2002:a05:600c:384a:b0:37c:2d14:a2d3 with SMTP id
 s10-20020a05600c384a00b0037c2d14a2d3mr2468122wmr.20.1646898874485; Wed, 09
 Mar 2022 23:54:34 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Mr_z6h7eg1O8ZN5_qE-o+8KFFBum3CxyuDYeF50s1dw@mail.gmail.com>
 <mhng-1ed81282-b17a-43ef-9030-fc538d96892b@palmer-mbp2014>
In-Reply-To: <mhng-1ed81282-b17a-43ef-9030-fc538d96892b@palmer-mbp2014>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 10 Mar 2022 08:54:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3mzax-OiaxBcxM_RgKNsd6N8HW0odRmw38u2jKE5aYaQ@mail.gmail.com>
Message-ID: <CAK8P3a3mzax-OiaxBcxM_RgKNsd6N8HW0odRmw38u2jKE5aYaQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Work to remove kernel dependence on the M-extension
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "Michael T. Kloos" <michael@michaelkloos.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:y6EvQnE3DlcYvBleJij9bwfLn6Linv5SnvEd7nkIjDc1MixHgpZ
 gz5HBC1Z06cxF2qwunbpYWynYjUN9CrsEe1lBkupltVxrqosah03S9e9ww8eNW7EL9mTVP5
 CswiXEKm5YSgFaCajFSsVpHTzLlgsKAzJAmmVqUAEx65GcTCSFJI37G1HPHPtHFvUYrmY95
 Yc4ttQ75AvPRS9kpLV9bA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5+ztI3TqagA=:NYvbspUnqTNpFEvwIodQvc
 swNHRB2KwPcSQ3y0HP6KtkvJyDolraO26D5XJ2f2Fxg9kDuwxe1neDzQod/0PWHGaA9hmuDV9
 b+hCrQBfMHxkxpBse2u2rmpFxaSshZM1Jh+VTokxwJ/9UavhhhM0lvI32FA+IN6xdv3dTEtzn
 bdi/ji7zSs8BbY9IIfDxgMahapIEjoOdnnAqXvkkvMbgPA7+NlnHSP381RFsseI44Hh8IuT89
 yWqdiKhEcWc9sGusFDzwFrTuCqL2craOFMfAEhyW+8JAJbGzD2F3Wv1k1SR0Juhl5FGgvba1s
 mWZ39CfhcJxiFlKDgCORBktHB9csu1kjnSNV4xhc0u8eRPRT11xfBb6QPqXNC3hdgtu8tVbJP
 3BPl9VkubWDIwt+065PK0nOwQEdi1ODD0C7CoNqzF6homI8fp8JpC6ZGgHEqhK9YyQBE+n0eq
 cw5FiPGrZUZHkYvPdTH71oHAIc/WPLBm8ywzQCdWasMk+IZt1CWtIn7Gp4Kq2CSu1BM/5NGC3
 g4pX9kTEd9Q7yNoix4hBRIvK+pho1bOFN745at0qGw2I1vlVwlWNDfSdCRMiw2QTSMxeDgH6F
 l3PwOW4qogqIJGRZw+hGRZrGzMzZ5LVFsZimWwK1gx45zlje7sc83QkIs56rSRYjR5OgSeF9f
 WPmrbN6cH2qzf4WQ+ANRho8j/xBOTphwkzWgFHnk/sGHBOI9xgU8Fvrro3MF7TJQIQho+mkzB
 hkTGu928fC5u/06cobDDm7//fJ6EpMxFlrPRYQhFmgz1MRI7W2vsJka23zouQtHvVXY8j5uNX
 jSvujSZ0qkR+77qv8dLe8R8d+/ifoIage4uTse77Z44CWutIUg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_235438_941851_3FBD0C8F 
X-CRM114-Status: GOOD (  22.98  )
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

On Thu, Mar 10, 2022 at 8:34 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Wed, 09 Mar 2022 02:02:27 PST (-0800), Arnd Bergmann wrote:
> > On Wed, Mar 9, 2022 at 6:28 AM Michael T. Kloos <michael@michaelkloos.com> wrote:
>
> That'd be wonderful, but unfortunately we're trending the other way --
> we're at the point where "words in the specification have meaning" is
> controversial, so trying to talk about which flavors of the
> specification are standard is just meaningless.  I obviously hope that
> gets sorted out, as we've clearly been pointed straight off a cliff for
> a while now, but LMKL isn't the place to have that discussion.  We've
> all seen this before, nobody needs to be convinced this leads to a mess.
>
> Until we get to the point where "I wrote 'RISC-V' on that potato I found
> in my couch" can be conclusively determined not compliant with the spec,
> it's just silly to try and talk about what is.

I would argue that codifying the required extensions through kernel source
code is much stronger than interpreting a specification. Ideally the
specification
would match what the kernel requires, but it's not the end of the world if
the kernel ends up making decisions that are different: If Linux can do
runtime detection of non-M, non-A or pre-standard extensions and handle
them correctly without a notable performance impact, it can do that. Or
Linux could end up requiring things that are normally there but not
in the scope of the spec.

Regardless of who determines what the compatible subset is, I think there
is value in splitting out Kconfig options that prevent booting on normal
RV64GC machines (XIP, NOMMU, 32-bit, ...). This would probably
not include the non-M option, as long as a non-M kernel works as
expected on CPUs with the M instructions.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
