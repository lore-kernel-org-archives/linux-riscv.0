Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E49CC10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 05:49:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F320C2073F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 05:49:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ao6lNvvy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F320C2073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhRrUDNvw3+2l/vnuYASLq4MWuHDC6duPNYdwKq/WtY=; b=ao6lNvvy/8vskL
	0tktLIqUnD99P06Y+Fr84HgyddBHrty1bcqwnmxiGiXTHt/5wL3mp+C5hukMnAUA0QqUhYphssvWo
	k0Irlx4OwuSZv69yKVaqBLB1NuUBAcbMVGwYzYGckj+lHxl+eZYSZ5T0I6A68OqN1dov/GRr1zlud
	KnA4BDeo5L4PEBLDYBVBrhxw7/cYsI0QahDbt3vBmXiVVytJwqhGTs0mWNzozA2sbZP7ykIHnGvKN
	kURENpktYbF5g3rbp1m6h7VO3i/Xm7UHT9QVTmvhFD77JsuStDODcb151OfUEMJ7pWZ0uCYvFY3Rl
	TXiA/xw7qf4Sts/o9nDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFuV5-00014V-P3; Mon, 15 Apr 2019 05:49:51 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hFuV3-000149-68; Mon, 15 Apr 2019 05:49:49 +0000
Date: Sun, 14 Apr 2019 22:49:49 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v2 1/3] RISC-V: Add separate asm/encoding.h for spec
 related defines
Message-ID: <20190415054949.GA9279@infradead.org>
References: <20190413153807.116227-1-anup.patel@wdc.com>
 <20190413153807.116227-2-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190413153807.116227-2-anup.patel@wdc.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Apr 13, 2019 at 03:38:35PM +0000, Anup Patel wrote:
> It's better to have all RISC-V spec related defines in one place
> so this patch adds separate asm/encoding.h for such defines which
> can be included in assembly as well as C code.

As per the discussion of version 1 on Saturday I disagree with this
move.  There is both a philosophical and a practical reason for that:

 a) in RISC-V CSR access is really nicely split out into a separate
    number space, just accessed through a few special instructions.
    It has no overlap with the rest of instruction encoding
 b) <asm/csr.h> is pulled into just about every file build in the kernel
    though <asm/irqflags.h>, <asm/switch_to.h> and <asm/thread_info.h>

So even if you want to later add a new <asm/encoding.h> for instruction
encoding details later, I'd rather prefer to keep CSR access separate
from it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
