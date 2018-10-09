From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 9 Oct 2018 09:15:11 -0700
Subject: futex_atomic_cmpxchg_inatomic is missing
In-Reply-To: <mhng-b1474fef-9750-4bfb-be90-5e4bf4c964d4@palmer-si-x1c4>
References: <mvmh8icabwx.fsf@suse.de>
 <mhng-b1474fef-9750-4bfb-be90-5e4bf4c964d4@palmer-si-x1c4>
Message-ID: <20181009161511.GA18519@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Sep 28, 2018 at 07:17:17PM -0700, Palmer Dabbelt wrote:
> Christoph published a simple Kconfig workaround a while ago to turn on the
> generic support for non-SMP systems, which might help you work around your
> issue.  My plan was to construct a for-next branch over the weekend, but I
> managed to do so today so I might have time to take a look -- no promises,
> though :)

Can you pull that commit in at least?  It has been dandling in various
riscv tree for more than half a year now..
