Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2B6C433F4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 07:10:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EE522076D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 07:10:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oqNs+Gkp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EE522076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=68hMJNCAgamp9SIRVoZ3y9geS4/0gy8w3MwkMPjabWI=; b=oqNs+Gkpv7+a72dwCjMzk34eN
	jGbbJEGD1AhoQR8wjPrVAcKp1CI8p5tCJ5N++wW+emOiNKyp5Snoe1gJvU2mFFYpcu/SEW3QaPg60
	Di36aEGPZeH14SQDz16pqFAyLkVYxP/6jTD6zbO9DVwXiq+ngYTlBMBTa0vvCcwEhfq0m2Xdw3bhM
	Ya94Rmfd5o9PZQ4v15aPvCfkUuhOSI1kDJGTcy7kZSm5GTt6uuF9awAKZgPJSCUAcVoPw3H6/qI5u
	u7zOgs7t/5Dnn/SRFJDOrtMhZtnKPgevbBjB188Xrfkv6mMu0PlNkV72s+UoNl2jEVbz/Q/iIRQGc
	D+jKtAOHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvF4j-0001p3-86; Tue, 14 Jul 2020 07:10:01 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvF4h-0001oB-CS
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 07:10:00 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id C6A0468CFE; Tue, 14 Jul 2020 09:09:55 +0200 (CEST)
Date: Tue, 14 Jul 2020 09:09:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: clean up address limit helpers
Message-ID: <20200714070955.GB776@lst.de>
References: <20200710135706.537715-1-hch@lst.de>
 <CAHk-=wjGjwtgYJvLOd5aO2dWyPsC-6ED2Hthoxm1Eerf-Ahd-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wjGjwtgYJvLOd5aO2dWyPsC-6ED2Hthoxm1Eerf-Ahd-w@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_030959_628485_B9EDE43C 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 10, 2020 at 08:25:35AM -0700, Linus Torvalds wrote:
> On Fri, Jul 10, 2020 at 6:57 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > in preparation for eventually phasing out direct use of set_fs(), this
> > series removes the segment_eq() arch helper that is only used to
> > implement or duplicate the uaccess_kernel() API, and then adds
> > descriptive helpers to force the kernel address limit.
> 
> Ack. All the patches looked like no-ops to me, but with better naming
> and clarity.

Is that a formal Acked-by?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
