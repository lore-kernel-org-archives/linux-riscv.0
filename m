Return-Path: <SRS0=PVrh=R3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72102C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 03:32:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 456C22171F
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 03:32:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KC2CrVqU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="2AllWECy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 456C22171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4nB93Ixj9hPfWEJfRn0Zb7pIkp+i4FNakE1/gzCFZ1g=; b=KC2CrVqUHPp7uI
	D2elj32i21r4qjOCndGqzqp7GBBzuJt8oK2rVfXGxS42WmfvPnbKo+8S/T3VRLKkFAYEv5wf5e900
	BQCWkF5IsggTyJfv0aqQrj5AalLQ8C/1Aa41m7pt/Wn0pPD94j8i4lh/DcKnahlE9GS7fY77XiEvp
	8cmjWis1cZzEoTbXzLhQbm6VEC5iiXjsHzgFbndgMtlUXFTa9EQma0s2bueNYxPIrNDS3+9BpYGqc
	Nz/i7O92+VH9XN/h2Vaq50mY2/Z9Q0guV2HFKJbZp5IsccdnH/FtWKmYjjuo5j7nDbEulpsXyFNlf
	P2oQH4KaZhkfYgVVimIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7tsO-0002Ni-27; Sun, 24 Mar 2019 03:32:48 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7tsL-0002N2-A7
 for linux-riscv@lists.infradead.org; Sun, 24 Mar 2019 03:32:46 +0000
Received: by mail-wr1-x442.google.com with SMTP id w1so6418646wrp.2
 for <linux-riscv@lists.infradead.org>; Sat, 23 Mar 2019 20:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5r5BnJmBdEeR/Dv9Ixv/XBgxXRYB+lCzjMiA1TLjrxM=;
 b=2AllWECyHNVdDWdGmXG3lZ/Yh4+CrRBHOFVG/W8CmEa/aq913z87NR6MXsFItvj4gJ
 PY6v0y6rpiElfAIuWXSI+EXbQ1F5aS5AwWYrekhxYKatsylJhe9DuRZZQG124crIQM7Y
 MLE1gfSsWSNZRedEewc3lruHi15EeaSo/lWkxp+zMN1qyKM+PddhKs462wdGueehZRRi
 FyhZ4mEomgfhpKJGpGfrcAP04UaNrIu12gKvgKaP6PKWeG2txus1f6SFNEG3iEmrrFic
 ycK02sKtwiR5QbS7gFi3QBL/w4CbJjwWNRIGt6mL+/IRwzsh//aDKVDO+X0JldoDQaPB
 tHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5r5BnJmBdEeR/Dv9Ixv/XBgxXRYB+lCzjMiA1TLjrxM=;
 b=AOBQ2W0fUg4KqceC5FgjzzqtUjwETqXVnLbKIcQvsHs+J8cmcka2rEtJ6V/QASkOk2
 R7jEw297wEsSJ0LMZr6Pyqb9no7sjWqcyVu4as3z9GMrb2V5r1cN4pJkLNYACaWo78Ws
 xBIk0Kxz9S/HOVNMWZ+eghG8pnuLG5BxAPtTbgs6krx/GGEPDp4UOnXe3ihEx9gqeMrT
 GeJf/Q4ZWDD87lrJ7Gdsb6mottC+tynu/t4V+SzUKVJTmeqTIDmfMetdQh2tYYgyYBfs
 VO7dxVn26UQuk4mj79oABFgy1D5dzJZu/ibu6mhjIsaBg1Ld+cHmfz2eip+EQ7AV+cri
 /cvQ==
X-Gm-Message-State: APjAAAWECpjaUlcd3d/kwb/uWgqPThzLeGES+Wdu07L5z4VmQKh51B8b
 DksG1YTmgIaso67wp1v1uY3rPbBkHnCJmPtNP+nxPA==
X-Google-Smtp-Source: APXvYqzZOBi3gtlVEklHVhBx+XcBOyXaK4/PmJSGRdZ/nRYL0+FoevrUxknF1S3nGnpQDeJH2UVQdr2gYqarqLUYto4=
X-Received: by 2002:adf:fe03:: with SMTP id n3mr6925904wrr.59.1553398362654;
 Sat, 23 Mar 2019 20:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190321094710.16552-1-anup.patel@wdc.com>
 <20190321094710.16552-4-anup.patel@wdc.com>
 <20190323154012.GA25149@rapoport-lnx>
In-Reply-To: <20190323154012.GA25149@rapoport-lnx>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 24 Mar 2019 09:02:31 +0530
Message-ID: <CAAhSdy1enG_9o1rtZcwhht6e_-t2G1-yUy8Q5ENjnQKKW4UTeA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] RISC-V: Allow booting kernel from any 4KB aligned
 address
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_203245_352484_180B7DE8 
X-CRM114-Status: GOOD (  18.03  )
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
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Mar 23, 2019 at 9:10 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Thu, Mar 21, 2019 at 09:47:51AM +0000, Anup Patel wrote:
> > Currently, we have to boot RISCV64 kernel from a 2MB aligned physical
> > address and RISCV32 kernel from a 4MB aligned physical address. This
> > constraint is because initial pagetable setup (i.e. setup_vm()) maps
> > entire RAM using hugepages (i.e. 2MB for 3-level pagetable and 4MB for
> > 2-level pagetable).
> >
> > Further, the above booting contraint also results in memory wastage
> > because if we boot kernel from some <xyz> address (which is not same as
> > RAM start address) then RISCV kernel will map PAGE_OFFSET virtual address
> > lineraly to <xyz> physical address and memory between RAM start and <xyz>
> > will be reserved/unusable.
> >
> > For example, RISCV64 kernel booted from 0x80200000 will waste 2MB of RAM
> > and RISCV32 kernel booted from 0x80400000 will waste 4MB of RAM.
> >
> > This patch re-writes the initial pagetable setup code to allow booting
> > RISV32 and RISCV64 kernel from any 4KB (i.e. PAGE_SIZE) aligned address.
> >
> > To achieve this:
> > 1. We add kconfig option BOOT_PAGE_ALIGNED. When it is enabled we use
> >    4KB mappings in initial page table setup otherwise we use 2MB/4MB
> >    mappings.
> > 2. We map kernel and dtb (few MBs) in setup_vm() (called from head.S)
> > 3. Once we reach paging_init() (called from setup_arch()) after
> >    memblock setup, we map all available memory banks.
> >
> > With this patch in-place, the booting constraint for RISCV32 and RISCV64
> > kernel is much more relaxed when CONFIG_BOOT_PAGE_ALIGNED=y and we can
> > now boot kernel very close to RAM start thereby minimizng memory wastage.
>
> I have no general objection, but I presume the patch will be significantly
> simplified if the addition of 4K pages support will follow the removal of
> the trampoline_pd_dir.
>
> That said, I didn't look into the details, since they will change
> substantially, only some comments on the Kconfig part.
>
> On the high level, have you considered using large pages in setup_vm() and
> the remapping everything with 4K pages in setup_vm_final()?  This might
> save you the whole ops-> churn.

Yes, it can save the ops churn in setup_vm() but we should let setup_vm()
choose best possible mapping size based on load address alignment hence
it's better have common page table setup code shared between early and
final page table setup which can create mapping of any size.

For example, if we are booted from 1G aligned load address then setup_vm()
should create 1G mapping thereby getting better performance compared to
2M mappings.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
