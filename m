Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B723CC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 05:12:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87735206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 05:12:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ABDylWlc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="1lTs7P18"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87735206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eE0wCNIjK/8yabQQvmJlubhn4uFAyPBzxqm4YdXMgAk=; b=ABDylWlcz+MFgK
	gBFpq+Dhytz6el6ogz1MNIcdXgmT8ZWnQ+NIAWdjCImnKgpf5ooJB5Usp1v/brJzfCnfgoAUIYMfC
	q6tlUDDn6JPKGk5+PTSkKeFvb/Ly9kux87RUSwXEAjaYq1spgbFAMap4fCfMbjNSsNIp9UrLbH/Yk
	jWWPeVaQdnl/MO7gvAtZOhPjAnNtD+ebp/xFi3lHcVbC6ttIRY6JbxrWfknqGaMpdLiak9f69BFEd
	sampmZuUq/zniDhK+Rw8rYCf0heyuOc9pio2zwFuJxRHFpd0HnQ0e7A0GtKd9CIZDCKl3JIlFAdXn
	m2UFoh1rOb3mIVHhcbEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9joW-0003YX-9y; Fri, 29 Mar 2019 05:12:24 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9joS-0003Xr-TR
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 05:12:22 +0000
Received: by mail-wr1-x443.google.com with SMTP id y13so971977wrd.3
 for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2019 22:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bKnBSoZi4LuxrMzM4MLMIkqICF16Xx9TbrvGnGEfgAc=;
 b=1lTs7P18qM8kl6W9FeGm7vqIwvdzpq6ues9WS7N3DmJgrrTLKeM/F2z7fxzY3S1GH/
 aJceLriqerUByopmqeCCOW0Mrm6NnHde7SOcd842QvzI7rEfV4wnhchbqew3VYQIKF3D
 lIuthnPSTxVMfcVz6yvqyAZub8zQ6AvMM1bJk+Hy9LO5zXC4nDFzz+hKo9Prija3xU60
 HeLPRpecdOD+uSyu60bKNTeATIEKkoI5mVQY/iYUojndjR6dhDEstcmyfZHXZT0hahy2
 aUAFIw1ret3rhx+IR9MQGfp6iN2E2eFtRDYoaJDSpYme8/lwccZEkRCY4qskXg3Dkhh/
 ucuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bKnBSoZi4LuxrMzM4MLMIkqICF16Xx9TbrvGnGEfgAc=;
 b=iigYNOyyz0NvWcWqXnVWQpect3G88NeNra5BDgzGGmkRA8tEZ0x2rEi+JE2gWjD8KN
 o2dfIAaBuzXkLpWOmtqs50UTBLoeLaEWwGA9Zeb7dCvOpXKNc7Hc9hVckiVnphpfdt+K
 CDfUrvJvM6kd8JB6/PrO2aMoxsyudl6dT0yz3x35RavdJlZQxDeLCkP1UC6IYHz/tXvu
 wL7WXwUV/KYsVcO9pa5gPzW2gUZEEINvn7giqe2oH2nkuAfRHv9Ahe6034INj48/DDhO
 JDkfordWKyt1P1DsQYAzcFP20vZzgfFkBZjzePS03g9No5I7zYoC6eYwHmHGtVBMaKrJ
 +0Sw==
X-Gm-Message-State: APjAAAX6m76V28GH2T4bPcyJnQ1juRxjsTxx7YcCpgMDiZbVign/cDfx
 TB8ybwduYOleJ8fwbHlF9oN/E6wWPPdj+lCqwJqs+UCKUIEd1g==
X-Google-Smtp-Source: APXvYqyXJQK6XhqSNAYTj8EBUc5LyJC8lYYf5FwLRTgFVcq4mP9C+QFjhsvK76sYP2ZuIAZOWE0TA/13qu9pS12bLug=
X-Received: by 2002:adf:fe03:: with SMTP id n3mr18569004wrr.59.1553836337710; 
 Thu, 28 Mar 2019 22:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190328063211.13052-1-anup.patel@wdc.com>
 <alpine.DEB.2.21.9999.1903282158510.25278@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1903282158510.25278@viisi.sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 29 Mar 2019 10:42:06 +0530
Message-ID: <CAAhSdy2VaUJeMx0S=PA0NrX8s1eqvbNkknHi0cqX_OS4+y7u+g@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Implement ASID allocator
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_221220_952751_A1725D7B 
X-CRM114-Status: GOOD (  10.93  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Gary Guo <gary@garyguo.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 29, 2019 at 10:34 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>
> On Thu, 28 Mar 2019, Anup Patel wrote:
>
> > Signed-off-by: Gary Guo <gary@garyguo.net>
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> > Changes since v1:
> > - We adapt good aspects from Gary Guo's ASID allocator implementation
> >   and provide due credit to him by adding his SoB.
>
> This isn't the right way to use Signed-off-by: lines in the kernel.  See
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/5.Posting.rst#n213
>
> and
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n418
>
> The only people who should be listed in Signed-off-by: lines are patch
> authors.
>
> If your intention is to give Gary credit for changes in your patch,
> describe what ideas or code snippets you've taken in the patch description
> itself, above your Signed-off-by: lines so they would be included in the
> git commit description should your patch be merged.

Thanks for clarifying...

Under "Changes since v1" I have clarified what suggestions I have
taken from Gray.

Gray insist that I use "Co-developed-by:" so I have posted v3 with
"Co-developed-by:". Honestly, I don't mind "Signed-off-by: " or
"Co-developed-by:" as long as I am acknowledging other person's
efforts.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
