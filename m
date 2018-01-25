From: hch@lst.de (Christoph Hellwig)
Date: Thu, 25 Jan 2018 08:20:31 +0100
Subject: [PATCH] riscv: don't use the symbolic satp name in assembler code
In-Reply-To: <20180124221913.6613-1-palmer@sifive.com>
References: <20180124132447.5517-1-hch@lst.de>
 <20180124221913.6613-1-palmer@sifive.com>
Message-ID: <20180125072031.GA26420@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Jan 24, 2018 at 02:19:09PM -0800, Palmer Dabbelt wrote:
> On Wed, 24 Jan 2018 05:24:47 PST (-0800), Christoph Hellwig wrote:
> > The most recent release binutils release (2.29) doesn't know about
> > the satp name yet, so stick to the name from the previous privileged
> > ISA release and comment on the fact.
> 
> I think it'd be better to squash these into the previous cleanup you sent, just
> to make sure the kernel always builds.  How do these look?

Sure, fine with me.  Thanks for doing the work, next time I'd be happy
to resend as well.
