Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FABBC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 02:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DM8a3Ev9Efteov0G9W883kOsvzB28muatg2NeRu6tHI=; b=YecAcb9L2HN0C4lPoT1udBh5J1
	CGVwvO9VRZsAHzWxFZ48M8jPocSZmkKap3kRseodNPlfi4sCJ2LvzGOwsbz1SV30sc1lYvDjJYNyL
	XOaalqXKaGhXulTsVEZlO9M610i62DeG4c9EV6Q2mplJOGh0mSeBJS4uKm0oitFAI5NQyu3cRjo6J
	2dxdY5CTtusMZ9dcDWoVghp204kgjbeiJMHNdIILy5yr7wPHlft0VGTTIEW8d//j+whIdLWsMbuC6
	YsCQ9i+lGiQhKfWrnvn/bl2W7m8AKWxS011ZYnez4wqDRWZQKwVtTcQ1AZmxC/flCacxMgigFJMqs
	2l+VVOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDGDC-00A2hs-4a; Mon, 18 Jul 2022 02:10:18 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC1YB-00GB9h-IN
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 16:18:53 +0000
Received: by mail-oi1-x22f.google.com with SMTP id j3so2944100oif.8
        for <linux-riscv@lists.infradead.org>; Thu, 14 Jul 2022 09:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=JV9LJjHGagZ4Jzg64L/QgNLcEh2wpqQdS6fpBJU8/zM=;
        b=bu1iDA+afelPpPar4cQ/aQxVVwUxBm8F3v0CQJHle9U6pYa03g9I7BY7DWM4fI+wbj
         4NQCmQvmIn3UjJaLYwLVo9qW0JCFCJNoAnlWDiuT+B1bb1vqmwhOkRS3RQUXbYyuE+2s
         NZECaIpuZ+cUMmw34epm7Yte6VdKL49Uc59SGNwJkvsz+FQNaXR7CT9bS46tz9BFJhu/
         6ykXrmy5xg/ziZxwD//DA1ntiYrZ87mpspOGouUC/LLEvz/YLcvNKgLbeBFmDBUlVlmy
         FQMeYohJyggKhBfh6EDPsMgR3LbrpBvC/Z08NYIJKRiMTjD1FfdtpKvrQLvcl+fOGgzc
         qtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=JV9LJjHGagZ4Jzg64L/QgNLcEh2wpqQdS6fpBJU8/zM=;
        b=TO2jw5SMtBMqlKin4PMHfSNzUs10uZ7V5LAMh1NPmkLl1ATBYGQYJCo1LzdGKUBJND
         P/GIUNxaGS9aJWhl5oD2KA2hLtHHrztSzSdZ0puetKC/4EnJImKVmxZ1ItTORyeru/Nj
         +3BmE007hkcrnw5YFP+TSzqgkwBBvRLl+O6e3UxJvrUmU59GPk9KnO4SqbphypIE2KMq
         mC8SWD4183neWyQXH69FntNfod1WRaJ7JtlNuZ+YBZ00w9OfCcAbSWLzy1k5lX203T+2
         UjDwY4EhDfgJtCyEhEnsy4xBRtEvKWcdXawwuHOQb4SsUwzRBKC2ni73gr9HxAK2qfmu
         YfuA==
X-Gm-Message-State: AJIora+yvjYHJHU9BBUH5TJ6T3JQb8CpKjKBHzcc5wQewWC6QWWcr2f6
	q24MIGYEvIdR+ePN8KldTJxxEx51ovb1ZSZO8II2m7T8wgM=
X-Google-Smtp-Source: AGRyM1ufX+GiktMKUQOYGwkDLodA9lk4OaJGkUG6fvJfDHaeywI28TUk7zWk1rJdfU4OIRQuSXmNz2vy+j/SwsGysEA=
X-Received: by 2002:a05:6808:1201:b0:325:75e1:25a8 with SMTP id
 a1-20020a056808120100b0032575e125a8mr7580817oil.18.1657815514612; Thu, 14 Jul
 2022 09:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <CALLt3TiLNDqZdrn17JaeBeFjmCOMbTAo3901BzMcRKOOnr02YA@mail.gmail.com>
In-Reply-To: <CALLt3TiLNDqZdrn17JaeBeFjmCOMbTAo3901BzMcRKOOnr02YA@mail.gmail.com>
From: Kito Cheng <kito.cheng@sifive.com>
Date: Fri, 15 Jul 2022 00:18:24 +0800
Message-ID: <CALLt3ThETM8O+jXAjtODpcrinp3yvsu7Q89N8vjSZ1bQ8osw2A@mail.gmail.com>
Subject: RISC-V: Public review for Non-ISA Specification: psABI
To: linux-riscv@lists.infradead.org
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_091851_653702_6DD7B792 
X-CRM114-Status: UNSURE (   5.60  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sun, 17 Jul 2022 19:10:16 -0700
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

We are delighted to announce the start of the public review period for psABI.

The review period begins today, 2022/07/14, and ends on 2022/08/29 (inclusive).

This Non-ISA specification is described in the PDF available at:
https://github.com/riscv-non-isa/riscv-elf-psabi-doc/releases/tag/v1.0-rc3

which was generated from the source available in the following GitHub repo:
https://github.com/riscv-non-isa/riscv-elf-psabi-doc

To respond to the public review, please either email comments to the
public isa-dev (isa-dev@groups.riscv.org) mailing list or add issues
and/or pull requests (PRs) to the GitHub repo
(https://github.com/riscv-non-isa/riscv-elf-psabi-doc). We welcome all
input and appreciate your time and effort in helping us by reviewing
the specification.


During the public review period, corrections, comments, and
suggestions, will be gathered for review by the psABI Task Group. Any
minor corrections and/or uncontroversial changes will be incorporated
into the specification. Any remaining issues or proposed changes will
be addressed in the public review summary report. If there are no
issues that require incompatible changes to the public review
specification, the psABI Task Group will recommend the updated
specifications be approved and ratified by the RISC-V Technical
Steering Committee and the RISC-V Board of Directors.


Thanks to all the contributors for all their hard work.

Kito Cheng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
