From: zongbox@gmail.com (Zong Li)
Date: Thu, 21 Jun 2018 23:19:21 +0800
Subject: [PATCH 4/5] RISC-V: Change variable type for 32-bit compatible
In-Reply-To: <CA+ZOyah0-d3diK2iaWXsoPsCS9T8pTfp5-gxOixfBvJYRVjdLQ@mail.gmail.com>
References: <cover.1529506497.git.zong@andestech.com>
 <3f86f9eb853380686a86a8abe6bda0dd3720ee10.1529506497.git.zong@andestech.com>
 <20180621064135.GD19319@infradead.org>
 <CA+ZOyah0-d3diK2iaWXsoPsCS9T8pTfp5-gxOixfBvJYRVjdLQ@mail.gmail.com>
Message-ID: <CA+ZOyagG+wV0vCZ1S4+C+k+iw1dm=ntupsb=tz7eQ5j82qqihQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> > > -     s64 offset = (void *)v - (void *)location;
> > > +     uintptr_t offset = (void *)v - (void *)location;
> >
> > s64 is signed, uintptr is not, so this might change behavior and needs
> > an explanation.
> >
>
> Yes, it should be intptr_t. Thanks!

Correct, it should be ptrdiff_t. In kernel, there is no intptr_t definition.
