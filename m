Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCB5C63777
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 08:18:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B982920BED
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 08:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B982920BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uwzOSxFDxr96qO8nb25Hp1NYxZZfrp5uEBZrD2R5Hck=; b=U0Ww41BuegTV5siyZnRUtPiLY
	+X4SnOmZkREqq0GnXFckdZ3+zQ01ZnGaHghtLm0f1mmz3ZkGkYK53qeFTKRgsH5dmtox0WeC9LfWg
	Z4DFy8FSimePwPMLHBNbh/UemhAga5UNKKyUExo48B4Xo7ORjik6tGk3Jm9rZ6L9xR6SQxC0r2hJ6
	8Tf4Yads7WoDwxKtL0missuMbyjipQEdHYoKtcE2RuYEimLsD1NZw1BPhV4l3NiFUVwrHvPUZJgyj
	NoTEhyBX4ZZdvCw3ieJr+kCisZKxiJWiI2Oq2BE2tUzLJ+vDoArapMGNtQdXlb321z0Iqsss2nD6k
	DtjL2Z0VQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkjoe-0002o2-J5; Thu, 03 Dec 2020 08:18:16 +0000
Received: from atcsqr.andestech.com ([60.248.187.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkjoc-0002na-6w
 for linux-riscv@lists.infradead.org; Thu, 03 Dec 2020 08:18:15 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 0B38HD2t016615;
 Thu, 3 Dec 2020 16:17:13 +0800 (GMT-8)
 (envelope-from tesheng@andestech.com)
Received: from atcfdc88 (10.0.15.120) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Dec 2020 16:17:00 +0800
Date: Thu, 3 Dec 2020 16:16:55 +0800
From: Eric Lin <tesheng@andestech.com>
To: Pekka Enberg <penberg@gmail.com>
Subject: Re: [PATCH v2 0/2] Let illegal access to user-space memory die
Message-ID: <20201203081655.GB25276@atcfdc88>
References: <20201203064826.30832-1-tesheng@andestech.com>
 <CAOJsxLHo6-6w9M3H1UP1hPX1bnxZ06tqbnc9cwR5_sLQBgA7HA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOJsxLHo6-6w9M3H1UP1hPX1bnxZ06tqbnc9cwR5_sLQBgA7HA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 0B38HD2t016615
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_031814_638557_CE964B7B 
X-CRM114-Status: GOOD (  12.20  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>,
 Peter Xu <peterx@redhat.com>, Christoph Hellwig <hch@infradead.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michel Lespinasse <walken@google.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 03, 2020 at 03:29:57PM +0800, Pekka Enberg wrote:

Hi Pekka, 

> Hi Eric,
> 
> On Thu, Dec 3, 2020 at 8:51 AM Eric Lin <tesheng@andestech.com> wrote:
> >
> > Accesses to user-space memory without calling uaccess routine
> > leads to hanging in page fault handler. Like arm64, we let it
> > die earlier in page fault handler.
> >
> > Changes in v2:
> >     -Add a die_kernel_fault() helper
> >     -Split one long line code into two
> 
> Please also make no_context() use the new helper. Other than that:
> 

OK, I'll make no_context() use the new helper in v3.
Thanks for your review.

> Reviewed-by: Pekka Enberg <penberg@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
