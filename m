From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 08 Nov 2018 08:57:24 -0800 (PST)
Subject: [PATCH] riscv: add asm/unistd.h UAPI header
In-Reply-To: <CAEn-LTqCT-u0_QNdOSf3bLKYa5S2vz4T0X5yKmnS1AE4pDYOkg@mail.gmail.com>
Message-ID: <mhng-dc92b5a0-ee9f-4e63-a99e-34e77058c77a@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 08 Nov 2018 02:38:22 PST (-0800), david.abdurachmanov at gmail.com wrote:
> On Thu, Nov 8, 2018 at 3:10 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 07 Nov 2018 13:09:39 PST (-0800), Arnd Bergmann wrote:
>> > On Wed, Nov 7, 2018 at 7:30 PM David Abdurachmanov
>> > <david.abdurachmanov@gmail.com> wrote:
>> >> On Wed, Nov 7, 2018 at 1:08 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>> >> > On Mon, 05 Nov 2018 12:56:15 PST (-0800), Arnd Bergmann wrote:
>> >
>> >> > The target is still the next glibc release (Feb 1st) for a stable RV32I ABI.
>> >> > That's progressing well, with one last blocking issue related to some of our
>> >> > floating-point emulation routines before we can submit the port.  This should
>> >> > give us ample time to line up the ABIs correctly so everything works.
>> >> >
>> >> > So I think the correct answer here is to drop __ARCH_WANT_STAT64 from RISC-V.
>> >> >
>> >>
>> >> Then if you agree I could do and send v2:
>> >>
>> >> +#ifdef __LP64__
>> >> +#define __ARCH_WANT_NEW_STAT
>> >> +#endif /* __LP64__ */
>> >
>> > Looks good to me.
>>
>> This is a bit pedantic, but I'm not sure what the right answer is here:
>> "-march=rv64gc -mabi=ilp32d" will not define __LP64__, but will define
>> "__riscv_xlen == 64".  I actually don't know enough about how an rv64gc/ilp32d
>> ABI would work to answer this: would we have "long long" all over our syscalls?
>>
>> Probably not worth worrying about for now, as we'll have to go audit all of
>> these if we ever end up with an ilp32 ABI.  So just go for it and we'll throw
>> this on the pile to deal with later :)
>
> GCC will not allow "-march=rv64gc -mabi=ilp32d":
>
>     cc1: error: ABI requires -march=rv32
>
> I see that arch/riscv/include/uapi/asm/elf.h already use __riscv_xlen so to be
> consistent I will use it too (but I like __LP64__ more as it is well
> known macro).
>
> Looking at other UAPI headers I see that include/uapi/linux/rseq.h is using
> __LP64__ macro. This header is installed on riscv.

Yes, it's not currently supported and there are no concrete plans to support 
it.  Like Arnd mentioned, it's a big headache.  It was really more of a 
question about how this might work than a concrete review, I'm happy with the 
patch as it was suggested.
