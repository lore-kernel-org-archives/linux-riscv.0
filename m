Return-Path: <SRS0=TqGV=WQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC6AC3A589
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2019 22:18:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 223872087E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2019 22:18:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tzrDODEy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 223872087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJKlNmUT6Z9u4kno2ti5uw2CbvttuOq4g44LCgy8LPM=; b=tzrDODEy6drxfd
	NN0Um0prdFzh6M73KYaAt173OxQiX3CzDc8hMDBbEk0nTThff7dJv072syBUwxL7bCR7xNXg+DNI/
	W95CXUsAF5Q6XNcw83OmRVeCf4L/nT+i2K0b1jecXl7FxgFwCWxMi7/pGvewt9rs/3Hbnze4oVOBL
	39jOwQJHDmh2xsYETpeunQWn0nK7inHMV73nEpEwdN+5GncOMiwSU4rCNGuDZnX0JvBUgkHcTwWWL
	WPTLpeeNDDcLFOT5DQvio1EP5oLcI6cOkNP0u4R2BlJL0SvASvYrR6Gmc970NVn5/ogiHBP6ODA92
	TpbCcdd1RkxTipraw0LQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0CSD-0000ru-6a; Tue, 20 Aug 2019 22:18:13 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1i0CSB-0000rW-Q6; Tue, 20 Aug 2019 22:18:11 +0000
Date: Tue, 20 Aug 2019 15:18:11 -0700
From: "hch@infradead.org" <hch@infradead.org>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [v2 PATCH] RISC-V: Optimize tlb flush path.
Message-ID: <20190820221811.GA2256@infradead.org>
References: <20190820004735.18518-1-atish.patra@wdc.com>
 <mvmh86cl1o3.fsf@linux-m68k.org>
 <b2510462b55ffd93dba0c1b7cc28f9eef3089b50.camel@wdc.com>
 <20190820092207.GA26271@infradead.org>
 <76467815b464709f4c899444c957d921ebac87db.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <76467815b464709f4c899444c957d921ebac87db.camel@wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "schwab@linux-m68k.org" <schwab@linux-m68k.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "allison@lohutok.net" <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 20, 2019 at 08:28:36PM +0000, Atish Patra wrote:
> > http://git.infradead.org/users/hch/riscv.git/commitdiff/ea4067ae61e20fcfcf46a6f6bd1cc25710ce3afe
> 
> This does seem a lot cleaner to me. We can reuse some of the code for
> this patch as well. Based on NATIVE_CLINT configuration, it will send
> an IPI or SBI call.
> 
> I can rebase my patch on top of yours and I can send it together or you
> can include in your series.
> 
> Let me know your preference.

I think the native clint for S-mode will need more discussion, so you
should not wait for it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
