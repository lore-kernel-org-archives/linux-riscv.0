Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF48EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 00:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Mu1ZEB8sZcy4zinZdunEpPOU0lIdDgXIzl08dIYFMUU=; b=HHgF19evCtwbft
	FuB32xK3mKJeJ0mk7kGIFjyXRJ3An6Re/thn8c6r03jtaerrGCprLWtKp1DEeSl6JD87Fp+dnUqdA
	SV0LdHewzAiMVmzF7ovuYt+1UNHFMCzBJPDI0yUNptkfqqmQ8PzmOjWac0lwU9O/NhZiHuEgY2qyA
	IyttH5+qaWLRcsYSg0G4n3pJdmNVTBnjdeXNvhbwPZc7Jo06z+naldQIf/WfPjRT/fZojMPFo9HM7
	+IM2YUsI46D6RqrAJ2D2L00ox2WboHlFGBqvR7DoTjEFYY+ZesiWJwjNLCqVqcC6shzc3gdCj6v+G
	VyzeYl9MMskvIW3SeYgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBlTP-00CfwN-2I;
	Wed, 21 Jun 2023 00:13:23 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBlTL-00CfvI-38
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 00:13:21 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-666683eb028so3080066b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 17:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687306398; x=1689898398;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tjYx1i3/gCVvDUNwYH2uVhDCA+CPehZaUiYWjawRZkM=;
        b=sjUoX7jwC00g/1eLiAyZp7jtN9jgrMFgXJTIjzmMqeBGF6gNt7yEtIuDKhS6YWSKNw
         iG3jzjNxjTLdWROYuSIsCCK5Maghmyppas9yOrDKWiIaVNWLL8PGlYlojeJZXG3Jk+CR
         7M+80O9YfMnNcFB49lEcYcCFQMKY0lO8WrimTAdT6vcGiFhlfStGWkpJCFFhAQ0hV53e
         BKC4XRy/AvZKKysP4pFfNc0K1titJwvX4ea3CK9UxOef+Jt3oHPs2QQOG3WmUSJXRVfR
         eFeaVHM/mea84txT62UN5B3oJOxi/WHB9wJ15z8+3tCVqDhglOdrEL+0hOKbMZvN1Hgy
         TDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687306398; x=1689898398;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjYx1i3/gCVvDUNwYH2uVhDCA+CPehZaUiYWjawRZkM=;
        b=M7N9yTBbI5ED6nUibgiigF0zCj3mzXxgiYAHRfz8AANsfIJBVuVjEL1cB1DOZOi52G
         HBd25oNfrtcwpC8LBeh8VDunp8Ir8Qp5kxFNtCGlTXSySjxq+PghXsTs1aOqDteXfCW9
         m5WZutBFb8oExVUZksCciesPvVgQJXDWFf6r4rF4ovlrkAOKyP1XudNq+SEoJguqHW+l
         8OGfUQlvdYTQvN7utKHOG5T1pUjQb0yCz6TFaHDk1sHOp1UE6Q5+4CShCqUI3in2dXW4
         9AkKaEmZETj/1QHl4jPb/mQTlseZX8A1j1LzvuMzN1UZJHhvrXrIif+abf/P7+D8LjcC
         BrrA==
X-Gm-Message-State: AC+VfDwbOBNWrnjnnBuwS4oqCtEoYEFMKk+U2beDYxFLhMVaDKrHClfv
	1hV1TQu2NeL07OhUAgfKfYIAfg==
X-Google-Smtp-Source: ACHHUZ7Nw4aRq+TWO1VkY0DHqMW34dcaoaGD141nBeA4rU0iyYuaxNlQebBEStDo9kJp5JEvtCc1yA==
X-Received: by 2002:a05:6a20:5493:b0:122:9af9:67c with SMTP id i19-20020a056a20549300b001229af9067cmr3139865pzk.23.1687306398159;
        Tue, 20 Jun 2023 17:13:18 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0064ccfb73cb8sm1804052pfb.46.2023.06.20.17.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 17:13:17 -0700 (PDT)
Date: Tue, 20 Jun 2023 17:13:17 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 17:12:37 PDT (-0700)
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <mhng-3ceb19b1-0af6-451e-816d-8ab5c68b5fea@palmer-ri-x1c9a>
CC: Conor Dooley <conor@kernel.org>, jszhang@kernel.org, llvm@lists.linux.dev,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ndesaulniers@google.com
Message-ID: <mhng-8caf7779-aa9e-496a-b2ee-2e6d6d1d76ff@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_171320_225632_53027981 
X-CRM114-Status: GOOD (  31.32  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7739449416270421729=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7739449416270421729==
Content-Type: text/plain

On Tue, 20 Jun 2023 14:08:33 PDT (-0700), Palmer Dabbelt wrote:
> On Tue, 20 Jun 2023 13:47:07 PDT (-0700), ndesaulniers@google.com wrote:
>> On Tue, Jun 20, 2023 at 4:41 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>>
>>> On Tue, 20 Jun 2023 13:32:32 PDT (-0700), ndesaulniers@google.com wrote:
>>> > On Tue, Jun 20, 2023 at 4:13 PM Conor Dooley <conor@kernel.org> wrote:
>>> >>
>>> >> On Tue, Jun 20, 2023 at 04:05:55PM -0400, Nick Desaulniers wrote:
>>> >> > On Mon, Jun 19, 2023 at 6:06 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>> >> > > On Thu, 15 Jun 2023 06:54:33 PDT (-0700), Palmer Dabbelt wrote:
>>> >> > > > On Wed, 14 Jun 2023 09:25:49 PDT (-0700), jszhang@kernel.org wrote:
>>> >> > > >> On Wed, Jun 14, 2023 at 07:49:17AM -0700, Palmer Dabbelt wrote:
>>> >> > > >>> On Tue, 23 May 2023 09:54:58 PDT (-0700), jszhang@kernel.org wrote:
>>> >>
>>> >> > > >> Commit 3b90b09af5be ("riscv: Fix orphan section warnings caused by
>>> >> > > >> kernel/pi") touches vmlinux.lds.S, so to make the merge easy, this
>>> >> > > >> series is based on 6.4-rc2.
>>> >> > > >
>>> >> > > > Thanks.
>>> >> > >
>>> >> > > Sorry to be so slow here, but I think this is causing LLD to hang on
>>> >> > > allmodconfig.  I'm still getting to the bottom of it, there's a few
>>> >> > > other things I have in flight still.
>>> >> >
>>> >> > Confirmed with v3 on mainline (linux-next is pretty red at the moment).
>>> >> > https://lore.kernel.org/linux-riscv/20230517082936.37563-1-falcon@tinylab.org/
>>> >>
>>> >> Just FYI Nick, there's been some concurrent work here from different
>>> >> people working on the same thing & the v3 you linked (from Zhangjin) was
>>> >> superseded by this v2 (from Jisheng).
>>> >
>>> > Ah! I've been testing the deprecated patch set, sorry I just looked on
>>> > lore for "dead code" on riscv-linux and grabbed the first thread,
>>> > without noticing the difference in authors or new version numbers for
>>> > distinct series. ok, nevermind my noise.  I'll follow up with the
>>> > correct patch set, sorry!
>>>
>>> Ya, I hadn't even noticed the v3 because I pretty much only look at
>>> patchwork these days.  Like we talked about in IRC, I'm going to go test
>>> the merge of this one and see what's up -- I've got it staged at
>>> <https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=for-next&id=1bd2963b21758a773206a1cb67c93e7a8ae8a195>,
>>> though that won't be a stable hash if it's actually broken...
>>
>> Ok, https://lore.kernel.org/linux-riscv/20230523165502.2592-1-jszhang@kernel.org/
>> built for me.  If you're seeing a hang, please let me know what
>> version of LLD you're using and I'll build that tag from source to see
>> if I can reproduce, then bisect if so.
>>
>> $ ARCH=riscv LLVM=1 /usr/bin/time -v make -j128 allmodconfig vmlinux
>> ...
>>         Elapsed (wall clock) time (h:mm:ss or m:ss): 2:35.68
>> ...
>>
>> Tested-by: Nick Desaulniers <ndesaulniers@google.com> # build
>
> OK, it triggered enough of a rebuild that it might take a bit for
> anything to filter out.

I'm on LLVM 16.0.2

    $ git describe
    llvmorg-16.0.2
    $ git log | head -n1
    commit 18ddebe1a1a9bde349441631365f0472e9693520

that seems to hang for me -- or at least run for an hour without 
completing, so I assume it's hung.  I'm not wed to 16.0.2, it just 
happens to be the last time I bumped the toolchain.  I'm moving to 
16.0.5 to see if that changes anything.

>
> Thanks!
>
>>
>>>
>>> >
>>> >>
>>> >> Cheers,
>>> >> Conor.
>>> >
>>> >
>>> >
>>> > --
>>> > Thanks,
>>> > ~Nick Desaulniers
>>
>>
>>
>> --
>> Thanks,
>> ~Nick Desaulniers


--===============7739449416270421729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7739449416270421729==--
