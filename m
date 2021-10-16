Return-Path: <SRS0=v6lb=PE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2329C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 09:17:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54586610D2
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 09:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54586610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F02UF2K9LZa/zqtNMWkrexhCQ6YDJfIiSHt+SYBV1zM=; b=ZXAql9xAjWxu3m
	rn+02hUnu74Z6F/yMjEuMEPkxAMHdVmRi/31w2mSere4vHtn6N8IeHyNVIkj6WQ+4DC+E8C6yhaX3
	21KtnB/fWSd4BXw8wzsES19dQsQh3HR6dMyMWHwsUYLJYV1zndHH1OmIfv19XbtuzSUTE3ZvaJWTW
	ApXFIoL4feNAxTbGhjjQf2FIyzaz2AsqYEFDB5bv2JAnL0Ek0aWp2acBD1rxUec9xlB6cWyAcNCAt
	/yE22s1mqKGqZ17Suc9TF9m+19lNfS9eIR85Bv0K3sRBqOX85Kj6noWCUx4lkVePasFeHm9Abt9Ld
	+Qx0sIA7SROzdUYL8MRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbfoM-00AE9B-Bl; Sat, 16 Oct 2021 09:17:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbfoJ-00AE8q-G2
 for linux-riscv@lists.infradead.org; Sat, 16 Oct 2021 09:17:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 067DF611AF
 for <linux-riscv@lists.infradead.org>; Sat, 16 Oct 2021 09:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634375819;
 bh=lZbCj57sS26PhhEqqLIywo2CTki+igIMS5uTDnO/RQo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fv+uG4YpKUa61aLECR+ZwDU85bj61IhR7WtNAoeQkPHQoUDT+UH+nfe4SF2hAZblC
 p0YE0X9ximkFMLF7Tf32S+yLabOKVX2FJ7AZvRap6xOe9iUI9pNZW3rFaa5My0QVBf
 /NW3I4/B2LSQrPbUFUujU5BmhlROMGPEg7n0lj8uDqEk656F6tr/5iWR51JY7Pf9Sy
 uryq0IPvcffWfka0R5hZUhCXumKwjN2/rIpE1IyqPgnvJEnUVyCfvJymLD+7wQsnDQ
 S7T48keqwLk1cofaYwiHbUoCV1w5ItpdEsNTqXz1YjU+a/jZlkPiVAD8iS43Q0RVP2
 Z6pFRX3XI4gfw==
Received: by mail-vk1-f181.google.com with SMTP id l39so6284634vkd.7
 for <linux-riscv@lists.infradead.org>; Sat, 16 Oct 2021 02:16:58 -0700 (PDT)
X-Gm-Message-State: AOAM5326iwdephi8bx1cFdHoGQFEW5WfKqjsDcf58j46O0bHVQ2nLyKs
 6hmeLB7Hu1C6jQk4ARkocyS2nDQgQwgP47dCoi0=
X-Google-Smtp-Source: ABdhPJy7Dr9uJZRjLPplBn0SwWTsg5Ys8p5qWK0RQe03OuCs93YEQl7H/pLcxBmeE24G/bvo7SZgWy407FkLn5kqPhM=
X-Received: by 2002:a1f:2a4c:: with SMTP id q73mr16680462vkq.8.1634375817984; 
 Sat, 16 Oct 2021 02:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-3-guoren@kernel.org>
 <87mtn9mor9.fsf@linux-m68k.org>
In-Reply-To: <87mtn9mor9.fsf@linux-m68k.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 16 Oct 2021 17:16:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRYuo+U1wWaz1jiQTk07-6etNMg-2UBDTYmnrLKzVqH8Q@mail.gmail.com>
Message-ID: <CAJF2gTRYuo+U1wWaz1jiQTk07-6etNMg-2UBDTYmnrLKzVqH8Q@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] dt-bindings: update riscv plic compatible string
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_021659_577127_355379B0 
X-CRM114-Status: GOOD (  10.32  )
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

On Sat, Oct 16, 2021 at 3:17 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Okt 16 2021, guoren@kernel.org wrote:
>
> > +  The C9xx PLIC does not comply with the interrupt claim/completion process defined
> > +  by the RISC-V PLIC specification because C9xx PLIC will mask an IRQ when it is
> > +  claimed by PLIC driver (i.e. readl(claim) and the IRQ will be unmasked upon
> > +  completion by PLIC driver (i.e. writel(claim). This behaviour breaks the handling
>
> Missing close paren in both parenthetical remarks above.
Opps, thx. I'll fix it.

>
> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
