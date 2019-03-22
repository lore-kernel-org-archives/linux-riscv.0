Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABDDC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 12:29:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8F792070D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 12:29:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fBAKqNUF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="W+Srnho4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8F792070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8ttYUQM0ZW6i9edw19YZgRdfh+nKjdA59Zzqg5MtbQ=; b=fBAKqNUFUSHEvF
	N9Hudm5LX5HRY3HuEVcVwo4YCQlxSuq46LDhZ/3OSo59xLNXpakHsojOSj5Cw5VoPsqhVxXsXh76Y
	Ayi+Wd7WjFl82z+eZLHglf8lyMYZIeI8Gef+8GIviza+LG9PhUaO5uZlR5y6I9YCzEDFZF5Hwz1UB
	wn5Zr80pPlwJhcuPS0bJhMI/RH3evLgDZxl3dyK96vsUPUCPwAWiZ9hE5xQ+lsEH5jv+gjGcENRB9
	uIeBOJQMJNoLY8HTan4toI0I+bVwEGjYNIXRknWcscrNRMcz9762ldvFUTZEz2/Mj1IORa3YH19Dt
	9ngxNlrqOnjeB1/yeG5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7JIa-0007cy-Aj; Fri, 22 Mar 2019 12:29:24 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7JIX-0007cJ-7M
 for linux-riscv@lists.infradead.org; Fri, 22 Mar 2019 12:29:23 +0000
Received: by mail-wr1-x444.google.com with SMTP id o1so2117897wrs.13
 for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2019 05:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gsBMzsAmiyUElzJcpQItPvRWOyfdj0auWFoYPBI5Ooc=;
 b=W+Srnho4wYE3YUTA6/XX1WtmqZA+IhOKDV2LZ3NrUE+RG26YQCmQhcQyM/AvCLxAar
 EnYIly4SNzWUSWgjxV0U8/C9y2CN0i3sJ7XOKX7HQWY8uNMCEdFU8r/aaLmIhGUPtzbs
 BnEnyaUtoyRMS1GvT3tXToqh/TvwAI9JdGzS9JAWqrxPTdK2zHExII6TJwviYzybcsga
 4otdWwSusp0cv1MlX7zHontdR2RF1B2qJHl/WPNqA/Pr7LMpHnIXBIl2jIT2a39diOk4
 cPMvvU+34QQnmz/0kgKEuQdlM9VZ+kNlkqafTaMO15+KBT2k7OGjFl+rvGXZRESNvyv5
 5bKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gsBMzsAmiyUElzJcpQItPvRWOyfdj0auWFoYPBI5Ooc=;
 b=MlYDRz5dQsxmPGT6jyTMc/rgiLctQZajFd7sq/YV5kclwNHA7bgPT3Sv+UFpEABnCR
 iI4VaTs+oUYWT3trgEjjYV08MSbRndn2c49bFbgIqMfqqASgjfFbvEBfN8lSZHrX30TK
 uxyuVNtsKAIK+X5dXjIBD0ml0COyBjO3Sr+PPRfNt/hoUlWOw13ldDJeeueSQcXmcv8U
 ichsQAcpZQXPlbFBZ2Sw9FUv7vmz5QqRKeKoPAZudLMhySIckGsfA1tL0NhrLVN5O0PM
 K3wGrlT5jji3QExf/atNfGqcwUTGMCKo5hehRMUg0Y5Ec3l6vcu5Tw/iROYNtun6GOuF
 G1Ag==
X-Gm-Message-State: APjAAAVlD7p1Xi4ZADlzjEzTvAb6d2mXPEVzagWvuYQxdlxfyJ0H0G5T
 OQ2Ni5ox3bnwxVS0h/wReLacKrv4TBDHbeU1s6JyaC7Qanc=
X-Google-Smtp-Source: APXvYqxG02AWTjKdibVMeSqlMXLk+K2/NsAYdl5vcT4zIqtkJul5s34QPTqed6Iir8aUSbexgj1PHweZnQnHgcJIHac=
X-Received: by 2002:a5d:52ca:: with SMTP id r10mr6549244wrv.187.1553257759146; 
 Fri, 22 Mar 2019 05:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
 <20190322104209.GB24367@rapoport-lnx>
In-Reply-To: <20190322104209.GB24367@rapoport-lnx>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Mar 2019 17:59:07 +0530
Message-ID: <CAAhSdy3UoX9gS=9YN6m0=qA2g-m=bw-Y-N-5CAFQZcnKA04C5g@mail.gmail.com>
Subject: Re: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_052921_401912_04EB7D39 
X-CRM114-Status: GOOD (  14.33  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 22, 2019 at 4:12 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> Hi,
>
> On Fri, Mar 22, 2019 at 11:46:24AM +0530, Anup Patel wrote:
> > Hi Palmer,
> >
> > The 32bit kernel booting is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
> > affecting setup_vm() movement from kernel/setup.c to mm/init.c.
> >
> > There is no issue with 64bit kernel booting.
> >
> > The "[PATCH v2 2/5] RISC-V: Make setup_vm() independent of GCC code model"
> > fixes this issue.
> >
> > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1959102.html
> >
> > If possible please include above patch as Linux-5.1-rc1 fix.
>
> I'm not convinced that it's the best solution. Multiple __load_pa() and
> __load_va() conversions make code unreadable.

We have many __load_pa() and __load_va() in setup_vm() here because
this patch only get's things working for 32bit RISC-V kernel.

If you look at PATCH3 of my series then you will see that use of __load_pa()
and __load_va() is simplified a lot and is easily readable. This was possible
by rewriting the initial page table setup code.

> Is there any reason swapper_pg_dir cannot be setup after 'relocate'? It'll
> save a lot of churn for the current fix and for the addition of 4K mappings
>
> I've drafted a patch that separates trampoline_pd_dir and swapper_pg_dir
> setup, if it works, the __load_pa() and __load_va() conversions can be
> applied only to the trampoline initialization. I don't have riscv hardware,
> so it's compile tested only.

I had similar views as yours but I found that trampoling_pg_dir is totally
redundant and since it is part of __init section it will break runtime hart
hotplug in future. All mapping in trampoling_pg_dir are already covered
by swapper_pg_dir. The PATCH4 in my v2 series removes trampoline_pg_dir.

We just need to map vmlinux_start to vmlinux_end and DTB in setup_vm()
that's all. Complete memory is only mapped in setup_vm_final().

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
