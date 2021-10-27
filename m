Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31947C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 09:45:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F31A96103C
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 09:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F31A96103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPl3ZzeyN0vXmRvtxSffeXQxAULxGCSK4RoEdOacRVw=; b=3XmpkQab7Senfb
	IrO0w5HqGT8gIeeQ3/2kj8fbiaG3wsLLu3s1ChlAYDYv09gVRrtX8shWkLyOhJJ08vspDo0GCZVD4
	qtPlu+bYoEWPu3Jlxep8jB/fBP1ei2bKA9Ff320QlK3XEmZjkiphmQDX2RYwSY7ij1qDWquYroVO0
	lizF0GiBWPLD+eeYD0kI1/vMg2w1SMpNpPaCkfX7KVsuvMmE2Ut5DfjW805ru1rs4dqZpuzqP/J/f
	nCXf10ZYvAsAfPxHx1DgQqGXlwIf228BKr/P0s4W2UtqV3uT8xX9hp80T6H+d9/xkez0FvfJ4H829
	wi1yADUdB+Iu2EInkK9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mffV3-004T5A-CO; Wed, 27 Oct 2021 09:45:37 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mffV0-004T46-2e
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 09:45:35 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4HfP210Fxmz1qwxk;
 Wed, 27 Oct 2021 11:45:29 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4HfP2068n6z1qqkB;
 Wed, 27 Oct 2021 11:45:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id aM9GS1BKj2Zb; Wed, 27 Oct 2021 11:45:27 +0200 (CEST)
X-Auth-Info: C2/eG4m35MkI9B3Bxg1aiLH7XdmCmAifjuwSKAmQZlq5VktfNATtjZ8fcmt6k9ZP
Received: from igel.home (ppp-46-244-163-205.dynamic.mnet-online.de
 [46.244.163.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 27 Oct 2021 11:45:27 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 591102C2200; Wed, 27 Oct 2021 11:45:27 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,  alex@ghiti.fr,  Paul Walmsley
 <paul.walmsley@sifive.com>,  aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,
 kernel-team@android.com,  Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: Make CONFIG_RELOCATABLE user selectable
References: <20211026212847.43108-1-palmer@dabbelt.com>
 <87mtmuaodc.fsf@igel.home>
 <CA+zEjCuRuKtZAhkS_RFyby6UhLvYmg=4BdnXEwUdaCdtbB7ZAA@mail.gmail.com>
X-Yow: It's the land of DONNY AND MARIE as promised in TV GUIDE!
Date: Wed, 27 Oct 2021 11:45:27 +0200
In-Reply-To: <CA+zEjCuRuKtZAhkS_RFyby6UhLvYmg=4BdnXEwUdaCdtbB7ZAA@mail.gmail.com>
 (Alexandre Ghiti's message of "Wed, 27 Oct 2021 10:58:44 +0200")
Message-ID: <87ee86ajig.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_024534_299109_F530EE4C 
X-CRM114-Status: GOOD (  16.95  )
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

On Okt 27 2021, Alexandre Ghiti wrote:

> On Wed, Oct 27, 2021 at 10:03 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
>>
>> On Okt 26 2021, Palmer Dabbelt wrote:
>>
>> > +config RELOCATABLE
>> > +     bool "Build a relocatable kernel"
>> > +     depends on MMU && 64BIT && !XIP_KERNEL
>> > +     help
>> > +          This builds a kernel as a Position Independent Executable (PIE),
>> > +          which retains all relocation metadata required to relocate the
>> > +          kernel binary at runtime to a different virtual address than the
>> > +          address it was linked at.
>> > +          Since RISCV uses the RELA relocation format, this requires a
>> > +          relocation pass at runtime even if the kernel is loaded at the
>> > +          same address it was linked at.
>>
>> When in doubt, do what?
>
> Then do not enable.

Please add that to the help string.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
