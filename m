From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 12 Jun 2018 12:38:11 -0700 (PDT)
Subject: [PATCH 3/3] riscv: fix __user annotation for __copy_user()
In-Reply-To: <CAMHZB6E3Jcvni=nsxvOB-+g8sDGCvEV2G2q2+3XrJJy7f__-eg@mail.gmail.com>
Message-ID: <mhng-8a2f58a2-6c49-43bb-a7dc-51f2f8ff8e8f@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 12 Jun 2018 11:19:57 PDT (-0700), luc.vanoostenryck at gmail.com wrote:
> On Tue, Jun 12, 2018 at 7:12 PM, Palmer Dabbelt <palmer@sifive.com> wrote:
>> On Mon, 11 Jun 2018 20:00:08 PDT (-0700), luc.vanoostenryck at gmail.com wrote:
>>> On Mon, Jun 11, 2018 at 12:01:37PM -0700, Palmer Dabbelt wrote:
>>>>
>>>> OK, I'll try and figure out what's going on.  We've had a handful of
>>>> headaches trying to get things like '.align 2; .align 2' to actually
>>>> produce
>>>> no NOPs for the second alignment directive, which is surprisingly
>>>> complicated due to the aggressive linker relaxation we do.
>>>
>>>
>>> OK. I imagine indeed but note that no linker is involved here so,
>>> if the problem is still present, it must already be in the assembler.
>>
>>
>> Ah, OK -- in that case then it's just not a bug.  In RISC-V land we handle
>> alignment as part of relaxation in the linker, so if you're looking at the
>> output of the assembler then you'll always see a bunch of NOPs for every
>> alignment directive.  If you 'objdump -dr' you should be able to see the
>> relocations that get emitted, there should be a R_RISCV_ALIGN that points to
>> the run of NOPs.
>
> Ah OK. Indeed I see the R_RISCV_ALIGN.
> Thanks for the explanation.

No problem.  There's heaps of info about this in some blog posts I made a while 
ago if you're interested.
