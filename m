Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180B3C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 17:14:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA8B721900
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 17:14:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OcrcqO5Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IuhoI3hZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA8B721900
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOM5uGdSngDDgHm62DaUZkgZIvf1agcd/izo+oyzpOc=; b=OcrcqO5QUe+0hv
	TTyfDazQKgHrjUAly+9RhJVMOvWQSxrXuFYCPZ5ZNb+JfjHVYSiRrN9KkzawQdxz7IDbqoW41NweQ
	WMZBc+fS7mk4h07z+juF5oAl4em414s+/ZEO4/PQ452iVjIpf3sCX8ychhYuT6k2H3x1T+Tb+wbpU
	+0mk+rSCA75s+Z5RAlflBnxoSmHV03YLQZ14Kh29pfR6oU37NddoCdqCZBwlWncS4VoN/gPzGtqEU
	Npot7fgT//xeanrTIJbotrLhfa1eeVOIOizYAHgUY6zsC7hUFoE4KuF3OiB4JAQIdYLt8NHZ+p84h
	1zhbdaFsBcfnxxRET+IA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7Nkg-0000DZ-Ju; Fri, 22 Mar 2019 17:14:42 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7Nkc-0000Cm-83
 for linux-riscv@lists.infradead.org; Fri, 22 Mar 2019 17:14:40 +0000
Received: by mail-lj1-x241.google.com with SMTP id l7so2683098ljg.6
 for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2019 10:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=syf5FC/PD4cN6FgIJM2ms3RJG343jtrhSP64Oe75Sac=;
 b=IuhoI3hZaIxE4YvOC0/zFIRPXbZPqr4mch9fB87bJI50v/CesoGw5jPm0Ymj36S+8D
 SIzDojt4m/q1uwaK9P5Is2rLt7NY0cQwo3oRCrDKYwFF22+ZwEkj5rWc3XCpMkx/lh21
 i/oyaRFuahvewUzvmGuDcKpmqMK2Pff6AsG6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=syf5FC/PD4cN6FgIJM2ms3RJG343jtrhSP64Oe75Sac=;
 b=Tj1PLm4QzCVD0b2FX2ehOlUOgh6NHU8Gc+Iu7cnPWgWdIBBEZouhYQJCEUlCfZzQzk
 tGsxmW42FuKrjcXPX+MnM1QZAsKZirx4tcHnppBawVRYSMaJeBJzoLFYUJ8cQQnVhflL
 eiB/utKzxLTQvat/Zn4sKZ0WN/Ou4qy9+Hr2sO1PCPkjI+oJYSGXRgGmXDLR9YYeZgOD
 SUe+Yb6JhLDYwiT3aGSRQ9ULer5HODRGZTNE6zpL20zVtx/5Czzpg5/5tsFPR3XQMnKx
 /ss976k3iVbvju/Tz5rHxurpjzH0OTeCJKYv9c2nYrZ1Oiw2SgF1XF9O4C0TQRtdXcDk
 leqQ==
X-Gm-Message-State: APjAAAU2ZuZjAwWOe/gitKY6Qn0TYW70ZxZjCkmSqM1MdpWCW6sA9/4k
 2+XUpIip6Jgtz1+jrNsFElnFre+fyXU=
X-Google-Smtp-Source: APXvYqxMi9MRvGJfWmje8IkELYp2Pogh7unXjtedGZpR8sVlKhy8pTKwQrWtk8RHaTkRGjRFlN6xwA==
X-Received: by 2002:a2e:9e0b:: with SMTP id e11mr5657878ljk.4.1553274875865;
 Fri, 22 Mar 2019 10:14:35 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id d17sm1746084ljl.89.2019.03.22.10.14.35
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Mar 2019 10:14:35 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id r24so1637593ljg.3
 for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2019 10:14:35 -0700 (PDT)
X-Received: by 2002:a2e:86ca:: with SMTP id n10mr5880284ljj.135.1553274524897; 
 Fri, 22 Mar 2019 10:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190322143008.21313-1-longman@redhat.com>
 <20190322143008.21313-4-longman@redhat.com>
In-Reply-To: <20190322143008.21313-4-longman@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 Mar 2019 10:08:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi0wwmY-waC1-2SmBz4-XK-Eru2RTx6PrGzUK=P1nwexQ@mail.gmail.com>
Message-ID: <CAHk-=wi0wwmY-waC1-2SmBz4-XK-Eru2RTx6PrGzUK=P1nwexQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] locking/rwsem: Optimize down_read_trylock()
To: Waiman Long <longman@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_101438_283552_C6C4E89F 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>,
 linux-mips@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 Davidlohr Bueso <dave@stgolabs.net>, linux-c6x-dev@linux-c6x.org,
 linux-hexagon@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-um@lists.infradead.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-alpha@vger.kernel.org" <linux-arm-kernel@lists.infradead.org>,
 linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 22, 2019 at 7:30 AM Waiman Long <longman@redhat.com> wrote:
>
> Modify __down_read_trylock() to optimize for an unlocked rwsem and make
> it generate slightly better code.

Oh, that should teach me to read all patches in the series before
starting to comment on them.

So ignore my comment on #1.

                Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
