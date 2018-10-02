From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 2 Oct 2018 07:50:57 -0700
Subject: [PATCH v3 4/5] RISC-V: Select GENERIC_LIB_UMODDI3 on RV32
In-Reply-To: <3f1967e8be0c25910bf04181e84b46a788a156d7.1538470103.git.zongbox@gmail.com>
References: <cover.1538470103.git.zongbox@gmail.com>
 <3f1967e8be0c25910bf04181e84b46a788a156d7.1538470103.git.zongbox@gmail.com>
Message-ID: <20181002145057.GD3889@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Oct 02, 2018 at 04:52:30PM +0800, Zong Li wrote:
> On 32-bit, it need to use __umoddi3 by some drivers.
> 
> Signed-off-by: Zong Li <zong@andestech.com>

Which drivers?
