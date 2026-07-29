Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E810C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 18:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4/wykUj4TaPKhIWya3LfHunjdDnlqc4w3jToo6ucE4=; b=T3jaVlLnnZldd/
	FyfrAoQzCqIrdyAq07hQEpRMyFACBzXQlcwioGrKwuW67DSgnxEAPCzW4V1JIjuPeYwPBYgAmM8bi
	LYHrtbgUQmgyQVUTixK86vziAs8F2YsgB2Xztju6czOT9VN7OEE+EHMj/senv+CztqnEn9W3MA3fd
	OZ8H0U4kOe+HBQ84JrWOEfqnYEpBksIky1NHXEGjZcX0NZlTXL1/mLF1a5vOHq0+kq9eT3799SFRn
	7dMljXCUZVh5EccE/TQSRK9cry9mH1dwwx+GQsAMcGefZQWtblfNumy8qnaP+wG+NH8tZFjBzUQUO
	RRJ5m5sQjvhe9+p1xxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9Fe-00000008q2m-1T4O;
	Wed, 29 Jul 2026 18:43:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9Fd-00000008q2W-1wny
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 18:43:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 667F26001D;
	Wed, 29 Jul 2026 18:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE8B1F000E9;
	Wed, 29 Jul 2026 18:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785350612;
	bh=5MZ+MEFcKu7kaYFwhvg67goeUgTheL9pRSYEfNWMhMw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=UAsMJGVkeK5f7kgHvY60kloSZJ5ZacS/489PV/0/I8tDeMzIvJ3SWuS605NbXscee
	 Rt8NWl0YzONWGBWMm2ZQiJAA3yLYjCGdbL/eiP0BFYTRKBiPU9/swKYlJDG7Dm5D2S
	 HAMz/f/e+xwaRZoulQqgtBwT5EJHh10lbvSOpATwlvXOZZidgT2CxANkMzP37ciN79
	 Wl3bApMznk942OmUtbZCoDZNHC1V4pKwo2SbNLZjF6iKcJcfA+v/jGH9D7UIskAc+d
	 r29o+lZQSrFxA54vE5vVcWvutm90cu/r1Rq1gK/Z81qlkg/xvQsU2l29yQhlHH/wvP
	 LVD8yL05OcP/w==
Date: Wed, 29 Jul 2026 12:43:30 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Paul Sherman <shermanpauldylan@gmail.com>
cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    hchauhan@ventanamicro.com, apatel@ventanamicro.com, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: sbi: fix errno mapping for SBI_ERR_ALREADY_*
 error codes
In-Reply-To: <20260727221508.5179-1-shermanpauldylan@gmail.com>
Message-ID: <8760a4fc-fde1-85be-174d-dc6dc6012265@kernel.org>
References: <20260727221508.5179-1-shermanpauldylan@gmail.com>
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

Hi,

On Mon, 27 Jul 2026, Paul Sherman wrote:

> SBI error codes SBI_ERR_ALREADY_AVAILABLE (-6), SBI_ERR_ALREADY_STARTED
> (-7), and SBI_ERR_ALREADY_STOPPED (-8) have no explicit case in
> sbi_err_map_linux_errno() and fall through to the default branch,
> returning -ENOTSUPP (-524).
> 
> Map these three codes to -EALREADY, which correctly reflects their
> semantics: the requested operation was not performed because the target
> is already in the desired state.

It looks like -EALREADY is defined as "connection already in progress," 
which doesn't quite map to the meaning of these errors, here.

https://en.cppreference.com/cpp/error/errno_macros

Does this patch fix anything or change any behavior?

> Also add a documentation comment enumerating all SBI error codes and
> their Linux errno mappings, making the translation table self-documenting
> and making any future omissions immediately visible.

I don't think the comment is a good idea; it creates one more artifact 
that can get out of sync with the code.  We'd just expect people to read 
the code, I think.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
