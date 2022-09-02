Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961B9ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LjgtcXWT89rLAWryLb/M6EPwdtQWE6FO1HsHGvuPQE=; b=b/VoaOJ4tvlVhjJCnoBjB27cAX
	uEBHDZgLtKF3RqPI+trG15STFSRVAySD07dQzPMpL52TyozL+P6axQMiDKFdvUoSQhBVfVcyhdiGH
	zZWNHQcocUcn+ptDIicYnTcCMCaSGdhRXw9s+nZGSqoXGHlwS8S7AuzYiBZy0gGyrenbnJPhzZFu3
	XKF1pvQuX0y1Xb33HuegRJemibKTMbzvqGxrt2fbAGQzrZUgHcj15+94skFDSnQvhYB/EgBpTvsYy
	p5iniWmwPJF86TTEILJb0Lylh+1Cnjra5TdKrPxnA39CDF6PcGKUzP1oIKazE6zlwBj+ALt2CDvSR
	T20IQeQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU86p-005rkc-BQ; Fri, 02 Sep 2022 14:57:27 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU86D-005rKQ-9f
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 14:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662130609; x=1693666609;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SqK+KES9Kef0oX5qHsG81CZHcrCq/64MccAPPJRXZy8=;
  b=fJw2QxUcmQSafDeoIQIA+OTjEveNprw7n9edgyGtUWRWuOjt4mvX35T7
   g2XDZfBq2NYMtR7r4UXiC7RhsvOTiUR4f69tgGqEq04LcphhMeXcU2Hmh
   Ov4UJHTt56gnP9LSKdRCDzL1PlGqzmTMrWOigRylfr04Lx5krlAnaPwbt
   V5osrUhsE7bFhdvMcrb5ghhrQ67pth2ZhbXtfRJWA5DEnVKZtJawaB0je
   mBZf423YFOco2+oNRhFsrL8cJ9VqGNNqJ1JvRb0aFXZ3YQI/uDdpnSBSS
   xFRqhAf4xq5MF1VwBFEz+0A2rgWCFYsuYJ2Ui+1A7/BhBaxpv88zMLA7R
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="359953509"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="359953509"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 07:56:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="674379798"
Received: from vbykovni-mobl.ger.corp.intel.com ([10.252.53.17])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 07:56:41 -0700
Date: Fri, 2 Sep 2022 17:56:40 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jiri Slaby <jslaby@suse.cz>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, 
    Florian Fainelli <f.fainelli@gmail.com>, 
    bcm-kernel-feedback-list@broadcom.com, 
    =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Kevin Cernekee <cernekee@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, 
    Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
    Patrice Chotard <patrice.chotard@foss.st.com>, 
    linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] tty: serial: use
 DEFINE_UART_PORT_TX_HELPER_LIMITED()
In-Reply-To: <20220901110657.3305-4-jslaby@suse.cz>
Message-ID: <f45fab19-5034-cd9c-4133-ed74e5888193@linux.intel.com>
References: <20220901110657.3305-1-jslaby@suse.cz> <20220901110657.3305-4-jslaby@suse.cz>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1404598877-1662130606=:1647"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_075649_409881_E5D3FEEB 
X-CRM114-Status: GOOD (  12.53  )
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

--8323329-1404598877-1662130606=:1647
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 1 Sep 2022, Jiri Slaby wrote:

> DEFINE_UART_PORT_TX_HELPER_LIMITED() is a new helper to send characters
> to the device. Use it in these drivers.
> 
> mux.c also needs to define tx_done(). But I'm not sure if the driver
> really wants to wait for all the characters to dismiss from the HW fifo
> at this code point. Hence I marked this as FIXME.

Indeed, it seems odd.

This change looked good to me but I'll give my rev-by only after seeing 
the next version.

-- 
 i.


> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
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

--8323329-1404598877-1662130606=:1647
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1404598877-1662130606=:1647--

