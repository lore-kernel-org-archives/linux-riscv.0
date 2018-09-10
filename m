From: robh@kernel.org (Rob Herring)
Date: Mon, 10 Sep 2018 08:51:25 -0500
Subject: [PATCH 14/21] riscv: use for_each_of_cpu_node iterator
In-Reply-To: <20180910133757.GA21593@infradead.org>
References: <20180905193738.19325-1-robh@kernel.org>
 <20180905193738.19325-15-robh@kernel.org>
 <20180910133757.GA21593@infradead.org>
Message-ID: <CAL_JsqJ3VG7Yr6OqKTZD16TowOksNTQkO859UNLFdyMSnS3VQQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Sep 10, 2018 at 8:38 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Sep 05, 2018 at 02:37:31PM -0500, Rob Herring wrote:
> > Use the for_each_of_cpu_node iterator to iterate over cpu nodes. This
> > has the side effect of defaulting to iterating using "cpu" node names in
> > preference to the deprecated (for FDT) device_type == "cpu".
> >
> > Cc: Palmer Dabbelt <palmer@sifive.com>
> > Cc: Albert Ou <aou@eecs.berkeley.edu>
> > Cc: linux-riscv at lists.infradead.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Please ack and I will take via the DT tree. This is dependent on the
> > first 2 patches.
>
> We have a few pending patches in this area that look like they might
> conflict.  It might be worth to delay this one and apply it post -rc1
> to avoid dependencies if that isn't a problem for you.

Sure. That's fine.

Rob
