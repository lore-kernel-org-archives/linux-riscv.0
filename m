From: arnd@arndb.de (Arnd Bergmann)
Date: Mon, 5 Nov 2018 09:52:52 +0100
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <20181105070551.GA7274@infradead.org>
References: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
 <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
 <20181101174857.du2zu4vnrhpu5asf@excalibur.cnev.de>
 <20181105065807.GA1286@andestech.com>
 <20181105070551.GA7274@infradead.org>
Message-ID: <CAK8P3a2c98VVPArCkdAR=-nnDBq1gYRCLDDgQB71eGiTSRdb4A@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 11/5/18, Christoph Hellwig <hch@infradead.org> wrote:
> On Mon, Nov 05, 2018 at 02:58:07PM +0800, Vincent Chen wrote:
>> Many thanks for kinds of comments. I quickly synthesize the comments and
>> list them as below.
>> 1. The kernel image shall include all vendor-specific code.
>
> I fundamentally disagree with this? and think it should be the contrary.
>
> 1. The kernel shall support no vendor specific instructions whatsoever,
> period.

I think what was meant above is

1. If a vendor extension requires kernel support, that support
must be able to be built into a kernel image without breaking support
for CPUs that do not have that extension, to allow building a single
kernel image that works on all CPUs.

       Arnd
