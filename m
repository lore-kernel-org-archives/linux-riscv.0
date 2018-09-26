From: zongbox@gmail.com (Zong Li)
Date: Wed, 26 Sep 2018 10:40:02 +0800
Subject: [PATCH 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
In-Reply-To: <20180925152508.GA24002@infradead.org>
References: <cover.1537260207.git.zongbox@gmail.com>
 <2ccc6c0758624dbb22f6fe451a3e476a000108ef.1537260207.git.zongbox@gmail.com>
 <20180921070006.GC8401@infradead.org>
 <CA+ZOyaiJv-NZWk3ec_3zhRTSn7G-NGgyaiPTXOmuWfTWD7KSJw@mail.gmail.com>
 <20180925152508.GA24002@infradead.org>
Message-ID: <CA+ZOyaiB+eEWUr7J1s4PRB5tYcKQfbTp--hnL7S6H3BtUraizw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Christoph Hellwig <hch@infradead.org> ? 2018?9?25? ?? ??11:25???
>
> On Tue, Sep 25, 2018 at 10:19:55AM +0800, Zong Li wrote:
> > The RV32 need the umoddi3 to do modulo when the operands are long long
> > type, like other libraries implementation such as ucmpdi2, lshrdi3 and
> > so on. I encounter the undefined reference 'umoddi3' when I use the in
> > house dma driver, although it is in house driver, but I think that
> > umoddi3 is a common function for RV32. The udivmoddi4 and umoddi3 are
> > copies from libgcc in gcc. There are other functions use the
> > udivmoddi4 in libgcc, so I separate the umoddi3 and udivmoddi4 for
> > flexible extension in the future.
>
> I don't think libgcc is GPLv2 licensed, is it?  Also please retain
> the copyright notices from libgcc.

I will give next version patch. Thanks.
