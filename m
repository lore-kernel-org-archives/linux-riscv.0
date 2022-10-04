Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D285C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/KS6CWo2pAiL/fnOByzrfWsMuUIDktw0JP0Xjiuego=; b=Kj3BiVpycudr+uvCMIMC3es46a
	uFbX8beGm1o7Q6/xMQEwTsbC+2WNC+NNoAzcmi41Qa/L9vNtIexSSIZbDOvymNm3ZZDWfB7b8W5dV
	8MPaQMyO+PcVf0f/syZDL9qifgJbBfY826ukI7ebCbMyZ+3c5YCFuaqISiLtciauAQ0zLa6u5O0nP
	I83d/tF+hCIS/is2edlPak9Aol47nI1wf2xj5dTNH+j2X/GC4/amoyAj2u3bX4x5nkz+aLaJqYGup
	jRtopI4KrEaXqyz7Kv1m7XlYYpLjPbApRJmeeDzl6MzSte+rSTjFr4hlkmh/ANdawi5f9BSGmzRA7
	6WOqqu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofg0N-009VFf-Gy; Tue, 04 Oct 2022 11:22:31 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofg0K-009VEx-KU
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 11:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664882548; x=1696418548;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zV6XaQw7cFV+W0fZ4qt53I+U/j7E5pxnhTY/GN5mI2c=;
  b=LsFDMPRNbUJc6ddfmuWheGBVwj8sXQjf0opZiJcY0RP2VCJyIzG+jP6J
   UFCWxHT/91z8bIp3f8u8GxjKwo7HldJeJs9KYjjGmYR8bM3Unel0REWky
   1PLJVC2sd8VjVjH6RRI7dEXgiesulg2hrLMR5Kfvka5g/sNMjmVtQPboU
   d5/AhugjbNARThfaKXfjX28nBUjyzkCxF1HaRTBZ2Cx0aGLCSpg9gJ5dW
   xT8rPUI/RHcxDeQpeBlv3Ks/VtDTAdsVNdzozqV21C6jv2Qe9kEF63y3s
   7lwQWlIrv0Ydb6yO4bmAwBr6XHCRjk1KbySn8/6JTN5YjMX8rVunU+YMb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="364783593"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="364783593"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 04:22:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="654737955"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="654737955"
Received: from kmreisi-mobl.ger.corp.intel.com ([10.252.39.196])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 04:22:19 -0700
Date: Tue, 4 Oct 2022 14:22:17 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
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
Subject: Re: [PATCH v5 3/3] tty: serial: use uart_port_tx_limited()
In-Reply-To: <20221004104927.14361-4-jirislaby@kernel.org>
Message-ID: <ac4a5f21-fd2d-6981-eedd-1bca72a9237a@linux.intel.com>
References: <20221004104927.14361-1-jirislaby@kernel.org> <20221004104927.14361-4-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2081053952-1664882543=:1585"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_042228_754537_E7C28487 
X-CRM114-Status: GOOD (  11.13  )
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

--8323329-2081053952-1664882543=:1585
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 4 Oct 2022, Jiri Slaby (SUSE) wrote:

> uart_port_tx_limited() is a new helper to send characters to the device.
> Use it in these drivers.
> 
> mux.c also needs to define tx_done(). But I'm not sure if the driver
> really wants to wait for all the characters to dismiss from the HW fifo
> at this code point. Hence I marked this as FIXME.
> 
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
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

Perhaps you missed this one in the earlier mail. ...Anyway, here it's 
again:

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-2081053952-1664882543=:1585
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-2081053952-1664882543=:1585--

