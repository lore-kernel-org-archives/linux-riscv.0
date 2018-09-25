From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 25 Sep 2018 09:15:38 -0700
Subject: [GIT PULL] A Single RISC-V Update for 4.19-rc6
In-Reply-To: <mhng-e3afd7a0-8f32-43a2-98bc-ef162868bede@palmer-si-x1c4>
References: <mhng-e3afd7a0-8f32-43a2-98bc-ef162868bede@palmer-si-x1c4>
Message-ID: <20180925161538.GA5328@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

I think this fix isn't quite right actually - we don't need asm-generic
asm-prototypes.h, as said in the review of this patch.

Also on it's own it isn't going to help with doing a modversions enabled
build, as the return_to_handler export needs to be dropped.

Last but not least I'm not sure who is going pull this if you only
send it to linux-riscv :)
