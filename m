From: hch@infradead.org (Christoph Hellwig)
Date: Fri, 10 Aug 2018 01:38:23 -0700
Subject: [PATCH] riscv: Drop setup_initrd
In-Reply-To: <1533874300-17656-1-git-send-email-linux@roeck-us.net>
References: <1533874300-17656-1-git-send-email-linux@roeck-us.net>
Message-ID: <20180810083823.GB20415@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 09, 2018 at 09:11:40PM -0700, Guenter Roeck wrote:
> setup_initrd() does not appear to serve a practical purpose other than
> preventing qemu boots with "-initrd" parameter, so let's drop it.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
