Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC267C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 22:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=q06wKyojeUseiJcHTply0bw4q0xcIKxc+mPsyfhXsPE=; b=MAYZ2jxkqW4cDHtX3uokdQ6Jdd
	PZK7bYkMdw9Xi+yZ0k0PWr+bHQiRJ/pPVNF28MRHpr78bSVyzzXXWOM5GpOpa0zFK9mQXmGRk0LDX
	he35CnlUihIUUknLJsUJRxOp9hQtEJsIXu5z1CU/7ZUgOxmnu68RF/KzM0H3fzsjZk5HkgZsv/c8k
	QbeeQruH31fqbpCgWWlY4YD7tz2gxI0dZFrBnkXjGoV0VpIiK9cA9STqV1SCsejUfEoNZRFm7lBzw
	pEBxH5590K0gnDu6nEhob5TxY8A9qHfh9qAqYIHfAWJH3LhoT8UyApf7+KqttQFAz8jBYGWvOPMj7
	nriABINg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwswS-004WzJ-8e; Thu, 02 Jun 2022 22:05:20 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwswP-004Wva-07
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 22:05:18 +0000
Received: by mail-pg1-x530.google.com with SMTP id u4so2854287pgk.11
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jun 2022 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=g981gwU+QbTg1CTVTnIejpAqiSS5b7TknMhPk3HO7t0=;
        b=f+xLJvXfZ7e0YYIiiG8/GcUc8u5hceELJk7W0M5Z8D0q6oLUhThpXVrRVn4y0jhhvC
         Ut6IybYQv8Mv7pD8rhq6L0fhXEcKCpqK5E4EcpolBLU6gbuIZ/agRNZGeJ/J+3q7Y/0C
         KMrlYVsCiohb3vs++/UFKwcvaDr+OZhULyIF1n4JPP7FIb5MmJzOIH0Mu8BXBB/yWujM
         dtmgdw8M7+TUOyU3oQo2P9SyhzTEHYH9g429NAnTkfO2V6zryGGxZcIbIqqrX8PrOdoo
         QHCdFrdmVyUDhefMW3/KPJh+xRq0JAktWEE71h4yPSIu3kg3Tv1hF+Wq+bgDp0hywitT
         6B2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=g981gwU+QbTg1CTVTnIejpAqiSS5b7TknMhPk3HO7t0=;
        b=G3bmwfMKOEHTeF91HYPNYHf9ag5yvrIclz1/OsNZ0xX5v2xJzm9LD/jRlIE7Cx7FAB
         tpYp+GT+mioexlNPMaRn5zHmPP9XWB1pBDtZlArUlYmiSgMnQBxEgSOkQLEkV9VwRrC2
         VZ30KzFNimz82qLKaO+9C/10zRfzU2+qxiO3ZAF6yIbkUmB+zC+PaVTDT0uD6LeXLjef
         mnQVsVU4YuY5jIg13DYrhvtcPG0yt50zqPa9oppD+Okoxxbze5tevMc4ZXZN+mROvYcD
         ovj/tWt+65EeaC2f3z6RwQseWR/PNvxNAeAOEjm+2WBKHJIWk+ZTGDIlLXh3YcTcPl/2
         yd2Q==
X-Gm-Message-State: AOAM531mfLqEfn+2VvY9zuLu8LfEv20PcXVvLymtjCju1JaUZubvwcUn
	uJdlGE+Yj3nPomGJz4Yt1zxeug==
X-Google-Smtp-Source: ABdhPJxjSFUzsf4lkLoMfmFY1WMKhCTegBCaUe/romqfX3cM5aFA6cCJrrqxQjntq/bZuusWI+FpQw==
X-Received: by 2002:a65:5385:0:b0:3fa:52e3:6468 with SMTP id x5-20020a655385000000b003fa52e36468mr6077685pgq.366.1654207515548;
        Thu, 02 Jun 2022 15:05:15 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id k5-20020a17090a39c500b001df6f26c64esm6362810pjf.13.2022.06.02.15.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 15:05:14 -0700 (PDT)
Date: Thu, 02 Jun 2022 15:05:14 -0700 (PDT)
X-Google-Original-Date: Thu, 02 Jun 2022 15:05:13 PDT (-0700)
Subject: Re: [PATCH v4 1/1] MAINTAINERS: add polarfire rng, pci and clock drivers
In-Reply-To: <20220602163152.GA22276@bhelgaas>
CC: Conor.Dooley@microchip.com, Greg KH <gregkh@linuxfoundation.org>,
  Arnd Bergmann <arnd@arndb.de>, akpm@linux-foundation.org, sboyd@kernel.org, linux-pci@vger.kernel.org,
  mturquette@baylibre.com, Paul Walmsley <paul.walmsley@sifive.com>, kw@linux.com,
  linux-clk@vger.kernel.org, aou@eecs.berkeley.edu, lorenzo.pieralisi@arm.com, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, Daire.McNamara@microchip.com, Lewis.Hanly@microchip.com,
  Cyril.Jean@microchip.com, robh@kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: helgaas@kernel.org
Message-ID: <mhng-0b996c2b-86e2-4997-86ee-5510337ee460@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_150517_295584_98112306 
X-CRM114-Status: GOOD (  17.71  )
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

On Thu, 02 Jun 2022 09:31:52 PDT (-0700), helgaas@kernel.org wrote:
> On Thu, Jun 02, 2022 at 04:39:08AM +0000, Conor.Dooley@microchip.com wrote:
>> On 02/06/2022 02:55, Palmer Dabbelt wrote:
>
>> > I'm adding a bunch of subsystem maintainers just to check again.  I
>> > don't have any problem with it, just not really a RISC-V thing and don't
>> > wan to make a mess.  I've stashed it over at palmer/pcsoc-maintainers
>> > for now.
>> >
>> > Sorry if I'm being overly pedantic about this one...
>>
>> I don't mind. Maybe this should go via Andrew next cycle or w/e?
>> There's obviously no hurry etc
>
> My turn to be overly pedantic :)  IMHO there's no benefit in delaying
> MAINTAINERS updates.  There's zero risk, and delaying only means
> people will miss out on bug reports and other things they should learn
> about.

If by "delay" you mean wait until a merge window, then I definately 
agree -- that's just more cofusing for folks to have defacto 
maintainership outside of the tree, might as well get these in.  It's 
not like a MAINTAINERS update is going to introduce a regression or 
anything.

I'm just delaying because I just want to wait to make sure folks from 
the subsystems are OK with the updates, as these aren't really anything 
to do with RISC-V so it's not really my decision to make.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
