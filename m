From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 20 Sep 2018 23:59:00 -0700
Subject: [PATCH 2/5] RISC-V: Use swiotlb on RV64 only
In-Reply-To: <b9b943c21725db9822a787a1e985010012fc33b2.1537260207.git.zongbox@gmail.com>
References: <cover.1537260207.git.zongbox@gmail.com>
 <b9b943c21725db9822a787a1e985010012fc33b2.1537260207.git.zongbox@gmail.com>
Message-ID: <20180921065900.GB8401@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 18, 2018 at 05:19:14PM +0800, Zong Li wrote:
> Only RV64 supports swiotlb.
> 
> Signed-off-by: Zong Li <zong@andestech.com>

Reviewed-by: Christoph Hellwig <hch@lst.de>
