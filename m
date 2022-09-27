Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBEBC6FA86
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 06:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFIQW2wCab4Z4/EKIlkgrCfBqQaN0bfJ0muc6ABqSxs=; b=qiIRR6Hfz6AZwJ
	kBPN6Bx6XJUNtR91z3GNzpmXL5AkPkOvowSATLSUNrZMefDBcbqaVNKkNAgjHIUGJwvvo23pNZlV6
	nmSe1fMpDzx+G/OHHqP0lvTSzR41OIaTbnRXSeC1zgHZMGm3GNnLnGbN13ZdkTNm8sKKM9upOiATt
	OhAJBEWoGsdPNjD230kfms4Iam7Sehuo7DO5rL8/7nm04nYM3Tz7PztRQMy8t1NlmPBYruKg0tn4O
	2glaQB6mZ0OSxnZk/vU44N4xX6xO4YhBFjP/ytMFre+w+qZbxjlAYSLo/nHZXHXJt8QvbkjwLSuTf
	ik27dgh9k2PlpKEYwxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4B9-008ab6-QE; Tue, 27 Sep 2022 06:34:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4B4-008aYX-9X
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 06:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664260486; x=1695796486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JIhyNkxXH02AS3CwbderjnCiE1NnwJt2HS0Smkk7g/8=;
  b=VzhQ57dluFAJTlXKYf9Nhbh5oLjYCNaPOx/ha8nW27jUQFonFv+XFYLm
   LvMWKKMpUAIpCI7MUvGKrOlt5pYinpqpzB9N5XoyrAFmyFkEF9UgNrf00
   FO0XrU+D1OvI9ADueUXQ4420cZYMTAOUQl7G1SRqvSCGpsUYh4OyqwqjE
   /lO4IFhyYw5yo5KHaDl0vQ48tqgxW2D9xTu6z80+6zm53ekObv5eNWHBI
   L/lFhHConWI3YBRlILpfGJO/f5Zq7JDNwnYhT5uKwuLAd+ckfax+0+4rz
   xf0WIyvRGculXah5ZcXADQASdKDB+4fHquWdqmQtWr7MIq9HkBOeBPAEk
   g==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="182089551"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Sep 2022 23:34:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 26 Sep 2022 23:34:39 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 26 Sep 2022 23:34:38 -0700
Date: Tue, 27 Sep 2022 07:34:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <damien.lemoal@opensource.wdc.com>, <heiko@sntech.de>,
	<kernel@esmil.dk>, <arnd@arndb.de>
Subject: Re: [RFC 00/27] RISC-V: Convert SOC_FOO symbols to ARCH_FOO
Message-ID: <YzKZYoaAbwtLcsSY@wendy>
References: <20220923185605.1900083-1-conor@kernel.org>
 <CAMuHMdVxx7_im2wtb_Hszf2P6EuxEDjA95sJtkM9Jf9KV3xO4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVxx7_im2wtb_Hszf2P6EuxEDjA95sJtkM9Jf9KV3xO4Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_233446_620906_23F7C41A 
X-CRM114-Status: GOOD (  31.29  )
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

On Mon, Sep 26, 2022 at 11:04:58AM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
> 
> On Fri, Sep 23, 2022 at 8:59 PM Conor Dooley <conor@kernel.org> wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Following on from LPC, here's the start of my efforts to clean up
> > Kconfig.socs.
> >
> > My preference would be to take the whole thing through the RISC-V tree
> > for v6.2 to make things a bit less fiddly, but I am sending this as an
> > RFC in the hopes of getting some opinions on how the series should be
> > split up & merged. I guess it would always be possible to create a few
> > immutable branches for the individual subsystems that are being modified
> > & take the series through the riscv tree unless we hit a conflict in
> > -next. Obiviously for that route, maintainer acks will be needed.
> 
> Iff it is decided to make this change, I suggest to do it at the end
> of the v6.1-rc1 merge window, or even better, between rc1 and rc2.
> That way the affected subsystems can just base their for-v6.2 branches
> on v6.1-rc2, and have all renames.
> 
> If (a) you postpone this to v6.2, there will be more users to handle,

Unfortunately even if this is decided upon, I am not sure I am going to
have the time to get this sorted out prior to rc1. I'd rather wait until
v6.2-rc1/2 & not rush it - especially given the number of Acks it likely
requires.

> and (b) you take this through the RISC-V tree, you will miss all newly
> introduced users in other subsystem trees.

Aye, your suggested timing makes sense, but there are quite a few
subsystems involved here, so maybe doing it at the very end of the
window rather than asking everyone to stall until rc2 may be more
feasible?

Thanks,
Conor.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
