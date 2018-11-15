From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 15 Nov 2018 01:12:22 -0800
Subject: Re-run features-refresh.sh
In-Reply-To: <20181113020113.29640-1-palmer@sifive.com>
References: <20181113020113.29640-1-palmer@sifive.com>
Message-ID: <20181115091222.GA25926@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

FYI, we really should kill ARCH_SG_CHAIN in its current form.

See my series here, which could use a review or two:

https://lkml.org/lkml/2018/11/9/958
