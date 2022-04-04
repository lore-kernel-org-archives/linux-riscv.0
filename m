Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB60C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 19:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fiN39V5YKl1EIjj0Vc44o0R9vk6ln9SJT5m6P5FsXEw=; b=PDsjW47oDW9IYo
	HqV0jc0Y/UuWBCTkgoEt4guik0Aw0BiyhUlZIqCDZIRxnM9lyDZaQloJKV/ZdGmrTPdR5bLID8RXZ
	Xe4YqK71/1WvirI/T3yQx6WVxBZ+yHktbGKiHnTPl8555c5smnprp0yEXD+K42JxwfkFaZGyxN5dY
	A1xl5qplg24q2mBA5zx3c59nujmA++gf+rPby5duKixl1FsGsLVdxzSD22SYhxzqPfrL5NbYP3yqu
	HFEL+qJryAzL2r8Cpbbvh/geqErauye7stMOAkBEAjOtNaIoE10681evfL8IfmdRm9RthectLeUeM
	NrmrY8TvFn56nRIPEE5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbSA7-00GFp8-9o; Mon, 04 Apr 2022 19:14:51 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbSA4-00GFo2-GR
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 19:14:49 +0000
Received: by mail-ed1-x536.google.com with SMTP id g20so12295722edw.6
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 12:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e+espoYszSZp1p1WHrGyTvFNDm47vVsucL53VCJGbNQ=;
 b=hoh3dyC3FDOpHs0Oa9MtXNEdb6T+MPU/rE4E97vtjQ0kFHrfOquVsSfCT02pnpdOSV
 UyvQyXxSUBW3xQaMhklyAsx+cI6YgpDwo6Od5vyv2DXvZJjXbkK+zPEFIo1Kj9WuKE40
 sj0TSnCHCztoC2luqCmQsVaZ9xcMzSpppRbkv6J9Pi7fWZWikcAavtIJ0+2Fj0GavDhK
 N+I/fFIREY/ExKnSiGF4Io2lqewR0hKdHvFw5GsWZrxBzB4D+BbVZKpaqrlipMVNNbLa
 9dYSzYeNIUeFyHb/O/hJUhfcQFnUIA1mrgDYcW6k+UXPwRMZUg9/3SgljqUAVB8jbvRY
 A3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e+espoYszSZp1p1WHrGyTvFNDm47vVsucL53VCJGbNQ=;
 b=FGgIqQm3kmWFRjBEnowK7KFQu6SIGUIm6t+ta/jLxPHlQA8/gI5dNGzLDQ/2NN7w5Y
 Bqmrz+mchbTwjlcs0Vsp897RKQZc22sf9sjbq576pLh8PQMcZc9F5x8hvs3AMYoVLbUP
 GvnzhvN/dBnghXjvU4Txg10oWKgyWHO1T5LvW4xkolq2+87qFCKK+PWpQz4NnVLcs7cx
 p36gqPLDS5VtIUW1XXl6j3ufIMKdGupy0ejT9XotKAzA7Hsb/PQ812XrFJooFlbkFgdt
 r5HcSqFWw9bdMjRciv2YNqDyNRNk7ETohX/Zlsiwi9IYv8zChlKXJHXw/a1W2BtSsXJg
 6alA==
X-Gm-Message-State: AOAM531y5LOzzxq8ki015z0IhZw6czdW3LACKbOI6Trzf3Jc5xlySVox
 Yib1BkXNgrNt/+Yv9sUtujwrsNia9kgPF4iAOwc=
X-Google-Smtp-Source: ABdhPJzQP+hf5SuJlHqDSZUr7Fy6SznLH3ME81HEeqGLMYxs1Q1hlk7PXHj0e2EC/UWg5Jyw7UYqSwUbEdHC+883sYE=
X-Received: by 2002:a05:6402:1941:b0:413:2b5f:9074 with SMTP id
 f1-20020a056402194100b004132b5f9074mr1704694edz.414.1649099683759; Mon, 04
 Apr 2022 12:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMo8BfKgn0T5RtUTb89fPvygNJJYLy7r1=RZTmTTm=jiDfx1hQ@mail.gmail.com>
 <CAK8P3a0J1--WSyWY+TptFa0nn5d-mOxapadCE1csGRkfhSPbVw@mail.gmail.com>
In-Reply-To: <CAK8P3a0J1--WSyWY+TptFa0nn5d-mOxapadCE1csGRkfhSPbVw@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 4 Apr 2022 12:14:32 -0700
Message-ID: <CAMo8BfLT8vMw3aGQPs1+9ry7W63SQphmDc4Tt4A3JvADHJhxiQ@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_121448_572269_5A48907E 
X-CRM114-Status: GOOD (  15.11  )
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

On Mon, Apr 4, 2022 at 12:01 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Apr 4, 2022 at 7:57 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > Please let me know if you observe any specific build/runtime issues.
>
> This is what I get:
>
> $ make ARCH=xtensa O=build/xtensa nommu_kc705_defconfig vmlinux V=1
> ....
> xtensa-linux-gcc-11.1.0 -DKCONFIG_SEED=
...
> /git/arm-soc/arch/xtensa/kernel/head.S: Assembler messages:
> /git/arm-soc/arch/xtensa/kernel/head.S:87: Error: invalid register
> 'atomctl' for 'wsr' instruction

Sure, one cannot use an arbitrary xtensa compiler for the kernel
build, the compiler configuration must match the core variant selected
in the linux configuration. Specifically, for the nommu_kc705_defconfig
the following compiler can be used:

https://github.com/foss-xtensa/toolchain/releases/download/2020.07/x86_64-2020.07-xtensa-de212-elf.tar.gz

If you build the toolchain yourself using crosstool-ng or buildroot they
accept the 'configuration overlay' parameter that does the compiler
customization.

Perhaps the documentation for this part is what needs to be improved.

> I think there were other errors in the past, but every time I tried
> it, the build failed for me.

-- 
Thanks.
-- Max

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
