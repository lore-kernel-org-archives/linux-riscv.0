Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74820C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 16:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0U/OU2+/g6wrgjdo9JQOCbggSoVSPK6CFKlcy3Icmk=; b=0E6SyAgfwv26Mh
	lUUFhG5/Hu3McABrimLj+ZhJJ/z+FfQMnwMKRdqqq2rCX15uQZ1LPwFXrUpor4gzIIcrgaZP482/J
	86jZAzf+wy3KV+qOLQOPM1ZdoPfksagomX/o5o24b5w8cto1p5/kbbt6CFA/9ZJUnzJZfJysc2iYb
	AuFPjUx1ZGy4o0pNt9Oqk8Uouzvju+6CIpj2FJ2dA3IOvDfMVdgaZlMxDmumDyB8ptmPKkgt6GB1C
	HFuvkJ/hfI+lIFcKU6PgrvdL2IXOFFfwG8J+7zQkWGcKgI6f2VAqH/ti7Fl/daa1LWA7EEc6uoIBE
	n0CPVX9idOHw4d7ne+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81fR-00Guw8-A3; Wed, 21 Dec 2022 16:10:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81ew-00GufQ-Kw; Wed, 21 Dec 2022 16:09:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6698EB81A97;
	Wed, 21 Dec 2022 16:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E89C433EF;
	Wed, 21 Dec 2022 16:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671638971;
	bh=WegjlHZSrUxyZMNhSDJru775pDVx95szKJ8e3B7Aeog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QK5xUwZmJxxObJmEls87rAGucBZJ6W8OjeLiVl95LTXFoxW95UFG7boYHy5pL3o2O
	 GxYB1CpzmH6ITfFI401jAUqO1llQBDywynG98OLbwq5C1+JozHW9ei8iO+ZTEKsPx7
	 3r07rVP5otc87SecBDuro99rlqBsWPZmfnZ6qDME=
Date: Wed, 21 Dec 2022 17:09:28 +0100
From: gregkh <gregkh@linuxfoundation.org>
To: Bin Meng <bmeng@tinylab.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	aou <aou@eecs.berkeley.edu>,
	"catalin.marinas" <catalin.marinas@arm.com>,
	jirislaby <jirislaby@kernel.org>, palmer <palmer@dabbelt.com>,
	"paul.walmsley" <paul.walmsley@sifive.com>,
	linux <linux@armlinux.org.uk>, will <will@kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 0/3] serial: Add RISC-V support to the earlycon
 semihost driver
Message-ID: <Y6MvuJfocYIw9NPv@kroah.com>
References: <20221209150437.795918-1-bmeng@tinylab.org>
 <em37536add-7867-4e7d-9294-9a8389a661e2@a9022134.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <em37536add-7867-4e7d-9294-9a8389a661e2@a9022134.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_080934_917419_A64D192C 
X-CRM114-Status: GOOD (  17.40  )
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

On Wed, Dec 21, 2022 at 03:51:59PM +0000, Bin Meng wrote:
> On 2022/12/9 23:04:34, "Bin Meng" <bmeng@tinylab.org> wrote:
> 
> > RISC-V semihosting spec [1] is built on top of the existing Arm one;
> > we can add RISC-V earlycon semihost driver easily.
> > 
> > This series refactors the existing driver a little bit, to move smh_putc()
> > variants in respective arch's semihost.h, then we can implement RISC-V's
> > version in the riscv arch directory.
> > 
> > Link: https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc [1]
> > 
> > Changes in v3:
> > - add #ifdef in the header to prevent from multiple inclusion
> > - add forward-declare struct uart_port
> > - add a Link tag in the commit message
> > 
> Ping?

It is the middle of the merge window, we can not do anything until after
6.2-rc1 is out, please be patient.

While you wait, please take the time to review other patches on the
mailing list to help with the workload of the maintainers.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
