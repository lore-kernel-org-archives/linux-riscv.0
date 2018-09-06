From: schwab@suse.de (Andreas Schwab)
Date: Thu, 06 Sep 2018 09:35:33 +0200
Subject: Unable to handle kernel paging request at virtual address
 0000001bf8068693
In-Reply-To: <20180905190648.GC1420@infradead.org> (Christoph Hellwig's
 message of "Wed, 5 Sep 2018 12:06:48 -0700")
References: <mvmh8j4f4yb.fsf@suse.de>
 <ade8cef4-aad0-3320-8bce-700cd3e106c9@wdc.com>
 <20180905190648.GC1420@infradead.org>
Message-ID: <mvm1sa7f58a.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sep 05 2018, Christoph Hellwig <hch@infradead.org> wrote:

> The mainline commit is:
>
> commit fcc63543650150629c8a873cbef3578770acecd9
> Author: Boqun Feng <boqun.feng@gmail.com>
> Date:   Fri Jun 15 12:06:31 2018 -0700
>
>     rcu: Make expedited GPs handle CPU 0 being offline

Thanks, this got me further.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
