Return-Path: <SRS0=PVrh=R3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C5EC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 04:16:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FB592171F
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 04:16:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hi/J8RPN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="oMcV9Qsw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FB592171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOITLky2soK8VVoXtNQZyXldNonZcSFNBSuajsF0BYg=; b=Hi/J8RPNvesGgg
	bdbtlWlcnVpg56Kx1zaozeYQ+vNLEmW5D4y9aGYo4zNq50ruzDPjp98IlF+vMuI11EC8gHMM4OlJX
	/FkwfBNbP0PbKrKKR3QLruG1InnPmyowCUFwA9+GtZN35RIG2JA4V7eOKkD79RQ+WrdPtWlDpbZFB
	VSWL0A58hWeSEFb05tOXGOO4KSXaoMYk6VYI8s0WZ9Dd8gAqZmpOTQSFl4VPq69DMG07BIN6/v8or
	3JxhRXlO+01ElEtPytxWCGZdT6LQaR25+bJ329+WANEbjaW/gq794t99g2uJvPTYotrWgPZguEU6W
	dbA7S9Ukqa9evbP9mhWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7uZ1-0000Wz-RP; Sun, 24 Mar 2019 04:16:51 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7uYy-0000WA-NJ
 for linux-riscv@lists.infradead.org; Sun, 24 Mar 2019 04:16:50 +0000
Received: by mail-wm1-x342.google.com with SMTP id z24so2387635wmi.5
 for <linux-riscv@lists.infradead.org>; Sat, 23 Mar 2019 21:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kJcnT5dwTmgu7HoGHnOBrIOugHBvna1fMwqu9gN6KUk=;
 b=oMcV9QswJMr4ZCvb7NhJtyiTRvHaYDoT/4TqApGnGNwWRm8A9YhMU4e3xAplMrgSUk
 4De8lGuuSLM7i1grA60EJrztUVKpyiDPghGsgnddW8CUTDoXOG/6IpWzJ/dTLR1K4bwR
 hkQnPNyZMHo2picdY4834zqU6AEvjHubQJEiM4279qlgC+LgH5ZynNraTJLs1xjXRjBS
 qf0xYhEM1iTi6IiPD9SvnS0yQK//Q1lPOiuhYCasCj0hZMqRlV5OLghvADZA8NiFgSzE
 cCFcyVIKvkX1wd3/6XrYJxeP7deKokMwm0jWEoWwArSDxgH3GXs6fgTWFPvwk23fBOj8
 QMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kJcnT5dwTmgu7HoGHnOBrIOugHBvna1fMwqu9gN6KUk=;
 b=MR96CDkjh3q8r7CGAJfEyguysEmy8lnm2qOD/clA8bhGpdCKOTYcmGmCSTGEo6Irm5
 hhVJO3KPMl3F98XC9GAZuuvzjyffeFJfFxhR/Mp69lODsb6wNK4wuSq63cxAhkGOszRj
 GQ6LJW9bF5LZaSW0q5uuJDjuGPIaiuBdk0Cnci1XaDej+ayeSmzUVH72vPrvbzC9r61r
 v/+0fy4PbLYB8GaXTap/fBM+rj1A2JpPO9qZORkE5SxJ2dQBeB5sepKL44i4Iy8zbcBV
 nJRoy05Tat+vHTdBomQHwdeBlayCp8OyLd8e8/IFHL7r22xowTqmUpRZRsja5nzrvReI
 NrUQ==
X-Gm-Message-State: APjAAAWBwk4aFfaMWO7xaMTWvxElQKFoeQ5C+OO0LggrrbjPT2vM14zz
 l41yBgfc6oV9HGxE7CE1LnAegvfJYg8tX1lcROqHKg==
X-Google-Smtp-Source: APXvYqyyIo4eYKj4CBhjPwWjw0kMvGMe3WtrqZt3RZz5gU1YJxxpWdIocVLVISDA8VmuBE3htmn9PfWYtBTX7dNekEE=
X-Received: by 2002:a1c:700e:: with SMTP id l14mr6969803wmc.132.1553401006058; 
 Sat, 23 Mar 2019 21:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190321094710.16552-1-anup.patel@wdc.com>
 <20190321094710.16552-4-anup.patel@wdc.com>
 <20190323154012.GA25149@rapoport-lnx> <20190323172421.GA14080@infradead.org>
In-Reply-To: <20190323172421.GA14080@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 24 Mar 2019 09:46:34 +0530
Message-ID: <CAAhSdy2chHhAUJ5DtmaqHS8LFuFuiwhmnsh9mmuKZd8MX=Bqkg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] RISC-V: Allow booting kernel from any 4KB aligned
 address
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_211648_811104_27AC8D58 
X-CRM114-Status: GOOD (  15.42  )
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
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Mar 23, 2019 at 10:54 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sat, Mar 23, 2019 at 05:40:12PM +0200, Mike Rapoport wrote:
> > I have no general objection, but I presume the patch will be significantly
> > simplified if the addition of 4K pages support will follow the removal of
> > the trampoline_pd_dir.
> >
> > That said, I didn't look into the details, since they will change
> > substantially, only some comments on the Kconfig part.
> >
> > On the high level, have you considered using large pages in setup_vm() and
> > the remapping everything with 4K pages in setup_vm_final()?  This might
> > save you the whole ops-> churn.
>
> That would be a great start.  That being said the current tiny memory
> RISC-V devices don't even have a MMU, so the kernel pagetable mapping
> isn't even relevant for them.  I'm just not sure adding more complexity
> in the early boot path for a borderline case (MMU and tiny memory
> with a tiny kernel image) is reall worth all the complexity.

It's not just for addressing a borderline case (MMU and tiny memory with tiny
kernel image).

We trying to addresses following issues in current code:
1. The current setup_vm() maps all possible kernel virtual addresses (128GB
on 64bit system and 1GB on 32bit system). The amount RAM present on
real systems might be much less so we should not have kernel mappings for
non-existent RAM. Of course, we don't know amount of RAM available in
setup_vm() so we have to split page table setup in two parts and do minimal
required mapping in setup_vm().
2. NOMMU kernel requires a swapper_pg_dir with identity mapping (VA == PA)
and without it we get boot-time crash so we cannot skip it for NOMMU case. For
NOMMU, the PAGE_OFFSET will typically be 0x80020000 (or 0x80xxxxxx). This
means swapper_pmd array (which uses -PAGE_OFFSET) will be over-sized
causing compile errors.
3. For both NOMMU with tiny memory and MMU with tiny memory, the current
setup_vm() is not allowing us to place kernel on non-2M (or non-4M) aligned
addressed there by causing memory below kernel to be wasted.
4. For MMU based kernel, the current setup_vm() is hard-wired for fixed 2M
mapping size. It will require more changes if we want to do 1G mappings.

The above issues motivated us to re-write setup_vm().

We are trying to make initial page table setup more flexible and robust so that:
1. We don't have any unwanted mappings pointing to non-existent RAM
2. We can have any value of PAGE_OFFSET for NOMMU case without the
page table arrays becoming oversized
3. We can create mappings of best possible size to get good performance
4. We can boot from any 4K/2M/1G (or just 4K) aligned load address

Also, the end result of all this is a much more readable page table setup code
shared between setup_vm() an setup_vm_final() where the differences are
abstracted via mapping ops.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
