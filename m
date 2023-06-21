Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A945EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 14:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hRKcspmkOgfZKtKlAE8MNgP8wnxkzWqCcWf8O8G2uIc=; b=Vthj0Dg1sTDK46
	b/V1l2HxVxKHJ9sFcsugNcHvEPnpkRmF6XYvU8FRSiOss/2miwEFRzQvyYMhCQw1UOFrC9SAsMfS0
	V8l4wmKQQ+m+MlzGAAh1obqsmo1zTJxENTOpaHHYccUTPfBQ7s0pu+OFuFvd7OY+DUJJONb/9R31D
	sToQmL+29MxB+/eJjv/GdNuFdxFCQ+vldKRpBnprjlYEDbXGc2D9aTfR2rPITgxBvFpfI1UdoZ+T2
	+b3Xt3HxwXA8E8YbRG/87kvMkyEUDAy8H/Abs0AGQGb06V0odUgtzAAyiLhOFaWjhcFn6VjE70hB3
	+rMXVxm2Bwu0e6Lj/X7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBzDj-00EsRd-0U;
	Wed, 21 Jun 2023 14:54:07 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBzDf-00EsKd-14
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 14:54:05 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-54fba092ef5so4757660a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 07:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687359241; x=1689951241;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NEunxZx+vC6MelzaldzUGnTGO3Vi7pASMkXGIahe5XA=;
        b=i7XzxVV4Mf+kiHnx8OI4XIUzUBrOOuUtw83TzX3ObDbNWldX5/knsM5Z2FozYWGskt
         uNRng4wZP0+SujABsdgqz1QZNhasjdAC/XgLe8untJc3BOUSLbL8m7SGqaPj1i5VkJEZ
         QnS48sKtYZHITrVtQwPui2pIwiZkhNYhy0rYbe1aD+v72N9qiza9ZOlTFRLclUodtjN+
         NrEvHgRiSMhAdpjyGz85d2NkUna8ge7v54x+Xr/3I5T1grXRXnIsnyfokY6/z08eyrD+
         XA/N8l73U68N4MAq9/GclduZgp9EjNQOFJQ2Vp1/obiRyBYHj0bBel8zCDBHBXojUjty
         KswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687359241; x=1689951241;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NEunxZx+vC6MelzaldzUGnTGO3Vi7pASMkXGIahe5XA=;
        b=RcqMXH0VBtFmx9Yvx089sj7eVnN4WrDEx2PAmH6ePyygJVV03IQsNWwkqGM/6Hpe06
         ytasx4s8DTjWDylmXHIH7bRcwkt30XIgtdaUVv7SSZmIsliGcn4pXMF9Dx6G45bzVnVk
         g4hlVOa0gci3z93RXWphGR7cZeGmDhONUd1Hwtj2Ex/bFzSHL5tloIXtoOqvcL82hJHT
         8xXCwtUcwxF+9gVx39/yYlQdsGOu4X8vRs4Zy1B4ALws50yLwsVdCjH2sJ9dhSDNAfCX
         BJPGi4lrbIyqoSmOs8rCkYJ6ENnDkHOzZh6/YQpYdYn9LACkZ7GGdE0oBY9T4Adgh8wi
         nOMw==
X-Gm-Message-State: AC+VfDyRasq4FQ3yI5fqhSNQnHVcohMsL+ku88k2oCDeb1u3OlKbROgE
	ZMhDqJuw+M4R/oTOOeaNlCBGew==
X-Google-Smtp-Source: ACHHUZ5qKimugwIwWMm1fA+NHwlYg1WzZa5xNfgcuxC0docRuW4FMER/iDzKWVeYBtiFfDVC/1wnBQ==
X-Received: by 2002:a17:903:1250:b0:1ac:aba5:7885 with SMTP id u16-20020a170903125000b001acaba57885mr18055679plh.47.1687359240597;
        Wed, 21 Jun 2023 07:54:00 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d12-20020a170902cecc00b001b03a7a40e7sm3638417plg.19.2023.06.21.07.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 07:53:59 -0700 (PDT)
Date: Wed, 21 Jun 2023 07:53:59 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Jun 2023 07:53:17 PDT (-0700)
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <mhng-8caf7779-aa9e-496a-b2ee-2e6d6d1d76ff@palmer-ri-x1c9a>
CC: Conor Dooley <conor@kernel.org>, jszhang@kernel.org, llvm@lists.linux.dev,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ndesaulniers@google.com
Message-ID: <mhng-861ea8a6-c92c-4a78-a1a6-dfb4df554aee@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_075403_587133_9DF52D96 
X-CRM114-Status: GOOD (  33.62  )
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
Content-Type: multipart/mixed; boundary="===============9048507471893907727=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============9048507471893907727==
Content-Type: text/plain

On Tue, 20 Jun 2023 17:13:17 PDT (-0700), Palmer Dabbelt wrote:
> On Tue, 20 Jun 2023 14:08:33 PDT (-0700), Palmer Dabbelt wrote:
>> On Tue, 20 Jun 2023 13:47:07 PDT (-0700), ndesaulniers@google.com wrote:
>>> On Tue, Jun 20, 2023 at 4:41 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>>>
>>>> On Tue, 20 Jun 2023 13:32:32 PDT (-0700), ndesaulniers@google.com wrote:
>>>> > On Tue, Jun 20, 2023 at 4:13 PM Conor Dooley <conor@kernel.org> wrote:
>>>> >>
>>>> >> On Tue, Jun 20, 2023 at 04:05:55PM -0400, Nick Desaulniers wrote:
>>>> >> > On Mon, Jun 19, 2023 at 6:06 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>>> >> > > On Thu, 15 Jun 2023 06:54:33 PDT (-0700), Palmer Dabbelt wrote:
>>>> >> > > > On Wed, 14 Jun 2023 09:25:49 PDT (-0700), jszhang@kernel.org wrote:
>>>> >> > > >> On Wed, Jun 14, 2023 at 07:49:17AM -0700, Palmer Dabbelt wrote:
>>>> >> > > >>> On Tue, 23 May 2023 09:54:58 PDT (-0700), jszhang@kernel.org wrote:
>>>> >>
>>>> >> > > >> Commit 3b90b09af5be ("riscv: Fix orphan section warnings caused by
>>>> >> > > >> kernel/pi") touches vmlinux.lds.S, so to make the merge easy, this
>>>> >> > > >> series is based on 6.4-rc2.
>>>> >> > > >
>>>> >> > > > Thanks.
>>>> >> > >
>>>> >> > > Sorry to be so slow here, but I think this is causing LLD to hang on
>>>> >> > > allmodconfig.  I'm still getting to the bottom of it, there's a few
>>>> >> > > other things I have in flight still.
>>>> >> >
>>>> >> > Confirmed with v3 on mainline (linux-next is pretty red at the moment).
>>>> >> > https://lore.kernel.org/linux-riscv/20230517082936.37563-1-falcon@tinylab.org/
>>>> >>
>>>> >> Just FYI Nick, there's been some concurrent work here from different
>>>> >> people working on the same thing & the v3 you linked (from Zhangjin) was
>>>> >> superseded by this v2 (from Jisheng).
>>>> >
>>>> > Ah! I've been testing the deprecated patch set, sorry I just looked on
>>>> > lore for "dead code" on riscv-linux and grabbed the first thread,
>>>> > without noticing the difference in authors or new version numbers for
>>>> > distinct series. ok, nevermind my noise.  I'll follow up with the
>>>> > correct patch set, sorry!
>>>>
>>>> Ya, I hadn't even noticed the v3 because I pretty much only look at
>>>> patchwork these days.  Like we talked about in IRC, I'm going to go test
>>>> the merge of this one and see what's up -- I've got it staged at
>>>> <https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=for-next&id=1bd2963b21758a773206a1cb67c93e7a8ae8a195>,
>>>> though that won't be a stable hash if it's actually broken...
>>>
>>> Ok, https://lore.kernel.org/linux-riscv/20230523165502.2592-1-jszhang@kernel.org/
>>> built for me.  If you're seeing a hang, please let me know what
>>> version of LLD you're using and I'll build that tag from source to see
>>> if I can reproduce, then bisect if so.
>>>
>>> $ ARCH=riscv LLVM=1 /usr/bin/time -v make -j128 allmodconfig vmlinux
>>> ...
>>>         Elapsed (wall clock) time (h:mm:ss or m:ss): 2:35.68
>>> ...
>>>
>>> Tested-by: Nick Desaulniers <ndesaulniers@google.com> # build
>>
>> OK, it triggered enough of a rebuild that it might take a bit for
>> anything to filter out.
>
> I'm on LLVM 16.0.2
>
>     $ git describe
>     llvmorg-16.0.2
>     $ git log | head -n1
>     commit 18ddebe1a1a9bde349441631365f0472e9693520
>
> that seems to hang for me -- or at least run for an hour without
> completing, so I assume it's hung.  I'm not wed to 16.0.2, it just
> happens to be the last time I bumped the toolchain.  I'm moving to
> 16.0.5 to see if that changes anything.

That also takes at least an hour to link.  I tried running on LLVM trunk 
from last night

    $ git log | head -n1
    commit 5e9173c43a9b97c8614e36d6f754317f731e71e9

and that completed.  Just as a curiosity I tried to re-spin it to see 
how long it takes, and it's been running for 23 minutes so far.

So I'm no longer actually sure there's a hang, just something slow.  
That's even more of a grey area, but I think it's sane to call a 1-hour 
link time a regression -- unless it's expected that this is just very 
slow to link?

>
>>
>> Thanks!
>>
>>>
>>>>
>>>> >
>>>> >>
>>>> >> Cheers,
>>>> >> Conor.
>>>> >
>>>> >
>>>> >
>>>> > --
>>>> > Thanks,
>>>> > ~Nick Desaulniers
>>>
>>>
>>>
>>> --
>>> Thanks,
>>> ~Nick Desaulniers


--===============9048507471893907727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9048507471893907727==--
