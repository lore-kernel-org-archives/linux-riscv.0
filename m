Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7DDC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Oct 2022 12:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43Qhls7R+Z3LUGmbwn5ZdtnqwnIQxQGYrtE29MBvyjs=; b=Z6V29+Tos0ZA96
	JnZR3UOb8sQX8B4i7vvq8L753C6PZ2lYI65ikJdfZMWujJpe+lnhrjrPNYpLeLcWFKR1rnrvDiHBN
	/XPD0CKBKCwOQ+UHJZkYoB0Q1gmhihD5G5pto4yPQxPkPujNeGH+klezyIfCyjHQVzbp81jEfXpiU
	JbxG6AG4spq5t8CwSb42RsMM+3YrzxacBrVOsjOIqNRs0wMBEnFQu5CcanrTSxwK+cqBUe6gWF8ci
	3TpJY8rnpBF8L2+/NPL2BLRydEYTG/Ig5606+gEr9g7+ux+VyuqOeBiqUjKe07fHtgBjBsPEn0KAo
	n1ynDj8udjsUTCblYS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ok3BZ-001TLQ-58; Sun, 16 Oct 2022 12:56:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ok3BW-001TKa-1t
	for linux-riscv@lists.infradead.org; Sun, 16 Oct 2022 12:56:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 42A8ACE0D88;
	Sun, 16 Oct 2022 12:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA25C433D6;
	Sun, 16 Oct 2022 12:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665924961;
	bh=StkAkNcdQ+zFOz0afCgnHsRcpdc9gPqXe15XLH7oAqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DvACGCEZjD027TVP6lRW1aXaeuPZqskSJBNMigKVKMijbo+aa/+s+BTwqUt7Vdt24
	 dU91gzXjYpDXXD92m/3HKEmfsmAcr9MZmiepaTjjonrB09sNorwnFekF4xRIxjnurv
	 k60f2F69mzNdaUVUYWr7CNeo7iPnEqY3KbMo6LyY=
Date: Sun, 16 Oct 2022 14:56:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Conor Dooley <conor@kernel.org>
Cc: stable@vger.kernel.org, Aurelien Jarno <aurelien@aurel32.net>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4.19] riscv: fix build with binutils 2.38
Message-ID: <Y0v/j8iyR0aqZZeh@kroah.com>
References: <20221015111856.3869148-1-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221015111856.3869148-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221016_055606_303668_760E9816 
X-CRM114-Status: GOOD (  12.94  )
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

On Sat, Oct 15, 2022 at 12:18:57PM +0100, Conor Dooley wrote:
> From: Aurelien Jarno <aurelien@aurel32.net>
> 
> commit 6df2a016c0c8a3d0933ef33dd192ea6606b115e3 upstream.
> 
> >From version 2.38, binutils default to ISA spec version 20191213. This
> means that the csr read/write (csrr*/csrw*) instructions and fence.i
> instruction has separated from the `I` extension, become two standalone
> extensions: Zicsr and Zifencei. As the kernel uses those instruction,
> this causes the following build failure:
> 
>   CC      arch/riscv/kernel/vdso/vgettimeofday.o
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Assembler messages:
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
> 
> The fix is to specify those extensions explicitly in -march. However as
> older binutils version do not support this, we first need to detect
> that.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> Tested-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> [Conor: converted to the 4.19 style of march string generation]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: linux-riscv@lists.infradead.org
> CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> lkp has yet to complain, so here you go Greg..

Now queued up, thanks.

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
