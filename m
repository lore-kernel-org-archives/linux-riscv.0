From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Sat, 27 Oct 2018 11:10:34 +0200
Subject: [PATCH 1/2] Move EM_RISCV into elf-em.h
In-Reply-To: <20181027074613.GA7868@infradead.org>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-2-palmer@sifive.com>
 <20181027074613.GA7868@infradead.org>
Message-ID: <CAEn-LTq8i4FFU15Gn_zm_mwUzgp6i5dGCgKmbXju9qwBny+QhQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Oct 27, 2018 at 9:46 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Oct 24, 2018 at 01:40:35PM -0700, Palmer Dabbelt wrote:
> > This should never have been inside our arch port to begin with, it's
> > just a relic from when we were maintaining out of tree patches.
> >
> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>
> Looks good, and probably harmless enought that we should pick it up
> for this merge window:

That would be nice. The audit parts I am working on depends on this patch.

Tested-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
