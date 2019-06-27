Return-Path: <SRS0=5nvY=U2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED64C48BD6
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2019 06:47:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EF4C205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2019 06:47:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uKQkOjoo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="c6nSaZaH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="2Cyt6p7m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EF4C205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkEn6ugotI9Hd6eDRmaAdv8IAIJO8Y3EMKUSFUPI+YA=; b=uKQkOjoowaA+8C
	31e3rtTBhgDy4b36FK+t1J6f6L3Or8RjLvVbguoyoM5ZTrxOX0sBkydfd9+ETZDYbZ9yD44cHmOgI
	/VRWlScegj2ApJdpYROE5GM0XsDvQq/JXHyk6snGkyshDVOfEFORPdXcbGUXuAsLzFCvaV8Q+Xr6h
	YX7yCCyoQZeflpqPLFPSqFnEkkiENPPk7W7Pq24jU8vfvaG2OlrHFHbHiaLefkUJmBfq5ETTaKF5/
	DWp0EAW16aoqn9ip7Y1ZcJlCdScgXMjbslD4HBAOQ84XLerLyDcR5LqqYkGvXh2JBxGislfs3/LKN
	VypDgApPQ+bb7wl9ZFGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgOC6-0002KM-Vh; Thu, 27 Jun 2019 06:47:43 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgO8E-0006KM-4Y; Thu, 27 Jun 2019 06:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hUceC5AeeaszlwO9PeBwDuTy7hRVRhzHLJ1xX0slEKk=; b=c6nSaZaH1057hcDVEFiQifBjG
 3rNI6YLg7OK2xAlvKoo9FtuXDsRnyQmclZ/OJkfsfF4KwJVdzmJ/XFHdOvdR5RDDVL3LSAtJQK8Mn
 ovZKSqGPXFE9xHR2eOkm2IT3mm/6ZB489q2gp3M0lGdnDwNmjtErfEgrjKsBeFbQLaSdRHTOmvOdo
 DIqyNQoW71vTSIklMPDO6YOQnmAt2f/K29Mws/eV9LuRamWqmOHnIiRn94199s2Un0p4yRzoIkDgI
 Wc066BUnxJvvESGrrwzFq6tby4zQfKL1sb95mj7aThaNL6fpbRVsUUEG58JIRuQHDswyXa+z7Ooni
 1fgqIF+4Q==;
Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgKr7-0006HF-5Y; Thu, 27 Jun 2019 03:13:50 +0000
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id x5R3D6Nq018382;
 Thu, 27 Jun 2019 12:13:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x5R3D6Nq018382
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1561605187;
 bh=hUceC5AeeaszlwO9PeBwDuTy7hRVRhzHLJ1xX0slEKk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2Cyt6p7moE3aTxtO9LVZTLf8Js+TX6msHAzEQc2U3RWhpCafH3zcwX7L6dncx8NZj
 ockSog0czJt3lhCqCbLzNffVlAwojPSytljO9BO73VA05KUuFrmauuPIzOxtzCJyCS
 I5epEv29rqm491WP8MAtiIhEnlmhgxnbyjF+1EaPXAMrOVW0Tp8sy5BrWQ7xi5cIMS
 +la8c2fFA7Qz6Gsxgjb0dJKJI56ggjDPZDYsmLm17g/FfJteYLT0I79YEcy9pHsNwi
 0ZC+277O1XILPZP/vHnTygUbl9mom+Th9NKjBPsENXkyrtFEoxj3NwJvDj2HSBB8DY
 94rFlEoEYBGdQ==
X-Nifty-SrcIP: [209.85.221.173]
Received: by mail-vk1-f173.google.com with SMTP id y130so204168vkc.0;
 Wed, 26 Jun 2019 20:13:07 -0700 (PDT)
X-Gm-Message-State: APjAAAWnZIHDThqgcdgzQ1nwMUaVMY4gUPF4Q1sVrfeo0czcI+T1CgtG
 V90w+vUmHVWilECAq/QhMGtTQj1KtWALI962BHM=
X-Google-Smtp-Source: APXvYqyrO6AGMiLTE/NsWodSgUDnExRC/7L2ZBLMise97w6CNCIJwXhqUDD88sfQ76DyLQRs9XeF+xyViB4ZUlsc7PQ=
X-Received: by 2002:a1f:4107:: with SMTP id o7mr526475vka.34.1561605185809;
 Wed, 26 Jun 2019 20:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190627014617.600-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190627014617.600-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 27 Jun 2019 12:12:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNARr7mDaDdh0NxUjYHJCz7Gd9-gFdryWtT224U8KpJ9p3w@mail.gmail.com>
Message-ID: <CAK7LNARr7mDaDdh0NxUjYHJCz7Gd9-gFdryWtT224U8KpJ9p3w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Compile-test UAPI and kernel headers
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
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
Cc: Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Kees Cook <keescook@chromium.org>, xdp-newbies@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Anton Vorontsov <anton@enomsg.org>, John Fastabend <john.fastabend@gmail.com>,
 Yonghong Song <yhs@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Tony Luck <tony.luck@intel.com>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Colin Cross <ccross@android.com>,
 bpf@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 27, 2019 at 10:49 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
>
> 1/4: reworked v2.
>
> 2/4: fix a flaw I noticed when I was working on this series
>
> 3/4: maybe useful for 4/4 and in some other places
>
> 4/4: v2. compile as many headers as possible.
>


If you want to test this series,
please check:

git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 header-test-v2


> Changes in v2:
>  - Add CONFIG_CPU_{BIG,LITTLE}_ENDIAN guard to avoid build error
>  - Use 'header-test-' instead of 'no-header-test'
>  - Avoid weird 'find' warning when cleaning
>   - New patch
>   - New patch
>   - Add everything to test coverage, and exclude broken ones
>   - Rename 'Makefile' to 'Kbuild'
>   - Add CONFIG_KERNEL_HEADER_TEST option
>
> Masahiro Yamada (4):
>   kbuild: compile-test UAPI headers to ensure they are self-contained
>   kbuild: do not create wrappers for header-test-y
>   kbuild: support header-test-pattern-y
>   kbuild: compile-test kernel headers to ensure they are self-contained
>
>  .gitignore                         |    1 -
>  Documentation/dontdiff             |    1 -
>  Documentation/kbuild/makefiles.txt |   13 +-
>  Makefile                           |    4 +-
>  include/Kbuild                     | 1134 ++++++++++++++++++++++++++++
>  init/Kconfig                       |   22 +
>  scripts/Makefile.build             |   10 +-
>  scripts/Makefile.lib               |   12 +-
>  scripts/cc-system-headers.sh       |    8 +
>  usr/.gitignore                     |    1 -
>  usr/Makefile                       |    2 +
>  usr/include/.gitignore             |    3 +
>  usr/include/Makefile               |  133 ++++
>  13 files changed, 1331 insertions(+), 13 deletions(-)
>  create mode 100644 include/Kbuild
>  create mode 100755 scripts/cc-system-headers.sh
>  create mode 100644 usr/include/.gitignore
>  create mode 100644 usr/include/Makefile
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
