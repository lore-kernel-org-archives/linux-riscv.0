From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 23:17:45 -0700
Subject: [PATCH v3 06/12] RISC-V: Rename riscv_of_processor_hart to
 riscv_of_processor_hartid
In-Reply-To: <6acd4eec-bdfb-cfc8-6dca-782eb9ec01b0@wdc.com>
References: <1536221135-182613-1-git-send-email-atish.patra@wdc.com>
 <1536221135-182613-7-git-send-email-atish.patra@wdc.com>
 <20180910112548.GF12979@infradead.org>
 <6acd4eec-bdfb-cfc8-6dca-782eb9ec01b0@wdc.com>
Message-ID: <20180911061745.GB15060@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Sep 10, 2018 at 06:36:52PM -0700, Atish Patra wrote:
> On 9/10/18 4:26 AM, Christoph Hellwig wrote:
> > On Thu, Sep 06, 2018 at 01:05:29AM -0700, Atish Patra wrote:
> > > From: Palmer Dabbelt <palmer@sifive.com>
> > > 
> > > It's a bit confusing exactly what this function does: it actually
> > > returns the hartid of an OF processor node, failing with -1 on invalid
> > > nodes.  I've changed the name to _hartid() in order to make that a bit
> > > more clear, as well as adding a comment.
> > > 
> > > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > 
> > Looks generally good, but it is going to conflict with the dt iterators
> > series from Rob.  Given that this is just a little cleanup it might be
> > worth deferring until the next merge window.
> > 
> 
> Sure. np. I guess the entire series can be parked in for-next until the next
> merge window opens.

Actually more in your series also conflicts.  I think we can defer the
patch from Rob as it is very small and simple and can be applied post
4.20-rc1.  
