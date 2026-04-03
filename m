Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403BAD6AAFC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 08:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2vPM8TAT4e8jJ5/qJtmdycWz55vUtZ/E4pWIiBaFn4g=; b=b+umOZmc7r9ir0
	6IDqOiIwvtFXAw+xR7fxgO62ENBy0a++nUIgKXJ0Nbf1heKGEafYQs3+VMGy+Rw/d4jdb/ixJ/s9e
	AyeFIFbt8Tp66+5oYe5OsWKGhGGKgujZsNvcePioKIeBqCxmObmE8A0EJw5kT9tUh+Sjyphzo+uPa
	d9jKQ2UsrCuPSgccYFEpF2Oddijth98uU7Pz7Km8YgJ4ntZB/MAOyWi7lXMwEfXPcQUFHlxdRJQye
	qzBJKsmnqBv18vG8pflTveznb7pyGjpvh//n7E7jO/ddVpwX2UCw52p8WM67jYQ2jcwFvaMWoA4Wc
	9k/ZvfkTjG9B/nLoiX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Zq8-00000001i5R-44zZ;
	Fri, 03 Apr 2026 08:25:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Zq8-00000001i5L-0o9A
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 08:25:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3251E60008;
	Fri,  3 Apr 2026 08:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01EEC4CEF7;
	Fri,  3 Apr 2026 08:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775204714;
	bh=2V7jZRmmYQJwcE2susZ5Qb8YVVyl3rnEKO+bynnd24w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=coj/wKPwyyPQPWVkbZcyGi3QYwg0g6XHtikRG3kDONj6sXKTpKQX9NV/SG4B/AMPH
	 2hmXoMawVQE7pRQ25NS2StWXXAoiS15OwdQZaz8Ql+3Qz8DE8KdiCQMXKUryAshIDE
	 drpOp3VqmLevTnf9K2EmRFJ/D62Ui5tfXHPZN5MpPmEZFOjwNUpHvInWSesZwdcO1z
	 twGZjYlu5/BJohkDT8fos5MORF5hYsuddakC/CDsx3q74As/+QseSSQc8sP71qW9CU
	 MGY2dvypb3veVQsXVq+4fmIt0gA7i3AcmnTO/fZILDBLU6zHNT90lyFdTBE/0AnZ0L
	 bHF+TdRkjXMJQ==
Date: Fri, 3 Apr 2026 02:25:12 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Anup Patel <anup.patel@oss.qualcomm.com>
cc: Sunil V L <sunilvl@oss.qualcomm.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, Anup Patel <apatel@ventanamicro.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, 
    Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
    linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
    linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Nutty Liu <nutty.liu@hotmail.com>, linux-riscv@lists.infradead.org, 
    Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, 
    Len Brown <lenb@kernel.org>
Subject: Re: [PATCH v5 1/1] RISC-V: Add common csr_read_num() and csr_write_num()
 functions
In-Reply-To: <20260204155309.763597-2-anup.patel@oss.qualcomm.com>
Message-ID: <603b0a16-4965-2689-d3ea-3f9db0cc49aa@kernel.org>
References: <20260204155309.763597-1-anup.patel@oss.qualcomm.com> <20260204155309.763597-2-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Anup,

On Wed, 4 Feb 2026, Anup Patel wrote:

> From: Anup Patel <apatel@ventanamicro.com>
> 
> In RISC-V, there is no CSR read/write instruction which takes CSR
> number via register so add common csr_read_num() and csr_write_num()
> functions which allow accessing certain CSRs by passing CSR number
> as parameter. These common functions will be first used by the
> ACPI CPPC driver and RISC-V PMU driver.
> 
> Also, the RISC-V ACPI FFH specification allows arbitrary CSR number
> as CPPC register and the RISC-V SBI specification allows arbitrary
> CSR number as PMU hardware counter. This means ACPI CPPC driver and
> RISC-V PMU driver no longer need to do sanity checks on CSR number
> which are now done by the common csr_read_num() and csr_write_num()
> functions.

I recall that when we discussed this patch on a call a few months ago, it 
was brought up that it seemed useful to restrict which CSRs could be read 
or written at runtime, on a per-vendor basis.  That way, the FFH interface 
couldn't be used to read or write custom CSRs that had nothing to do with 
CPPC or PMU functions. 

Are you still planning to implement that change?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
