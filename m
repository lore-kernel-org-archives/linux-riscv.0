Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27978C433DF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 02:42:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA8C220739
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 02:42:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jw3DqzOj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fl9CdV4d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA8C220739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TPX9afmtIz1QUtl94iiK/9dol5QgWTNnN8FJ8BC4474=; b=jw3DqzOjzDX2ugFd1MAcMVakB
	I1xEGzI6aBUDp1zclJ5nO+Kj/5TdKKu7TP++lMeZVXa0kDJJjhaXhawNv7Z2uL98IVCFK4pbZGJbd
	6RLkolwCKJ/8DGFjrqyebJAvXXxRfbFNYk2FmkvjksZ7iAPX30gXmxppdf1Z/Mi7G4UpfOQH8VJrs
	ceWpstAhd3VEbWDgEAUprgNHII407I2MbqS1K/aoONJ2YR+NKmeTE5VzlXBUy/H6WYlxW0PZeAPzo
	s3xss7kWKR/AqMZy2WzjEt/tKd15wK/NyM8NPojx6jAFVumSjQ/nwI34VfqsvytiUBLl0uxx1pvNY
	+kUjbEo6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsH5P-0007Gk-TU; Mon, 06 Jul 2020 02:42:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsH5N-0007GN-Oy
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 02:42:26 +0000
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4879F20759
 for <linux-riscv@lists.infradead.org>; Mon,  6 Jul 2020 02:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594003344;
 bh=CrR+Ru1vIzVxb/frbja2kDuVOq5rjlaAGt224uq0yAU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Fl9CdV4dcESwGpstxHYpUOY55lRqxa4UjOu1awhEV9wC4YxkzSvqbz5uDDY7S8ete
 HgJOZqrihBYN2wojiukP3+PUSQ06axqmUyQrE3qK8BZQ/5Vc6PFhAAs7BcKyeugNsX
 t0SdORRsf+VonJvcbYQ8vHsUaIukvTnWoWX2nxJ0=
Received: by mail-lf1-f47.google.com with SMTP id g139so21717872lfd.10
 for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2020 19:42:24 -0700 (PDT)
X-Gm-Message-State: AOAM533Fn470T/7vQRAh0tChqSlptf8769AAvODacDxXWJv0GVE+9iKF
 k9oWCnOzdI3+gSCiwG4hxKu6wUQycFiIkJBYfsU=
X-Google-Smtp-Source: ABdhPJwDZYsA/gr9T0oE6LiNRx4sZr0rPI8qgTnwq0KpGS9PhHzhuLp5VyzNULOhkK89kDCcITnySqynDS/YBCoNrjo=
X-Received: by 2002:a19:4a4e:: with SMTP id x75mr28674931lfa.70.1594003342600; 
 Sun, 05 Jul 2020 19:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <1593958397-62466-1-git-send-email-guoren@kernel.org>
 <202007051336.C9EA0ECF65@keescook>
 <CAJF2gTR5Fc1wpjr1ZYZikS=hCP9rbjJVsH9b-z2nBxbBcfBoCA@mail.gmail.com>
 <202007051820.DABE7F87D7@keescook>
In-Reply-To: <202007051820.DABE7F87D7@keescook>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 6 Jul 2020 10:42:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTr_ENhGRmjqNbGBhEc8y4D3YSqAResvwHuB1ykemKTUw@mail.gmail.com>
Message-ID: <CAJF2gTTr_ENhGRmjqNbGBhEc8y4D3YSqAResvwHuB1ykemKTUw@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: enable per-task stack canaries
To: Kees Cook <keescook@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_224225_990792_27ABC76D 
X-CRM114-Status: GOOD (  10.92  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 6, 2020 at 9:21 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Jul 06, 2020 at 09:01:51AM +0800, Guo Ren wrote:
> > Yeah! :) I just want to show you, how about the format: use tp in gpr
> > to do that. The format is similar to arm64.
> >
> > tp is the task_struct point in riscv.
>
> Sounds good to me, yes. Thanks! Is there anyone looking at the GCC and
> Clang sides of this?
My colleague is working on gcc's.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
