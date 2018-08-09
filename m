From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 9 Aug 2018 00:02:58 -0700
Subject: [PATCH v5 5/5] Auto-detect whether a FPU exists
In-Reply-To: <20180809064336.GA18746@andestech.com>
References: <1533796003-680-1-git-send-email-alankao@andestech.com>
 <1533796003-680-6-git-send-email-alankao@andestech.com>
 <20180809063124.GA26062@infradead.org>
 <20180809064336.GA18746@andestech.com>
Message-ID: <20180809070258.GA11082@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 09, 2018 at 02:43:36PM +0800, Alan Kao wrote:
> It does look a little bit weird.  Should I send a v6 for this?

Yes, please resend the series or just this patch.

I think the hswap.h definition should go away and we should just
keep the switch_to.h one, even if that means including the header
in another C file.
