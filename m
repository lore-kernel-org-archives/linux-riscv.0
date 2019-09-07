Return-Path: <SRS0=H4jo=XC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFC0C4332F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  7 Sep 2019 23:53:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E68A206C3
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  7 Sep 2019 23:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RtYdeLSM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQhzSJ+9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E68A206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3b/Lc7tW4rYPgR27LlErh6xliMNSD6K+r0FUENPyBg0=; b=RtYdeLSM6p9kfe
	Uhj/7RMMu/yn6gg1yH25rMp7F2bBuQl62G5MZXyGM3qdCgxC5ddIsCeHSOdymPWuF1HD0yrS/LpOu
	3OWy0749h65jXfj1VaG3AaVPK2jbSFL6XELdZVzx57oNKgoR5QjwFxUlszUbK3b75cVbxdYbhvEym
	GMT/4/IVqulOnGdrG35VDcw2Uvq0k0jAu6L+RI2WufIEZL+33qHnjebiQJJQEpILEO9lWavonQhjf
	BFoMQwx2rP1QDl22XEQVmDtabp+WvIArotZ8vGhvDXxKxsrP6e8Vo+v3uRWoCZBdw+UT7+A0JnDFO
	QlawHUmPYSj68tDC01/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6kWC-0002Vv-RT; Sat, 07 Sep 2019 23:53:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6kVy-0002Kr-0J; Sat, 07 Sep 2019 23:53:11 +0000
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7427B21882;
 Sat,  7 Sep 2019 23:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567900388;
 bh=KU+yu1dnpjqMkvaxD0NQ/62kFYi8GAP69zuvLWhpBPg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iQhzSJ+9oXgDhIW7PRJgS7OAd27+ApcmlwV1Pr1t7tIdVxFSSbNmEPtHB+EVkx/QI
 3oFy7UEQ8OJz3CxRjUYWmyWOwvSBH4uR+n5qkd1ZBcZeaqG5m2rMeo15JOhhtEIi6O
 gZUNlX9yNbmazWAWH7DCrTZAkCxjkeJuFftVnO9s=
Received: by mail-wm1-f43.google.com with SMTP id n10so10780540wmj.0;
 Sat, 07 Sep 2019 16:53:08 -0700 (PDT)
X-Gm-Message-State: APjAAAXcCJ6DjBNFw3dKSjZNC1KMWNK5NlJ3u8gW203KEG5MF8/PH3/Y
 SH7fZS93O2NvJQ4NRwjbg4VxPMswFntbi4H4lSc=
X-Google-Smtp-Source: APXvYqz/EaoziXhxATPtaiz7WMpDkudp2uTSNKWYfbpcDLkqo0GVOyZavKTFmq2PKcMvW87cxTCwTetw/AbRtRbW9aM=
X-Received: by 2002:a1c:f007:: with SMTP id a7mr12784687wmb.172.1567900386906; 
 Sat, 07 Sep 2019 16:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190321163623.20219-1-julien.grall@arm.com>
 <20190321163623.20219-12-julien.grall@arm.com>
 <0dfe120b-066a-2ac8-13bc-3f5a29e2caa3@arm.com>
 <CAJF2gTTXHHgDboaexdHA284y6kNZVSjLis5-Q2rDnXCxr4RSmA@mail.gmail.com>
 <c871a5ae-914f-a8bb-9474-1dcfec5d45bf@arm.com>
 <20190619091219.GB7767@fuggles.cambridge.arm.com>
 <CAJF2gTTmFq3yYa9UrdZRAFwJgC=KmKTe2_NFy_UZBUQovqQJPg@mail.gmail.com>
 <20190619123939.GF7767@fuggles.cambridge.arm.com>
 <CAJF2gTSiiiewTLwVAXvPLO7rTSUw1rg8VtFLzANdP2S2EEbTjg@mail.gmail.com>
 <20190624104006.lvm32nahemaqklxc@willie-the-truck>
In-Reply-To: <20190624104006.lvm32nahemaqklxc@willie-the-truck>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 8 Sep 2019 07:52:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSC1sGgmiTCgzKUTdPyUZ3LG4H7N8YbMyWr-E+eifGuYg@mail.gmail.com>
Message-ID: <CAJF2gTSC1sGgmiTCgzKUTdPyUZ3LG4H7N8YbMyWr-E+eifGuYg@mail.gmail.com>
Subject: Re: [PATCH RFC 11/14] arm64: Move the ASID allocator code in a
 separate file
To: Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190907_165310_066042_458FC8FE 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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
Cc: julien.thierry@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 christoffer.dall@arm.com, Atish Patra <Atish.Patra@wdc.com>,
 Julien Grall <julien.grall@arm.com>, gary@garyguo.net,
 linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, suzuki.poulose@arm.com,
 Marc Zyngier <marc.zyngier@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, Anup Patel <anup.Patel@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, james.morse@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Thx Will,

On Mon, Jun 24, 2019 at 6:40 PM Will Deacon <will@kernel.org> wrote:
> > I'll keep my system use the same ASID for SMP + IOMMU :P
>
> You will want a separate allocator for that:
>
> https://lkml.kernel.org/r/20190610184714.6786-2-jean-philippe.brucker@arm.com

Yes, it is hard to maintain ASID between IOMMU and CPUMMU or different
system, because it's difficult to synchronize the IO_ASID when the CPU
ASID is rollover.
But we could still use hardware broadcast TLB invalidation instruction
to uniformly manage the ASID and IO_ASID, or OTHER_ASID in our IOMMU.

Welcome to join our disscusion:
"Introduce an implementation of IOMMU in linux-riscv"
9 Sep 2019, 10:45 Jade-room-I&II (Corinthia Hotel Lisbon) RISC-V MC

--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
