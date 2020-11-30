Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6265FC5519F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 08:30:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D07D0206CA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 08:30:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XP92O6z0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vUaYt+r8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D07D0206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dKYSCABZovnrzw1YCafigIB/bSbPvRUwKq1NtNcwOp4=; b=XP92O6z0wFjMPMIKkMOzk53H0
	ynzdzDUxIVC7LDbuZSnYowJcCyjQ4F4oXYwrIrHVkvSH7RQAfIYfGIOVHvcMZ5U6UpahEXfvHhGO4
	lqb4vKGCEtmge7dQfC8Mf4oTuHJhFdiHXmgDTSJEQMwnYeHt5YEezEb/tX1wHH7qC6GPKdyDDdH6o
	YY+8esUBk7Tp8U5FmFwldFz/zhnVtv+qmywINDIEqrQPQOYfwyBj8GeaC/jnNxNMxwM2AHI9fOaPc
	icIKsdERwVb5oh70rE3FQnpwYEOy0eSK2WvwwJTyFqA+GB/asK+xbDAHA69sBZ5fiqnKLIH9bqMuu
	nEdNe2GCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjeZh-0001D5-7f; Mon, 30 Nov 2020 08:30:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjeZf-0001CB-8G
 for linux-riscv@merlin.infradead.org; Mon, 30 Nov 2020 08:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dlMIUuk5t9/HdJR9i9suY7in0Y/IA8FpeIUXUx4PpM0=; b=vUaYt+r8+5w20rf9SjYeqKN1AH
 qohY38w7m3qq76ehoimsy2DMTIcug4MWY3Q3ntLAYH9v0rmwLIVZK2kZEHrEcF6rOhvNrj5gd+93D
 YrsgO8punGkfvok3EZUBJqSK7/qr8Sbh3yniklPO4T4Yo+eee8jouNzbiXQBjlW07WdEsM7PvBTFj
 Yk7kSKkI/Wj1mJkhdOZZONHarMDxfrYe+nrE8OLuS2wHs5pnmjL2SR6VuzinFR8AyVfRq48cEiwHJ
 ITcQSRWzlOFfbcviQ92SIJ7NPmgotwLX4eER8NQC6iFNEwZTO/1d1yzapVYOye7Xo/ZTc4IFljsCY
 QGQGEeVg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kjeZb-0003xv-SA; Mon, 30 Nov 2020 08:30:15 +0000
Date: Mon, 30 Nov 2020 08:30:15 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Eric Lin <tesheng@andestech.com>
Subject: Re: [PATCH] riscv/mm: Prevent kernel module access user-space memory
 without uaccess routines
Message-ID: <20201130083015.GA14676@infradead.org>
References: <20201130053037.27006-1-tesheng@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130053037.27006-1-tesheng@andestech.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: aou@eecs.berkeley.edu, dslin1010@gmail.com,
 Alan Kao <alankao@andestech.com>, linux-kernel@vger.kernel.org,
 peterx@redhat.com, daniel.m.jordan@oracle.com, penberg@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, akpm@linux-foundation.org,
 walken@google.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> +	if (!user_mode(regs) && addr < TASK_SIZE && unlikely(!(regs->status & SR_SUM)))

Please avoid the overly long line.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
