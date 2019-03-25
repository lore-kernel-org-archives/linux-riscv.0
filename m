Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9D0C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 16:23:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D53E20828
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 16:23:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FE/6CN3h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D53E20828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=df6V1bMy6D0H9VegFto2rVKGPnI7PJ6B9BBJ35qgliY=; b=FE/6CN3hSR+EOa
	/aMeK3F2mYmQPIwdQvyzbJffPrkIqTJS6NzVy0k/dMFyf7BJtscLUPAS3eQcOvzZDOMDiZeNs7FdA
	FMiO810CVrvZ4qYeQipBiWSO3Y0cmOVwfhxpM2NUUhAnJMTP1Ua4X/tWgt9eusFnzDVkotxPM9aih
	56py7R1akMWNzByAe/i6xgvLuxYaqcxnJrpyK9ruA3vZX3Ps/SsGwGQOCfhKGRNhlNT+8S4vcUNbq
	+V/x2x9p+h9cUGN8PITvs7CLOX5pgGmcMIUEq8ULuglkixoA/jVezVWYcS9PaSXXrWDNVWok9AGP0
	HsCBXDWaqawhl5e3I3hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8SNh-00084K-QY; Mon, 25 Mar 2019 16:23:25 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8SNd-00083a-FM
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 16:23:24 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 67A98AF68;
 Mon, 25 Mar 2019 16:23:18 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 0/3] RISC-V SBI earlycon
References: <20181204135507.3706-1-anup@brainfault.org>
X-Yow: Here we are in America...  when do we collect unemployment?
Date: Mon, 25 Mar 2019 17:23:15 +0100
In-Reply-To: <20181204135507.3706-1-anup@brainfault.org> (Anup Patel's message
 of "Tue, 4 Dec 2018 19:25:04 +0530")
Message-ID: <mvm4l7qvs7g.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_092321_662963_EEF75A4C 
X-CRM114-Status: UNSURE (   9.63  )
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Dez 04 2018, Anup Patel <anup@brainfault.org> wrote:

> This patchset adds RISC-V SBI earlycon and removes RISC-V EARLY_PRINTK.
>
> We should use earlycon over existing EARLY_PRINTK for SBI console because:
> 1. It's a more generic way of implementing early console for debugging
> 2. Current RISC-V EARLY_PRINTK is a compile-time option whereas earlycon
>    is enabled at run-time via kernel parameters.
> 3. To use earlycon with SBI, we have to pass "earlycon=sbi" in kernel
>    parameters. If earlycon kernel parameter is not provided then kernel
>    boots much faster which is very useful in real-world RISC-V deployments.

Why doesn't this earlycon disable itself when the real console kicks in?

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
