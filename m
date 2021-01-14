Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98A7C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 09:41:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81B5D23A21
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 09:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81B5D23A21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g9pgShLD+1/Kt/wxFLQBIrqDIepVWePnn0Do5e6rvD0=; b=1xm2DeUp3UWMPOAmUXXkVqn2E
	5zyVMgjDll92+JuD+fGc3/XlGQvrW16LcEIMLOvhOXbuj5gbjTSwPpbPRDc9fvX376AJy7xFaHS7R
	kRJl9ErGWhPRnw5DbMbzP07Z9gLig+tQ3PkQfaJdoaK6rFHbXIB/y2HBUzL7FwXbu/MTQFxMZI+7W
	1LiFIE+mU34c+C9y9WKRo7jhlle+BJNdaNsis7MQAqPDElj0ZP6zX/iAQNiAn2WEEdjl3krnomDUk
	tobNl90l4ifIb4F5vWXDGt1sDpf0Dtc4kjrYumkPPjexphN2iV9dnflnXeL+0fvVn+QgtCoCPtAxD
	xED1qIdlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzz7e-00025a-Lx; Thu, 14 Jan 2021 09:40:54 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzz7R-0001zd-P8
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 09:40:45 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33F4CB278;
 Thu, 14 Jan 2021 09:40:39 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: EFI booting crashes
References: <mvmk0ssu8yi.fsf@suse.de>
 <CAOnJCU+JmDaU1f3hAbyjR4__TVHJbjnZZ8th25i5Q-et_UxXeg@mail.gmail.com>
 <87im8154r2.fsf@igel.home>
 <CAOnJCUJg+-4RTz=6JQDU_c90W1KpNkvNN=riLfHmtwtpHAh0yw@mail.gmail.com>
X-Yow: Those aren't WINOS--that's my JUGGLER, my AERIALIST,
 my SWORD SWALLOWER, and my LATEX NOVELTY SUPPLIER!!
Date: Thu, 14 Jan 2021 10:40:38 +0100
In-Reply-To: <CAOnJCUJg+-4RTz=6JQDU_c90W1KpNkvNN=riLfHmtwtpHAh0yw@mail.gmail.com>
 (Atish Patra's message of "Wed, 13 Jan 2021 17:48:33 -0800")
Message-ID: <87czy726w9.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_044041_997196_8EC17780 
X-CRM114-Status: UNSURE (   8.62  )
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

On Jan 13 2021, Atish Patra wrote:

> efi_var_buf is at 0x200b2338

That's its GOT entry, not the variable itself.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
