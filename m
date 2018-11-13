From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 12 Nov 2018 18:01:06 -0800
Subject: Re-run features-refresh.sh
Message-ID: <20181113020113.29640-1-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

I didn't even know this existed until David submitted a patch set that
included updates to the documentation as a result of some features he
added to RISC-V.  It looks like there may be a handful of other people
who don't know this exists either, so I figured I'd just mail out a
patch set containing all the updates split out as well as I can.

This smells like something that sholud be automatic, so if I'm jumping
the gun here then feel free to drop this.  If nobody says anything then
I guess I'll submit this as a separate PR to Linus from my personal
tree, as it's not really a RISC-V thing but it seems like it's worth
having docs that match the code where it's trivial -- I assume that's
what this does, I didn't actually read anything but the diff because I
never trust documentation to be up to date...

I feel compelled to say something like "maybe this should be part of
checkpatch?", but I'm definately not looking to learn perl :)
