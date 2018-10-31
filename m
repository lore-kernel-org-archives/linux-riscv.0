From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 30 Oct 2018 23:12:06 -0700
Subject: virtio-gpu without ARCH_HAS_SG_CHAIN
In-Reply-To: <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
References: <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
Message-ID: <20181031061206.GA2828@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

There is no good reason to not define ARCH_HAS_SG_CHAIN.  To fix
your immediate problem just select it from riscv, as riscv uses
the generic dma-direct code which is chained S/G safe by definition.

And if you want to get extra points do a quick audit of the remaning
iommu drivers on architectures that don't define it so that we can
kill the symbol.
