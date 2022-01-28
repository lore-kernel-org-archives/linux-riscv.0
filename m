Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCBEC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 19:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0oJzVKxxg3fNU18Mzd3gB29yJZC6GeOQwjS7cL5kCo4=; b=VZWnRv8nL3cSg2
	yDlnc1cxhWsEedjD/klM//brTrA6GVMqYu/0IaLzTv5cdefqL/28JUjJRvW/IDYKPy5oCvKD9kCM6
	HoR8f39v1ZoY3uockDR3I2IrJ/P5CBKtGXC3cwIG7qYKmbI8qCFr4Swz3z2imk4qxHgLms/dvX1oL
	dQaX+E0aDKWImN+vayIYvln93HGtWAghLlwcwJaxF2IKgC38WLZV+4/KlVrg1HF9FnXiV95cmoEmx
	eqa7/pDkATRWCJ1ecEgQqfiRs7i0TMyo7sdtl0v8jkTXaXcFxnrJB/qNmtjDzG/DrH6nlrJn0JoJ7
	xUu1eZ7ogCG2ziHiTizw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDX7G-003RPb-Hb; Fri, 28 Jan 2022 19:41:02 +0000
Received: from mail-4317.proton.ch ([185.70.43.17])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDX7E-003ROe-BO
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 19:41:01 +0000
Date: Fri, 28 Jan 2022 19:40:52 +0000
Authentication-Results: mail-4317.proton.ch; dkim=none
To: Marc Zyngier <maz@kernel.org>
From: Conor Dooley <mail@conchuod.ie>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: interrupt-controller: sifive,
 plic: Fix number of interrupts
Message-ID: <c3221217-52de-64fd-2375-78b5d80c8a9a@conchuod.ie>
In-Reply-To: <87mtjf66cx.wl-maz@kernel.org>
References: <cover.1643360419.git.geert@linux-m68k.org>
 <f73a0aead89e1426b146c4c64f797aa035868bf0.1643360419.git.geert@linux-m68k.org>
 <D-55Hk0vrg2vkivFR3NXwnyI8hno6J5TA6gRHi3GbGVflgVPOGQNM2auwcIoHVt3fuzkg-pe7MAARda8PG8-KPoEnarmha7U6TI-pA7V6uI=@conchuod.ie>
 <87mtjf66cx.wl-maz@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_114100_559498_0226ADBB 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Conor Dooley <mail@conchuod.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 28/01/2022 18:51, Marc Zyngier wrote:
> On Fri, 28 Jan 2022 17:57:04 +0000,
> Conor Dooley <mail@conchuod.ie> wrote:
>>
>> [1 PGP/MIME version identification <application/pgp-encrypted (7bit)>]
>> [2 OpenPGP encrypted message <application/octet-stream (7bit)>]
>
> Please refrain from posting encrypted messages to the mailing lists.
>
> 	M.

Apologies - not my usual mail client. It appears to have decided that
you (and Rob) should get it encrypted even though I had that disabled.
Actually doing so also would appear to be non trivial. I am hoping but
not expecting to have fixed it.
The mail to the list itself looks to be fine however.

>
> --
> Without deviation from the norm, progress is not possible.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
