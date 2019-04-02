Return-Path: <SRS0=a8/2=SE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB48C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 17:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49BBA205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 17:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pnvkiSR6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="HALv0SQX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49BBA205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l5jGZzBn0PjldXm1+jGllY+2Gw/yyEIitQ8nxShUAmg=; b=pnvkiSR67Ydb38
	pq8CMvQS7JDgnkyH4iZi5Ab+GWoN08Veo1Bpq/NF8RIKqzrTz/k6cp3b/7g1OdnE8ERq7E3RdLHi4
	uPWUHMCj0xGDqwwnA2nPGOBZQ5UBiySPkIFC8WRSxZYHU0syX4wopX6vP0oUvSFM3yaDEwHNZc9Cs
	8M5IOeg4U8k2T3q5xfv6COWeG4hf/8dNRN/mkd3Lcz4NQt1W79fL+DpqX+b7qVs1/7/FktqvLYIp7
	4m2yXoocTrCnxlQEn6ad3p7DYwiIVv9M9Ps5tZX/o247ODU8kGapfGG4kWGqq5SXyr8LIHh4K9BlA
	9hiFAzbbyYJA7DeGCQDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBNNJ-0002Z9-6C; Tue, 02 Apr 2019 17:39:05 +0000
Received: from lkcl.net ([217.147.94.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBNNF-0002Y9-VH
 for linux-riscv@lists.infradead.org; Tue, 02 Apr 2019 17:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=TCnQBsYfZ6Ksxv/EuhygD3/YajoF1SP0L+2WCthEAvw=; 
 b=HALv0SQXUHdFehHmwlChXPpppl42am75VD+Z30lRTEJdXH0X7CIfF0ebx5Syc9VwSKKYFFl9PJo8n/A0T0i7fku+SVMLfgRQHb54PrG3h3zz3vLJiiPJmibLlwYCkFBDILFfT4HpIv3esAbY+iLccUE2f1lnKgV7+tSsU9rLqJw=;
Received: from mail-lj1-f181.google.com ([209.85.208.181])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1hBNMx-0005Gh-6q
 for linux-riscv@lists.infradead.org; Tue, 02 Apr 2019 17:38:43 +0000
Received: by mail-lj1-f181.google.com with SMTP id f23so12379782ljc.0
 for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2019 10:38:27 -0700 (PDT)
X-Gm-Message-State: APjAAAUKqwCmtMx2cBK6iLTFyj9j3aMhVFWYORKTGTTHHDJw50hHmDlx
 w1hMwgYtVBDwNHnvsW1AJimg/pMm4YXLSxlKYJM=
X-Google-Smtp-Source: APXvYqzboFBYGI+MM/CG3/9j1KHTRkDVNNKLogoiLGMyE1IR+a5S02vR4zq2Kprf8WcSzPEeQYduEisN4oo6WR4XgKQ=
X-Received: by 2002:a2e:5056:: with SMTP id v22mr39819342ljd.153.1554226702200; 
 Tue, 02 Apr 2019 10:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-99966160-5466-4cfc-b3d8-48ad48d3dc74@palmer-si-x1c4>
In-Reply-To: <mhng-99966160-5466-4cfc-b3d8-48ad48d3dc74@palmer-si-x1c4>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Tue, 2 Apr 2019 17:38:09 +0000
X-Gmail-Original-Message-ID: <CAPweEDyb7SQB8zXu_fKEDO5gGBn69xoEFC86-tFr1HBhnSoJ9w@mail.gmail.com>
Message-ID: <CAPweEDyb7SQB8zXu_fKEDO5gGBn69xoEFC86-tFr1HBhnSoJ9w@mail.gmail.com>
Subject: Re: [isa-dev] UNIX-Class Platform Specification Working Group
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_103902_283845_9273F6C2 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: RISC-V ISA Dev <isa-dev@groups.riscv.org>,
 Rick O'Connor <rickoco@riscv.org>, Atish Patra <Atish.Patra@wdc.com>,
 RISC-V SW Dev <sw-dev@groups.riscv.org>,
 RISC-V HW Dev <hw-dev@groups.riscv.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 2, 2019 at 5:50 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> Atish and I have approval from the RISC-V technical committee and board to
> start a group to manage the UNIX-class platform specification.  This working
> group will start by defining a subset of this platform specification that both
> allows compatibility with existing implementations and extensibility for the
> future needs.  The contents of this first platform specification will include:
>
> * A versioning scheme for future versions of the UNIX-class platform
>   specification.
> * A specification for a platform-level interrupt controller that is compatible
>   with existing implementations of SiFive's PLIC.
> * A specification for a standard SBI that is compatible with the current
>   implementation in Linux as well being extensible for future needs.
> * An SBI extension for CPU power management.
> * A specification of the interface between a bootloader and supervisor-mode
>   software.
>
> Since this working group mostly consists of standardizing existing
> implementations, I hope it can progress quickly.  As such, I'd like to set a
> 6-month deadline between when the working group is started (ie, today) and when
> a specification enters the 45-day review period.

 this sounds great, palmer, it will help resolve some of the
uncertainty surrounding the Unix platform, allowing implementors to
commit to silicon with confidence.

as you are no doubt aware, the commercial and mass-volume libre risc-v
SoC is a hybrid CPU / VPU / GPU [1], where for example the TLB /
Virtual Memory handling and other aspects *may* need to deviate from
the standard UNIX-class platform specification, or suffer significant
(commercially unacceptable) performance degradation, jeapordising its
chances of commercial success if its hybrid requirements are not met
by the UNIX-class platform.

 in addition, as it is not intended as a proprietary (secretive,
closed doors) design, those (potential) modifications *will* end up as
publicly-released common-place mass-volume and high profile
modifications to the associated software and toolchains that will
ultimately require (potentially forcibly - not by our team! - due to
user demand) upstream long-term distribution and support.

 in addition to *that*, there are funding applications being
considered and under review that *require* full disclosure and full
transparency, as part of "Enhanced Privacy and Trust" for end-users
[2].  secretive closed-doors discussions of innovations and potential
enhancements to, and ratification of, the UNIX-class platform are *not
possible*, because engaging in secretive discussions would be viewed
by investors, customers and end-users alike as "something to hide",
and thus irrevocably cause harm to the reputation of the project by
undermining its business case as a "trusted independently auditable
product at every level of its development and manufacture".

 question: is the discussion of the UNIX-class platform specification
to take place in a fashion that is inclusive of the *business* needs
of this commercial *and* libre project to remain entirely public and
transparent at all times?

 difficult as this is to point out: we have asked about this in the
past, many times, and have not received a response.  investigations
into Trademark Law show that the point at which financial and other
damages occur due to manufacturing and design delays caused by
persistently and systematically not receiving a response is the point
at which a Trademark may be irrevocably invalidated.

 whilst we continue to develop this product in good faith (an
important factor to note under Trademark Law), and will make our best
efforts to ensure interoperability (another extremely important factor
to note under Trademark Law), our coninued exclusion from access to
ongoing innovations and the Standards Development Process *will* at
some point require us to make decisions or suffer substantial
financial loss as a result.

l.

[1] unlike a discrete GPU, which is a completely separate isolated
processor where IPC is deployed to shuttle data between the CPU and
GPU, and thus any augmentations or non-compliance with Standards *does
not matter*, a hybrid CPU / GPU / VPU has CPU workloads *and* GPU
workloads *and* VPU workloads operating on the exact same SMP cores.
the number of *general-purpose* registers has therefore been increased
to a whopping 256 (128 INT and 128 FP), the ISA extended to cope (as
hinted at as a possibility right at the top of the priv-spec), the TLB
will almost certainly require pre-load "hints" due to the
significantly different nature of GPU parallel workloads, and many
other aspects besides.

[2] https://nlnet.nl/PET/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
