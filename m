Return-Path: <SRS0=W2t6=2I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DC6C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 14:10:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C4982176D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 14:10:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rRjz7MTZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="CSWsiFWl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C4982176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sK0Y524wx5hTvDQvfkikiU6FvAcdXV1HieXZce1m0oY=; b=rRjz7MTZaC7S9hUmOXjfpwsXg
	i3BneJC0/kbkF8/aIcKdma3Cx7NTxQBMykN3o5gKPfjN0ca6egGWEm9fHgjrvlEGpmvGtQBky3Z0e
	nE1dhuo5n6lPTu+jnvROHImFUMlkQ3zx0sWrgJ0/iZZYcUIEVMmxWZEAJHwSxCp5Fd00ULOflh+3x
	2TefPjgvLNvLdb2xuLHrIsLxEmSQwDTjrTdF1bsYQPLuv3NeiDiCmHYvKHIxUQ5f+mYMiotV4hZlk
	YBCY1OUdDMLJmBS7/VdAWb51hpAEnNc95F9+BNeS5iR/e911qmXRqNnbxaKVg6Un6FBFnZm9Mdqnk
	Bdq9Mxsmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iha2D-0004Zk-EE; Wed, 18 Dec 2019 14:10:41 +0000
Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iha2A-0004Ws-Hi
 for linux-riscv@lists.infradead.org; Wed, 18 Dec 2019 14:10:40 +0000
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id xBIE9xhq031298
 for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2019 23:09:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com xBIE9xhq031298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1576678200;
 bh=sK0Y524wx5hTvDQvfkikiU6FvAcdXV1HieXZce1m0oY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CSWsiFWl4hNytsEwVdoam4tV0utXMKiNzfUBJQ+/TJxh/aZLGebehNEK3fZb3xvfn
 Xj98jOMxDT/HhqiJAAZ+1N3/RT0OjqCmOw8kcSV2pafhlhGH8af/RCI0CHLtBbg8yI
 oy+gjIxYzdvTXy9PA4KBR1tOoCRASBSaBhXtYXlDjNEbJdEp6jh25v396vO/YXeZ2F
 ViupeXq1tg/p/NBxrsLD9EE6ketgS2yywrktuMT7xzLCtzDyn3aYchnOUfk2opZ4Ui
 rp6fGIOcLTZVeqzYuVbT2vdRwOp0CogA6ia5qsXhwXsHdZlMVi8VtiZTrT8gNqEVJA
 2ammzjWoVjrHA==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id v18so667490uaq.7
 for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2019 06:09:59 -0800 (PST)
X-Gm-Message-State: APjAAAVO0qA4pP6Bo/03SBK6HIMm5GB2fFu6s1qXTuNze+LwlHe/x2vQ
 4KfkwwFefMaN27lDKo2WjWhHe7OksrgGiHYiHwI=
X-Google-Smtp-Source: APXvYqxj/VVIXI6U17IvS2b1hvsjfikDP+/ho6hEvii+xPz6k15U/LpW0YHSFxyWudL1l727MKUmI6SeuX7p8+rBGCw=
X-Received: by 2002:ab0:3487:: with SMTP id c7mr1453419uar.25.1576678198490;
 Wed, 18 Dec 2019 06:09:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576599202.git.tommyhebb@gmail.com>
In-Reply-To: <cover.1576599202.git.tommyhebb@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 18 Dec 2019 23:09:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQgG45XRfQEKBJFt-knZ0L7se5eMH6Kvo-3L_gW6wcA1g@mail.gmail.com>
Message-ID: <CAK7LNAQgG45XRfQEKBJFt-knZ0L7se5eMH6Kvo-3L_gW6wcA1g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] kconfig: rework symbol help text
To: Thomas Hebb <tommyhebb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_061038_809965_79F58656 
X-CRM114-Status: GOOD (  13.75  )
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
Cc: "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 18, 2019 at 1:15 AM Thomas Hebb <tommyhebb@gmail.com> wrote:
>
> This series fixes several issues with help text generated by Kconfig,
> mainly affecting symbols that are defined in multiple places. Although
> results of these patches are somewhat visible for the symbols in Linux,
> what prompted me to write the series was working on U-Boot, which also
> uses Kconfig and makes very heavy use of multiple definitions (e.g. for
> overriding defaults). I have provided Linux examples where I could find
> them, but the example for the biggest patch (the first one) is taken
> from U-Boot because it was more illustrative than anything I could find
> in Linux.
>
> Changes in v2:
> - Added explicit U-Boot version in commit message + other rewordings
> - Made the new "Depends on:" line print actual dependencies instead of
>   visibility to avoid an intra-series regression, and noted that in the
>   commit message.
> - Get rid of redundant "with prompt" and "without prompt" notes in
>   definition text, but continue to ensure that definitions with prompts
>   are printed before ones without.
> - Fixed checkpatch issues
> - Omit already-merged patch "kconfig: don't crash on NULL expressions in
>   expr_eq()"
>
> Thomas Hebb (3):
>   kconfig: list all definitions of a symbol in help text
>   kconfig: distinguish between dependencies and visibility in help text
>   kconfig: fix nesting of symbol help text

All applied to linux-kbuild. Thanks.


>  scripts/kconfig/expr.c |  3 +-
>  scripts/kconfig/expr.h |  1 +
>  scripts/kconfig/menu.c | 82 +++++++++++++++++++++++++-----------------
>  3 files changed, 52 insertions(+), 34 deletions(-)
>
> --
> 2.24.1
>


-- 
Best Regards
Masahiro Yamada

