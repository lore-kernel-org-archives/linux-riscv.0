Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F35C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 06:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WAqTK6BSRfo/JKDGPZ1ujoYQoUthd8W97sV8mu3QqZg=; b=U38oywsxqwFx37
	d4P6Kj28dhEW5SMdRiPFw2gUlcYbXlHVZqMtXI0Q23+HNK6+41u6sUkUVCwxrpGXd1kbqk82YTpru
	Bn96pmdMf5qV/C9A6U8Oxf+EUF+V5uGr2Kep6WOYCxB+yZ/lOjqiJCwHDKs6cbfFG3CX1OwTudXV+
	ofQ1jxC9NgYXLMuzAvoq+CruyPT6/tPs+pW+T9bYdW0bMK3Gq4nuMwsd/TF9YF2PzHzK+Kq4Y7b1X
	zVNMqnGRuQyMwXO+tUqHNTljQbGY192NrDVcjLS8d4n+cqacS6rVWJbEiZx0FETUQW2YsZkpzc1LH
	gcNlzYy/e8BQrTJCHxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncLl4-009i6v-He; Thu, 07 Apr 2022 06:36:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncLl1-009i4f-Cm
 for linux-riscv@lists.infradead.org; Thu, 07 Apr 2022 06:36:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E1EF461CDD
 for <linux-riscv@lists.infradead.org>; Thu,  7 Apr 2022 06:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDA3C385A8
 for <linux-riscv@lists.infradead.org>; Thu,  7 Apr 2022 06:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649313398;
 bh=y8Hzh6X4ov/pWCwdyVdXH8J0X9JbXxB31XioMauX8I0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gSRWIyM3zCcHxW0KEvgIQOePA23ryzGrMJh6y33avUH9lLcLrtTQbZxSylSSYUeVE
 gQWdDTSap7/UqEXOOufd5NcOPqgdymPNRdXk7dKn8L5FGrktzXbDwNt0VF0+dN7z9L
 cy6o+LnitEiQm+05Itm9yK6HOOVzirB+SWsPD1QS4g02xD2fvLXJu6pnJNznL8w4y8
 G3AF5EPP8SW3SMZKuGyFOeWEFraKTJM3h/U92wkO8GNTwwoQMlMp/s4kAinGXaLlIY
 wK//amQjSkVwz786YWzyA9xQ9hlxTrjPKBCMSRBXe36441jcNImZXJVN4bNTQOg2v/
 j5lylyQFMb16g==
Received: by mail-ua1-f48.google.com with SMTP id 63so3119256uaw.10
 for <linux-riscv@lists.infradead.org>; Wed, 06 Apr 2022 23:36:38 -0700 (PDT)
X-Gm-Message-State: AOAM533hJ5qJJm4+bYQr6/JmyRTywuUBb1rqrj9OkHtg4Wj5MBVQ0pFq
 G0Q7TDnpyvboQqEQ70E1On6rtVmc7uGQR5GGKWw=
X-Google-Smtp-Source: ABdhPJydzCgTxScgqH3neRJgDnYZjHcS9lgL73MhlBIqhRB6tjH5OZPFpm4siyD9r6yxEwjcjdMCGPb4oXGfY4egEzI=
X-Received: by 2002:a9f:2048:0:b0:352:9b4f:ac98 with SMTP id
 66-20020a9f2048000000b003529b4fac98mr3551530uam.12.1649313397262; Wed, 06 Apr
 2022 23:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <Yk3YUFfvEszb+cXT@kroah.com>
 <mhng-492e449b-ad90-4725-86a0-d5d84e4c35be@palmer-mbp2014>
In-Reply-To: <mhng-492e449b-ad90-4725-86a0-d5d84e4c35be@palmer-mbp2014>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 7 Apr 2022 14:36:26 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS_W6NyA4mhHm4fsCsbAGaEb8XN-k=Aq=SCdOEP-kuy9g@mail.gmail.com>
Message-ID: <CAJF2gTS_W6NyA4mhHm4fsCsbAGaEb8XN-k=Aq=SCdOEP-kuy9g@mail.gmail.com>
Subject: Re: [PATCH V3] riscv: patch_text: Fixup last cpu should be master
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_233639_548513_F6EBBCC6 
X-CRM114-Status: GOOD (  27.85  )
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

On Thu, Apr 7, 2022 at 3:06 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> On Wed, 06 Apr 2022 11:13:36 PDT (-0700), Greg KH wrote:
> > On Wed, Apr 06, 2022 at 10:16:49PM +0800, guoren@kernel.org wrote:
> >> From: Guo Ren <guoren@linux.alibaba.com>
> >>
> >> These patch_text implementations are using stop_machine_cpuslocked
> >> infrastructure with atomic cpu_count. The original idea: When the
> >> master CPU patch_text, the others should wait for it. But current
> >> implementation is using the first CPU as master, which couldn't
> >> guarantee the remaining CPUs are waiting. This patch changes the
> >> last CPU as the master to solve the potential risk.
> >>
> >> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >> Signed-off-by: Guo Ren <guoren@kernel.org>
> >> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> >> Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
> >> Cc: <stable@vger.kernel.org>
> >> ---
> >>  arch/riscv/kernel/patch.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > What commit id does this change fix?
>
> I think it's been there since the beginning of our text patching, so
>
> Fixes: 043cb41a85de ("riscv: introduce interfaces to patch kernel code")
Yes, it the riscv origin.

>
> seems like the best bet, but I'll go take another look before merging
> it.  That's confusing here, as I acked it, but that was for an earlier
> version that touched more than one arch so it was more ambiguous as to
> which tree it was going through (IIRC I said one of those "LMK if you
> want it through my tree, but here's an Ack in case someone else wants to
> take it" sort of things, as I usually do when it's ambiguous).
Thx for the clarification, I would remove the acked in the next version.

>
> Without a changelog, cover letter, or the other patches in the set it's
> kind of hard to tell, though ;)
Okay, I should add a changelog for the patch with cover letter.


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
