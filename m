Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3CACAC5B5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 10:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7Jr88S8SRl7ZbdyRrBVWmLPKyKuBl6iGYzYipakMVU=; b=Gxby42ljIsUzKb
	wOpjRkHo9Lbjj8mNOmRfjFeTF/GicbgY0QFtrx1j2vjo3gnLG4Y+KvNzKJX/pBjZ3TGWIhtO2T+MY
	VLP+AQYMcftfmvxNBEjQVpJAT3Q2PbOiFfVWxCmJSKecdrXHfDT9jf0aAQFtFeqCmFWnsw4nnCJmy
	FiBDlv2QY3EfGWeGRrqP/boXSxfyYtFLbLYcfEtNZCnGyPzcCgnWkPAQXIK2Oxt7VwVla76mZO98a
	SMuCtZC/B6araRui19rZ5d0JpCh3P+QhNzEIDqyvlXQCf5LCeTYF9cppM85VKZD+e8LbgDISlBcaT
	gqDh5EQGTy+a6FXZYGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ayj-000000029nz-37Nd;
	Mon, 29 Sep 2025 10:19:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ayh-000000029lf-1HaM
	for linux-riscv@lists.infradead.org;
	Mon, 29 Sep 2025 10:19:32 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1759141167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=na+z28tfujvUbYZGUn5Elyo9Cu+dfw5ocKOwLyEHUIo=;
	b=13tNo2p8nc6zWD3ftjF+Dm/6rnWtaYz72CxAujFLiWRtOdHF7CfjNgDNTdS0zMymUk/qFT
	W2ho8qe98rmUe819LIUtyI+/FGjlsI29o5AjIxzh4ZigSOKdb7k8lchTQ9kh8g+1aBFtxY
	o96KFoQiaqHH76JByvV3iOqlPrYj7ZFWsQGNPXOd+BOHUF+KyIe2hc4qX58WPmPveMbud0
	mCUEj+1bPclkDzlzEffHuoBKjFLDVBIfForNaOCb+vjtYJRCsk3W34O40hWkGXAQOPnpz1
	fnnyme24yyXqIuYQqfIZJPsk6eqW+4/9EIBGpJWC5yCuTujXpp/6pGhKF2qd3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1759141167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=na+z28tfujvUbYZGUn5Elyo9Cu+dfw5ocKOwLyEHUIo=;
	b=+Syr7Wiki9tBCENI51Zw8YlRdpoNLpmUSdrdBLrUrpUoArChrosAoh4awSkFPiDT8kLCrv
	rhwrakVJ9FrBRQCA==
To: Thomas Huth <thuth@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: Add kprobes KUnit test
In-Reply-To: <87frc9h0lo.fsf@yellow.woof>
References: <20250513151631.3520793-1-namcao@linutronix.de>
 <16b74b63-f223-4f0b-b6e5-31cea5e620b4@redhat.com>
 <87frc9h0lo.fsf@yellow.woof>
Date: Mon, 29 Sep 2025 12:19:27 +0200
Message-ID: <87v7l17e8g.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_031931_497468_C1F673BF 
X-CRM114-Status: UNSURE (   8.26  )
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

Nam Cao <namcao@linutronix.de> writes:
> Thomas Huth <thuth@redhat.com> writes:
>> Could you maybe change that into "__ASSEMBLER__" instead of "__ASSEMBLY__" ? 
>> I'm currently trying to get rid of the latter in the kernel sources, see: 
>> https://lore.kernel.org/all/20250606070952.498274-1-thuth@redhat.com/
>
> It's been applied, it's up to riscv's maintainers how we should do this.
>
> I can send v3, or a follow-up patch.
>
> Or riscv maintainers can also squash that change into this patch, or
> into your patch.
>
> I'm fine with any options.

Riscv pull request is already created. A follow-up patch it is then.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
