Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BCCC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 00:58:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8FFB6140B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 00:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8FFB6140B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=DcKNp9WEQ+rsMVYFrNKY50CDgt5Zj6yNLwOJrbjdr/M=; b=32YIoga9mYbACd5j5GiDyQro/T
	DjoCfdZ7btKbgcFObz8DqyVat9madb2wuPC5w5dVz2os5Ssk1BzhuB5EJ9HIUNDL1tB/DWTcISNSy
	oIC8GIhcE7pIow0xkBPdervbQWA1qYvKQYoYw+/HHdCQ26maIfp1psrpZS93xEPgI8Yh+TNU4S42Z
	KXKBwq+dS47rJkDeLaRlNPs6sZsNmOkRLjTxPMTCCj2Jpai77dL+gpw9g8DlnJY0ziH/4Ejlo13ss
	rwyQy/rolo01adlxfeDepETO47oeXamm9HpwfkQwSmaj8/9RsTcPEtqNPphSIYmlw/U0cka14GyMW
	ZAYIacBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXYm9-008Vn7-Ho; Tue, 05 Oct 2021 00:57:45 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXYm7-008VmV-0d
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 00:57:44 +0000
Received: by mail-vs1-xe32.google.com with SMTP id g10so4290927vsb.8
 for <linux-riscv@lists.infradead.org>; Mon, 04 Oct 2021 17:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=3DZPJUSQwIIwcPnyAkR1NQv0eMMiHcXMtz6SXNb7OxE=;
 b=3WOFksZy8ZZOIybnQMCGjrluGv5EQ4Ygdb6XCkoY8gV7RjahThEVHApn5Jjp7VnAza
 TVt+KiyxjgcbhbuiQh3QMNGjSeI6SDKnBWrYsScLXWa7WV1YkZguNq83rcOzasY7lDIF
 /tdT/vbJUS3WqDmgUIeh7SuCp78FA/65OSGOYwBvBxq2Crvyye6Bf4ZHX0iKcJVC+YjW
 kql5Yr2axPjMehM48whKIh2Qn0rldDk1O43L/lfrtANCWP1rEZ/CRXp1zL5KxJ1+mRjs
 PxGme7xJqw81yAoF8gIDofh5BFycCFl5zfFJkcyvJNzzgxMnWfpyaOXy3ME2y55uUjFI
 8e4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=3DZPJUSQwIIwcPnyAkR1NQv0eMMiHcXMtz6SXNb7OxE=;
 b=t5V2PZFRskpiam7FztK6Y4dRA3hVF+yY53NCUiV5Vo0q9Xt28F4/VsfgPw7x4glHMi
 eEqGxvruYm4OZCR5EnnbUlWADoiwPJkmBYVDhS74YPDn94WsUpRdXoDg4ddykcJI2gjW
 USWP36BPFK2h1zy49pXCYiNG9GEXx8pDxSttkJJePlLFiBrHZ/MczmrAYNID1FQg0FPj
 Cm1yqdMX/unsxxG75R+Kc+CZWS+rn3s1xVOLj5PlvtJt7nGQ4Ymzh1lqRlJeBe2d/lZu
 o8QrE31U0yRVoMNxlc+GDKqBXpA9mMF6f9qIP2rWpIVJ0Q1g4plJD8RWG9ONgM1faO5+
 DLrQ==
X-Gm-Message-State: AOAM530G4Mf2yvHkS5+3ab7jbyHjUVImO83pEloOnAs29L7CEH3rphIn
 bP+oksxe6+hTahrr99CFHrj00A==
X-Google-Smtp-Source: ABdhPJzGUd4ZAFoZqSktNsK2dhWzWX17bSWZQSxjM2h80ka1/OxjD/4MCvt9MJ5Exlxj2RsdsdBj5g==
X-Received: by 2002:a67:d78c:: with SMTP id q12mr3535268vsj.28.1633395461689; 
 Mon, 04 Oct 2021 17:57:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b3sm7872360vkl.6.2021.10.04.17.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 17:57:41 -0700 (PDT)
Date: Mon, 04 Oct 2021 17:57:41 -0700 (PDT)
X-Google-Original-Date: Mon, 04 Oct 2021 17:57:31 PDT (-0700)
Subject: Re: [PATCH 05/10] riscv: remove Kconfig check for GCC version for
 ARCH_RV64I
In-Reply-To: <202110041750.C90595D1@keescook>
CC: ndesaulniers@google.com, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux@rasmusvillemoes.dk,
 nathan@kernel.org, masahiroy@kernel.org, 
 joe@perches.com, arnd@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 llvm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: keescook@chromium.org
Message-ID: <mhng-f7c38c89-4c50-49cc-9b9e-7089cb83a307@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_175743_096716_72834DBC 
X-CRM114-Status: GOOD (  15.06  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 04 Oct 2021 17:50:46 PDT (-0700), keescook@chromium.org wrote:
> On Mon, Oct 04, 2021 at 05:40:42PM -0700, Palmer Dabbelt wrote:
>> On Mon, 13 Sep 2021 09:23:45 PDT (-0700), keescook@chromium.org wrote:
>> > On Fri, Sep 10, 2021 at 04:40:42PM -0700, Nick Desaulniers wrote:
>> > > The minimum supported version of GCC is now 5.1. The check wasn't
>> > > correct as written anyways since GCC_VERSION is 0 when CC=clang.
>> > >
>> > > Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> > > Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> > > Cc: Albert Ou <aou@eecs.berkeley.edu>
>> > > Cc: linux-riscv@lists.infradead.org
>> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>> >
>> > Yeah, good catch for Clang too.
>> >
>> > Reviewed-by: Kees Cook <keescook@chromium.org>
>>
>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>
>> Only this patch ended up in my inbox.  Where you guys planning on keeping
>> this whole series together, or did you want me to pick this for the RISC-V
>> tree?
>
> Linus already merged this series (see d20758951f8f28c0ee1b2a8a6bb8189858083895)

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
