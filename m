From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 08 Mar 2018 14:11:12 -0800 (PST)
Subject: [RFC PATCH 1/2] riscv/spinlock: Strengthen implementations with
 fences
In-Reply-To: <20180308210303.GA2897@andrea>
Message-ID: <mhng-994ef724-c752-4667-a119-8db6407464df@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 08 Mar 2018 13:03:03 PST (-0800), parri.andrea at gmail.com wrote:
> On Wed, Mar 07, 2018 at 10:33:49AM -0800, Palmer Dabbelt wrote:
>
> [...]
>
>> I'm going to go produce a new set of spinlocks, I think it'll be a bit more
>> coherent then.
>>
>> I'm keeping your other patch in my queue for now, it generally looks good
>> but I haven't looked closely yet.
>
> Patches 1 and 2 address a same issue ("release-to-acquire"); this is also
> expressed, more or less explicitly, in the corresponding commit messages:
> it might make sense to "queue" them together, and to build the new locks
> on top of these (even if this meant "rewrite all of/a large portion of
> spinlock.h"...).

I agree.  IIRC you had a fixup to the first pair of patches, can you submit a 
v2?
