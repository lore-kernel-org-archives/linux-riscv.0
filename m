Return-Path: <SRS0=HZsE=GQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4FCC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 13:46:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20907233FB
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 13:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20907233FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sCeS/K7Al5Ttuf0EkswvxmC5oHg7m6CWFV9bdfKe6uo=; b=pQUgDdoZc0CTsQ8KUfU8vQonU
	KOhSsTCy2hpaQ6MczXOMSz+yqPbUJG4gYGceVN8KENUZ7XbZc6hZ4/3JF3bkjcfTsTN9MMrlPzZnq
	xtddVcKsKeDf0pjQgVIQxHPknZ0sqtrqIPeIwnDK4a6MPJF8kkupytnUtYwabWOOUZPNI+mnuaFdc
	Sn3icauXQIGpyUuWlWmTIEF9Z1zKIj+SFUIYeE2auaVf4Z4nDucbxAHDKGoqyQu4Z89IOL/jdI65Z
	HoV+9YOd2cjF91lRuyoEAQQ/mwHyPG8pCDUUhFoISRYNmHX73ou9UzekH4ruA+6hvUPQWIFBe6Zpx
	5NqvCcy9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzgTm-00013i-TV; Wed, 13 Jan 2021 13:46:30 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzgTk-00012h-Lt
 for linux-riscv@lists.infradead.org; Wed, 13 Jan 2021 13:46:29 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80BB9AC24;
 Wed, 13 Jan 2021 13:46:26 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: EFI booting crashes
References: <mvmk0ssu8yi.fsf@suse.de>
 <CAOnJCU+JmDaU1f3hAbyjR4__TVHJbjnZZ8th25i5Q-et_UxXeg@mail.gmail.com>
X-Yow: Yow!  Maybe I should have asked for my Neutron Bomb in PAISLEY--
Date: Wed, 13 Jan 2021 14:46:25 +0100
In-Reply-To: <CAOnJCU+JmDaU1f3hAbyjR4__TVHJbjnZZ8th25i5Q-et_UxXeg@mail.gmail.com>
 (Atish Patra's message of "Mon, 4 Jan 2021 12:46:03 -0800")
Message-ID: <87im8154r2.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_084628_848008_05D68224 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Looking closer, the fault address is pointing to the GOT of u-boot,
coming from loading the address of efi_var_buf in efi_var_mem_find:

    80200338:   00078497                auipc   s1,0x78
    8020033c:   9e84b483                ld      s1,-1560(s1) # 80277d20 <_GLOBAL_OFFSET_TABLE_+0x80>

I wonder how this is supposed to work?  Surely the GOT isn't mapped in
the EFI runtime memory.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
