Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE78C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 01:08:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E24E208E7
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 01:08:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i9ajiyA8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E24E208E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvboc6Eju+UYg2UPGKgicH+yyK3+nRx8lnzqs7phI5I=; b=i9ajiyA88LG6gV
	vfOoXFSUilxlRY8MLLC30E55WnxO2QmvyUEVx05b2shOXjWzV2teSjOe8X3dnKbuJrP78hKINW+WF
	EfuLvs5/v80yRAwnIA8jj1WzjclEujPn1B/SXoh063wm0uM8o9jvjuTVvlCx3ZNGjbBmIXtxdf/IT
	6jNNrnyNj9Te0u3R9NaeB0nrQtz5UXJysz8kyv0dKXhSRi9TNsJ3ganh23PAJUjW34g2x30Q0yXe4
	cZFgf/xnYi9YJa32wxGy7VWsUGXHLXhSz7n1vT3qUsvOnrAyoIZNWy4dqvuToA0LH0TqnOlJUtLei
	oT+BbkE5RH/FkyCoaG5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gV4cj-0001kt-3P; Fri, 07 Dec 2018 01:08:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gV4cX-0001co-FW
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 01:08:01 +0000
Received: from vmware.local.home (unknown [208.91.3.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 788DB208E7;
 Fri,  7 Dec 2018 01:07:46 +0000 (UTC)
Date: Thu, 6 Dec 2018 20:07:43 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] riscv: remove unused variable in ftrace
Message-ID: <20181206200743.0f951d19@vmware.local.home>
In-Reply-To: <CAOesGMiT2OpN9VFaeST5tBW=epkknRUcrQtVLrpeR-GpRCr34w@mail.gmail.com>
References: <20181206102626.2557-1-david.abdurachmanov@gmail.com>
 <CAOesGMiT2OpN9VFaeST5tBW=epkknRUcrQtVLrpeR-GpRCr34w@mail.gmail.com>
X-Mailer: Claws Mail 3.15.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_170757_534385_F7B1E046 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 6 Dec 2018 11:20:31 -0800
Olof Johansson <olof@lixom.net> wrote:

> On Thu, Dec 6, 2018 at 2:26 AM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
> >
> > Noticed while building kernel-4.20.0-0.rc5.git2.1.fc30 for
> > Fedora 30/RISCV.
> >
> > [..]
> > BUILDSTDERR: arch/riscv/kernel/ftrace.c: In function 'prepare_ftrace_return':
> > BUILDSTDERR: arch/riscv/kernel/ftrace.c:135:6: warning: unused variable 'err' [-Wunused-variable]
> > BUILDSTDERR:   int err;
> > BUILDSTDERR:       ^~~

Bah. I could have sworn I checked for all the error messages when I did
my cross-compiling of the architectures. I fixed this issue in other
places, not sure how I missed riscv.

Thanks for fixing it.

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

 
> > [..]
> >
> > Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>  
> 
> Please add a:
> Fixes: e949b6db51dc1 ("riscv/function_graph: Simplify with
> function_graph_enter()")
> Reviewed-by: Olof Johansson <olof@lixom.net>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
