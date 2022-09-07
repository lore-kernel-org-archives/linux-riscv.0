Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B3CC38145
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 09:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Izsv29ezbj/asubnGjpERpfXDjIKzcYLl+L3YFi6QUU=; b=JkyTnz2OOwV2wtjDT6tazvDAFx
	192U4R+A+ZCxi3RZF1x9Z/Qn0qkWUKycJVRlho3k2Atp9UOxnB2nHincCZ7W0TnLC4ehj4+wDCtve
	nBeabNu5yhjs9/smNTKX1nuklpt/M3SqTsuxIXlDwI55pxgWhwZdUrHZdmBWSlkkkVu6vSTtiHqzR
	4rkKz3fXGS9b/g6kj+ydtwCNSCDRagLYbLYRei8XcNgZzK9ZJDqdsij40CbZxfgbpM/JuSvtfIpc8
	iTxB0PH6phPPvLz2+wjL2XNqBuYm6oReXz94Bbh9OQlppqMNR3phAVcgipP8gaezNIKmlBh6vxTXY
	mY4o24bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVrmr-00577u-Rh; Wed, 07 Sep 2022 09:56:01 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVrm4-0056eM-3M
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 09:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662544512; x=1694080512;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wTz5MbuOMBDOMBq3QKGowVOjTKfUFIGm8N9GEPakT7M=;
  b=DrVYmVhLJ51+anXjYImOzPDHXUIox4sgx87gyugQBX47PDfCrf215N1M
   wue6IF8caGeNGJNvVEmnNOv3ONWL+4SOhCe+Bp8aYBOdFUTlWo2ZKJTfA
   VIyJmFW++CWjFmxMVPPX9YRxGnhgTyXSxHzJbzNpTh+wMf2Bud0eYwSK9
   15G4PX9XQ/p2FfWHxSqwAgLXCSUhQnEtdya6fzGkPF9up9TqvicSPB/EC
   eF0LBAeEAbVzSvoZtC7n9e2HpDlbGvpFKG8jY/SRGxlFqSpeimPi7H0RW
   P/jRewJRw0eAmsBU9eAHpvNhQ/LKXCsgT1nROA1fZrm+m0ccPcevOrROB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="298146718"
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="298146718"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 02:55:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="644551974"
Received: from dmatouse-mobl.ger.corp.intel.com ([10.251.223.53])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 02:54:58 -0700
Date: Wed, 7 Sep 2022 12:54:57 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jiri Slaby <jslaby@suse.cz>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, Tobias Klauser <tklauser@distanz.ch>, 
    Richard Genoud <richard.genoud@gmail.com>, 
    Nicolas Ferre <nicolas.ferre@microchip.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Claudiu Beznea <claudiu.beznea@microchip.com>, 
    Vladimir Zapolskiy <vz@mleia.com>, Liviu Dudau <liviu.dudau@arm.com>, 
    Sudeep Holla <sudeep.holla@arm.com>, 
    Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
    Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
    =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>, 
    Manivannan Sadhasivam <mani@kernel.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Florian Fainelli <f.fainelli@gmail.com>, 
    bcm-kernel-feedback-list@broadcom.com, 
    =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Kevin Cernekee <cernekee@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, 
    Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
    Patrice Chotard <patrice.chotard@foss.st.com>, 
    linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] tty: TX helpers
In-Reply-To: <20220906104805.23211-1-jslaby@suse.cz>
Message-ID: <e6e551fa-2347-7b17-8a62-2b28517c76e@linux.intel.com>
References: <20220906104805.23211-1-jslaby@suse.cz>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1229872048-1662544507=:1717"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_025516_665529_90C65264 
X-CRM114-Status: GOOD (  14.29  )
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

--8323329-1229872048-1662544507=:1717
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 6 Sep 2022, Jiri Slaby wrote:

> This series introduces DEFINE_UART_PORT_TX_HELPER +
> DEFINE_UART_PORT_TX_HELPER_LIMITED TX helpers. See PATCH 2/4 for the
> details. Comments welcome.
> 
> Then it switches drivers to use them. First, to
> DEFINE_UART_PORT_TX_HELPER() in 3/4 and then
> DEFINE_UART_PORT_TX_HELPER_LIMITED() in 4/4.
> 
> The diffstat of patches 3+4 is as follows:
>  26 files changed, 191 insertions(+), 823 deletions(-)
> which appears to be nice.
> 
> Cc: Tobias Klauser <tklauser@distanz.ch>
> Cc: Richard Genoud <richard.genoud@gmail.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: "Andreas Färber" <afaerber@suse.de>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: "Pali Rohár" <pali@kernel.org>
> Cc: Kevin Cernekee <cernekee@gmail.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang7@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: linux-riscv@lists.infradead.org
> 
> Jiri Slaby (4):
>   tty: serial: move and cleanup vt8500_tx_empty()
>   tty: serial: introduce transmit helper generators
>   tty: serial: use DEFINE_UART_PORT_TX_HELPER()
>   tty: serial: use DEFINE_UART_PORT_TX_HELPER_LIMITED()
> 
>  Documentation/driver-api/serial/driver.rst |  3 +
>  drivers/tty/serial/21285.c                 | 33 ++-------
>  drivers/tty/serial/altera_jtaguart.c       | 42 +++--------
>  drivers/tty/serial/altera_uart.c           | 37 ++--------
>  drivers/tty/serial/amba-pl010.c            | 37 ++--------
>  drivers/tty/serial/apbuart.c               | 36 ++--------
>  drivers/tty/serial/atmel_serial.c          | 29 ++------
>  drivers/tty/serial/bcm63xx_uart.c          | 47 +++----------
>  drivers/tty/serial/fsl_lpuart.c            | 38 +++-------
>  drivers/tty/serial/lantiq.c                | 44 ++++--------
>  drivers/tty/serial/lpc32xx_hs.c            | 38 ++--------
>  drivers/tty/serial/mcf.c                   | 27 ++------
>  drivers/tty/serial/mpc52xx_uart.c          | 43 +-----------
>  drivers/tty/serial/mps2-uart.c             | 29 +-------
>  drivers/tty/serial/mux.c                   | 46 ++++--------
>  drivers/tty/serial/mvebu-uart.c            | 40 ++---------
>  drivers/tty/serial/mxs-auart.c             | 31 ++-------
>  drivers/tty/serial/omap-serial.c           | 47 ++++---------
>  drivers/tty/serial/owl-uart.c              | 35 +---------
>  drivers/tty/serial/pxa.c                   | 39 +++--------
>  drivers/tty/serial/rp2.c                   | 36 ++--------
>  drivers/tty/serial/sa1100.c                | 49 +++++--------
>  drivers/tty/serial/serial_txx9.c           | 37 ++--------
>  drivers/tty/serial/sifive.c                | 45 ++----------
>  drivers/tty/serial/sprd_serial.c           | 38 ++--------
>  drivers/tty/serial/st-asc.c                | 50 ++-----------
>  drivers/tty/serial/vt8500_serial.c         | 40 ++---------
>  include/linux/serial_core.h                | 81 ++++++++++++++++++++++
>  28 files changed, 275 insertions(+), 822 deletions(-)

For the whole series:

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-1229872048-1662544507=:1717
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1229872048-1662544507=:1717--

