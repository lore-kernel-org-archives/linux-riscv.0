Return-Path: <SRS0=MPT1=MN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F47C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Oct 2018 07:07:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED1382083C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Oct 2018 07:07:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L3C2PGEr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED1382083C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8o4orqw75OWE7nasonQ+p96F/w5IwuxbEa3IIyzUuYs=; b=L3C2PGErBdOaeC
	npNQUxt6y1eqxiUweW4H1N2KLk4YEzGCLlJ5DW0xFv76P/LVohH2OGyXkSiIsaNq/13sWZFtN8GNu
	miJHWKAzGK5ti03vPB06C5DdTqXXxaiHAjPWlNcR6zM4M0uIg5V59xZI2ZuOahTu6kpZNiC29sW+O
	5l4t/8N/tEYxY6fU6k27DOFhJ0THEVFufg+Dd5Y3jliPvkFf/YUUq4vOIXsd4zaQ2WMRK0tG/9WBq
	6E3119PCPMYIqI6gnjIMe0D9aX0yst6ZjCC1xcLNT1JeCQFqPcvUyHxlZ7ojygFwmxfIDnfDqCtnn
	QYqQ3svw1alV7MFTQJIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g6sIw-0008Ii-La; Mon, 01 Oct 2018 07:07:42 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6sIt-0008Hs-Ve
 for linux-riscv@lists.infradead.org; Mon, 01 Oct 2018 07:07:41 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2351CAF02;
 Mon,  1 Oct 2018 07:07:23 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: futex_atomic_cmpxchg_inatomic is missing
References: <mhng-b1474fef-9750-4bfb-be90-5e4bf4c964d4@palmer-si-x1c4>
X-Yow: .. I have a VISION! It's a RANCID double-FISHWICH on an ENRICHED BUN!!
Date: Mon, 01 Oct 2018 09:07:22 +0200
In-Reply-To: <mhng-b1474fef-9750-4bfb-be90-5e4bf4c964d4@palmer-si-x1c4>
 (Palmer Dabbelt's message of "Fri, 28 Sep 2018 19:17:17 -0700 (PDT)")
Message-ID: <mvmzhvy6t79.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181001_000740_167182_23BAEA92 
X-CRM114-Status: UNSURE (   9.54  )
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
Cc: Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181001070722.9bBOEjeOpEAidVi86PJ81tQmfeUnDBBYrndcUregwL0@z>

On Sep 28 2018, Palmer Dabbelt <palmer@sifive.com> wrote:

> Christoph published a simple Kconfig workaround a while ago to turn on the
> generic support for non-SMP systems, which might help you work around your
> issue.

What kind of workaround?  If you disable SMP this should be
automatically enabled.  But of course, being non-SMP, this is also
useless.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
