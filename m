Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA1EC43460
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 16:55:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0F1D61284
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 16:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0F1D61284
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kSL6e+Xi2PeVDqp9uKwQD3LTRw8lR6URrTdRRwShkQQ=; b=GwvE+Hftts+j1S4zZ7wOebk05
	C/TcOPI/roQ/dKT9tIpAyl0qUjLLZ+BN3TqOpuJpSPhNfb13x5Wj8VCC2N1LGPkvS6Ptx912VdPSj
	1qrOx4s13oGY0MZP2mULCtgE8snF8DwjjKE6DsCtbRsYP9oTsCGhET0/LFB7VB8CsFfJm6KVlpexY
	lmcRjSiSChRhUDbaGKN+dRliO5jSoXc0fa3nhIiNrzT6UOGv/88mGU7hMH/3/znO0DEfZ2y1KW0nN
	4i4YZZfGM9fSIEdfSQYgJoWMGJSiNz4A/3Id1G0UgY9RKgp4lB/SRdPg+wpdjE+C8uNK1S/BIs3Fu
	mMKrpFdAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUBS7-005W2Q-4T; Wed, 07 Apr 2021 16:54:51 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lUBS5-005W26-Ah; Wed, 07 Apr 2021 16:54:49 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A8A5C3001FB;
 Wed,  7 Apr 2021 18:54:46 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 867582BC07BA6; Wed,  7 Apr 2021 18:54:46 +0200 (CEST)
Date: Wed, 7 Apr 2021 18:54:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Guo Ren <guoren@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <YG3j1j/MNCszy12w@hirez.programming.kicks-ass.net>
References: <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTS4jexKsSiXBY=5rz53LjcLUZ1K4pxjYJDVQCWx_8JTuA@mail.gmail.com>
 <YGwKpmPkn5xIxIyx@hirez.programming.kicks-ass.net>
 <20210407094224.GA3393992@infradead.org>
 <CAHB2gtROGuoNzv5f9QrhWX=3ZtZmUM=SAjYhKqP7dTiTTQwkqA@mail.gmail.com>
 <YG3VRIUjjaK+pfES@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YG3VRIUjjaK+pfES@hirez.programming.kicks-ass.net>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 07, 2021 at 05:52:36PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 07, 2021 at 04:29:12PM +0200, Christoph M=FCllner wrote:
> > The comparison with sparc64 is not applicable, as sparc64 does not
> > have LL/SC instructions.
> =

> Sparc64 has CAS, without hardware fwd progress. It has to do software
> backoff for failed CAS in order to do software fwd progress.

Again, the longer answer is that this applies identically to LL/SC and
I'm sure we actually have (or had) an architecture in tree that did just
that. I just cannot remember which architecture that was.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
