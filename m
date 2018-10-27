From: hch@infradead.org (Christoph Hellwig)
Date: Sat, 27 Oct 2018 00:46:13 -0700
Subject: [PATCH 1/2] Move EM_RISCV into elf-em.h
In-Reply-To: <20181024204036.8799-2-palmer@sifive.com>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-2-palmer@sifive.com>
Message-ID: <20181027074613.GA7868@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Oct 24, 2018 at 01:40:35PM -0700, Palmer Dabbelt wrote:
> This should never have been inside our arch port to begin with, it's
> just a relic from when we were maintaining out of tree patches.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Looks good, and probably harmless enought that we should pick it up
for this merge window:

Reviewed-by: Christoph Hellwig <hch@lst.de>
