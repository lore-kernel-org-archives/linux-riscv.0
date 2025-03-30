Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AB7C28B20
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+jM6QsJcQIkOIWpOMyy3h5J/ia6llj/rzTeacj2Irk=; b=DOOjj2JQMOmSoy
	hGLKtX2B7aH5WUbmX5KP4RDWiA9o05uLTinU/Z1yc8MoF9tIFWClbjpcrZyr6mYMWnMe9bSMFbymL
	gFvt5ituTR5n/jgmaUNJd673OjODU2un+1hzmDhDvTDxJMy+WGdDyphg3R+nH/nnJBHwJTXDGIsZz
	a4PILQAY7PH7zvFx9tL8KRSWSkPfCnLV6dmHq20ZoEO5Q9tyRqkMPbYrGJBnfNfdeQuH65FSJDPGE
	uEnVsvpoQZKfUB8+axexqpZ5R+w28dhdHJ0gTqJ+G5+tnix59KaFpGxn887frNHw0IPlDiWoDwDfW
	pa+tOyrj/vKYkwYrZnDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tynAm-0000000FuLX-2wfU;
	Sun, 30 Mar 2025 07:33:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyn98-0000000FuDW-48BR
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 07:31:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8CB71A40253;
	Sun, 30 Mar 2025 07:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD10C4CEDD;
	Sun, 30 Mar 2025 07:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743319913;
	bh=XT++m8L00AHqR60PiDT6jFZLNRZAi4GYXrVsMkTv7DM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WBQQFmF4Uf0XPZsFdycqML7Qg2RH+kPKmMpNsGdFeAfKdzh6Bw5oKMI5uO+79nsyH
	 6nRpxg8ECmXKeBFsp9QBxxIiLZICaPRzDGp0aWbX0fHRPyEKgEVrvoP3hRnclzoY+d
	 EQ4lMbOmVhPc3t2j4yoohKuQmGC5b8tPba9Cmiw4=
Date: Sun, 30 Mar 2025 09:30:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, jirislaby@kernel.org,
	john.ogness@linutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pmladek@suse.com,
	samuel.holland@sifive.com, bigeasy@linutronix.de,
	conor.dooley@microchip.com, u.kleine-koenig@baylibre.com,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
	stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/2] serial: sifive: lock port in startup()/shutdown()
 callbacks
Message-ID: <2025033015-blanching-pagan-db09@gregkh>
References: <Z-iSb0ryR-tiUCj0@42be267012b8>
 <20250330011610.388077-1-ryotkkr98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250330011610.388077-1-ryotkkr98@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_003155_208980_E3938121 
X-CRM114-Status: GOOD (  13.27  )
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

On Sun, Mar 30, 2025 at 10:16:10AM +0900, Ryo Takakura wrote:
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
> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
> Cc: stable@vger.kernel.org
> ---
> 
> Hi,
> 
> I'm sorry that I wasn't aware of how Cc stable should be done. 
> 
> I added Cc for stable but please tell me if this patch should be
> resent or if there is any that is missing.

Please resend a v3.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
