From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 18 Sep 2018 15:53:20 -0700 (PDT)
Subject: Unable to handle kernel paging request at virtual address
 0000001bf8068693
In-Reply-To: <20180905190648.GC1420@infradead.org>
Message-ID: <mhng-07deb823-671d-453c-ad4c-1cf6d11d49d7@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 05 Sep 2018 12:06:48 PDT (-0700), Christoph Hellwig wrote:
> On Wed, Sep 05, 2018 at 10:17:08AM -0700, Atish Patra wrote:
>> This issue is fixed in 4.19-rc1.
>>
>> If you don't want to pull the latest, here is the change you need to
>> cherry-pick to your branch.
>>
>> https://lore.kernel.org/lkml/20180626192746.GJ3593 at linux.vnet.ibm.com/
>
> Paul, I think we need this in 4.18-stable.
>
> Also Palmer, I think we should pick it up in riscv-linux-4.18.
>
> The mainline commit is:
>
> commit fcc63543650150629c8a873cbef3578770acecd9
> Author: Boqun Feng <boqun.feng@gmail.com>
> Date:   Fri Jun 15 12:06:31 2018 -0700
>
>     rcu: Make expedited GPs handle CPU 0 being offline

I added it to riscv-linux-4.18.  Thanks!
