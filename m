Return-Path: <SRS0=uc63=OT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE32C5CFFE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 20:49:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECFB720821
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 20:49:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c5M9fTHx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJUlaOMt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECFB720821
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xu0LjgZdweMzDClWopqmPufdQystoxmSJBvap4FitYU=; b=c5M9fTHx587Ss8
	vwut+Ftkey8cIUxltJWQSZM/E5fTfFuCDveHOlds+kd5kPIAij+NCgePdyEI6BXb8keNZ4oG6RVia
	h4GCkjVhpBj8QcarKemUoNJmQLtjGdzyGNCDZT5yvlUsrdPnubFOOrYg39QWewlnc/UH6c5VFUjfa
	vxp9D47TtEr9i4JLwud8NIO2u+kdBDIaTyJRYFKNSvZxnB2+JkEFSYm5FUW11yJdSV1c4Q5G4vpXe
	RKhPZbZkOmPMB+dBqB0egk9bHpjVzTbvA8nabnbl8icFUoNdliVXRYIPBEIf+ZLhFJ2jP7deUlASO
	/dU6jSsy7gyGkyf5lE8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWSU9-00023P-BL; Mon, 10 Dec 2018 20:49:01 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWSU6-0001tT-56
 for linux-riscv@lists.infradead.org; Mon, 10 Dec 2018 20:48:59 +0000
Received: by mail-ot1-x341.google.com with SMTP id 32so11773311ota.12
 for <linux-riscv@lists.infradead.org>; Mon, 10 Dec 2018 12:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DPc87t3VAq9HeDqQFIyYmKoC+eBpfSY1KnbMliRPxUc=;
 b=LJUlaOMthNwgyRFQ3YXrW0DfyuoUQ6Z5c6TJBjWF3oJGio/ZIXs8G1U3ehUNcSoYMI
 TwsgJeW/74KXgUyYO//HJRkQ2bgH2df+E2CyoCTJR0S97k8ZE6lUApXBiXXP0tBd08fm
 kU4FISgFljCPislmFGJXbkAEr/2kBl6FBuJ26kKEaPDw/yn1KGN9MCOlGvkagF0kWGZH
 XpV0fsA6n5gaHYO+lZHYBs4z9MTL7fkxcNHw91XG4yLnqvBx3T92KsiJsOxA4h9E8DbB
 ezIRgbBi/NL9CKwOXqG5jtxbGSViv+tqy6VilPGrMRvN4yF1cOfvVstB+mtig4JtO0gw
 +gkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DPc87t3VAq9HeDqQFIyYmKoC+eBpfSY1KnbMliRPxUc=;
 b=pLzseegfDV5QBrz3OaeOnFGJONdb6voVfY7IsFOGxsP/rRpFkUYX1Mqyq1zE9hGNl9
 CAtqqkKOJJJ7+3JOwbb03pZ4fVu63hWmT3vb4sUqoh561ioyn6DujaL6e0/W7UMxcJWf
 0t3H2vNu2xefbr8RbHf0JVVrlQoeWZTUbYxMK+2flL5PLn1u0DkZik/haKTViUqMujXp
 Dp/S6jVfk7PcWDyDTUHaJurQmastKq0bYw34qkbKJFUiNjANfHIgNfhHv0TKUXkU81wj
 8CHh/CAGtq+Aedengw9dN5B2gxI89JmrcYY1srpFN79KQw/C+/PEHW+aEaw0dJEHR0Xc
 fKzg==
X-Gm-Message-State: AA+aEWbv9NFlsassqhBfoiqiH1HiaZuyrTK6xbAbR3UKX8OMDPTe7F6z
 PQ+S8EgJCFd7CjvXul7wODaDe4Oi5uQrfzzGr1Q=
X-Google-Smtp-Source: AFSGD/Vo16M2jBUU/VJotaDnyAqtNMwCm54MuXbPbCEVpLZY9cpVChUcx9Y00mYA03M4WlZAqI4BYlBXv7HoaMDJMO0=
X-Received: by 2002:a9d:dc3:: with SMTP id 61mr9457508ots.345.1544474927093;
 Mon, 10 Dec 2018 12:48:47 -0800 (PST)
MIME-Version: 1.0
References: <20181206152635.1869-1-david.abdurachmanov@gmail.com>
 <mhng-49f84968-18a7-4acb-b41a-f056d1ee7034@palmer-si-x1c4>
In-Reply-To: <mhng-49f84968-18a7-4acb-b41a-f056d1ee7034@palmer-si-x1c4>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Mon, 10 Dec 2018 21:48:36 +0100
Message-ID: <CAEn-LTqP70BXjVGosw1KFTP1gSaTdji3174Hc3skZA2chdJXgA@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: enable syscalls tracepoints
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_124858_193711_73DA7C21 
X-CRM114-Status: GOOD (  12.67  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 7, 2018 at 9:32 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Thu, 06 Dec 2018 07:26:33 PST (-0800), david.abdurachmanov@gmail.com wrote:
> > Depends on audit patch:
> > http://lists.infradead.org/pipermail/linux-riscv/2018-October/001931.html
> >
> > audit patch is already merged into linux-next.
> >
> > This simply fixes compilation error in do_syscall_trace_exit() and
> > enables syscalls tracepoints.
> >
> > David Abdurachmanov (2):
> >   riscv: fix trace_sys_exit hook
> >   riscv: add HAVE_SYSCALL_TRACEPOINTS to Kconfig
> >
> >  arch/riscv/Kconfig         | 1 +
> >  arch/riscv/kernel/ptrace.c | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
>
> I've attempted to add this on top of next-audit, which I've merged into
> for-next.  Let me know if something went wrong.

Two things:
- The order of commits are wrong. Right now the commits are in
  reverse order, i.e. audit patches are on top.
- Intel kbuild test bot found compilation errors with riscv-allmodconfig
  config. I fixed those and posted two patches:
  http://lists.infradead.org/pipermail/linux-riscv/2018-December/002508.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
