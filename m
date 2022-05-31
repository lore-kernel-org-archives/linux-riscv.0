Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED43C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 31 May 2022 09:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCnCK/bxiqES1La8aIB3WJcpXvMOtzXnja6r3O6IUis=; b=HmnK3vngcEnWt0FSVVDr8hq7hY
	zJ8QxM4d/ll4VybjEfKK3Yl24jtJqtwkvprXOw4qp+/PhexUnD/Ac2gyWx2DA9g0ZYdf/10TGpfQg
	UPRfB81vhlHRaQEaN/wuF20LgFXj1G4toOyuLP+cwpF6Ja6Vni1FzjloB750fGV0F70HFxVMPEBvL
	0rBXjhXdSyCQWO/qwhYGMtC7P9CScLWGWCSjPbrvlChnjqeMEorPhZzRDaWTIpKQVcbVp/hfUFIQG
	W9olKFFmQYeDrwLYR0iKiQjUwUyfdOyLo3t9HOBM/IhB4xYsaZJc+NLDjrvEtWIY5kqm2UAlN3Ukc
	G+uuHdXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvy5Y-00A1BA-Aj; Tue, 31 May 2022 09:22:56 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvy5V-00A19j-42
	for linux-riscv@lists.infradead.org; Tue, 31 May 2022 09:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653988973; x=1685524973;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=RwZHPwLQi0zkefuKPqdJYX4ZgiLMBfNkovTNMntcpxM=;
  b=jD16+h4iiV7XK3FlnvRdO3uEWPSNhc/mU0jFQNqyzx8STCumOijwyV4H
   Arud8i7CtLFKG90gGx+P0kFviZqYlfmt4hxgzVknaB9Axd85w+t0C75eC
   laYOZb0sBxlkg4us4ma5MRbrxzPSyP7MBx2oF95fpIS5FiiHdDb9ii11H
   OA3iYl0UOzgbtHCSNae+F/Y5ZBpn28T29/hpHZqOGpa5Sw7U/em8+bQsc
   WI8T5UMXkF/5VXq1IjHD5pGGx8Hg6by2Yg9koP7ajT16fqpiU6rbtTs5M
   qIUkyFfW0Lm05RUlll9MUbS8AkogZMHZUddHQ8sCIndvxB/5yJSIAvgvI
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="338238925"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="338238925"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 02:22:51 -0700
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="605578188"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.169.215]) ([10.249.169.215])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 02:22:48 -0700
Subject: Re: [kbuild-all] Re: [PATCH] gpio: sifive: Make the irqchip immutable
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Marc Zyngier <maz@kernel.org>,
 kbuild-all@lists.01.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <73c75a67d1c87b049d633057c0e765e708ee02a2.1652884788.git.geert+renesas@glider.be>
 <202205201122.xuM6bWUt-lkp@intel.com>
 <CAMuHMdX_WMwPVTbGQYLSeCb5P2BNimkzeif+o9oDwx40qt7D5g@mail.gmail.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <1fee01b7-79b7-5a51-4852-c87a48dc2433@intel.com>
Date: Tue, 31 May 2022 17:22:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX_WMwPVTbGQYLSeCb5P2BNimkzeif+o9oDwx40qt7D5g@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_022253_254159_7001171B 
X-CRM114-Status: GOOD (  20.50  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 5/20/2022 2:46 PM, Geert Uytterhoeven wrote:
> Hi Kernel Test Robot,
> 
> On Fri, May 20, 2022 at 5:29 AM kernel test robot <lkp@intel.com> wrote:
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on linus/master]
>> [also build test ERROR on linusw-gpio/for-next v5.18-rc7]
> 
> As of commit 2d3535ed2c73fee3 ("MAINTAINERS: update the GPIO git tree
> entry"), the GPIO for-next tree has changed to
> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git#gpio/for-next

Hi Geert,

Thanks for the information, we have updated it.

Best Regards,
Rong Chen

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
