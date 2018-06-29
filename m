From: zongbox@gmail.com (Zong Li)
Date: Sat, 30 Jun 2018 01:06:23 +0800
Subject: [PATCH v2 0/4] Building for 32-bit RISC-V kernel
In-Reply-To: <20180629072307.GF12956@infradead.org>
References: <cover.1529915117.git.zong@andestech.com>
 <20180629072307.GF12956@infradead.org>
Message-ID: <CA+ZOyahMwEtrG+uzQqGtbfmbeyBDNQVQJUn9oyaMfJb2wNmybw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Christoph Hellwig <hch@infradead.org> ? 2018?6?29? ?? ??3:23???
>
> Btw, what kind of userspace do you use for riscv32?  Do you have an
> easy to use root file system available somewhere (or a way to build
> one)?

I'm porting 32 bit riscv glibc now, and it is almost completion but
still has few fail cases of glibc testsuite.
I built the root file system consist of busybox, bash and dropbear and
so on. I can push the
rootfs I used or a build script to github if somebody need it.
