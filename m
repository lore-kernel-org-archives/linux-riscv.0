Return-Path: <SRS0=a7a/=U5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA26C5B57D
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 30 Jun 2019 01:36:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F320621743
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 30 Jun 2019 01:36:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Iank9JLb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="yvemeWLv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F320621743
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6gJjbSDRGjoRzJhnvRKzbv5yehPXTYe/CR2tWXvccg=; b=Iank9JLbjRT2uB
	H6Aur/HvbLGAXf6gQ00Dn0wy/L2wTliY43Kg1zieLkWxKO3aRibjAtrBxczvpDcmS2z4tw5HYGGeK
	irI9I6IDVNsnJAon24zEsF0XmgeoCs6KxyvlQHaI0iUBmqwnj3CEsJb6+dEj5ZL2WT7MNRggXHruh
	7i2faVZgMIwzNSTz/VDSOFp7JOa4vnqDHv+NQaWj8YgLsZ+hTgpbV9X/ugivcFJakQA0La6lom1ww
	/SX/AJQQEI5rt2ztajFHPYG3/MmkXkIwH6OXW4uQzTEBppt4gpPQSA9VFNPyzZsxbk4+NI1LyfRdc
	XzUeER5fkRU/WZdkRvkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhOlY-0001ZB-Nr; Sun, 30 Jun 2019 01:36:28 +0000
Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhOlV-0001Ym-9a
 for linux-riscv@lists.infradead.org; Sun, 30 Jun 2019 01:36:27 +0000
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x5U1a1Hx028524
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jun 2019 10:36:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x5U1a1Hx028524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1561858562;
 bh=GsxC4tEwPTMvxmjodyniSfKM8XvTWF4ZQPqzrB+b+MI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yvemeWLvba4Q8g2UVjnLIv15lSYwXP0TgSL9KEbz+SFcM8iUwyGgz6gG7JjR97M+6
 tpk7uLnaampMdiIpqfZ2lxTSVX020UTdbzmnVLNK4vxNUYFo8d/7Tw4WuKPZDidlIC
 BCUVUBBXShv4vZ+BL695j/CgsIYneCDDxUi1KyroulEfQOGtZx9pozt8eZT6ee9yHU
 VIP8tW0QZimtukFY2zDdO/4vd6SOyle4azblBK7rGJtJ2YrkWQ+XCFBIcIt8O/pHzh
 lXFAY5/5hPAoF8w4XYQg7z/W8WXDNDa4W0ziBOWK7e/HdpHcz5ZK0gJq7ke5uuA+Xo
 k2YvKzjzAof5g==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id l125so6550473vsl.13
 for <linux-riscv@lists.infradead.org>; Sat, 29 Jun 2019 18:36:02 -0700 (PDT)
X-Gm-Message-State: APjAAAW58EFeBMvSrlzgVA55lIgxcE1ujbKttbqg8txOdh2+q/+jifzZ
 CNXZMYvVLjoeU8z35a1s61/keX/WU/v6Hxq+LXM=
X-Google-Smtp-Source: APXvYqxTVfy5EI181YpdOobkJbUfPJJwcnBGg16qjvPUW9JsxOT1+iFiAuvukVbwRgwDCIlcEtkvBLkcCf0+BEALY6g=
X-Received: by 2002:a67:8e0a:: with SMTP id q10mr10752837vsd.215.1561858560929; 
 Sat, 29 Jun 2019 18:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190627163903.28398-1-yamada.masahiro@socionext.com>
 <20190627163903.28398-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190627163903.28398-2-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 30 Jun 2019 10:35:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ4Z0BxqFrNdQDWJqbJBW9bSvnzVkvJTZZ-1mMKD7Y6SQ@mail.gmail.com>
Message-ID: <CAK7LNAQ4Z0BxqFrNdQDWJqbJBW9bSvnzVkvJTZZ-1mMKD7Y6SQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] kbuild: compile-test UAPI headers to ensure they
 are self-contained
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190629_183625_558857_5263AFA5 
X-CRM114-Status: GOOD (  10.71  )
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
Cc: Song Liu <songliubraving@fb.com>, Michal Marek <michal.lkml@markovi.net>,
 Daniel Borkmann <daniel@iogearbox.net>, Jani Nikula <jani.nikula@intel.com>,
 Networking <netdev@vger.kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jun 28, 2019 at 1:40 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Multiple people have suggested compile-testing UAPI headers to ensure
> they can be really included from user-space. "make headers_check" is
> obviously not enough to catch bugs, and we often leak references to
> kernel-space definition to user-space.
>
> Use the new header-test-y syntax to implement it. Please note exported
> headers are compile-tested with a completely different set of compiler
> flags. The header search path is set to $(objtree)/usr/include since
> exported headers should not include unexported ones.
>
> We use -std=gnu89 for the kernel space since the kernel code highly
> depends on GNU extensions. On the other hand, UAPI headers should be
> written in more standardized C, so they are compiled with -std=c90.
> This will emit errors if C++ style comments, the keyword 'inline', etc.
> are used. Please use C style comments (/* ... */), '__inline__', etc.
> in UAPI headers.
>
> There is additional compiler requirement to enable this test because
> many of UAPI headers include <stdlib.h>, <sys/ioctl.h>, <sys/time.h>,
> etc. directly or indirectly. You cannot use kernel.org pre-built
> toolchains [1] since they lack <stdlib.h>.
>
> I added scripts/cc-system-headers.sh to check the system header
> availability, which CONFIG_UAPI_HEADER_TEST depends on.


Perhaps, we could use scripts/cc-can-link.sh for this purpose.

The intention is slightly different, but a compiler to link
user-space programs must provide necessary standard headers.


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
