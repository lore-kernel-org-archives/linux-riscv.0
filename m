Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49B4C4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 14:01:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC9961155
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 14:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BC9961155
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtpVn/KQEINxBgo8Eje82Bw9iZiy6L2tbUr/c1AfjvE=; b=woGqH7vqVZvtJ7
	T26q+8XXpfjo+hG8RhaZME3WFFBxz5hPsw39CnXuTkWgKWAcbrhJYLyb4TNPE/D/8ZU5AyhQtxqDI
	TFj9/Ww3TRMfOC+6xLDQmpuwPQiTkmpvvmcgJ7spFypy0eQimb5RvrITCAXlyN+AjWD2M9oubqi+Q
	LvoTXjyYZDh2QQW01qSfFxGqyu9mgVybxHQxCOeM/kVOxhpj4UupVP1yP+1LT2a3StGOyeubt3jc1
	TbYKDLoUGc/APUPRi7IzenGqJd+dTPVHUlG1SUb4NxUFTw04eVm9n4rwSK3Z/XMb5jNTMu2zaAKHe
	99uvWsqn0wANxwT8YpkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBdvP-009mR6-8B; Thu, 05 Aug 2021 14:00:43 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBdvL-009mPt-Ih
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 14:00:41 +0000
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 175E0PB3010466
 for <linux-riscv@lists.infradead.org>; Thu, 5 Aug 2021 23:00:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 175E0PB3010466
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1628172026;
 bh=lffbE45BRrgQKayNYnYaGttwzdEDcoutwDeVAJukOHE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RTYjuW+6Yj1y9WzrY5XZjN8EW2tKGg1fUci/yOtrtiq7uReI24qIrR14DKLufRhPV
 icB+n15fCVkVIpp8Aid1bJfQX0yGRzdpKXF0TApwcvXJaf+kGLaWGaxzD+luQkMhjz
 Z380y4zm7YDD4UUKZDrYrHX36Qps58U8YRZWRDApaoVJa5WBwZP+bVha33ijwydDZV
 Wng+ATPLPChlhTmfYd2+trS64OZZsKBVLaBWfYERIP2BegQa7V8qkVPGJ2fslkroAh
 QaPOcwfq/NTJjC8aWQ665qMgcAJatI7rMcVDh3vsViswk9uiYETv0d/wbnzoUjybFf
 VYpGqORKJsPyA==
X-Nifty-SrcIP: [209.85.216.46]
Received: by mail-pj1-f46.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so14966967pjb.3
 for <linux-riscv@lists.infradead.org>; Thu, 05 Aug 2021 07:00:25 -0700 (PDT)
X-Gm-Message-State: AOAM5316Rj0ebX7lkUIPlaXXs0U823iy+F0CjAHKTgzweNDUrMM26KIb
 g/xWqyzURbSdDOv3Y9ReTRA7dz6A5mklvI73aes=
X-Google-Smtp-Source: ABdhPJxZa5hhUZfNZ1UgobCzy0zyXlvxx8sD248nZ0a4FXFWiLIEtivCGL+LfW0JxWplPlExOQFTlkwqFc3NHJ3/r2Y=
X-Received: by 2002:a05:6a00:d71:b029:3c7:6648:69c6 with SMTP id
 n49-20020a056a000d71b02903c7664869c6mr2014065pfv.63.1628172025021; Thu, 05
 Aug 2021 07:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210802234304.3519577-1-ndesaulniers@google.com>
 <YQicuh/Qtj0AfxdK@casper.infradead.org>
In-Reply-To: <YQicuh/Qtj0AfxdK@casper.infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 5 Aug 2021 22:59:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNASq2CdhbybOrdcxBDA7BmF1jfBK6mX2z75MR7DLN3GMwQ@mail.gmail.com>
Message-ID: <CAK7LNASq2CdhbybOrdcxBDA7BmF1jfBK6mX2z75MR7DLN3GMwQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/Makefile.clang: default to LLVM_IAS=1
To: Matthew Wilcox <willy@infradead.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Khem Raj <raj.khem@gmail.com>,
 Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_070039_877621_4E5911EA 
X-CRM114-Status: GOOD (  12.10  )
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

On Tue, Aug 3, 2021 at 10:33 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Aug 02, 2021 at 04:43:03PM -0700, Nick Desaulniers wrote:
> > +++ b/Documentation/kbuild/llvm.rst
> > @@ -60,17 +60,14 @@ They can be enabled individually. The full list of the parameters: ::
> >         OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
> >         HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
> >
> > -Currently, the integrated assembler is disabled by default. You can pass
> > -``LLVM_IAS=1`` to enable it.
> > +Currently, the integrated assembler is enabled by default. You can pass
> > +``LLVM_IAS=0`` to disable it.
>
> I'd drop the "Currently,".  This is presumably going to be the default
> going forward unless there's some horrible unforeseen problem.  The
> "Currently," implies that we're planning on changing it.

I agree.



-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
