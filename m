From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 5 Nov 2018 22:56:49 -0800
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <cac10a0961274e3ac4674e945f9d9e90@mailhost.ics.forth.gr>
References: <1540982130-28248-1-git-send-email-vincentc@andestech.com>
 <cac10a0961274e3ac4674e945f9d9e90@mailhost.ics.forth.gr>
Message-ID: <20181106065649.GA13526@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Nov 05, 2018 at 09:39:29PM +0200, Nick Kossifidis wrote:
> a) By directly modifying your custom CSRs, it means that we will need
> compiler support in order to compile a kernel with your code in it. This
> will break CI systems and will introduce various issues on testing and
> reviewing your code. In general if we need custom toolchains to compile
> the kernel, that may be unavailable (vendors will not always open source
> their compiler support), we won't be able to maintain a decent level of
> code quality in the tree. How can the maintainer push your code on the
> repository if he/she can't even perform a basic compilation test ?

And that (besides avoiding the wild growth of extensions) is the major
reason why accepting vendor specific CSRs or instructions is a no-go.
