Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA67D78337
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 17:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XngOXG2JuDo3wjkB5z0n/Jir114OftWJNPyQiUhqyVw=; b=VBv/aCWP5loKQH
	ppeHEEw/WGzIuR2JchmkWe3YYUokqPWuO9uoZIkLECgBl/xMb1hI910qETafH2myOf8K/kEqB19zh
	1qZs6653o8VII6KrN7A7Le1ptrvxHb0NORlDkyy99h+OVau8HUSaid9NyWjwQrgpu1roFWV4KrIC7
	TQXictkZTpCqNyzuJSz0CZr3LrLf8kt+JV6HrDTizkFzyTXRqjVies0wurqvaUuDB5KTbSJlCYX6C
	K8mILxI19dNr0AeLHykuGglqfwJ+b1GKacsXYeP7NXAYni24u3C1fk1rACcEl6ojtMV36OLCnk3YT
	DyJh7kcmAdTaudKzro6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9t7-00000006xtm-0qAC;
	Mon, 02 Dec 2024 17:07:09 +0000
Received: from smtp-fw-52005.amazon.com ([52.119.213.156])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGko2-0000000GKEm-468b;
	Thu, 28 Nov 2024 20:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1732824487; x=1764360487;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=OqkEOPg1Ntw5OzjoKV6qV13YxrudUL0x8D+JX5oOx/Q=;
  b=WY1Boq3A/rdqoEOenAWiqQvPH8rAXu4b1X8ss1IYCxCiurasfPnJghJ0
   LHYPno8C4tEpe5qTmH1t/jmlfR3q9DiRT5WLd3/5wH4iFdFm0p8+2N4T0
   ETn3Ft1NfQqKP08+UWEE3incMAZhu+J9OmQOaadM6NFGcJs3gE+NxR6Im
   M=;
X-IronPort-AV: E=Sophos;i="6.12,193,1728950400"; 
   d="scan'208";a="699037645"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.124.125.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 20:07:59 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.10.100:44286]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.34.163:2525] with esmtp (Farcaster)
 id 092245c2-527c-4203-87c5-e650bdd3ad53; Thu, 28 Nov 2024 20:07:58 +0000 (UTC)
X-Farcaster-Flow-ID: 092245c2-527c-4203-87c5-e650bdd3ad53
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Thu, 28 Nov 2024 20:07:58 +0000
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19D018EUA004.ant.amazon.com (10.252.50.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Thu, 28 Nov 2024 20:07:58 +0000
Received: from EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d]) by
 EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d%3]) with mapi id
 15.02.1258.034; Thu, 28 Nov 2024 20:07:58 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Thomas Gleixner <tglx@linutronix.de>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"naveen@kernel.org" <naveen@kernel.org>, "maddy@linux.ibm.com"
	<maddy@linux.ibm.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "bhe@redhat.com" <bhe@redhat.com>,
	"hbathini@linux.ibm.com" <hbathini@linux.ibm.com>, "adityag@linux.ibm.com"
	<adityag@linux.ibm.com>, "songshuaishuai@tinylab.org"
	<songshuaishuai@tinylab.org>, "takakura@valinux.co.jp"
	<takakura@valinux.co.jp>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: "Chocron, Jonathan" <jonnyc@amazon.com>
Subject: RE: [PATCH v2] arm64: kexec: Check if IRQ is already masked before
 masking
Thread-Topic: [PATCH v2] arm64: kexec: Check if IRQ is already masked before
 masking
Thread-Index: AdtB0CLnH24qyvw6Ek+EUcflLj/BEA==
Date: Thu, 28 Nov 2024 20:07:57 +0000
Message-ID: <3a499ecdfa5042f8b6e8834c47cdb2d9@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.143.173]
MIME-Version: 1.0
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_120807_339974_D3E895FD 
X-CRM114-Status: GOOD (  14.49  )
X-Mailman-Approved-At: Mon, 02 Dec 2024 09:07:07 -0800
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

On 11/28/2024 12:39 PM, Thomas Gleixner wrote:
> This is just wrong. If the interrupt was torn down, then its state is deactivated and it was masked already. So the EOI handling and the mask/disable dance are neither required nor make sense.
>
> So this whole thing should be:
>
>                 chip = irq_desc_get_chip(desc);
> -               if (!chip)
> +               if (!chip || !irqd_is_started(&desc->irq_data))
>                         continue;
ACK. Will be done this way in V3.

> But what's worse is that we have 4 almost identical variants of the same code.
>
> So instead of exposing core functionality and "fixing" up four variants, can we please have a consolidated version of this function in the core
> code:
>                 struct irq_chip *chip;
>                 int check_eoi = 1;
>
>                 chip = irq_desc_get_chip(desc);
>                 if (!chip || !irqd_is_started(&desc->irq_data))
>                         continue;
>
>                 if (IS_ENABLED(CONFIG_.....)) {
>                         /*
>                          * Add a sensible comment which explains this.
>                          */
>                         check_eoi = irq_set_irqchip_state(....);
>                 }
>
>                 if (check_eoi && ....)
>                         chip->irq_eoi(&desc->irq_data);
>
>                 irq_shutdown(desc);
>
> No?
In V3 I will add a preliminary patch that will remove the four variants
and instead add a common implementations to the kexec core.

Thanks, Eliav

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
