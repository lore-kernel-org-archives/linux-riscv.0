Return-Path: <SRS0=edRZ=VX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9803FC76190
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2019 00:55:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6236E2238C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2019 00:55:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k5DEuAyP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5uUd3Gh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6236E2238C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGhYEYhLN4bvtvFpZdq4bxAABcWjrHn5aBAVk6A1aM0=; b=k5DEuAyPtGzd8q
	8tdb98y1t+EpRFWOBHY7kukAwWxyJaEdxwJo/rWzDksm+GblgvoeQtXW9i91j8nDGF6x1H/crHXZT
	glB1zFBgqM5TkzZSsLelspuYtldIPl7eypHrx4QaBCNVQt8zCpghMONNr5hAlgmxLfK61zzwmuMiz
	cOYAvPkD5XlzHPjwnWrPjxyLgBSE5KH2JZLswbfg7JuHYvwCJVeF4SdTrfcuoZtsCLxHbdDLy0RAi
	QgCyDNGuNFrXmwg71IdlDULSo3Thu8hbQ+VEnf+oDU7g0dUmBLelTAjcgpwYkWhZXbgJa/Bic1JLE
	/EyXhaGB2sv2wJ1f2T+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqoWV-0001iA-Dn; Fri, 26 Jul 2019 00:55:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqoWG-0001W8-4V; Fri, 26 Jul 2019 00:55:37 +0000
Received: from localhost.localdomain (c-73-223-200-170.hsd1.ca.comcast.net
 [73.223.200.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC8ED2238C;
 Fri, 26 Jul 2019 00:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564102535;
 bh=o4hVED1DnXPhi52FO0wtBGwbvoqHLkWraSNdRFbEhmA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L5uUd3GhpWzXG8NZ5VAfPLAogGQnqmrSDtJ2WoGzo4kODsjexGjl2plEX8UF4CwuW
 oU0gaoBumTXP+a5Fx+/RYg+bzmTeV7Qn9p0BT20Auw6fp70moUvLzgdHDbXgB4eoWy
 x3mw2X6mVGMx2Db5jEYPWqqxyerg3w7sEzNMLtn4=
Date: Thu, 25 Jul 2019 17:55:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH REBASE v4 11/14] mips: Adjust brk randomization offset
 to fit generic version
Message-Id: <20190725175533.f9fcc5139a9575560be7f679@linux-foundation.org>
In-Reply-To: <201907251259.09E0101@keescook>
References: <20190724055850.6232-1-alex@ghiti.fr>
 <20190724055850.6232-12-alex@ghiti.fr>
 <1ba4061a-c026-3b9e-cd91-3ed3a26fce1b@ghiti.fr>
 <201907251259.09E0101@keescook>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_175536_198641_0508B145 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Burton <paul.burton@mips.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, James Hogan <jhogan@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 25 Jul 2019 13:00:33 -0700 Kees Cook <keescook@chromium.org> wrote:

> > I have just noticed that this patch is wrong, do you want me to send
> > another version of the entire series or is the following diff enough ?
> > This mistake gets fixed anyway in patch 13/14 when it gets merged with the
> > generic version.
> 
> While I can't speak for Andrew, I'd say, since you've got Paul and
> Luis's Acks to add now, I'd say go ahead and respin with the fix and the
> Acks added.

Yes please.   After attending to Paul's questions on [14/14].

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
