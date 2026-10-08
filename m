Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D27CA6004
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 02:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLsUmlctpi/AB5n4h9zxVWS57EvY7d4rlqDAeSSfl28=; b=huN61k9uvCLq9q
	tc36Oq1or1PVGqGyTd49VR2fssqZf2GOD3BDB0hkIlvUiKtpbdTmItW0nHYS7UyAyPF8yoHS2epuI
	gPlkXEAmsyCIjVUksILpfEK96nZ5LU8yU/qXo1zSfUwfJiLlIaRe52Tyjrwq985u4msH5ZLzmK2Wd
	KnPzMaCycZ8/PMVBeIl75WZuDKZ9SHprRjVb1dP9j1O7U3yiGj6yK3c7YZzHHWu4hDcvP+o8f3ejw
	Ors5hXFvdgggWdDHPg+L0O2MagMfmBwvxTnjQgfY3RccVBy7TASc+7fCxSA3LFnE2f21lm0VFQxVV
	D5jfXyYWQ5AbY6Nvvhgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEdZw-00000003NuU-2ngt;
	Thu, 08 Oct 2026 02:09:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEdZv-00000003NuO-49Ky
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 02:09:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1501A60261;
	Thu,  8 Oct 2026 02:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6819D1F00893;
	Thu,  8 Oct 2026 02:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791425390;
	bh=sLZyJKiCSgxjVKXmv5xWwSa29qLHX+rbfn8RwKh9OKQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Az2xhmjJyJZfE4l8JmlfOryuNV+QPUSMgj5lJ5f6iWfOfS4FfugxHC/1T5XdwnqqN
	 8dduWHK9rWqQDfgPbffN+kW0JU7FqgT47QZ3tG+Hux2uJXfEobCP+is5sXu10UR99Z
	 URmf+7fN+GaWQd1KlADB+sgnOwi3QDFogUDGuU04W/7e/x2YNljXpx4pzvLR/9kKPs
	 fD1mJzqGTzhin/B9RXG1QSVNiQOIHsAPTyZUMgDYBhfZdVCT7LYd/kqkk2BbgSdtQ0
	 uFlZesmSbamLTgS0IoP9eDrlmDjlzBwjTm9aQxlokj24o2sSFZ1QSmQNjL27f/K6bb
	 ewzpFgEmf/4gw==
Date: Wed, 7 Oct 2026 20:09:45 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Anthony Iliopoulos <ailiop@suse.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: remove unused profile.h includes
In-Reply-To: <20260820131309.14014-1-ailiop@suse.com>
Message-ID: <003df670-51e6-19d3-630c-8eb27c2ac95d@kernel.org>
References: <20260820131309.14014-1-ailiop@suse.com>
MIME-Version: 1.0
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

On Thu, 20 Aug 2026, Anthony Iliopoulos wrote:

> None of the code in these files uses declarations provided by profile.h.
> Remove the unnecessary header includes across the various files to clean
> up dependencies and reduce include bloat.
> 
> Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>

Thanks, queued for v7.4.


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
