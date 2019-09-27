Return-Path: <SRS0=E2Nt=XW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB211C388F4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 22:19:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A061A217D9
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 22:19:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xxtr04nc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A061A217D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XdDUUebi/9tax979d0PDAn7gwY9MHcgZuJyHDYbbqk=; b=Xxtr04ncVp7jk7
	dyLxiPo+DD3HMgaxPQjHiagqVE7X3DON1wE8wWEKgqcsysFeycKr63YjwmHN2rQEJnpJuxLoFLj7S
	r1FUWAVnlNbh77yLrQiDKfGRxhRQIoXEv54XRQi3xMmOZunQK7xWNfBfYGwYECJYj7xE+Fzg7ZZRf
	0Tl5s/CEjWXdEjRlboSTUfh753VsbWfWSOMHOhEZjdHoONVtL+ZD6CG0rvWIazjY/ZYMTsRf1uEbr
	rjVh8HAAoWHy8YU6Rxi8oWz+iAdKNazfJtx70AIVDzK/SlZE3UyOPBdQ7XGvDI3BLJ3EeKedvqcrt
	0qGmQs4Fk+Nd1kThcBOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDyaV-0001Mz-8u; Fri, 27 Sep 2019 22:19:43 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
 Hat Linux)) id 1iDyaT-0001Ma-5y; Fri, 27 Sep 2019 22:19:41 +0000
Date: Fri, 27 Sep 2019 15:19:41 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v2 1/3] RISC-V: Mark existing SBI as 0.1 SBI.
Message-ID: <20190927221941.GB4700@infradead.org>
References: <20190927000915.31781-1-atish.patra@wdc.com>
 <20190927000915.31781-2-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927000915.31781-2-atish.patra@wdc.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Gary Guo <gary@garyguo.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 26, 2019 at 05:09:13PM -0700, Atish Patra wrote:
> -#define SBI_CALL(which, arg0, arg1, arg2, arg3) ({		\
> +#define SBI_CALL(which, arg0, arg1, arg2, arg3) ({             \

Spurious whitespace change.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
