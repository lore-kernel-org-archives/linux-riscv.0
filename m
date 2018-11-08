From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 08 Nov 2018 08:57:21 -0800 (PST)
Subject: [PATCH] riscv: add asm/unistd.h UAPI header
In-Reply-To: <CAK8P3a2468O=MVXVaZ8_Vq6DuOYV2iwR98upqpWOH67z9Gh-6Q@mail.gmail.com>
Message-ID: <mhng-9210a40d-eee0-4600-ae47-4fdff795f0a6@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 08 Nov 2018 02:30:02 PST (-0800), Arnd Bergmann wrote:
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
> Short answer: it doesn't matter because an ilp32d ABI would use neither
> newstat nor stat64, it would only need statx().
>
> Long answer: We've gone through multiple iterations on the question.
> x86 uses long long in syscall interfaces and tries to reuse the native
> 64-bit syscalls as much as possible. This turned out to cause endless
> problems, so for the (never merged but still kept around as a patchset)
> arm64 ABI, we went the opposite way, and made the syscalls use the
> same ABI as the arm32 mode.
>
> From the experience with both of the above, I'd say if you end up
> having to do it, use the same method as arm64, but try to resist
> doing it at all. Unlike arm64 and x86-64, there is no inherent benefit
> to using the 64-bit instruction set (doubled register number etc),
> so compared to the normal lp64 ABI you only gain a little dcache
> space for the smaller pointers at the cost of a smaller address
> space. For you as a maintainer however, the cost of supporting this
> mode is that you are stuck with three user space ABIs instead of
> just two (normal 32-bit and 64-bit).
> If anyone really wants to run 32-bit code, they need a CPU that
> allows switching modes.

Thanks!
