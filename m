Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD4DC2D0E4
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 01:03:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31BFD208D5
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 01:03:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A0QQF/9g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ZFi5IgqO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31BFD208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7D/Zl4J9KdzDeNNgG541DbYc50lzr9wpQwdjZQlZ+e4=; b=A0QQF/9gbjHEf2eRBcWG349Ao
	PTE/s4RuryVAKVAzQ7rLqemXHaWPqgr9ygDrHangrE28/TMOGgbkYx0eVhlMuRDuaJdDIOyvFzfjh
	metnzX1SIxwY3fROHQJohOaoKWA3Y8Xn4jCH67B+JSukt0+Zzqr4wau6LJeNzn0tjygriM026pqRL
	KnhmtrMcBtRUZRFuz9W7KffAOCytcWOpDiDjyXAlsFqRjFRUNaT3U+fWyP/sHflBTRueqhqwHqeR9
	Tp7lYBIe1/2HFQo9+hTIhhmZjU93IYIV7Iq0lxtOt3xhKRF0t29f8GYAoodfCqGhruI/kAvTo4WVZ
	1THxWb4xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdNV6-0005X1-2X; Fri, 13 Nov 2020 01:03:40 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdNV3-0005WV-9o
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 01:03:38 +0000
Received: by mail-ed1-x544.google.com with SMTP id y4so2877631edy.5
 for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2020 17:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4rHcsSn4tvPHdEd3aSA+VI5udp3Ct0q3o9hwij9UMEQ=;
 b=ZFi5IgqOb9K+M2xVzFZ1Dj4wIiazGAiIKRobu7yknmcbmQ6bQvP0kH99tQFLNAOPlB
 0v99P4TViqiGe1DeMXs/6Vcv0hKoYpmnjugEwpflxekpA8YYEhn0krqLedZpWiC72ZQU
 k8o/k1XZd2BJEnheNsLiTSEQKS7vo/2X7KxBIKfrUXng4pGTPSdYRyv+wxl7kddmJjBh
 b+WIGyhV2hufXGRSLOSvsjfdqE/Oa8DFNXC2F/lYLtrbaYwspxeFIPDqKXcOITKqaOBk
 xsErUSJBxlbodtdR2iX+6AVPlfAehuEW7umj43T6Gs2I52CEcdbft5Z0xW5x9thRZgNx
 AUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4rHcsSn4tvPHdEd3aSA+VI5udp3Ct0q3o9hwij9UMEQ=;
 b=I3h3z9QMa0cz/YktQFgzjrTnFul6xUJakh/bBdg7qgkcu9TxEH7YkBYTxgyJDDL6eB
 7R77X8zBaTfnh918FU0g7xEghgTS9WcQp8vn6/J5MvIEjZ1ybeKU5x2aXD0LkxTT10Ym
 o+FggilFsixPSBbQwVKN1dDqRIMsaDb7GE5QSgMrEEFdqu1LC9BharsqQiddqvxZfIPx
 be/wDSa1U4/QNkKnOEbMic6IRP83jr57gnxBxPHLbSanXIQB96aopT8I4nyuvd7KsVKY
 amhPdFJE9Cw7SHuMXgToC5YUl34KpBiuazfRVVgXDtsDsYOMoK7cfo3/KCVmlIQQ9JzK
 z7yw==
X-Gm-Message-State: AOAM533DKc+T1e2vT0+LwU2bu1s/up6/wa4j0ahSmvTjUSh5glUCd35X
 Z3feYXSlJRO8sLxK2dJFnsD9xefBZGHr0pv7+gy2
X-Google-Smtp-Source: ABdhPJxgk9h7tG5lIlfb8RpVXqIs4njVIRR6YGvJXee5knc0Tq/r5hVZFfeh358uA/QWm7hROYzzQ/iT/MMxBhhd7DQ=
X-Received: by 2002:a50:99d6:: with SMTP id n22mr19914edb.261.1605229413879;
 Thu, 12 Nov 2020 17:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20201108203737.94270-1-natechancellor@gmail.com>
 <CAKwvOd=P2yFxkAXh9TUpJ=D5=jNnxnx7O5Nr3iTDeqV40UA19A@mail.gmail.com>
In-Reply-To: <CAKwvOd=P2yFxkAXh9TUpJ=D5=jNnxnx7O5Nr3iTDeqV40UA19A@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Thu, 12 Nov 2020 17:03:22 -0800
Message-ID: <CAGG=3QVQTQsHhsb5cSEejZ=D4Gq60cz7kMfD8moXWeVU1odTdQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Explicitly specify the build id style in vDSO
 Makefile again
To: Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_200337_366279_9603E1FC 
X-CRM114-Status: GOOD (  26.94  )
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
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Nathan Chancellor <natechancellor@gmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 12, 2020 at 4:53 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Sun, Nov 8, 2020 at 12:37 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > Commit a96843372331 ("kbuild: explicitly specify the build id style")
> > explicitly set the build ID style to SHA1. Commit c2c81bb2f691 ("RISC-V:
> > Fix the VDSO symbol generaton for binutils-2.35+") undid this change,
> > likely unintentionally.
> >
> > Restore it so that the build ID style stays consistent across the tree
> > regardless of linker.
> >
> > Fixes: c2c81bb2f691 ("RISC-V: Fix the VDSO symbol generaton for binutils-2.35+")
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>
> Thanks for the fixup!
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> (I'm curious what --build-id linker flag does, and what kind of spooky
> bugs that led to a96843372331?)
>
--build-id generates a unique "build id" for the build. It can use
several different algorithms to do this. The BFD linker uses sha1 by
default while LLD uses a "fast" algorithm. The difference is that the
fast algorithm generates a shorter build id. This shouldn't matter in
general, but there are some tools out there that expect the build id
to be of a certain length, i.e. the BFD style's length, because BFD is
more prevalent. The obvious response "well, why don't they just change
the expected length?" is difficult in all situations. (Once an
assumption is made, it's hard to backtrack.)

You can add this if you like:

Reviewed-by: Bill Wendling <morbo@google.com>

> > ---
> >  arch/riscv/kernel/vdso/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> > index cb8f9e4cfcbf..0cfd6da784f8 100644
> > --- a/arch/riscv/kernel/vdso/Makefile
> > +++ b/arch/riscv/kernel/vdso/Makefile
> > @@ -44,7 +44,7 @@ SYSCFLAGS_vdso.so.dbg = $(c_flags)
> >  $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
> >         $(call if_changed,vdsold)
> >  SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
> > -       -Wl,--build-id -Wl,--hash-style=both
> > +       -Wl,--build-id=sha1 -Wl,--hash-style=both
> >
> >  # We also create a special relocatable object that should mirror the symbol
> >  # table and layout of the linked DSO. With ld --just-symbols we can then
> >
> > base-commit: c2c81bb2f69138f902e1a58d3bef6ad97fb8a92c
> > --
> > 2.29.2
> >
> > --
> > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20201108203737.94270-1-natechancellor%40gmail.com.
>
>
>
> --
> Thanks,
> ~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
