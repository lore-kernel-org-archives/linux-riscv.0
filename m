Return-Path: <SRS0=w96C=J6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E2CC433ED
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 13:12:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A576F611EE
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 13:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A576F611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tXTCCvn9RjQ0TDXd6TK58XcQTz3U30fMvIp+9jmOiZY=; b=jKBUbRoEL8cacmJXjvOqtBqA6
	yz/D8vtsg/dFs1NfycDzk3NMvj299zcYzNoI0Q3K4AtF0YH+N2Xc5C2CWkk96AGAyW9FfKi2461/+
	Du5r29Klcr/YQwqdggy0D0wHboDw80DflAbGfhAK1UrYOz/tzq8wnSQ+Dun1Btnk/gPXXnKwj1HE3
	4zaNLfk32JXUxP1WOLuTjLRtsRf+lGwtGxcoT5ciUJKmYFG1xB2LOHdDMYaRNwHeJGS9HGjgsmUwN
	3H+kqJZOhfF30wZvAv2TJXAuopavjAyUY+E3HzOU1sp5MnR7nGLnRCbG0GDASzjnAl5uq1z18dev8
	ZQhYP4wnQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldYMA-00DvaP-1X; Mon, 03 May 2021 13:11:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldYLd-00DvY6-7H; Mon, 03 May 2021 13:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=q6aPtToSrVgBi/90t1ZUB9kHaOhzD5C9bj4BQEcePPk=; b=DZkKfv+laICFJ1pU8rt5MMt0+o
 f8GbA99YbC0r8GS2NFgoCAOheHEG/wsixA0jEizhVh/dIl6M3aWRGScAjsPOdkIIaq7dnPMMURAGq
 k8ogrouosabf3hSgsdmPLpEFwXZFX6WmtIr9Zi4Ue5I5hOHGuzYQ/3dE4IWw+1vRZFo1eU6vrdeuK
 TQq5hif6uI52LMHX+tBdNe++mIw3X7i5is7K3JMUK7ehi+/DUq15OgGFFyk4IC+wVD93h5EGv9sva
 J67jmPEp2nso8fYVGh2+Zwd3ni6eAnlg9lD1odZ7s0VITEG1t/oaAda/Ifq3kcRk4Wmwy7yUI1ITH
 vmgIbuMQ==;
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldYLa-0035CN-Mz; Mon, 03 May 2021 13:10:51 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id b131so7422143ybg.5;
 Mon, 03 May 2021 06:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q6aPtToSrVgBi/90t1ZUB9kHaOhzD5C9bj4BQEcePPk=;
 b=lqGGCtzE5m8F9orYtPate6N4BTFbRDldnXzGj2tE87HBcn1BRn7f5XfxsJmYODrxik
 e8EkfaDCxloU/Q9iBapQyXgVjXP0S4DEJ0fXLrl9h3WPztOm88MubRYvbs9d3jfqGqx+
 iy9k59bjEyTqA/JJgPQ3YBDSOg4s+trVOYoxK6J7Lt5Gi2GwquvTtB02IITfC21XkxNA
 lGyAB0OIcRbwh0FVuTlthtGxfWSXpeBK0cMQGMm7c6fDD1CV4+4N2Ay8M/08fvry9jyw
 TF22FDOSLWt3qkPw5KtV5L2sv6tZ8jOFNTAw83cA9C4ThWwXkIpT0aLKrSpPx/QUefiX
 Kbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q6aPtToSrVgBi/90t1ZUB9kHaOhzD5C9bj4BQEcePPk=;
 b=WBXUqJObo1PlZiVuD+GCFKFpTgTkLFjxT5yciYLbWggJKNP9uDMl4F5x1mmYzOCzNi
 r9DSJ0zz1BFFbNbvOTusQIpgBOGhQY9Xj8PuvIDF8/uDPbuyGqxvyEjG0zitH/iuI/M3
 5PxXabs5TCMjhcXedWxRtT2Nz97U+NgVf2IQ1x/mUaK6337Xlqg3PRbFkp30KDwklRSr
 Tlq0Eg2/wO4Az0Eb+sAmOJlHxq8whSIg4EyVhbM8Piv5zkr+h4Q0yd2jXxPOf1DDOZKc
 b+Yl/PDlYnuXU82LXGKewtJw2nvl+UpPijNbtS6cPAy0g93AKDYnKfRwf7zaToXXiwFo
 ObVQ==
X-Gm-Message-State: AOAM531hQYGPbdAHBZKJRB+3LnHfRLeAu3nMVPvcOfZZUX+dJkIYAcQj
 oBaDzR5l5XxgTZz7oHgrBHt0fd0aMLs3NgMspao=
X-Google-Smtp-Source: ABdhPJxvygbDWGxmRr6V8Vm4D83Fq4MRol9PEQb74s8BS9df3UUbSP8yls4vcRx2kU2tZhdFxHQp30hnnaM7RamlTpQ=
X-Received: by 2002:a25:7909:: with SMTP id u9mr25466002ybc.22.1620047448169; 
 Mon, 03 May 2021 06:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
 <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
 <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
 <fc0c7c092f274ab8b760b3c897830347@AcuMS.aculab.com>
In-Reply-To: <fc0c7c092f274ab8b760b3c897830347@AcuMS.aculab.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 May 2021 15:10:37 +0200
Message-ID: <CANiq72nyvrb6ZrVVeaT9py7D_Sv9q-a1HGYH-hNpqfmcCmb4dg@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: David Laight <David.Laight@aculab.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Segher Boessenkool <segher@kernel.crashing.org>, Joe Perches <joe@perches.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_061050_769231_9AF0401A 
X-CRM114-Status: GOOD (  13.32  )
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

On Mon, May 3, 2021 at 2:20 PM David Laight <David.Laight@aculab.com> wrote:
>
> It would be nice to be able to build current kernels (for local
> use) on the 'new' system - but gcc is already too old.

I have seen such environments too... However, for the kernel in
particular, you could install a newer GCC in the 'new' machine (just
for the kernel builds) or do your kernel builds in a different machine
-- a 'new' 'new' one :)

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
