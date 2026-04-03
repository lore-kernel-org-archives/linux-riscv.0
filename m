Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7B4E8537A
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 15:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4d8EwPd5FfgQXaszN5eXbGC92eRmWLvUGTZUbWNmIs=; b=clJnGLAF0H66PRwwhZ7bqCpZ0q
	6MpbS41a7nrGvKQOXlU3Pasa6imwKvMN02MMB8VtWdFRWxR/OETtf6d9Uu634awEHVkurlftvRwDO
	FqPeNWaicW2WN9s+IkXSB7SvKlXiOMszMckQd79OQSBHHYmSfGzrhkWrCnUA3Ac17PgKFycLlg1xo
	+zEF0GO/R8Vspbc6WN8lRwyLaFYdCr/WgTOCPDTZ6mcy+2Lv65E8+Qr0JFVSdHv572EDY7sLuRuuK
	+sJ/J7PsjJh6K7+9eVFzFpaX/0ATw/SUnvSA78/IPfpcK1kcsfi5xfjzktw5Gc5k+HCXVlB/D/8MF
	68PNXJVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gtC-00000002F6N-43GJ;
	Fri, 03 Apr 2026 15:56:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gtB-00000002F60-0pG7
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 15:56:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 84A754429E;
	Fri,  3 Apr 2026 15:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478B9C4CEF7;
	Fri,  3 Apr 2026 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775231812;
	bh=d7Oo0NCSB/TG7jbObkGRS2GwGcfinzzv50WNHyopH6w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vDuQGWsd8QjhkNmjZwJqNsn/66q3asMVzCxK4dx+Vn7n6UW1okRN6NC0y1g80zlKi
	 FtgRcmSF7JiVRYcH3bfgDeQ2FRrhpU314jpOoMnxhugJBPxUzreMLTng++QxsSNs/8
	 8HaaS1USR95pxBz8nLW/0jG559kASlibAcIt5lb3Ni7OCB1p2dFR2ES7DYos+KPlcK
	 gURc5TZiOLgIGInJJ4oNyZiWol1LG09ob+BfxEpjFFO7buFcc+khhjwwxSWnIsZTre
	 oH6m72Nvl+DZh5HrKWGh84ducWsapz4l1JSI1NS1NqjrOve54IejsX23ikuTuGFHoB
	 FeZsa7hegO/UQ==
Date: Fri, 3 Apr 2026 09:56:47 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Anup Patel <anup@brainfault.org>
cc: Paul Walmsley <pjw@kernel.org>, Anup Patel <anup.patel@oss.qualcomm.com>, 
    Sunil V L <sunilvl@oss.qualcomm.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, Anup Patel <apatel@ventanamicro.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, 
    Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
    Andrew Jones <andrew.jones@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Nutty Liu <nutty.liu@hotmail.com>, linux-riscv@lists.infradead.org, 
    Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, 
    Len Brown <lenb@kernel.org>
Subject: Re: [PATCH v5 1/1] RISC-V: Add common csr_read_num() and csr_write_num()
 functions
In-Reply-To: <CAAhSdy28oPgzaaZj94F-MToTYT6WTWsiSVpuy0VzLkM_maSP0g@mail.gmail.com>
Message-ID: <e8a5e3b7-b68a-8b92-192f-985a0559eb95@kernel.org>
References: <20260204155309.763597-1-anup.patel@oss.qualcomm.com> <20260204155309.763597-2-anup.patel@oss.qualcomm.com> <603b0a16-4965-2689-d3ea-3f9db0cc49aa@kernel.org> <CAAhSdy28oPgzaaZj94F-MToTYT6WTWsiSVpuy0VzLkM_maSP0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2101813137-1775231811=:751248"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_085653_286911_010C52D8 
X-CRM114-Status: GOOD (  27.77  )
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

--8323329-2101813137-1775231811=:751248
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 3 Apr 2026, Anup Patel wrote:

> On Fri, Apr 3, 2026 at 1:55 PM Paul Walmsley <pjw@kernel.org> wrote:
> >
> > On Wed, 4 Feb 2026, Anup Patel wrote:
> >
> > > From: Anup Patel <apatel@ventanamicro.com>
> > >
> > > In RISC-V, there is no CSR read/write instruction which takes CSR
> > > number via register so add common csr_read_num() and csr_write_num()
> > > functions which allow accessing certain CSRs by passing CSR number
> > > as parameter. These common functions will be first used by the
> > > ACPI CPPC driver and RISC-V PMU driver.
> > >
> > > Also, the RISC-V ACPI FFH specification allows arbitrary CSR number
> > > as CPPC register and the RISC-V SBI specification allows arbitrary
> > > CSR number as PMU hardware counter. This means ACPI CPPC driver and
> > > RISC-V PMU driver no longer need to do sanity checks on CSR number
> > > which are now done by the common csr_read_num() and csr_write_num()
> > > functions.
> >
> > I recall that when we discussed this patch on a call a few months ago, it
> > was brought up that it seemed useful to restrict which CSRs could be read
> > or written at runtime, on a per-vendor basis.  That way, the FFH interface
> > couldn't be used to read or write custom CSRs that had nothing to do with
> > CPPC or PMU functions.
> >
> > Are you still planning to implement that change?
> 
> The current csr_read_num() and csr_write_num() only allows
> HPM counters and custom CSR space (as defined by the Priv
> spec) to be accessible via ACPI FFH. The ACPI FFH interface
> is very flexible and allows vendors to specify the CSR number
> in the ACPI table itself so we don't need to compile kernel on
> per-vendor basis.
> 
> In other words, the current approach allows same Linux kernel
> image for multiple vendor even if they use custom CSRs in their
> ACPI FFH interface.

I understand that part.  The part that I don't like is that with this 
patch, the FFH interface could also be used to read and write custom CSRs 
that have nothing to do with CPPC or PMU functions.  That doesn't seem 
like a good idea.  What I had in mind was to add a way to restrict the 
custom CSRs that the kernel would allow FFH to use, via a mechanism other 
than the ACPI table - e.g., sysfs, or the kernel command line, etc.


- Paul
--8323329-2101813137-1775231811=:751248
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-2101813137-1775231811=:751248--

