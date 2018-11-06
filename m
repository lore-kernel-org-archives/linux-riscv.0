Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA5EC32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 08:03:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50AFB2085B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 08:03:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F3aOgG9Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wS5rG+xf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50AFB2085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cR6ypaBEoT0q7KZ6CmXdE34lEZaJn8Xc9m43/TCK1Qw=; b=F3aOgG9ZTFJd39
	x8dDqtl21lAS2OF3Zyq4x5BFVXF7c5f+cwgGv3Uhm2fneFXEuAGjhLPUtoaQND98Ru6eiKPzSBiNc
	f6frQmmDVyw9ljBTkA8/AGbLdV+rfykIFCJy10sBS6mcoY/Ya7IsQtaA0bAcEYf36QCFSubuwZI55
	G/oxefdntnVERukGQSl/g0Gv/AuiPHcOOvMVvMCsJZEWV0X+7c46jRnFpR6kRDG6HPZ6UEECJ+xaj
	UXeBdpVASFycVkebBclkLX+YPr8Qh3AIsql8EquIC684iwWxM//bbbo0BmH6e1zDpoZmGp7R2iuSk
	uTVxG4Z68upOolduHI3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJwKq-00036R-FT; Tue, 06 Nov 2018 08:03:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJwKp-00036L-Ec
 for linux-riscv@bombadil.infradead.org; Tue, 06 Nov 2018 08:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y9a7gnT2kHvPf1ucDhRf/+YcYwNFbGxNz5Ork0JqqSs=; b=wS5rG+xfMlXz3LOQhztK7edhy
 nMrgX11oo6rady7FW/TJnBL/dgfhwaHS85JsOZJEpNMlCuwCZZ8z7D2wSbo68O+Gd3HmD+F5qHl0t
 GA4OeBeZNlyWuDba+oclk9rpoMu1O8rqjuFlrgVYzFjaiA2goyWh2D2h8RAwfguVg6wkE7h3iYae+
 XAVZzv0+ymXuAQU77XPpbC9YswM7UCP3TyAZN9iC4FxDOc5F3piE+AEH9wYEBxgdwpOWVoueu+WIw
 Ccn47d5f16IXcq/ARPLoY2xDZGX88fXrwO1CWZE2vjMA4aVTChd7RX6dBrxUBbxaNmXtUg/ku9Btc
 wznqcBZWg==;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJwKl-00062R-Ml
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 08:03:37 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7DFADB104;
 Tue,  6 Nov 2018 08:03:20 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [sw-dev] About the Use of sfence.vma in Kernel
References: <mhng-098e5d8e-3af1-4c5a-9c0d-2f2baba961da@palmer-si-x1c4>
X-Yow: Somewhere in Tenafly, New Jersey, a chiropractor is viewing
 ``Leave it to Beaver''!
Date: Tue, 06 Nov 2018 09:03:19 +0100
In-Reply-To: <mhng-098e5d8e-3af1-4c5a-9c0d-2f2baba961da@palmer-si-x1c4>
 (Palmer Dabbelt's message of "Mon, 05 Nov 2018 18:33:23 -0800 (PST)")
Message-ID: <mvmk1lqk4zc.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_080335_774264_1EB9E292 
X-CRM114-Status: UNSURE (   5.37  )
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
Cc: linux-riscv@lists.infradead.org, sw-dev@groups.riscv.org,
 alankao@andestech.com, greentime@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106080319.o5eaK0gD3Wb63MvkQLGg_CE3ns8gwkYB9TJucvE1ClE@z>

Perhaps that't the reason I sometimes get errors like this:

[303420.500000] swap_info_get: Bad swap file entry 2000000000df09b1
[303420.500000] BUG: Bad page map in process struct-ret-3.ex  pte:6f84d8c0 pmd:8f579001
[303420.510000] addr:000000008a1610cd vm_flags:00100173 anon_vma:0000000036036fc9 mapping:          (null) index:3ffffe7
[303420.520000] file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
[303420.530000] CPU: 1 PID: 2054 Comm: struct-ret-3.ex Not tainted 4.19.0-00040-g2d5ee99e76 #42
[303420.530000] Call Trace:
[303420.530000] [<ffffffe000c847d4>] walk_stackframe+0x0/0xa4
[303420.530000] [<ffffffe000c849d4>] show_stack+0x2a/0x34
[303420.530000] [<ffffffe0011a6800>] dump_stack+0x62/0x7c
[303420.530000] [<ffffffe000d55942>] print_bad_pte+0x146/0x18e
[303420.530000] [<ffffffe000d56df6>] unmap_page_range+0x33a/0x5ea
[303420.530000] [<ffffffe000d570d4>] unmap_single_vma+0x2e/0x40
[303420.530000] [<ffffffe000d57278>] unmap_vmas+0x42/0x7a
[303420.530000] [<ffffffe000d5cb92>] exit_mmap+0x7e/0x106
[303420.530000] [<ffffffe000c872aa>] mmput.part.2+0x26/0xa0
[303420.530000] [<ffffffe000c87344>] mmput+0x20/0x28
[303420.530000] [<ffffffe000c8ba24>] do_exit+0x238/0x7c0
[303420.530000] [<ffffffe000c8c006>] do_group_exit+0x2a/0x82
[303420.530000] [<ffffffe000c8c076>] __wake_up_parent+0x0/0x22
[303420.530000] [<ffffffe000c83722>] ret_from_syscall+0x0/0xe

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
