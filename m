From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 06 Nov 2018 15:45:54 -0800 (PST)
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <CAK8P3a2c98VVPArCkdAR=-nnDBq1gYRCLDDgQB71eGiTSRdb4A@mail.gmail.com>
Message-ID: <mhng-19511b81-9f89-4a15-8b2f-d63779074fb4@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 05 Nov 2018 00:52:52 PST (-0800), Arnd Bergmann wrote:
> On 11/5/18, Christoph Hellwig <hch@infradead.org> wrote:
>> On Mon, Nov 05, 2018 at 02:58:07PM +0800, Vincent Chen wrote:
>>> Many thanks for kinds of comments. I quickly synthesize the comments and
>>> list them as below.
>>> 1. The kernel image shall include all vendor-specific code.
>>
>> I fundamentally disagree with this? and think it should be the contrary.
>>
>> 1. The kernel shall support no vendor specific instructions whatsoever,
>> period.
>
> I think what was meant above is
>
> 1. If a vendor extension requires kernel support, that support
> must be able to be built into a kernel image without breaking support
> for CPUs that do not have that extension, to allow building a single
> kernel image that works on all CPUs.

Yes.  I don't want anything that won't compile with upstream GCC, but I also 
don't want to have a Kconfig that says "make the kernel only work on $VENDOR's 
implementation".  I think this can be achieved, at least for the cases I've 
seen so far.
