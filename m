Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0D3C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 11:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPMMkOPDDKAEvbv6vg/dP8P/N9YI1D8U+9UYlOuwiEM=; b=szNM8HVJ0l58o4
	gG7IRrjJnRnic5iwisO51iCK8cv9iuKkqFgSQgMEE+sElLTMkpuaeB6EcCcsVhJzO+5S87/hh4jIJ
	9NI7vrfTpGIyS5yaqJRkOEa2wXYippuZdT7VHxtjBZP1484z31q6UZxlOqSL6jDIC1KRKqcdYp8Xd
	0wGgOpNlTMxe/iQkUQZrHGnXMdgtFz9ezncK/WIrBZOQOdrTGYFOIXKD5VaZnl383cU5l2y+KYS/Q
	WNuiq4huzlw7L7KD7/ZxN4vwl+mo8rBYhKUCzMuCeC+bGU18QVJH2OKXLIKzXXncGIH9fu7ejIGQd
	WM7uXIRypJ4i4cb7vbEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmZN2-00FONa-Hy; Thu, 05 May 2022 11:10:08 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmZMz-00FOMX-J7
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 11:10:07 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MjSsm-1oESLB056Y-00kvpv for <linux-riscv@lists.infradead.org>; Thu, 05
 May 2022 13:10:03 +0200
Received: by mail-wr1-f42.google.com with SMTP id q23so5645348wra.1
 for <linux-riscv@lists.infradead.org>; Thu, 05 May 2022 04:10:02 -0700 (PDT)
X-Gm-Message-State: AOAM5321OBWsxs0eiOnAF2dU8SierPlMd98pKBxUn7062rqjEUuyvUff
 8hwf1/6moZUcs1lwYkdJHTL56bgvIBZ8gCoUofs=
X-Google-Smtp-Source: ABdhPJy3sZItdcfe17y+S/VnaEhqFhXcQF66aoZmv1r68aZfE+8weQM2Hae0G8znhhQS8eBb/xXeQCqA+DvrYRMKHic=
X-Received: by 2002:a5d:49cb:0:b0:20a:cee3:54fc with SMTP id
 t11-20020a5d49cb000000b0020acee354fcmr19600892wrs.12.1651749002633; Thu, 05
 May 2022 04:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220430153626.30660-1-palmer@rivosinc.com>
In-Reply-To: <20220430153626.30660-1-palmer@rivosinc.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 5 May 2022 13:09:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1VjunJE5zAm96pkQX7EvVDcN6VGT8usedeO709KQnB_g@mail.gmail.com>
Message-ID: <CAK8P3a1VjunJE5zAm96pkQX7EvVDcN6VGT8usedeO709KQnB_g@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Generic Ticket Spinlocks
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, 
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Greg KH <gregkh@linuxfoundation.org>, 
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, 
 Jisheng Zhang <jszhang@kernel.org>, linux-csky@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>
X-Provags-ID: V03:K1:2yD5I5xh/tb0q09LlFHdCCcdWfwyt4CBW89P3EXPCzpwPC7vIJw
 G5ldgzLS0hxhOlLSFJP5pf+PYRzhOXCFSCIYg1nuk4EJbKxsqY4ywyI1b8B3f+LS5m6q8Jl
 uwMX5WvE4Crnq+SPqXIp/kFLn6a//isxeiZbnc6osXnvrDAbvU+tc65RYcqYnKVuz4Tl4vv
 9ixDIbg7BnTlpe0puMkNQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2Hc39MZZAtA=:mcXCw57nwTAvyzCj0KXaqa
 L4NbPoUlguppo4XGQ6uSSaX5S190Pk1Mu9YSZHMPzLxWzbn0ANkuoFf6xeEZGxKiMIRhaCpOO
 qdcY+duShW7Dzx4wn6NSQWifmru04w3l+O5S1D+sGgf87T+UIhpk+8DbpTBJo9tliBYDwm8tt
 9u8Z+43jTjXyCLn8Hk4kkAb7OIPQb02XLtIsT3MyfZW9jsV+mtQQ7xxoIjmLTdmJHNersV21H
 8vhEA9BG1fjL8YUytvYxl2bbqmGAPlL82W1WKJHX1sU3/iJQZWXjpu5BYtHG6TvuTycOb4B98
 4pg2djBTgrFjsmzTT027l2MTVQ5RuW4oVklWo0qm/z17VOq6XKuqz2IXrxsUEVFUz6k3TnvcK
 cRVNZNGaToSnMAAAFVAKAPrpPQDGvFoWm+uS7GtpX0auuoDcb/KjUWp+pN7YmYKJORFMUxVs5
 Pgh3zCsxK2fHddGN4AUgd6Z73StmkmB9nptMbldUkp0bbqmBY7tYrV2fwJFk/ghgrM5a1RXjq
 o1mzz0QIyNLRYQGbvC77v3f0TYGTvXnlpInUhKdS2wHVLyPgGVfuG86JTKxnZVHUub+Xh6BjA
 vesut5oFUJ30zMne5t+Vi+s2qsg15uMIHfG2z+EpAXz4msSYWvrIOje/JEEWoOM56GX3Nbg3Y
 DXMgh8ynetJbG8rgrwCcj2ia0kGZhZyjvohcEnup9m+IdvUIHmYZ22MsUQdVcp+Q45Q93wLhH
 AoI4wlTWb+VYq8jqjKAtIDR1xQbSq0uQhYXEFmVKXf/WsvGYyptx2+yJPiB11tjOU37/e6B8x
 TYyyxHjW9fPz17j1kYz1ot9Kdp+cRfLlZdRyVBtjLq8VlFty7I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_041005_960065_B342B4EA 
X-CRM114-Status: GOOD (  22.51  )
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

On Sat, Apr 30, 2022 at 5:36 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> Comments on the v3 looked pretty straight-forward, essentially just that
> RCsc issue I'd missed from the v2 and some cleanups.  A part of the
> discussion some additional possible cleanups came up related to the
> qrwlock headers, but I hadn't looked at those yet and I had already
> handled everything else.  This went on the back burner, but given that
> LoongArch appears to want to use it for their new port I think it's best
> to just run with this and defer the other cleanups until later.
>
> I've placed the whole patch set at palmer/tspinlock-v4, and also tagged
> the asm-generic bits as generic-ticket-spinlocks-v4.  Ideally I'd like
> to take that, along with the RISC-V patches, into my tree as there's
> some RISC-V specific testing before things land in linux-next.  This
> passes all my testing, but I'll hold off until merging things anywhere
> else to make sure everyone has time to look.  There's no rush on my end
> for this one, but I don't want to block LoongArch so I'll try to stay a
> bit more on top of this one.

I took another look as well and everything seems fine. I had expected
that I would merge it into the asm-generic tree first and did not bother
sending a separate Reviewed-by tag, but I agree that it's best if you
create the branch.

Can you add 'Reviewed-by: Arnd Bergmann <arnd@arndb.de>'
to each patch and send me a pull request for a v5 tag so we can
merge that into both the riscv and the asm-generic trees?

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
