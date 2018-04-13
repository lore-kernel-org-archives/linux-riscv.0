From: alex@ghiti.fr (Alexandre Ghiti)
Date: Fri, 13 Apr 2018 12:09:41 +0200
Subject: kernel hangs after running program that uses a custom SIGSEGV
 handler
In-Reply-To: <CADJ6UvOs+2OVmRhJThhNufg-jPT2UwaP=HNuvV_V=tuJ=fFi_w@mail.gmail.com>
References: <3428122.ik0p8hGU2m@omega>
 <CADJ6UvOs+2OVmRhJThhNufg-jPT2UwaP=HNuvV_V=tuJ=fFi_w@mail.gmail.com>
Message-ID: <05c49b57-e805-5ed6-afe0-419852073333@ghiti.fr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Stef,

I'm happy to see there are solutions to this problem: I have a working 
port of hugetlb for riscv-linux and I was wondering how to support 
PROT_NONE.
Can you share a link to the patches you mention please ?

Thanks,

Alex


On 04/12/2018 02:14 AM, Stef O'Rear wrote:
> On Wed, Apr 11, 2018 at 6:10 PM, Bruno Haible <bruno@clisp.org> wrote:
>> Hi,
>>
>> $ uname
>> Linux stage4.fedoraproject.org 4.16.0-rc2-00328-gebea62367bc4 #4 SMP Mon Feb 26 16:05:16 GMT 2018 riscv64 riscv64 riscv64 GNU/Linux
>>
>> This kernel either hangs or prints "BUG" messages when running a program that
>> installs a SIGSEGV handler. That handler uses mprotect to change the access
>> permissions of memory pages. It is known to work fine on all other Linux
>> architectures that I tested.
> The bug is caused by mishandling of PROT_NONE (failing to distinguish
> between PROT_NONE and non-present pages), not by the segfault handler.
> I sent a patch for this to Andrew and Richard a few weeks ago but
> haven't had a chance to follow up.
>
> -s
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
