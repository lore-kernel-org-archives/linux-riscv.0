From: arnd@arndb.de (Arnd Bergmann)
Date: Wed, 7 Nov 2018 10:51:11 +0100
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <mhng-19511b81-9f89-4a15-8b2f-d63779074fb4@palmer-si-x1c4>
References: <CAK8P3a2c98VVPArCkdAR=-nnDBq1gYRCLDDgQB71eGiTSRdb4A@mail.gmail.com>
 <mhng-19511b81-9f89-4a15-8b2f-d63779074fb4@palmer-si-x1c4>
Message-ID: <CAK8P3a1He1B2UHLEinzuPF2WvDbt=gwmTkz7-XoMwvpHhBDiuA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 11/7/18, Palmer Dabbelt <palmer@sifive.com> wrote:
> On Mon, 05 Nov 2018 00:52:52 PST (-0800), Arnd Bergmann wrote:
>> On 11/5/18, Christoph Hellwig <hch@infradead.org> wrote:
>>> On Mon, Nov 05, 2018 at 02:58:07PM +0800, Vincent Chen wrote:
>>>> Many thanks for kinds of comments. I quickly synthesize the comments
>>>> and
>>>> list them as below.
>>>> 1. The kernel image shall include all vendor-specific code.
>>>
>>> I fundamentally disagree with this? and think it should be the contrary.
>>>
>>> 1. The kernel shall support no vendor specific instructions whatsoever,
>>> period.
>>
>> I think what was meant above is
>>
>> 1. If a vendor extension requires kernel support, that support
>> must be able to be built into a kernel image without breaking support
>> for CPUs that do not have that extension, to allow building a single
>> kernel image that works on all CPUs.
>
> Yes.  I don't want anything that won't compile with upstream GCC, but I also
>
> don't want to have a Kconfig that says "make the kernel only work on
> $VENDOR's  implementation".  I think this can be achieved, at least for the
> cases I've seen so far.

I think over time, the implementations will diverge. Ignoring the question
of vendor extensions for the moment, you will definitely have to deal with
combinations of (future) standard extensions. I can see two ways of
doing that: Either each extension is a separate Kconfig option and you
have to know which one to enable or disable for a particular target,
or you list each platform separately with one Kconfig option, and
have Kconfig/Kbuild work out which features to enable or disable
based on that to get the fastest and most featureful kernel that still
works on all enabled platforms.

       Arnd
