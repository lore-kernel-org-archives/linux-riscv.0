Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D2DCA6007
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 02:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkZfXBRdo0ElRW26LPdB7q8V/J7Pi1wswgRqFVqxU+8=; b=4XbKk2rOdrMQm6nvHfhAgYVWuJ
	pw3ermsb2dhdkgwOD0YB0WfKjrXY7oZnTofbRpNcE9Fl1OFY65bzUU651480/jicWRKavUIncpJTZ
	c0cyaI5MSk24pz+q0aTld/wa+8k1nGMpd+84D7MC843T2UdgHUDnhrkHQD4NJgFQ/uGMupfY9ymff
	Gy0QdqW0io2NLQuIDKtj7NlhNZRKEOh/67p7s02mXrGiaGFvDbyDzLT9dwY3Pm/7nJGvxGensN3AO
	UZB5KJ+m9M7SdjuBWxMcD+QTJZlP2kLZXWMbQXuvMFEKpjWIi3z4emeMqIpBhDQaj946vKlH5kvep
	XGr0ATwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEe9x-00000003PmE-3yzM;
	Thu, 08 Oct 2026 02:47:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEe9w-00000003Pm5-48D4;
	Thu, 08 Oct 2026 02:47:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0756960136;
	Thu,  8 Oct 2026 02:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE9C1F00893;
	Thu,  8 Oct 2026 02:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791427623;
	bh=F0DK6+IHfMR+aBaJ6CuyYkB2ySvo8uPa6sPYs+zV3eM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=W1wEbk8rfOAr2uT0E+PKOceknUXswVzLJ4yMNcjQ1jNl8yk9DfbaHqGx6syOOPcA/
	 rWEDPNWLPDujXP4SDZ9DMTAzYwDK5E9TcoI2ajf+jC4rPZx1yqg85IdLkRjtk7c0yf
	 Bq/z7K99qcH2j2RKpt7LeJk6lZFYO3LUBJprCBWE6pN6F3/67wi0boP+VDU+oJdDI7
	 H5VzU9zwk0d3hVh5aW7nq5icgpZLxaXDXEsFJjE6FvQEqRRTfNvtQsoYe6FJb3v9K3
	 c00Tfy8hLaoh2Wn5n52noeRVsTBb+1J4q6SVYVN/WVwQj0eBSVpcCk4KIl7fiwk/tp
	 VdHDYzb6BZexw==
Date: Wed, 7 Oct 2026 20:46:57 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Radim Krcmar <rkrcmar@qti.qualcomm.com>
cc: Paul Walmsley <pjw@kernel.org>, 
    "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atishp@rivosinc.com>, 
    "ajones@ventanamicro.com" <ajones@ventanamicro.com>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, 
    "apatel@ventanamicro.com" <apatel@ventanamicro.com>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
    David Laight <david.laight.linux@gmail.com>, 
    linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] RISC-V: make use of variadic sbi_ecall
In-Reply-To: <DLYI0I8PT4LZ.ZSXV160QVO0H@qti.qualcomm.com>
Message-ID: <d94ecb9c-def7-a9cb-456b-60b18489d0f3@kernel.org>
References: <20250619190315.2603194-1-rkrcmar@ventanamicro.com> <20250619190315.2603194-3-rkrcmar@ventanamicro.com> <650d23e8-b51b-85da-f9f3-52a06fed81e5@kernel.org> <DLYI0I8PT4LZ.ZSXV160QVO0H@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-837776277-1791427623=:3541018"
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

--8323329-837776277-1791427623=:3541018
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 7 Oct 2026, Radim Krcmar wrote:

> 2026-10-06T03:55:12-06:00, Paul Walmsley <pjw@kernel.org>:
> > On Thu, 19 Jun 2025, Radim Krčmář wrote:
> >
> >> The new sbi_ecall doesn't have to list all 8 arguments anymore, so only
> >> pass the actual numbers of arguments for each SBI function.
> >> 
> >> The remaining trailing 0 are intentional as they represent an argument.
> >> 
> >> SBI 0.1 shouldn't be using the sbi_ecall, because it's only for 0.2+,
> >> but allow it by passing 0 is the reserved register.
> >> 
> >> Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
> >
> > Thanks, queued for v7.4.  
> >
> > For everyone, not just Radim - probably it's worth looking through the 
> > codebase to convert any SBI ecalls that were added over the past year that 
> > weren't covered by this patch (e.g., the MPXY drivers) and to doublecheck 
> > the overall argument counts.
> 
> I started working on a followup and noticed a bug.
> 
> Please squash the following change or just drop the second patch, since
> we may be touching the same lines again soon, sorry about that.

Thanks, squashed in.


- Paul
--8323329-837776277-1791427623=:3541018
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-837776277-1791427623=:3541018--

