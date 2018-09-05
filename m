From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 5 Sep 2018 12:03:03 -0700
Subject: [PATCH -next] RISC-V: Request newstat syscalls
In-Reply-To: <1536158166-3397-1-git-send-email-linux@roeck-us.net>
References: <1536158166-3397-1-git-send-email-linux@roeck-us.net>
Message-ID: <20180905190303.GA1420@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Sep 05, 2018 at 07:36:06AM -0700, Guenter Roeck wrote:
> Fixes: 82b355d161c9 ("y2038: Remove newstat family from default syscall set")
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> I would suggest to merge this patch with the offending patch.

Yes, that would be helpful.
