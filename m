Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C11FC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 16:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H93kPFbcD/BIPQDMKSqJHyi+LFyc0hlUXRo5/UMVj7U=; b=088JgsqqVHIAQr
	uUTplDujWJmCIU30Fj+xsJ/mRDI10E5yGdxuUNvRFXI9yimJf8ccsMV68E9ssMCwQs8SG/Au0srTP
	twlqkxXYgpC4rOuVLrUxIyT8hh2HWwpVNUvJGRIrIAcCAnyWCOcHH/sBB6mdRSCSCbsz+PDWknf0N
	ws3ebjqFa/tjDnXdDMdRJouwajcCmcwmWpxyDh7WM1LUQVR4zA2i4EjNDHDWU4sLQXgw/TUF8Afou
	C4Fh81hHD/vc3LhZLHjwIiVw6MUhI62yMr7kTSMzxDNqnQYiz07wUorSWX6fqJ7aED9yR7CFcISWc
	8u336FEWbd03TEntuOJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgaK-002gCx-Ct; Mon, 28 Nov 2022 16:02:20 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgaH-002gBv-UV
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 16:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669651337; x=1701187337;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=szx3V/THdgBnLdEMF5U5QuumyUgo5RkTBLtv41gapAo=;
  b=B3nmhsMAUHFK0BZl2EKrNUhubWHu+MTFVETpsoeeMQrTLKJcOlggyZ/2
   /yLopi7eM0UQZpgdl3h06dAaUwz/DdBMsPxvQvQ6X+BjOZ7JhcOyLmQVg
   DxLOBl+p/lAK8JQfF8regmaccJP7+Ij1041sGOETRScAf5TtgyImSoae3
   SsDR8mk5Y0zxodvzKpJASEzW8Xv0bTjoHXVnXzUmXkI11zdRLx+DrvJNF
   fhcKf9A1sLXmgwFP2gUR/JkaEjK0lcSZK8HvbqcwU4umemR0rXRIuxDRN
   fSFYRUf6C5KWtCjkaqW3tHgqUyOpIARrMamcggbAxEFtXXFcQdmn+xanF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="316702274"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="316702274"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 08:01:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="732189888"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="732189888"
Received: from steinint-mobl1.ger.corp.intel.com ([10.249.34.136])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 08:01:33 -0800
Date: Mon, 28 Nov 2022 18:01:28 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
cc: Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
    Conor Dooley <conor@kernel.org>, 
    Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v2 2/9] serial: bflb_uart: add Bouffalolab UART Driver
In-Reply-To: <Y4TD48v84CJcMS+S@xhacker>
Message-ID: <e1f689d2-d337-5a42-e4c9-91c1d338b42b@linux.intel.com>
References: <20221127132448.4034-1-jszhang@kernel.org> <20221127132448.4034-3-jszhang@kernel.org> <c0406076-04e1-6b81-1bba-ac684516d898@kernel.org> <Y4TD48v84CJcMS+S@xhacker>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_080218_064938_B4D760A0 
X-CRM114-Status: GOOD (  12.40  )
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

On Mon, 28 Nov 2022, Jisheng Zhang wrote:

> On Mon, Nov 28, 2022 at 07:10:41AM +0100, Jiri Slaby wrote:
> > On 27. 11. 22, 14:24, Jisheng Zhang wrote:
> > > +static void bflb_uart_tx_chars(struct uart_port *port)
> > 
> > Again:
> > 
> > Are you unable to use the TX helper? If so:
> 
> You know serial subsystem better than me, may I ask for more
> details? For example,
> Besides uart_xmit_advance(), do you expect other TX helpers? If yes,
> can you please list them?

Please take on look on commit 8275b48b278096edc1e3ea5aa9cf946a10022f79.
The changes following that commit convert some drivers to use the tx 
helper so you can look into them to see examples.

> > * why?
> > * use uart_advance_xmit() at least.
> 
> Do you mean uart_xmit_advance()? in the do while loop below?

Yes, Jiri had the name wrong. But your code looked like it could use 
the tx helper instead.

-- 
 i.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
