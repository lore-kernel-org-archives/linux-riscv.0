From: arnd@arndb.de (Arnd Bergmann)
Date: Wed, 31 Oct 2018 12:45:47 +0100
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
References: <1540982130-28248-1-git-send-email-vincentc@andestech.com>
 <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
Message-ID: <CAK8P3a125hSg5cK_bt_4w2iLrxCETnPLHvHpFmYyRYXhjC9Bjg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 10/31/18, Anup Patel <anup@brainfault.org> wrote:
> On Wed, Oct 31, 2018 at 4:06 PM Vincent Chen <vincentc@andestech.com>
> wrote:
>>
>>   RISC-V permits each vendor to develop respective extension ISA based
>> on RISC-V standard ISA. This means that these vendor-specific features
>> may be compatible to their compiler and CPU. Therefore, each vendor may
>> be considered a sub-architecture of RISC-V. Currently, vendors do not
>> have the appropriate examples to add these specific features to the
>> kernel. In this RFC set, we propose an infrastructure that vendor can
>> easily hook their specific features into kernel. The first commit is
>> the main body of this infrastructure. In the second commit, we provide
>> a solution that allows dma_map_ops() to work without cache coherent
>> agent support. Cache coherent agent is unsupported for low-end CPUs in
>> the AndeStar RISC-V series. In order for Linux to run on these CPUs, we
>> need this solution to overcome the limitation of cache coherent agent
>> support. Hence, it also can be used as an example for the first commit.
>>
>>   I am glad to discuss any ideas, so if you have any idea, please give
>> me some feedback.
>>
>
> I agree that we need a place for vendor-specific ISA extensions and
> having vendor-specific directories is also good.
>
> What I don't support is the approach of having compile time selection
> of vendor-specific ISA extension.

Agreed, we did this on arm32 in the past, and it took us a long time
to change all the modern platforms (ARMv6/7/8) to be usable in a
shared kernel. It's better to avoid that and keep everything together
like we did on arm64 from the start.

One thing we do on arm32 is to support combinations of different
instruction set variants in a combined kernel through callback pointers
that turn into direct function calls when the kernel is configured for
only a single CPU type. This might be something to add later on
riscv, but I probably wouldn't do it right away.

      Arnd
