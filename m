Return-Path: <SRS0=ZoRk=QE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D78AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 23:17:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E8E661B9F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 23:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E8E661B9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKVzb5NRj2WzDPhwwxfFtlewB8bWqCCqq+1j8tHhneU=; b=3fCLYga+epQKtz
	ma0uxCL1ggBBpWHIrXYWgESrrndlhgoGyRxnI9EHco4qJ3RQwEhbq9uGnV0TxU/7DtOir3q9YrrFY
	EANthFzy9Ty02sruLjzVFYifagJEBcTOLE9V7M/aNzx0UDjukBzAkW3AphZiDRVCFNATNyKbxDpSb
	wY3UH/dTnHtbVQ9sOOHmNMTJjHXf7AP8nKzS/nZpYIEw3N6f6YqDO1E0zznZKrxBs9a7xsLMlTLau
	9v6uvtNzJUOMDfASAWF1XNZ6NaZNjn2jwNBq/fg5Od4Hq8QGWpiigdjDVdV7sVyiQIXVfeGvsKS04
	m62QbJ5PnzcPEgOE+zvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnUBF-006YMw-Ut; Wed, 17 Nov 2021 23:17:29 +0000
Received: from smtprelay0226.hostedemail.com ([216.40.44.226]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnUBC-006YMe-Dz
 for linux-riscv@lists.infradead.org; Wed, 17 Nov 2021 23:17:28 +0000
Received: from omf03.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 5E0CA837F253;
 Wed, 17 Nov 2021 23:17:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf03.hostedemail.com (Postfix) with ESMTPA id 49AB3900065E; 
 Wed, 17 Nov 2021 23:17:16 +0000 (UTC)
Message-ID: <dd3b7e0a1b71ab669fc1c0df434bf49eb3dce976.camel@perches.com>
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Sort sections with
 parse-maintainers.pl help
From: Joe Perches <joe@perches.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 llvm@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Linus
 Torvalds <torvalds@linux-foundation.org>
Date: Wed, 17 Nov 2021 15:17:18 -0800
In-Reply-To: <20211117190553.36144-1-andriy.shevchenko@linux.intel.com>
References: <20211117190553.36144-1-andriy.shevchenko@linux.intel.com>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 49AB3900065E
X-Stat-Signature: n9bupe7doqj5hygd79w1p9qt1qrjrf6s
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+rro6zIGaj4O46vOHsG7C1p1dc+9K9qn0=
X-HE-Tag: 1637191036-854386
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_151726_584495_FD6E8C74 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 2021-11-17 at 21:05 +0200, Andy Shevchenko wrote:
> Sort sections with parse-maintainers.pl help since quite a few
> got unsorted from the previous run.

If this is done, I think adding --order to the command line would be better.

For next-20211117 this gives

$ ./scripts/parse-maintainers.pl --input=MAINTAINERS --output=MAINTAINERS --order
$ git diff --stat MAINTAINERS
 MAINTAINERS | 826 +++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------------
 1 file changed, 413 insertions(+), 413 deletions(-)



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
