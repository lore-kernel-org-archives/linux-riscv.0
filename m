Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE60CA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 09:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caOFuplTjXOS6EJHkSDme3sq2b8WghJjnZmjlzilXjA=; b=AqwU/ycMFRiEh2J0Sj+GKX8kFV
	GP1j9OA3LZ6Dxm9cYywH4PDO7WQ3HjQYB5ZnwzQhC/IbOsnCBI6Mzq7a7q2IXuQDVquAy0Pt03Fg5
	CZYW2ugBmz3sTne+Din0h2IRxHjRFMcgNLFt1CQxePp7mJDhEoRSAdY06Wj0utNusB82NV3eabWQ4
	PxVhicAJBD1CYpv3BVWbfGvBcVV12D/whYH3BpMayTi/2JCL2lmE4KACOeEDCE2aJOwJpA280ayAy
	aC93E+DxaF3LIHJufHNdt9Ke9W6RR/6Ed40gcC4rSJRtLw5tgGFt31AtGkl7MITcBOrMFQCVn9RlP
	FYD1qrNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1lL-00000000Q9t-3uH2;
	Tue, 06 Oct 2026 09:47:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1lK-00000000Q9j-3zpp
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 09:47:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6452343F96;
	Tue,  6 Oct 2026 09:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620EA1F000FF;
	Tue,  6 Oct 2026 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791280026;
	bh=0zAqroHmp3QqjC49Dk9GufE8ynDmNgEV29xm7mZvD1g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Lx31mzJ1L295+8YX902P+EoHasPWV38wUjMFpniEL+RVoKFNcH5BEkhSoRndMtb1D
	 YoWji/5v+GF9uR6JEu3eGwDi9zVyt1gwoMTyc8md/ONsTEF0JTEom/uhQBJWwP3hUA
	 vn0q8egogPSVO70eXbyugHujTkQD46PKrpBKMkbc4Y5Fi+AV4NyhOO2mhzTpc3z+Ko
	 QKtfyyLrly8u05iGuAB7f6Z8LzjR5l+p3spnfWyr63MD5sSHM2K9ECuLn95oNytbMd
	 C35ZLThulM5dinKgMVOK/VKpHrcaGeFPshHcM7E0+DoJvhUMc7Xlyjuox2QWS0UVvc
	 p8HnxLtcehHKQ==
Date: Tue, 6 Oct 2026 03:47:01 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@ventanamicro.com>
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atishp@rivosinc.com>, 
    Andrew Jones <ajones@ventanamicro.com>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, 
    Anup Patel <apatel@ventanamicro.com>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
    David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH v2 1/2] RISC-V: sbi: turn sbi_ecall into variadic macro
In-Reply-To: <20250619190315.2603194-2-rkrcmar@ventanamicro.com>
Message-ID: <d481749b-2c83-a7f8-9c25-dd6e78a77c9a@kernel.org>
References: <20250619190315.2603194-1-rkrcmar@ventanamicro.com> <20250619190315.2603194-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1922366945-1791280026=:2885293"
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

--8323329-1922366945-1791280026=:2885293
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Thu, 19 Jun 2025, Radim Krčmář wrote:

> The SBI ecall interface has 0~6 arguments in a0~a5, and undefined
> arguments are not reserved, so we don't have to zero the registers.
> 
> The current sbi_ecall forces programmers to pad the argument count,
> which makes it hard to distinguish what is a value 0, and what is the
> padding, because 0 was traditionally used for padding as well.
> 
> Turn sbi_ecall into a variadic macro that accepts 2~8 arguments, and
> where only the specified arguments get passed to the ecall instruction.
> 
> The register a1 is zeroed if unused, to prevent unnecessary leaks of
> kernel register state from the tracepoints.
> 
> Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>

Thanks, queued for v7.4.


- Paul
--8323329-1922366945-1791280026=:2885293
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1922366945-1791280026=:2885293--

