Return-Path: <SRS0=W2t6=2I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324F3C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 10:35:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2294218AC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 10:35:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bmk9P5dA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2294218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7PRzv7udjNM2jx0BWQraPA1YkX5ozHqkifg+caGb7KM=; b=bmk9P5dAgEBFFKQO825pUnXCT
	dveAbm3GFQk+F5TXH1kXb0s5hD14XikGUWnhizegL4K5zCSpX+s4QHmGNCrHhDeRs8z0Rd4xA9SJp
	B4X6UmF8tqIbBt1QM0qQZ8pPEzrerms4Jd6j112E8f5XxuENwxTOr2FRwJZVv0F2BmTlixfGpiebq
	QqQUif5GkYll8u2kd6w2mNRF+6hNE/S8U/26uc/E3RmE1DXeTyvuaZPwPb4HUXgv7xoYyTkwrHLC5
	C5aZ5CSKT9vfzuBRLslKErqGIi0uEXdqjula+ltZXWVPeY5IysWIwl2ZrU43q/rTG2G2GEU55dm8h
	A5GnuocVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihWgE-0002ZH-7U; Wed, 18 Dec 2019 10:35:46 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihWfx-0002Gp-Hf
 for linux-riscv@lists.infradead.org; Wed, 18 Dec 2019 10:35:33 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5FF2BAD05;
 Wed, 18 Dec 2019 10:35:27 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
Subject: Re: [PATCH] riscv: reject invalid syscalls below -1
References: <20191218084757.904971-1-david.abdurachmanov@sifive.com>
 <mvmo8w63r1d.fsf@suse.de>
 <CAEn-LTojXuAbY31nReCsbE=7Q9PkuKexAttTc+35ZFn7SLG-_w@mail.gmail.com>
X-Yow: I was in EXCRUCIATING PAIN until I started reading JACK AND JILL
 Magazine!!
Date: Wed, 18 Dec 2019 11:35:26 +0100
In-Reply-To: <CAEn-LTojXuAbY31nReCsbE=7Q9PkuKexAttTc+35ZFn7SLG-_w@mail.gmail.com>
 (David Abdurachmanov's message of "Wed, 18 Dec 2019 12:06:57 +0200")
Message-ID: <mvmk16t53bl.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_023529_846462_97E76A04 
X-CRM114-Status: GOOD (  12.07  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Vincent Chen <vincent.chen@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Bin Meng <bmeng.cn@gmail.com>, Valentin Schneider <valentin.schneider@arm.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Dez 18 2019, David Abdurachmanov wrote:

> On Wed, Dec 18, 2019 at 11:46 AM Andreas Schwab <schwab@suse.de> wrote:
>>
>> On Dez 18 2019, David Abdurachmanov wrote:
>>
>> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> > index a1349ca64669..e163b7b64c86 100644
>> > --- a/arch/riscv/kernel/entry.S
>> > +++ b/arch/riscv/kernel/entry.S
>> > @@ -246,6 +246,7 @@ check_syscall_nr:
>> >        */
>> >       li t1, -1
>> >       beq a7, t1, ret_from_syscall_rejected
>> > +     blt a7, t1, 1f
>>
>> How about using bgeu instead in the preceding check?
>
> The syscall number could be -1 if tracer rejected it.

So check for -1 first, then for out-of-range?

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

