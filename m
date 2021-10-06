Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4BFC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 21:39:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA30B611CC
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 21:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA30B611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tTZVqwUstJHp7a6zbUCPi4ZI8pMWqLjdquVdUFtc60=; b=4LJTN4EQlxi3z/
	/pDuqEM+Kg+8v6U21WRxAnWlKdoEwZuQUAcYO1U3XZdk3d1TgTFXIgIaQ3BAGJ2DhuI+9D3WNXSM0
	AJwMvWizQPjxXtonIGNIDlLpSy9gw9tnaZQizFXVjBW13LBSnINuUPPQfMcBFSaFMf2dGN5bWKq1N
	HwTsv2GelGxRemD19eysuyD1lM/pfFySwLSIj1h+PQ6l0fIqZMg/MQJ01Xrm7dPhmY5ee+B8K2fRY
	/NKJ1AvUejlo5SBweJSrA6oHCDCpgvi1idnmZmT2F9a4NBKfFZ8z2p7dRyFPcujWe/t3tC56AajSl
	fXhpyaaCu56E3/znZwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYEdA-00FcOU-TP; Wed, 06 Oct 2021 21:39:16 +0000
Received: from gate.crashing.org ([63.228.1.57])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYEd7-00FcNn-Sm; Wed, 06 Oct 2021 21:39:15 +0000
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 196LRU0O007032;
 Wed, 6 Oct 2021 16:27:30 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 196LRS4V007029;
 Wed, 6 Oct 2021 16:27:28 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 6 Oct 2021 16:27:28 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Stafford Horne <shorne@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Rich Felker <dalias@libc.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Jonas Bonn <jonas@southpole.se>, Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.osdn.me>, linux-sh@vger.kernel.org,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Ray Jui <rjui@broadcom.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Rowand <frowand.list@gmail.com>,
 James Morse <james.morse@arm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
Message-ID: <20211006212728.GM10333@gate.crashing.org>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org> <YV4KkAC2p9D4yCnH@antec>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YV4KkAC2p9D4yCnH@antec>
User-Agent: Mutt/1.4.2.3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_143914_303599_098B6005 
X-CRM114-Status: GOOD (  11.70  )
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

On Thu, Oct 07, 2021 at 05:44:00AM +0900, Stafford Horne wrote:
> You have defined of_get_cpu_hwid to return u64, will this create compiler
> warnings when since we are storing a u64 into a u32?
> 
> It seems only if we make with W=3.

Yes.  This is done by -Wconversion, "Warn for implicit conversions that
may alter a value."

> I thought we usually warned on this.

This warning is not in -Wall or -Wextra either, it suffers too much from
false positives.  It is very natural to just ignore the high bits of
modulo types (which is what "unsigned" types *are*).  Or the bits that
"fall off" on a conversion.  The C standard makes this required
behaviour, it is useful, and it is the only convenient way of getting
this!


Segher

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
