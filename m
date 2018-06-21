From: zongbox@gmail.com (Zong Li)
Date: Thu, 21 Jun 2018 15:12:45 +0800
Subject: [PATCH 4/5] RISC-V: Change variable type for 32-bit compatible
In-Reply-To: <20180621064135.GD19319@infradead.org>
References: <cover.1529506497.git.zong@andestech.com>
 <3f86f9eb853380686a86a8abe6bda0dd3720ee10.1529506497.git.zong@andestech.com>
 <20180621064135.GD19319@infradead.org>
Message-ID: <CA+ZOyah0-d3diK2iaWXsoPsCS9T8pTfp5-gxOixfBvJYRVjdLQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> > -     s64 offset = (void *)v - (void *)location;
> > +     uintptr_t offset = (void *)v - (void *)location;
>
> s64 is signed, uintptr is not, so this might change behavior and needs
> an explanation.
>

Yes, it should be intptr_t. Thanks!
