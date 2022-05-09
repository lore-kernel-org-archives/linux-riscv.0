Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B11EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 05:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/bwxgurwvvCTUVrqFghvCPJMPu6OIb0ybaYAajJU18=; b=0uMxt5I6M/wNAk
	kXpYgbaGvGD9vzbjP33895ti50kYygVc7AQtr/MisOZdQnOCtoQsSXKTdJ+Yn1I2PAXVlS6d0hqHV
	2f2izC16p4hRPHA5FlPMRqmfwf7L3BilMe44faeuqhIkdtPrGyXvp0SgKL1TXVYKqdv516vsk5arA
	mNAmr5sEqPL4oYJa13HI0/UrZXMdN+xtXU7odnpFcw4+peRGEidvOOW6HCxwh95HRCv1N/9Jw5KNB
	lMuC67MVp/f1NEmjgUhwSq1fdwxL4dvtX9uJ4AefAFTIJ7S4X8CCT9q7TFslufkg3RwiB7XP8ntuG
	ciHx8OwiHNxSsvOQZJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnwFO-00CZuH-4X; Mon, 09 May 2022 05:47:54 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnwFL-00CZrv-Cl
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 05:47:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 k126-20020a1ca184000000b003943fd07180so7611747wme.3
 for <linux-riscv@lists.infradead.org>; Sun, 08 May 2022 22:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lhjB+0fLqvVfgEW7nyDfKQG6j1ynFgP4NXUc8d2xwM0=;
 b=KRBKPxV+qsGatSWPNAc3af3H5ujwxrs+Gr4pVdA3sBnGGPhWhQGPoUsRMVfVwjGa8j
 BRwOOMwqH/BzQZnX9jaFYzJ3OibUiMA4SHKqxXI6lcf5NuQPNtjEYGayAZjmfEuE9NU/
 r76isaumn9lMtqZGvlFDl4ajlk0FhNpASTSF9v4cwSVq37OFP40NTs1AP8L97gsXfb/O
 Lu4uvNTjfW40FgGojYmF/GKAMnkaoGJxLi6h4uLsDIqN9X4AjULKqsA/mpibHQcF/WaG
 VZKXAjCy8fkbeYEFVbywdIE7WtOOLDH1Q1YuMO2sv6JUhiTPI8WmiCs+mJJseczfJUAK
 LYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lhjB+0fLqvVfgEW7nyDfKQG6j1ynFgP4NXUc8d2xwM0=;
 b=pxrTmGhyLFoqiCcpRQt3L0XkBeCZsAupbS4GfBhEUnoTVU21D5i3tdCqZg3Z3oiAEW
 UpyrTbS3WJy4lsEjwjclqPJuvqun9H8hpzw5HT5HsVeacWA+uPnLCitnmiDkRUXY5asH
 ucUnWJVd22jFjM1G8JDS2Ac6EnOs2ZIv7/cAVnNjwIF6+57/oIKN1D8RWhudWXhfRaDr
 P0hRN7fIaMneAd8fn/R3cO53hGaIyY+Dgo26PD69l11Q4P0wOzny21mqtv8p3BZ3ku7v
 9pZsbjMoMB9ItYkd2eE/DsnJjQw/fxpbKr4Vq8vtzo4vBHur5iUFLUZ1b3U/xtbP7k5u
 VjYw==
X-Gm-Message-State: AOAM532hBo34ndKcBn3jXb7ICg+I8jJHILd0pWQyp/KiZjbzbFofcE/i
 4dJXKk8bF9UvKECp+Mj99q/d75me+/RlBAD3DDifXQ==
X-Google-Smtp-Source: ABdhPJy6eKa8jOFSpWN4A5O+QMgITHEAyUrGpHyC5wDtjCGOldB0UCq0bDht4iqGngOrVCjXcZWNcYVLIZBj+rjLbNY=
X-Received: by 2002:a05:600c:1d08:b0:394:54ee:c994 with SMTP id
 l8-20020a05600c1d0800b0039454eec994mr14116539wms.137.1652075269206; Sun, 08
 May 2022 22:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220506094512.116729-1-jiapeng.chong@linux.alibaba.com>
 <CAAhSdy15CE5ZUROH-mOwhpR0AuwsK8h+8W-Kd0jxwsTixpQOQg@mail.gmail.com>
 <918affc0a0a91dab08647696ed6587021264f25f.camel@perches.com>
In-Reply-To: <918affc0a0a91dab08647696ed6587021264f25f.camel@perches.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 May 2022 11:17:37 +0530
Message-ID: <CAAhSdy1iVV1qfpaYcr+XuFjMYz+Df4vCdcJGLOYK+MQO_y+PSA@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: riscv: Remove unneeded semicolon
To: Joe Perches <joe@perches.com>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 KVM General <kvm@vger.kernel.org>, linux-kselftest@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Abaci Robot <abaci@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_224751_464944_43D4DDF9 
X-CRM114-Status: GOOD (  11.47  )
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

On Mon, May 9, 2022 at 11:06 AM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2022-05-09 at 10:37 +0530, Anup Patel wrote:
> > On Fri, May 6, 2022 at 3:15 PM Jiapeng Chong
> > <jiapeng.chong@linux.alibaba.com> wrote:
> > >
> > > Fix the following coccicheck warnings:
> > >
> > > ./tools/testing/selftests/kvm/lib/riscv/processor.c:353:3-4: Unneeded
> > > semicolon.
> > >
> > > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> >
> > In future, please CC kvm-riscv@lists.infradead.org for KVM RISC-V related
> > patches.
>
> Perhaps add or update some MAINTAINERS entry as this list is not
> currently specified by:
>
> $ ./scripts/get_maintainer.pl -f tools/testing/selftests/kvm/lib/riscv/processor.c --nogit --nogit-fallback
> Paolo Bonzini <pbonzini@redhat.com> (supporter:KERNEL VIRTUAL MACHINE (KVM))
> Shuah Khan <shuah@kernel.org> (maintainer:KERNEL SELFTEST FRAMEWORK)
> Paul Walmsley <paul.walmsley@sifive.com> (supporter:RISC-V ARCHITECTURE)
> Palmer Dabbelt <palmer@dabbelt.com> (supporter:RISC-V ARCHITECTURE)
> Albert Ou <aou@eecs.berkeley.edu> (supporter:RISC-V ARCHITECTURE)
> kvm@vger.kernel.org (open list:KERNEL VIRTUAL MACHINE (KVM))
> linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
> linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
> linux-kernel@vger.kernel.org (open list)
> $

Ahh, I see. I will certainly update the MAINTAINERS entry for
KVM RISC-V selftests.

Thanks,
Anup

>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
