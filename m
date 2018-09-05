From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 5 Sep 2018 12:03:51 -0700
Subject: [PATCH v2 2/3] RISC-V: Use Linux logical cpu number instead of
 hartid
In-Reply-To: <d79833a8-98ae-fa19-9a7c-0afeb3d0bb92@wdc.com>
References: <1535445370-19004-1-git-send-email-atish.patra@wdc.com>
 <1535445370-19004-3-git-send-email-atish.patra@wdc.com>
 <20180831061104.GB19292@infradead.org>
 <ec0819d5-9dc6-6b25-47a9-cd9d9e5099a8@wdc.com>
 <20180904213654.GB2078@infradead.org>
 <d79833a8-98ae-fa19-9a7c-0afeb3d0bb92@wdc.com>
Message-ID: <20180905190351.GB1420@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 04, 2018 at 02:43:13PM -0700, Atish Patra wrote:
> On 9/4/18 2:36 PM, Christoph Hellwig wrote:
> > On Tue, Sep 04, 2018 at 01:35:10PM -0700, Atish Patra wrote:
> > > sure. How about this ?
> > 
> > That would work, but why not just keep calling sbi_remove_sfence_vma
> > directly from flush_tlb_all?
> > 
> I guess that's fine too. I just wanted to keep all flush_tlb_* same format
> to make it more coherent.

I'd just keep it simple by calling directly.  While the compiler would
probably optimize away the branch in an inline function we can just
avoid it entirely that way.
