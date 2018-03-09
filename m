From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 09 Mar 2018 10:07:19 -0800 (PST)
Subject: [RFC PATCH 1/2] riscv/spinlock: Strengthen implementations with
 fences
In-Reply-To: <20180309121643.GA16716@andrea>
Message-ID: <mhng-e33a5770-5cf5-407d-b2f6-45af7c0b9ef8@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 09 Mar 2018 04:16:43 PST (-0800), parri.andrea at gmail.com wrote:
> On Thu, Mar 08, 2018 at 02:11:12PM -0800, Palmer Dabbelt wrote:
>> On Thu, 08 Mar 2018 13:03:03 PST (-0800), parri.andrea at gmail.com wrote:
>> >On Wed, Mar 07, 2018 at 10:33:49AM -0800, Palmer Dabbelt wrote:
>> >
>> >[...]
>> >
>> >>I'm going to go produce a new set of spinlocks, I think it'll be a bit more
>> >>coherent then.
>> >>
>> >>I'm keeping your other patch in my queue for now, it generally looks good
>> >>but I haven't looked closely yet.
>> >
>> >Patches 1 and 2 address a same issue ("release-to-acquire"); this is also
>> >expressed, more or less explicitly, in the corresponding commit messages:
>> >it might make sense to "queue" them together, and to build the new locks
>> >on top of these (even if this meant "rewrite all of/a large portion of
>> >spinlock.h"...).
>>
>> I agree.  IIRC you had a fixup to the first pair of patches, can you submit
>> a v2?
>
> I've just sent it (with updated changelog).

Thanks!
