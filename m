Return-Path: <SRS0=qfeT=V3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5F8C0650F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 06:52:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F35C2087F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 06:52:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a2rgxaHg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F35C2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hsel7k4gDZrmZMz8QIxMRpMm69XSCZp1r2ZWMSluolA=; b=a2rgxaHgBBTIP4
	NcTPqpxaBvu9Si/oPZQ5AwuG5gAgFsm1U7kp8RgRkg3fRhdinbOqpWdX8Uv02Ci8wO5fkqXKx23kR
	LS0SssVyz2QNKrJD6NjQF3OQnszh8z5pd8lmUysdtB4e1LAdODp7zEYmLpzdDzUPBwzrkxu+wkLbh
	9qo/Wvil8LzSwNhHkDnHPGJlZlbBSN2EBtSuhK9hIos++258HTEhOE7QQ6/vVp0Q3GDcQtx9miWKt
	+xk0sDVcn4FkzS4LXVTldTyIZjnLO2jlNoAOh7AWqCScswzcjr9+vs2zuQOqCZWxoB/PoDxzEBdil
	nTyHZRDP8YgzXO+swyEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsLzE-0001iu-Ga; Tue, 30 Jul 2019 06:51:52 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsLzB-0001i5-O3
 for linux-riscv@lists.infradead.org; Tue, 30 Jul 2019 06:51:51 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 97E03AE5C;
 Tue, 30 Jul 2019 06:51:46 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [RFC PATCH 13/16] RISC-V: KVM: Add timer functionality
References: <20190729115544.17895-1-anup.patel@wdc.com>
 <20190729115544.17895-14-anup.patel@wdc.com> <mvmpnlsc39p.fsf@suse.de>
 <d26a4582fad27d0f475cf8bca4d3e6c49987d37d.camel@wdc.com>
X-Yow: This is a NO-FRILLS flight -- hold th' CANADIAN BACON!!
Date: Tue, 30 Jul 2019 08:51:43 +0200
In-Reply-To: <d26a4582fad27d0f475cf8bca4d3e6c49987d37d.camel@wdc.com> (Atish
 Patra's message of "Mon, 29 Jul 2019 18:02:00 +0000")
Message-ID: <mvma7cwaubk.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_235149_929868_07B97864 
X-CRM114-Status: UNSURE (   6.29  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "rkrcmar@redhat.com" <rkrcmar@redhat.com>,
 "anup@brainfault.org" <anup@brainfault.org>, Anup Patel <Anup.Patel@wdc.com>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hch@infradead.org" <hch@infradead.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Jul 29 2019, Atish Patra <Atish.Patra@wdc.com> wrote:

> Strange. We never saw this error.

It is part of CONFIG_KERNEL_HEADER_TEST.  Everyone developing a driver
should enable it.

> #include <linux/types.h>
>
> Can you try it at your end and confirm please ?

Confirmed.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
