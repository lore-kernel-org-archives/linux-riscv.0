Return-Path: <SRS0=S271=QN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DB4C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 10:33:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21F5B206C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 10:33:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RhjRL45J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21F5B206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4egJ5Ai242hYS+ctV7NS7vIA8KhP3XfdA6pAvrNpjME=; b=RhjRL45JP2UDFW
	kP4l7f3qsZU2A9pvYkiKu1bSIUbVYVB5T4OdEj3K+6JKkcuCRvhY2a0TmHO4lPBtwskmmQZE84/sk
	K3LCAv8Y4kkT2Afih1J41fShSUbz11vzpUZuf/4pj/AD0tGk7JhYRGaPqT2unZ/MRzchtMI+hFy5B
	JDAIu+l3S2vEgOFhucgNDkuKwuPQt5S+h1ROJSmIBmLJ4pNdAlKIxouOVqhX4CWhzF/JkzZVYLG+b
	lM4Gtzzt3hzTSoSD6Emt9jj2BacLCgicJSNKiNHaSARGSeWc39zbSRF30GzJTfwi7p4KcqwX1hwIq
	BJ6cC/zse3syF3S25few==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grKVt-0000pZ-MB; Wed, 06 Feb 2019 10:33:05 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grKVr-0000p3-1j
 for linux-riscv@lists.infradead.org; Wed, 06 Feb 2019 10:33:04 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C52C5B691;
 Wed,  6 Feb 2019 10:33:01 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Anup Patel <anup@brainfault.org>
Subject: Re: Boot stuck at "smp: Bringing up secondary CPUs ..."
References: <mvmsgx22r3u.fsf@suse.de>
 <F77EA382-959C-4142-9A00-F1EBB58D37F8@wdc.com>
 <mvmtvhh1dl2.fsf@suse.de>
 <CAAhSdy1OWwh86u1w=jtX-3SidWjZm46T-5giKtXD1LMcZSywQg@mail.gmail.com>
 <mvmftt11bdq.fsf@suse.de>
 <CAAhSdy33AFXrCQppswWzscy8TQh0Tjp1ixcjFcoB97v6vAwWxw@mail.gmail.com>
X-Yow: I had a lease on an OEDIPUS COMPLEX back in '81...
Date: Wed, 06 Feb 2019 11:33:01 +0100
In-Reply-To: <CAAhSdy33AFXrCQppswWzscy8TQh0Tjp1ixcjFcoB97v6vAwWxw@mail.gmail.com>
 (Anup Patel's message of "Wed, 6 Feb 2019 15:47:30 +0530")
Message-ID: <mvmbm3p1a1u.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_023303_228473_359BD0D9 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Feb 06 2019, Anup Patel <anup@brainfault.org> wrote:

> On Wed, Feb 6, 2019 at 3:34 PM Andreas Schwab <schwab@suse.de> wrote:
>>
>> On Feb 06 2019, Anup Patel <anup@brainfault.org> wrote:
>>
>> > On Wed, Feb 6, 2019 at 2:47 PM Andreas Schwab <schwab@suse.de> wrote:
>> >>
>> >> On Feb 05 2019, Atish Patra <Atish.Patra@wdc.com> wrote:
>> >>
>> >> > Are you loading Linux from U-Boot and openSBI ?
>> >>
>> >> No.
>> >
>> > We requite Atish's SMP fixes to boot upstream kernel on Unleashed board.
>>
>> The same boot image has booted sucessfully before.  The problem with SMP
>> bringup only started when I started experimenting with openSBI and
>> U-Boot.  Coincidence?
>
> Lot of kernel bugs are hidden due to FDT fixups done by BBL at boot-time.

Then why does it fail with BBL?

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
