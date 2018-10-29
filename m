From: mforney@mforney.org (Michael Forney)
Date: Mon, 29 Oct 2018 12:46:34 -0700
Subject: virtio-gpu without ARCH_HAS_SG_CHAIN
Message-ID: <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi,

I was looking at adding virtio-gpu support to tinyemu
(https://bellard.org/tinyemu/). I got it to work on x86, but just for
fun I tried it under riscv and ran into an issue with buffer
allocations (though, this should affect any arch without
ARCH_HAS_SG_CHAIN).

virtio-gpu uses ttm to allocate buffers, which swaps pages to ensure
that they aren't consecutive[0][1]. However, this causes
sg_alloc_table_from_pages to use a sg entry for every single page,
limiting buffers to only 170 pages (the number of sg entries that can
fit into a page). This is only 417x417 with 32bpp. I believe the page
swapping also makes TRANSFER_TO_HOST_2D inefficient by forcing the
host to do many memcpys instead of just a few.

Commenting out the swaps in [0] and [1] makes it work with larger
buffers. I don't know anything about huge pages, or how sg chaining
works, so I have a few questions:
- Is virtio-gpu intended to be usable without ARCH_HAS_SG_CHAIN?
- Is it still necessary to swap the pages when
CONFIG_TRANSPARENT_HUGEPAGE is disabled?
- Should riscv support ARCH_HAS_SG_CHAIN?

Thanks for any help!

[0] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/gpu/drm/ttm/ttm_page_alloc.c?id=fdb1a2236b07948e83e0a777e1795d4f07e52c33
[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/gpu/drm/ttm/ttm_page_alloc.c?id=ae937fe19636067ec5e20d7f1fa10c6cc6000b52
