From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 25 Sep 2018 10:57:22 -0700 (PDT)
Subject: [PATCH 1/2] riscv/bitops: Remove smp_mb__{before,
 after}_clear_bit()
In-Reply-To: <20180925174906.GA4372@andrea>
Message-ID: <mhng-011ba62c-cdf5-4a9b-9d4e-b1a7909d5d43@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 25 Sep 2018 10:49:06 PDT (-0700), andrea.parri at amarulasolutions.com wrote:
> On Tue, Sep 25, 2018 at 10:19:24AM -0700, Palmer Dabbelt wrote:
>> On Tue, 25 Sep 2018 05:12:24 PDT (-0700), andrea.parri at amarulasolutions.com wrote:
>> > The barriers are unused; remove their definition.
>> >
>> > Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
>> > Cc: Palmer Dabbelt <palmer@sifive.com>
>> > Cc: Albert Ou <aou@eecs.berkeley.edu>
>> > Cc: <linux-riscv@lists.infradead.org>
>> > ---
>> >  arch/riscv/include/asm/bitops.h | 5 -----
>> >  1 file changed, 5 deletions(-)
>> >
>> > diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
>> > index f30daf26f08f4..01db98dfd0435 100644
>> > --- a/arch/riscv/include/asm/bitops.h
>> > +++ b/arch/riscv/include/asm/bitops.h
>> > @@ -23,11 +23,6 @@
>> >  #include <asm/barrier.h>
>> >  #include <asm/bitsperlong.h>
>> >
>> > -#ifndef smp_mb__before_clear_bit
>> > -#define smp_mb__before_clear_bit()  smp_mb()
>> > -#define smp_mb__after_clear_bit()   smp_mb()
>> > -#endif /* smp_mb__before_clear_bit */
>> > -
>> >  #include <asm-generic/bitops/__ffs.h>
>> >  #include <asm-generic/bitops/ffz.h>
>> >  #include <asm-generic/bitops/fls.h>
>>
>> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>
> Thank you.
>
>
>>
>> Do you want me to take this via the RISC-V tree?  I only ended up with patch
>> 1/2 in my inbox, and I probably shouldn't take both.
>
> I expected this to go via the RISC-V tree and 2/2 via the H8/300 tree,
> but really no preference from me as long as they get upstreamed. ;-)

Works for me.  I'll take this one.
