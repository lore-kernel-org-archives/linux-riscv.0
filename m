Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E61CA5FF0
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 09:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoUIPzC5j+ddJKx9J9D1xve0yuyFLpQQbMpQSHnNl08=; b=bXxGpTQHqRL/marOycfOtgwSS5
	8/zrvBBPNnFwijXNaIZunW+Jbpuo7isZ9xgJn592BFNIGHJ8ViC3d7gXKEsHS7NTbIzZDfbNkH2Lx
	FL4xupHKCAyjOojAvSEMct9DHuK1jZmx8JILZhSjxMSt7OH+Ny58zEGA4tGjTTiPf1e/xunTx9aMJ
	bxooUoZgma7z4WefGX2EoqUeY+cDSVwlZjWiRbTGRW/Etl3pQqsurURfDUX1Dey3onN2WRvEbzi1i
	BndN0JbZ/53ckXf94c0i4+JKVaurUWuVxgGOYNycRPj8Iy+AZTBe6B/x9AdgPwkl4L+6QznnSFOLg
	oYXMkEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1tH-00000000R0E-164Y;
	Tue, 06 Oct 2026 09:55:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1tG-00000000Qz4-105Y
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 09:55:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 545D86022A;
	Tue,  6 Oct 2026 09:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CC51F000FF;
	Tue,  6 Oct 2026 09:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791280517;
	bh=U/UJLBwKjfbb2sgsrgLx15T9FSqQIhajyoEePoI+pZU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=AUy/9/vjS2XtlXuvtdJPZOLX1BQfwjtP6LdD6yzKeNeavB+39why0E0QkxeedqmaO
	 IqOi6NCngJDi0FTBI646o5kagYURXHMW3eHaBWpdSeitTbJ8BZirC6zzjo8RJc0qXG
	 mYM2bE++mwfsS69YalOcw4yUhyvMblae1RWcxEyPIyifcqB2oguPDhuf/kXHRLe2I9
	 OYwlm448XhlbqTs8kwnpvxEznTXriUUFch2KZsQIzoNwzIM837/WlMEtoTrxdXT4fe
	 9CZnhoc3QKtiKAURXeCGnXrEViuo0/o4yUWNtaa+xp/vjvB84K0WmNa1Pi6ArQdbqG
	 uG6Sa/w1qwRdg==
Date: Tue, 6 Oct 2026 03:55:12 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@ventanamicro.com>, 
    rkrcmar@qti.qualcomm.com
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atishp@rivosinc.com>, 
    Andrew Jones <ajones@ventanamicro.com>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, 
    Anup Patel <apatel@ventanamicro.com>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
    David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: make use of variadic sbi_ecall
In-Reply-To: <20250619190315.2603194-3-rkrcmar@ventanamicro.com>
Message-ID: <650d23e8-b51b-85da-f9f3-52a06fed81e5@kernel.org>
References: <20250619190315.2603194-1-rkrcmar@ventanamicro.com> <20250619190315.2603194-3-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1636448891-1791280516=:2885293"
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

--8323329-1636448891-1791280516=:2885293
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Thu, 19 Jun 2025, Radim Krčmář wrote:

> The new sbi_ecall doesn't have to list all 8 arguments anymore, so only
> pass the actual numbers of arguments for each SBI function.
> 
> The remaining trailing 0 are intentional as they represent an argument.
> 
> SBI 0.1 shouldn't be using the sbi_ecall, because it's only for 0.2+,
> but allow it by passing 0 is the reserved register.
> 
> Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>

Thanks, queued for v7.4.  

For everyone, not just Radim - probably it's worth looking through the 
codebase to convert any SBI ecalls that were added over the past year that 
weren't covered by this patch (e.g., the MPXY drivers) and to doublecheck 
the overall argument counts.


- Paul
--8323329-1636448891-1791280516=:2885293
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1636448891-1791280516=:2885293--

