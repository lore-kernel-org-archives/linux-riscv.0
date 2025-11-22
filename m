Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B44CFC518
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Nov 2025 01:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9lX1nPBKeumQTxNizxS9srR2CO0SeUtQC1nktARa/A=; b=MKeFcVLzadrjeDdGBQbZPoJfF2
	+rAEXQ6z81WsSOw70LyrDG6OCiVOFg58J0v/ZubHXggb3q7M6PiGYX8Z6afZb5SbPvB/P+H8YH1w6
	f13wH23BRqosmpP5u0Jq0awBB5zGisfQJPZ1yntof1mCcDllwi2+47ppPNbZEnvfShuBsTLJWcLxV
	Lv78LHQSZyWER/KHZeKaz/6kMP5/jvemmU90Lok+4xHWXaLoI/HAaekyjC6Zvybg5+GQFPAVfCAU2
	Gba80qIQfmBJVXkzcVQ+fxpJqgfN+ihO9Zkv53OTIzI+BY3dQz24llyKREi67sr6mamphZzqbZdjD
	vxcptv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMcCq-000000098Os-1Ulb;
	Sat, 22 Nov 2025 01:14:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMcCp-000000098Oi-0Iny
	for linux-riscv@lists.infradead.org;
	Sat, 22 Nov 2025 01:14:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7935D60008;
	Sat, 22 Nov 2025 01:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2BDC4CEF1;
	Sat, 22 Nov 2025 01:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763774066;
	bh=TmK0ymaRbGnYFBwWDPKvoufQniChA4/p5HNSW5rwn4k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DOCCUXDK6NRPvEW7WVjqDqRvikLNZETxp14lEvjXrEOexGVnJH5y6gk0Z+olezdx8
	 4EshyvU5rLYqAlq84lgdS6MouZYFhL+q2fvWLIxnFc7zqz2CSNMSrhraclcdPg4jRS
	 unLYvOiCD/w4CABgMBmXum9x7DnFD3jGUqhKK6d3W1LiwqTyKPiE3y/sOoVCY8Eua9
	 yZeM/aBkwqJmXgXWDZl+XwWtf7eXckoFGU9Aza5brimVrD3fwG00I0GmVhWB5tN3J3
	 OZJODR9xGQq7Fo2W34AgrGfyIAcU1NjUgIN75TmMKBwRRs/GBSyuKdCDwXCkP0eKUo
	 sGpN4++AqfYXg==
Date: Fri, 21 Nov 2025 18:14:24 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Anup Patel <anup@brainfault.org>
cc: Paul Walmsley <pjw@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
    Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alex@ghiti.fr>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    Atish Patra <atish.patra@linux.dev>, Atish Patra <atishp@rivosinc.com>, 
    linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Nutty Liu <nutty.liu@hotmail.com>, linux-riscv@lists.infradead.org, 
    Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, 
    Len Brown <lenb@kernel.org>
Subject: Re: [PATCH v3 1/1] RISC-V: Add common csr_read_num() and csr_write_num()
 functions
In-Reply-To: <CAAhSdy0iwq_ZPzFY5_x_wsbM_H+npSDVv1F=wP=O-_25VChh6Q@mail.gmail.com>
Message-ID: <60f4c500-6e22-ed4b-912b-c9368bad7c9a@kernel.org>
References: <20251014132106.181155-1-apatel@ventanamicro.com> <20251014132106.181155-2-apatel@ventanamicro.com> <012aaa39-a37b-e682-0e34-9b7d7cd87f75@kernel.org> <CAAhSdy0iwq_ZPzFY5_x_wsbM_H+npSDVv1F=wP=O-_25VChh6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-284714384-1763774066=:3073511"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-284714384-1763774066=:3073511
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 30 Oct 2025, Anup Patel wrote:

> On Thu, Oct 30, 2025 at 12:35 AM Paul Walmsley <pjw@kernel.org> wrote:
> > On Tue, 14 Oct 2025, Anup Patel wrote:
> >
> > > In RISC-V, there is no CSR read/write instruction which takes CSR
> > > number via register so add common csr_read_num() and csr_write_num()
> > > functions which allow accessing certain CSRs by passing CSR number
> > > as parameter. These common functions will be first used by the
> > > ACPI CPPC driver and RISC-V PMU driver.
> >
> > This patch also (silently) removes the CSR number filtering, e.g.
> >
> > > diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
> > > index 42c1a9052470..fe491937ed25 100644
> > > --- a/drivers/acpi/riscv/cppc.c
> > > +++ b/drivers/acpi/riscv/cppc.c
> > > @@ -65,24 +65,19 @@ static void sbi_cppc_write(void *write_data)
> > >  static void cppc_ffh_csr_read(void *read_data)
> > >  {
> > >       struct sbi_cppc_data *data = (struct sbi_cppc_data *)read_data;
> > > +     int err;
> > >
> > > -     switch (data->reg) {
> > > -     /* Support only TIME CSR for now */
> > > -     case CSR_TIME:
> > > -             data->ret.value = csr_read(CSR_TIME);
> > > -             data->ret.error = 0;
> > > -             break;
> > > -     default:
> > > -             data->ret.error = -EINVAL;
> > > -             break;
> > > -     }
> >
> > ... the above code, and:
> 
> The switch case is incomplete for cppc_ffh_csr_read().
> Also, csr_read_num() already does appropriate filtering
> so the switch case over here is now redundant.
> 
> >
> > >  /*
> > >   * Read the CSR of a corresponding counter.
> > >   */
> > >  unsigned long riscv_pmu_ctr_read_csr(unsigned long csr)
> > >  {
> > > -     if (csr < CSR_CYCLE || csr > CSR_HPMCOUNTER31H ||
> > > -        (csr > CSR_HPMCOUNTER31 && csr < CSR_CYCLEH)) {
> > > -             pr_err("Invalid performance counter csr %lx\n", csr);
> > > -             return -EINVAL;
> >
> > ... the above code.
> >
> > I'm thinking that we probably want to keep the CSR number filtering code
> > in; at least, I can't think of a good reason to remove it.  Care to add it
> > back in?
> 
> We can potentially have custom CSRs as hardware counters
> hence the CSR filtering over here is already incomplete. Plus,
> csr_read_num() already does the CSR filtering and returns
> failure for inappropriate CSR number.

OK.  To me, the most notable changes in this patch are the changes in the 
filters for both reads and writes for the two different call sites, ACPI 
FFH and PMU.  It would be good to document these filter changes directly 
in the patch description, along with the rationale.

I'm also not yet completely convinced that we should allow both of these 
call sites to read and write any custom CSR.  But maybe the updated patch 
description might be convincing...


- Paul
--8323329-284714384-1763774066=:3073511
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-284714384-1763774066=:3073511--

