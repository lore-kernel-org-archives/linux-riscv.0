Return-Path: <SRS0=HMje=M7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C3DECDE3D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Oct 2018 17:32:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6BF2087A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Oct 2018 17:32:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZYx1l5xP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A6BF2087A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lip6.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AhJ3DznbD+Jy5YjJCBQ5LLe5gh1Zjake7u5DDMOUeyo=; b=ZYx1l5xPDgl1RB
	2k4i1tWeYBEhE+rgVvVNHOfJFyXE840K3ZS7618ZOpnCVLEUyuf/8l3oRIm/ntbb6aKbfHoMPCPkV
	DmmRGlwaxhOibDOL5AvJQ0NHAqsA3EnAr3r0M30kfiDXn3jwJ7QaG64QyO5fwfJBk+TsZXkoJ8rz7
	S6AcrzBgSTXcYDbfICAnlVn081D/QZyvILb8MiulTk4djOqmQrj0u7olrggxh+rP9+rtNm9qxxtxT
	XeqnuQAqB6o9fcwG97TM7zUEVgRA40RVqx4Z+57je0OK3LDxhBDOqLHnckQkzPW00Qw1qWuJtSMiW
	a8WcZZUQ5s4WKqT7R06Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gDYdj-0006sF-VF; Fri, 19 Oct 2018 17:32:47 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDYZ1-0005Gx-6Z
 for linux-riscv@lists.infradead.org; Fri, 19 Oct 2018 17:27:57 +0000
X-IronPort-AV: E=Sophos;i="5.54,400,1534802400"; d="scan'208";a="282734461"
Received: from unknown (HELO hadrien) ([132.227.125.15])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Oct 2018 19:27:35 +0200
Date: Fri, 19 Oct 2018 19:27:35 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 2/2] tty: serial: add driver for the SiFive UART (fwd)
Message-ID: <alpine.DEB.2.21.1810191926360.5513@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181019_102755_541116_DDECA2E1 
X-CRM114-Status: GOOD (  12.27  )
X-Mailman-Approved-At: Fri, 19 Oct 2018 10:32:43 -0700
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Paul Walmsley <paul@pwsan.com>, Wesley Terpstra <wesley@sifive.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, kbuild-all@01.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181019172735.gQq42UQblNzE112HcnidqBJpWgrc_Tn08eFWiFEic8I@z>

Hello,

It looks like an unlock is needed before the return on line 562.

julia

---------- Forwarded message ----------
Date: Fri, 19 Oct 2018 18:12:04 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild@01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 2/2] tty: serial: add driver for the SiFive UART

CC: kbuild-all@01.org
In-Reply-To: <20181018234352.26788-3-paul.walmsley@sifive.com>
References: <20181018234352.26788-3-paul.walmsley@sifive.com>
TO: Paul Walmsley <paul.walmsley@sifive.com>
CC: linux-serial@vger.kernel.org
CC: Paul Walmsley <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Palmer Dabbelt <palmer@sifive.com>, Wesley Terpstra <wesley@sifive.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Paul Walmsley <paul@pwsan.com>

Hi Paul,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on v4.19-rc8 next-20181019]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Paul-Walmsley/dt-bindings-serial-add-documentation-for-the-SiFive-UART-driver/20181019-165529
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
:::::: branch date: 77 minutes ago
:::::: commit date: 77 minutes ago

>> drivers/tty/serial/sifive.c:562:2-8: preceding lock on line 558

# https://github.com/0day-ci/linux/commit/15d0af7ab79ba53f984613f23e668cade495babb
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 15d0af7ab79ba53f984613f23e668cade495babb
vim +562 drivers/tty/serial/sifive.c

15d0af7a Paul Walmsley 2018-10-18  552
15d0af7a Paul Walmsley 2018-10-18  553  static irqreturn_t sifive_serial_irq(int irq, void *dev_id)
15d0af7a Paul Walmsley 2018-10-18  554  {
15d0af7a Paul Walmsley 2018-10-18  555  	struct sifive_serial_port *ssp = dev_id;
15d0af7a Paul Walmsley 2018-10-18  556  	u32 ip;
15d0af7a Paul Walmsley 2018-10-18  557
15d0af7a Paul Walmsley 2018-10-18 @558  	spin_lock(&ssp->port.lock);
15d0af7a Paul Walmsley 2018-10-18  559
15d0af7a Paul Walmsley 2018-10-18  560  	ip = __ssp_readl(ssp, SIFIVE_SERIAL_IP_OFFS);
15d0af7a Paul Walmsley 2018-10-18  561  	if (!ip)
15d0af7a Paul Walmsley 2018-10-18 @562  		return IRQ_NONE;
15d0af7a Paul Walmsley 2018-10-18  563
15d0af7a Paul Walmsley 2018-10-18  564  	if (ip & SIFIVE_SERIAL_IP_RXWM_MASK)
15d0af7a Paul Walmsley 2018-10-18  565  		__ssp_receive_chars(ssp);
15d0af7a Paul Walmsley 2018-10-18  566  	if (ip & SIFIVE_SERIAL_IP_TXWM_MASK)
15d0af7a Paul Walmsley 2018-10-18  567  		__ssp_transmit_chars(ssp);
15d0af7a Paul Walmsley 2018-10-18  568
15d0af7a Paul Walmsley 2018-10-18  569  	spin_unlock(&ssp->port.lock);
15d0af7a Paul Walmsley 2018-10-18  570
15d0af7a Paul Walmsley 2018-10-18  571  	return IRQ_HANDLED;
15d0af7a Paul Walmsley 2018-10-18  572  }
15d0af7a Paul Walmsley 2018-10-18  573

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
