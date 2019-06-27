Return-Path: <SRS0=5nvY=U2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4917C48BD7
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2019 09:15:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A920E2082F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2019 09:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dofqQMYF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A920E2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2D+4H76Fj3qmFf4cyxhT2ocuaTTEolO7KwdFZUr6Wk=; b=dofqQMYFLZPWfH
	g4x82Z2CwXulm4QUapGg27Yf+CoWwdm0K6C/H1trM0k7OQPLYoWKMdWnP47CQLoCS7oIvNvxseA1T
	PIQuUy38T8yzVDVEkTxtynhrMZIJuu45+QrDfN55GZ+sbhPtRMfKqvHxpAmhxnvNvr16DuPT0z6Bi
	0ZLdaEpwexFR975pyInOxc8FJSVlhOjtJbLAVxO+KWuqMsstUyxK5D9RgAa+YDKHyD9K7NfBSvKMB
	+ZDf+6NvU70ahsJvesdajcMtPnmX5JYheEDaCVbOj04tu+pqcV8T+5WFifowrngpNC+ti+JY4aPu5
	oWjTK2Y7mWhD3NTCW+uQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgQVF-0006Jg-1V; Thu, 27 Jun 2019 09:15:37 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgQVB-0006Ij-LA
 for linux-riscv@lists.infradead.org; Thu, 27 Jun 2019 09:15:35 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7C402AC41;
 Thu, 27 Jun 2019 09:15:29 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Troy Benjegerdes <troy.benjegerdes@sifive.com>
Subject: Re: [PATCH] RISC-V: defconfig: enable MMC & SPI for RISC-V
References: <20190625225636.9288-1-atish.patra@wdc.com>
 <6D4D90AF-59F9-4523-A916-7CFAC8E43C45@sifive.com>
X-Yow: Are we THERE yet?  My MIND is a SUBMARINE!!
Date: Thu, 27 Jun 2019 11:15:28 +0200
In-Reply-To: <6D4D90AF-59F9-4523-A916-7CFAC8E43C45@sifive.com> (Troy
 Benjegerdes's message of "Tue, 25 Jun 2019 18:58:20 -0500")
Message-ID: <mvmlfxntmmn.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_021533_849456_AAEB539D 
X-CRM114-Status: UNSURE (   8.29  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Jun 25 2019, Troy Benjegerdes <troy.benjegerdes@sifive.com> wrote:

> and I see this in the log
>
> [    1.106626] m25p80 spi0.0: unrecognized JEDEC id bytes: 9d 70 19 9d 70 19

You need the patchset "mtd: spi-nor: add support for is25wp256 spi-nor
flash".

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
