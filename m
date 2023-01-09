Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F5EC5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 21:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7PijODGiS8qfby3Wv4f22yU5s1zC064esiCBS2V+uc=; b=mRarUsNg8r1hJw
	r+W1tu/1AYQhZYCawV7iFtOqkrYyNWlGtJneQzxlB/g5mQEAFSvquVL3J8x7KAB3UXKjUdXurRvO1
	hj7tWXThtbxvjnghDLbn3k+Z1e59ZYMf5HInzrzR6plctRHVqNbFlu4ZUq7Z2vkCkqPp63ITOnUE2
	3LPe2ZeV4YJAhFBk3HWI5qHoFWzznGH+3bTb1kL6k2a7gPbf2S/cO9zu6OLfPxxC5dy65TWXrqQT5
	wUTchaupKrSaBvz4HSea3YUjH5Vvc82csfmJOW9ZeSDfPjr2hWwBvgVVffVR9ebqY6pcH3ySBhZYD
	T3LxJVPLAH9z7XIveqJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF02u-004Lor-QC; Mon, 09 Jan 2023 21:51:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEzom-004GRx-50
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 21:36:34 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d15so11026664pls.6
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 13:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XQWJ6Cr4IImJL6zlxqosQINLILCXhpE6Qg/8UMNu6m4=;
        b=M9R9bE9rVQWpi71VTT8izHtCpN0eyRyeYdZK/eCdyXJtkqhTwVbhK/iVBschylObSm
         PnmzFdmE41k3PMDKxveFDOcC7/QB4cGyGIXLeR8hpJVFzIgzTzmn0DlF6kG2BccsV/kv
         UWtxlY0xHabBPyiUfwByOsz2dVez1SdUmS7tM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQWJ6Cr4IImJL6zlxqosQINLILCXhpE6Qg/8UMNu6m4=;
        b=ThUMNTjWdqcqUTOLEb1KCROeQit91sLDc4E1mwwZ4L5fec0Zn6AnBeg4mJwxGVqmQm
         korJFYJ5sX7K7oo4FlKYFWrwRFB5J7Jg0IrRWuGxjuLsyhS7azbE2jtiVOHkZWBJZKuW
         GLwRb+cs9GB2UHKAvbaMQWo4Z8xuzg7umeoTA2mO4zV2Wg86mldlrWcMQTGXKH7+1PlN
         O2Z8t/f6NADix2PgFuGCrAuDV40vSSnoz4JqTHYmm3yDXvkoXzBS6HKIE+/MXCVXFwW9
         9r03/zrmt5FvNOmV9KrRxncTTRiuXw5yMI90l8BD8jeJsVE16tcOA5Lj51DCGZAbGZ3Y
         wfRQ==
X-Gm-Message-State: AFqh2kqECS2Tne1QXfa5WNg8sUDyU4x/QYfqbdSrWfK/+fPJkoNNC9yz
	MftZT5bQfewZxHK4sdx11coiNlnQhWEKUYikop6o
X-Google-Smtp-Source: AMrXdXvWWUsWUWXZOJID137JCYPjYorrUW7Yb0R8SUea6RrsFVbpKQXNtb2bAvCBWVga2pBRkAsIUfAXCp8kbbOkedw=
X-Received: by 2002:a17:902:d645:b0:193:150e:a8ef with SMTP id
 y5-20020a170902d64500b00193150ea8efmr1222338plh.71.1673300190704; Mon, 09 Jan
 2023 13:36:30 -0800 (PST)
MIME-Version: 1.0
References: <mhng-72f383f6-a85f-4587-9fa6-f85fb9f27ec8@palmer-ri-x1c9a>
 <87359wpy9y.fsf@meer.lwn.net> <87y1rooje8.fsf@meer.lwn.net> <Y4srdBCmYJFx+ypW@spud>
In-Reply-To: <Y4srdBCmYJFx+ypW@spud>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 9 Jan 2023 13:36:19 -0800
Message-ID: <CAOnJCU+DhxcPjgftMspWAzhsms_8sXnGS++vbp1iJDB0XcOxLQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: riscv: note that counter access is part of
 the uABI
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_133632_531683_4CD7937F 
X-CRM114-Status: GOOD (  25.14  )
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

On Sat, Dec 3, 2022 at 2:57 AM Conor Dooley <conor@kernel.org> wrote:
>
> On Sat, Dec 03, 2022 at 03:45:35AM -0700, Jonathan Corbet wrote:
> > Jonathan Corbet <corbet@lwn.net> writes:
> >
> > > Palmer Dabbelt <palmer@dabbelt.com> writes:
> > >> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > >> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > >>
> > >> I think I merged the last one of these, but if the doc folks pick it up
> > >> that's fine with me.  Otherwise I'll take it when it comes back around,
> > >> so folks have time to take a look.
> > >
> > > "Doc folks" applied it, thanks. :)
> >
> > Actually, I take that back.  I'd missed this part from the patch:
> >
> > > Based on an, as yet, unsent v2 of my other uABI changes. I don't expect
> > > it to be applicable, just getting a patch into patchwork while I don't
> > > forget about this.
> >
> > ...but b4 happily picked up a couple of *other* patches from this thread
> > and applied them instead; I've now undone that.  Sorry for the noise.
>
> Huh, I accidentally put an "in-reply-to" header on this patch. I have
> been updating some of my submission helper scripts & I must have left
> the field populated from sending another set by accident:
> https://lore.kernel.org/linux-riscv/20221129144742.2935581-1-conor.dooley@microchip.com/
>

I don't see the patch upstream. Is this patch merged already ?
If not, please hold on merging this for now. We had some discussions
around this in the perf community.
Here is the thread
https://lore.kernel.org/lkml/Y7gN32eHJNyWBvVD@FVFF77S0Q05N/T/

TLDR; Even though x86 allows unrestricted access through rdpmc (not
default), it still reads zero unless a privileged root user modifies
the MSR interface exposed by the kernel.

Quoting PeterZ

"RDPMC is only useful if you read counters you own on yourself -- IOW
selfmonitoring, using the interface outlined in uapi/linux/perf_events.h
near struct perf_event_mmap_page.

Any other usage -- you get to keep the pieces."

"Anyway, given RISC-V being a very young platform, I would try really
*really* *REALLY* hard to stomp on these applications and get them to
change in order to reclaim the PMU usage."

We need to decide what's the best approach for RISC-V. The current
text in uABI will let users assume that
cycle/instret can be read without any issues which is wrong.

There are few options what we can do for RISC-V:

1. We can trap n emulate and report 0 always as suggested by Mark in
that thread.
2. Continue to allow the user to read the counters directly but
expects the garbage value depending on the other activities
on the system. Hopefully, folks will fix their application by that time.

Once we have the procfs interface, we enforce the behavior by breaking
the application.

In either case, the uABI needs to be updated accordingly.

> Apologies!
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
