From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 26 Jan 2018 14:39:54 -0800 (PST)
Subject: [GIT PULL] RISC-V: We have a new mailing list and git repo!
Message-ID: <mhng-79785df3-96f9-4ec6-900d-7cf7587a9117@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The following changes since commit 0c5b9b5d9adbad4b60491f9ba0d2af38904bb4b9:

  Linux 4.15-rc9 (2018-01-21 13:51:26 -0800)

are available in the git repository at:

  ssh://git at gitolite.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.15-maintainers
gpg: Signature made Fri 26 Jan 2018 08:02:15 AM PST
gpg:                using RSA key 00CE76D1834960DFCE886DF8EF4CA1502CCBAB41
gpg:                issuer "palmer at dabbelt.com"
gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
gpg:                 aka "Palmer Dabbelt <palmer@sifive.com>" [ultimate]

for you to fetch changes up to 6572cc2bf2e7b10378eaa5a94a0c717dca1289c9:

  Update the RISC-V MAINTAINERS file (2018-01-26 08:01:24 -0800)

----------------------------------------------------------------
RISC-V: We have a new mailing list and git repo!

Sorry to send something essentially as late as possible (Friday after an
rc9), but we managed to get a mailing list for the RISC-V Linux port.
We've been using patches at groups.riscv.org for a while, but that list has
some problems (it's Google Groups and it's shared over all RISC-V
software projects).  The new infaread.org list is much better.   We just
got it on Wednesday but I used it a bit on Thursday to shake out all the
configuration problems and it appears to be in working order.

When I updated the mailing list I noticed that the MAINTAINERS file was
pointing to our github repo, but now that we have a kernel.org repo I'd
like to point to that instead so I changed that as well.  We'll be
centralizing all RISC-V Linux related development here as that seems to
be the saner way to go about it.

I can understand if it's too late to get this into 4.15, but given that
it's not a code change I was hoping it'd still be OK.  It would be nice
to have the new mailing list and git repo in the release tarballs so
when people start to find bugs they'll get to the right place.

----------------------------------------------------------------
Palmer Dabbelt (1):
      Update the RISC-V MAINTAINERS file

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
