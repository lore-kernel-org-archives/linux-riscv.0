Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2A4C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 19:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BYyBUDct7S5tI8+yoMUAhL/9FT4+NceDhBsbfzlmGvM=; b=0pQfWtqbPYfHUQ
	2UQxI7D4GfJXevrK9bXq/8xOnbPxiYw8lAS29BoRKNKlxY5Zh4CwLPLvJ4j7DgWP7LkAxX0kBcJ3O
	CjHJTh9LCmNRyAeGpvsyaXdd2NITcQQ1WqdU4T9K6V+fCtkv8SKPl2gs9lLvP/SFikyCHNzSIbhF2
	Zlm6qWOdZ/knpeQV2iJ8qrMkGR+GdDn+IO+EAcgvOmO22xSBgCQhO4yJmP+7pZriHEk6q4o5+cgln
	16gtwxsWBhGBMTiFuKxDbFZHCkzmPznWXwPG2ElTxYDxkm9cpJxu9tqsCFJM8OD/9r1+F72E+m6zq
	igaywwNSdZfD1hOkxcDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1vFb-00HLSd-8O; Mon, 27 Dec 2021 19:01:39 +0000
Received: from isilmar-4.linta.de ([136.243.71.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1vFY-00HLRX-Vu
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 19:01:38 +0000
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from owl.dominikbrodowski.net (owl.brodo.linta [10.2.0.111])
 by isilmar-4.linta.de (Postfix) with ESMTPSA id 7083B2013F8;
 Mon, 27 Dec 2021 19:01:29 +0000 (UTC)
Received: by owl.dominikbrodowski.net (Postfix, from userid 1000)
 id 83A9C80E7C; Mon, 27 Dec 2021 19:41:15 +0100 (CET)
Date: Mon, 27 Dec 2021 19:41:15 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
Subject: Re: [RFC 18/32] pcmcia: Kconfig: add HAS_IOPORT dependencies
Message-ID: <YcoIyy7uQakUp4sd@owl.dominikbrodowski.net>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-19-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211227164317.4146918-19-schnelle@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_110137_205142_0CDF4448 
X-CRM114-Status: GOOD (  15.57  )
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

Am Mon, Dec 27, 2021 at 05:43:03PM +0100 schrieb Niklas Schnelle:
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. PCMCIA devices are either LEGACY_PCI devices
> which implies HAS_IOPORT or require HAS_IOPORT.
> 
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thanks,
	Dominik

> ---
>  drivers/pcmcia/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pcmcia/Kconfig b/drivers/pcmcia/Kconfig
> index d13b8d1a780a..3d05bdf1f9cb 100644
> --- a/drivers/pcmcia/Kconfig
> +++ b/drivers/pcmcia/Kconfig
> @@ -5,7 +5,7 @@
>  
>  menuconfig PCCARD
>  	tristate "PCCard (PCMCIA/CardBus) support"
> -	depends on !UML
> +	depends on LEGACY_PCI || HAS_IOPORT
>  	help
>  	  Say Y here if you want to attach PCMCIA- or PC-cards to your Linux
>  	  computer.  These are credit-card size devices such as network cards,
> -- 
> 2.32.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
