From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 4 Sep 2018 14:36:54 -0700
Subject: [PATCH v2 2/3] RISC-V: Use Linux logical cpu number instead of
 hartid
In-Reply-To: <ec0819d5-9dc6-6b25-47a9-cd9d9e5099a8@wdc.com>
References: <1535445370-19004-1-git-send-email-atish.patra@wdc.com>
 <1535445370-19004-3-git-send-email-atish.patra@wdc.com>
 <20180831061104.GB19292@infradead.org>
 <ec0819d5-9dc6-6b25-47a9-cd9d9e5099a8@wdc.com>
Message-ID: <20180904213654.GB2078@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 04, 2018 at 01:35:10PM -0700, Atish Patra wrote:
> sure. How about this ?

That would work, but why not just keep calling sbi_remove_sfence_vma
directly from flush_tlb_all?
