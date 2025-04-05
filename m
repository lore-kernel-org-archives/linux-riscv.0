Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241B4C36010
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 13:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIfTZG7DTuU2Xzh/QLjd+VEij3mrNghg4/nfJTeAQ7s=; b=Q/4SxM3T30Dwq+
	SjT1XvBs75LojaKpgFMngT7MJbE6JPFb8PanNvTtTGS7posaq27T+rYlndBn9AFXsofY7RT+mWHLm
	fkd662Lfb6/MiS4Pji8xwB+TnDgk2XUyYzDuDLst2Z2qo2AO95pp3loA6GXRRYeWKuChtmhJXgTZu
	ZrEmEuMK/2gNrdhaVhM73lRIJnRqv2D/AFmhYFjbP0MUdBNCvq1uNcUfRGamfL7PglqNKA03rkzn9
	DbqIUv8dKTHOTuzX0WRXSoSKVwmpMAA/7uLSrBXvYhT9fJPmcrmQvUUOG7wZ3vitKQm18Io+5ZSTC
	JX5Axtz1Qow4Gf6qDtAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u13mf-0000000E0na-48Z2;
	Sat, 05 Apr 2025 13:42:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u13md-0000000E0n9-34aE
	for linux-riscv@lists.infradead.org;
	Sat, 05 Apr 2025 13:42:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A46E65C5564;
	Sat,  5 Apr 2025 13:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEF7C4CEE4;
	Sat,  5 Apr 2025 13:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743860521;
	bh=6ZBu1ypN5W8L8ABHscPMDLNWedVKSj4STFjXvlC54b0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yKJG4FlLE0R4wffcuvHSI63O9Hn7/iUSBrOvJCJwRC0BW7UNldm2LUerVN3emEYBV
	 hU68YKpr1jCbDl3F/l9c/RNeAl1oYMsZCnQpAn+hSg6aEyWpHvqNV9MItxYnhjASZw
	 mcDyxpkuvVOPMdR5ILHIR9L4em1QdRzMMRbe2jpg=
Date: Sat, 5 Apr 2025 14:40:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, bigeasy@linutronix.de,
	conor.dooley@microchip.com, jirislaby@kernel.org,
	john.ogness@linutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pmladek@suse.com,
	samuel.holland@sifive.com, u.kleine-koenig@baylibre.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] serial: sifive: lock port in startup()/shutdown()
 callbacks
Message-ID: <2025040513-bronco-capsule-91aa@gregkh>
References: <20250405132458.488942-1-ryotkkr98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250405132458.488942-1-ryotkkr98@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_064203_826442_D65C0B46 
X-CRM114-Status: GOOD (  12.05  )
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

On Sat, Apr 05, 2025 at 10:24:58PM +0900, Ryo Takakura wrote:
> startup()/shutdown() callbacks access SIFIVE_SERIAL_IE_OFFS.
> The register is also accessed from write() callback.
> 
> If console were printing and startup()/shutdown() callback
> gets called, its access to the register could be overwritten.
> 
> Add port->lock to startup()/shutdown() callbacks to make sure
> their access to SIFIVE_SERIAL_IE_OFFS is synchronized against
> write() callback.
> 
> Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
> Cc: stable@vger.kernel.org
> ---
> 
> This patch used be part of a series for converting sifive driver to
> nbcon[0]. It's now sent seperatly as the rest of the series does not
> need be applied to the stable branch.

That means this is a v2 patch, and you should also send the other patch
as a v2 as well, right?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
