From: jimw@sifive.com (Jim Wilson)
Date: Mon, 15 Oct 2018 10:41:46 -0700
Subject: [PATCH] RISC-V: Add FP register ptrace support for gdb.
In-Reply-To: <20181015084013.GB11826@infradead.org>
References: <20181013005649.14379-1-jimw@sifive.com>
 <20181015084013.GB11826@infradead.org>
Message-ID: <CAFyWVaYGU=QQi9W2ZuO54T_akNMSk73B8HRLiLfTVoROoj-m-A@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Oct 15, 2018 at 1:40 AM Christoph Hellwig <hch@infradead.org> wrote:
> So why don't we have a proper macro / type for the FP registers?

Shrug.  No one has defined them.  I can try adding them, but the
farther I get from ptrace the less comfortable I am, and the more
revisions I'll probably need.

The other comments are as I expected.  I will work on a followup
version of the patch that tries to fix these problems.

Jim
