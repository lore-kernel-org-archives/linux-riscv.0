From: hch@infradead.org (Christoph Hellwig)
Date: Fri, 29 Jun 2018 00:08:44 -0700
Subject: [PATCH v2 2/4] RISC-V: Select GENERIC_UCMPDI2 on RV32I
In-Reply-To: <e83cbb33e4b72fdef56bfe396131474040a194b7.1529915117.git.zong@andestech.com>
References: <cover.1529915117.git.zong@andestech.com>
 <e83cbb33e4b72fdef56bfe396131474040a194b7.1529915117.git.zong@andestech.com>
Message-ID: <20180629070844.GB12956@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Jun 25, 2018 at 04:49:38PM +0800, Zong Li wrote:
> On 32-bit, it need to use __ucmpdi2, otherwise, it can't find the __ucmpdi2
> symbol.
> 
> Signed-off-by: Zong Li <zong@andestech.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
