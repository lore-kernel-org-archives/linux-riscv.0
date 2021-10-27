Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE966C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 00:31:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B0C96103B
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 00:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B0C96103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=as6ktsjGQI3tGrqv99AMLJdue2eF+L6+ffeT/fN1Lhk=; b=yilpaI7A47cK9p
	vBErseyq/cEcK+uNVy7heVsNzPu4SMYq2EbPgDmf8HVuVEWZsww+RQo3cuvKlbHStpf3nnZDPouaG
	hiIbwqjdHdKDnkWvjRMLCLqEaHai5FLbHsoGHI/QNGJ7LZHgm8LBZqGLNM6vlNMnZnZHbm+mVFAme
	rkjETAi5hvGZ/kC9F89ujpdA+GmQolfUUrrETiZ2rA5a8qBkVKUv5iFqP1mgF8xFpICc2EWuqoaBc
	ly48q1l5jm/WV0IAyAQm/mHWu+IKlhQ+JXkPH2LJFLTt1ryzf5e0+lPiXza/c0T42iiU/cxGYseTd
	AOSFiZEr9SMU89p6SXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfWqM-003OZj-Qf; Wed, 27 Oct 2021 00:31:02 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfWqI-003OYT-Ea
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 00:31:00 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.21])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1mfWqC-0004xX-Dx
 for <linux-riscv@lists.infradead.org> ; Wed, 27 Oct 2021 01:30:52 +0100
To: linux-riscv <linux-riscv@lists.infradead.org>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: OOPS in PLIC on SiFive Unmatched board
Organization: Codethink Limited.
Message-ID: <42a40844-0fce-3d47-d37d-512383488895@codethink.co.uk>
Date: Wed, 27 Oct 2021 01:30:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_173058_556382_E1014236 
X-CRM114-Status: GOOD (  10.79  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I wonder if anyone is seeing the same issue. The plic driver is oopsing
when the OF firmware code is going through the pcie node and trying to
map and allocate the interrupts.

The issue seems to be the fdt either being corrupted by uboot or the
kernel during load. When dumped post kernel starting (having made a
invalid irq check in plic, the following is seen in the diffs:

<             interrupts = <0x00000038 0x00000039 0x0000003a 0x0000003b 
0x0000003c 0x0000003d 0x0000003e 0x0000003f 0x00000040>;
---
 >             interrupts = <0x00000038 0x00000039 0x0000003a 0x0000003b 
0x0000003c 0x03000000 0x0000003e 0x0000003f 0x00000040>;

The loaded dtb has irq 0x3d replaced with 0x03000000.

I'm not sure what's going on here, I upgraded uboot to  2021.07 and it 
boots the yocto image that was used to build it.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
