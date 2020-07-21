Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005CCC433E8
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 10:59:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C01BF206E9
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 10:59:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CXOKsm5w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uk4f9jfG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C01BF206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bK0MTrKFHSF95q9u4MuS3FvPUVwAxV3Bd+RarfH8+EE=; b=CXOKsm5wN4wtP/f+N/LipjYNd
	mICRlVy7WXGZYOxNFMg+WpbNF/IaEVdvAH9USxN0b/5KY2cbR/Zfr3VrBcnBxXPchYXbuA3ezhD4s
	fG8mwQaSC9ev1S+jDGt6L6Haqt9Uj/9gJmvp5KPBX2qecWhyvffol076RCF3qLbsYvRxHxT0PX+O9
	VpuWSg/5xcRAFte/o8ct6QzCuaosKmVXWsY3Wbb9QRHe2wZguSHD+Xt+Y3MmiJr2GIX+mkb+vYvNh
	a+QAw4GD09SnlitGQZew6aTglD0ZMOXtjDhbqOj85vtNAhp2rr+gyAuuj5oSDN1N6FE0TAfFh3oxl
	cNiZneMyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxpzn-00060N-SW; Tue, 21 Jul 2020 10:59:39 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxpzj-0005yM-0T; Tue, 21 Jul 2020 10:59:35 +0000
Received: by mail-ot1-x344.google.com with SMTP id w17so14747168otl.4;
 Tue, 21 Jul 2020 03:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=/EF7Qison7+OGXQXe8tCTGM4PP/e4Mdg4NPhl6XK730=;
 b=Uk4f9jfGhs5DkBWkywVYSxv+RjvPtlBJKwNzxDQJRM4oyUlZeJHH9Ay0Dz9S3T+O86
 I1k8wcSU5qjlnQbQS1Cc5u/Di5a8oxU0TqNANIeZ+urK3ruLtTD1rFzoDtPyUq0zyw1t
 TKTa7dYj3q558MX8C2dCAhl0Kx3BnS6PKK14W3du9GA95iORa8+JZDbW/DQ6a9DT5Fmy
 8za6hMaHY5YNv55f0k+a+Ti8u5YKEfdRVS6vRWc0m6bcU1eZA57gEbg14Y3/HWJqEceg
 I6AApXJum8MPc7FIX+9Iv2OU5g/1PXoIJOC9VdOjehdpKQ5Gaotz84w3/VSWkS/6Omc3
 Mlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=/EF7Qison7+OGXQXe8tCTGM4PP/e4Mdg4NPhl6XK730=;
 b=Nu7UrbDv2NXRGIN0gwkt84qWlTae7851LCo82CPyqOJuo1t/AtVlDwp7d+Nl0fZhXQ
 QSpGjDxNbx1VKzJAillC2zwdaxtVqnthlgJZJMXU9v1F6BnH9WzEc1LgF+LDjkdTn37T
 x0+bqSj4Ox9gMStOz9mKGMWv6VPYyq9i6nVNxktAuPhBi/hyAjd8ppLGumA2iv1ifZ9M
 UhVv1Fr3VJ2/IFoblQY2rHKTg5qppRWBytqstBPRn3VYJ3G+kdO8d1JKN8iy/e+6Zxlf
 nAeIe0NxdJ7sO4T88bhYjhs0JHoBEpHoITZBjE2vat3gA2f3GHm3mdFRlqm2tjQ4GG36
 0AwA==
X-Gm-Message-State: AOAM531qxMtxqsxYsTMjiQuNNtvxigyd6gHQBpsYuD5LQYc1VDyv1W0g
 1JHf7VTv+Gj8QFH7HujHfeXHN0AsyL135nqtZeg=
X-Google-Smtp-Source: ABdhPJwDn1K9lCXh3r6H2duEArkbw7P69YNYfj8OXMApUjXADa+z15C6AlqxraRlKJPBGg9bBd1HTcPmXTNgIEWHZIw=
X-Received: by 2002:a05:6830:2081:: with SMTP id
 y1mr23521903otq.114.1595329173244; 
 Tue, 21 Jul 2020 03:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200720092435.17469-1-rppt@kernel.org>
 <20200720092435.17469-4-rppt@kernel.org>
In-Reply-To: <20200720092435.17469-4-rppt@kernel.org>
From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Date: Tue, 21 Jul 2020 12:59:22 +0200
Message-ID: <CAKgNAkgdOZXsVVkYveqnjODOr_cHYWiRssw2Tu1dZEBd+GnOnA@mail.gmail.com>
Subject: Re: [PATCH 3/6] mm: introduce secretmemfd system call to create
 "secret" memory areas
To: Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_065935_103710_8B415056 
X-CRM114-Status: GOOD (  10.93  )
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
Reply-To: mtk.manpages@gmail.com
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Linux-MM <linux-mm@kvack.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 linux-arch <linux-arch@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 linux-nvdimm@lists.01.org, Will Deacon <will@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Linux API <linux-api@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Mike,

On Mon, 20 Jul 2020 at 11:26, Mike Rapoport <rppt@kernel.org> wrote:
>
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> Introduce "secretmemfd" system call with the ability to create memory areas
> visible only in the context of the owning process and not mapped not only
> to other processes but in the kernel page tables as well.
>
> The user will create a file descriptor using the secretmemfd system call

Without wanting to start a bikeshed discussion, the more common
convention in recently added system calls is to use an underscore in
names that consist of multiple clearly distinct words. See many
examples in  https://man7.org/linux/man-pages/man2/syscalls.2.html.

Thus, I'd suggest at least secret_memfd().

Also, I wonder whether memfd_secret() might not be even better.
There's plenty of precedent for the naming style where related APIs
share a common prefix [1].

Thanks,

Michael

[1] Some examples:

       epoll_create(2)
       epoll_create1(2)
       epoll_ctl(2)
       epoll_pwait(2)
       epoll_wait(2)

       mq_getsetattr(2)
       mq_notify(2)
       mq_open(2)
       mq_timedreceive(2)
       mq_timedsend(2)
       mq_unlink(2)

       sched_get_affinity(2)
       sched_get_priority_max(2)
       sched_get_priority_min(2)
       sched_getaffinity(2)
       sched_getattr(2)
       sched_getparam(2)
       sched_getscheduler(2)
       sched_rr_get_interval(2)
       sched_set_affinity(2)
       sched_setaffinity(2)
       sched_setattr(2)
       sched_setparam(2)
       sched_setscheduler(2)
       sched_yield(2)

       timer_create(2)
       timer_delete(2)
       timer_getoverrun(2)
       timer_gettime(2)
       timer_settime(2)

       timerfd_create(2)
       timerfd_gettime(2)
       timerfd_settime(2)




-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
