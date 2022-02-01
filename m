Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F11CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 09:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WJUrx+u/pxecRpDTYWtpBF72gdEBybp+31IMnqUyXs=; b=yNXiNyJdTRbpZD
	PiOjmoW2LgcCzioa5opWKMA3fu+nY/UGm3V4ZS/8kh4ee4wOPgbYgzg/3AUDMd9NpKe/9xHN79yLK
	eChAzpF/iZgo6WPuaaAPtXzuHzZpW0ORyqEWFlX0QW5Zf4Jw6qYF6AYb6g2al5vCArFr7jSXr0wJs
	coRXmYCUO0jY4vs+LDShwDFbwedi0dAEkSR0qI6CZZJm9Y8wswy8QJlJnCBq2kEuD7UIhKw5XXzZU
	CRlNYQM7LGICZWKJmlLXIN+pzWrbOahFhPww3ex/mCY5Z/oIwgGMcwNg18g8OWhqFcKQAsPihFv5X
	rCZI29+liYDryBNOEGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEpaX-00Beab-9j; Tue, 01 Feb 2022 09:36:37 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEpaM-00BeYK-5e; Tue, 01 Feb 2022 09:36:27 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MpDRv-1mRxFK1AuF-00qk3U; Tue, 01 Feb 2022 10:36:21 +0100
Received: by mail-ot1-f49.google.com with SMTP id
 i16-20020a056830011000b005a3cc8d20fbso9276636otp.9; 
 Tue, 01 Feb 2022 01:36:20 -0800 (PST)
X-Gm-Message-State: AOAM532+9wqvB9FloxdmfPLlqMoigfYwkcEZmKTkF9R7Oq44zfKN0jvG
 DIWzW18ikOVlIYISCHXmVO5TRTBw/Qtt8el/Vwg=
X-Google-Smtp-Source: ABdhPJzjYk9dm3bFjvGFwtGU979wMDH3XPeFI40ue70UVOPzI4lwptcfGFngzaOKSdB77TE70F1nIEDki5MDfbq8Q+A=
X-Received: by 2002:a9d:654f:: with SMTP id q15mr13934011otl.119.1643708178915; 
 Tue, 01 Feb 2022 01:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-17-guoren@kernel.org>
 <YffVZZg9GNcjgVdm@infradead.org>
 <CAJF2gTRXDotO1L1FMojQs6msrqvCzA782Pux8rg3AfZgA=y0ew@mail.gmail.com>
 <20220201074457.GC29119@lst.de>
 <CAJF2gTTc=zwD__zXwYbO8vmup5evWJtzyiAF9Pm-UVHLJRc5hQ@mail.gmail.com>
In-Reply-To: <CAJF2gTTc=zwD__zXwYbO8vmup5evWJtzyiAF9Pm-UVHLJRc5hQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 1 Feb 2022 10:36:01 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2C7nDGQvopYzi1fe_LWyosp8t9dcBsduYK5k_s_OrCaA@mail.gmail.com>
Message-ID: <CAK8P3a2C7nDGQvopYzi1fe_LWyosp8t9dcBsduYK5k_s_OrCaA@mail.gmail.com>
Subject: Re: [PATCH V4 16/17] riscv: compat: Add COMPAT Kbuild skeletal support
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Christoph Hellwig <hch@infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:LTVToWslt1MMdcj5vss3XfaOTSMHziGyJJIkQMTAy6+uxjInqdZ
 pKd97AOm+RFSM4FZykIr673K7Jdzro/GYBAjhNW8ac7IalqZ6CNMD2QkjVGGpnz3rQga/mR
 7VV7ArhHp9SJvc1n5E7FdnzbSedWx9KRILNJyF9eJUgJzTxFb3TRXk5D0OUWZJBfxlSfE+q
 Ny2g2p0/vbNdcTytWPCag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Se3n+l8/04w=:pFS9xt+WnhRtoapf3ORssn
 +scfwFH6raHXm+rBwvrxBgOVTDqw2eUCAAydum2QJ7iLZVbYot3dCZ9fIBzrXdShwKhqw2e98
 toYOoXpVoqnWAJ4A5EcfUxm/vJ9g/iKN7h1cAfBjfLF9yRVhksi8QkoozRzwxGxHfi0uRntIa
 E1bPIkz/p2QS2o9MsSo7TYmw5VjEWe/6HMXamvDV/ZgZlj5PmL9qf4vfBKrn0zXiK7Gnwqcmo
 gIZ16bB8/KjUTjEQ1k8GMpZX7G+dvG6T2EEeOm+2zLVZaA+JLbIvVILn+wwt16Y7URsli74dO
 XIAAbEbuiXb0eKIb9GMHrW7AUcW/kCtrUkHo8vMTKGcaTbDJQD53lLUJw5ZMH+aD7Tj7OByY+
 zCNy2wZ7LhgGVd4kPiUVP+v3Svopfoe7Zp9FBLQuoAFYuxu/a4TzWbqZTGys23TQgKsvO4AkR
 GH9fOHdgqaq4xqOjYzLH4yYHyDHqaKdhB6si4wE3EvTk8EfQv1pZKiJXTrrGIGcN9abPJUTo2
 XW0cwHcGXg/WrQE5sGkkUuRYiVJDBtmqQno3vQhdWznRBefWxFqAAdYpEMup4HScpTRAyS9Vx
 TbE+9IInCG7LutsQAMd1mADCnxQY3HxG/i4VLKdLKmGpOUWv6PVo3MpkSDwNBJwD6aFu/7PNz
 1ZxSeV0ED92epcCmILRkE8KTJSlWGpIZA5p13OOYXsDjIJgdxUi9Hv2YCfff07vGFQsjm5U1f
 fyMrHuB2ThAnZPZov8xtqP4GeWXN/AFd9cvGjYqrU6NrsSSZavUP3o8MN9UFmaXHUcWmXQkl1
 8/IwizMDDsGkaqzmcjxjZ+gRa4zouXdz+u/9uWg9f6TejQWyxA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_013626_533486_564D7F2A 
X-CRM114-Status: GOOD (  22.83  )
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

On Tue, Feb 1, 2022 at 10:13 AM Guo Ren <guoren@kernel.org> wrote:
> On Tue, Feb 1, 2022 at 3:45 PM Christoph Hellwig <hch@lst.de> wrote:
> > On Mon, Jan 31, 2022 at 09:50:58PM +0800, Guo Ren wrote:
> > > On Mon, Jan 31, 2022 at 8:26 PM Christoph Hellwig <hch@infradead.org> wrote:
> > > >
> > > > Given that most rv64 implementations can't run in rv32 mode, what is the
> > > > failure mode if someone tries it with the compat mode enabled?
> > > A static linked simple hello_world could still run on a non-compat
> > > support hardware. But most rv32 apps would meet different userspace
> > > segment faults.
> > >
> > > Current code would let the machine try the rv32 apps without detecting
> > > whether hw support or not.
> >
> > Hmm, we probably want some kind of check for not even offer running
> > rv32 binaries.  I guess trying to write UXL some time during early
> > boot and catching the resulting exception would be the way to go?
>
> Emm... I think it's unnecessary. Free rv32 app running won't cause
> system problem, just as a wrong elf running. They are U-mode
> privileged.

While it's not a security issue, I think it would be helpful to get a
user-readable error message and a machine-readable /proc/cpuinfo
flag to see if a particular system can run rv32 binaries rather than
relying on SIGILL to kill a process.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
