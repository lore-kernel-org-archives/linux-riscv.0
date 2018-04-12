From: sorear2@gmail.com (Stef O'Rear)
Date: Wed, 11 Apr 2018 20:14:52 -0400
Subject: kernel hangs after running program that uses a custom SIGSEGV
 handler
In-Reply-To: <3428122.ik0p8hGU2m@omega>
References: <3428122.ik0p8hGU2m@omega>
Message-ID: <CADJ6UvOs+2OVmRhJThhNufg-jPT2UwaP=HNuvV_V=tuJ=fFi_w@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Apr 11, 2018 at 6:10 PM, Bruno Haible <bruno@clisp.org> wrote:
> Hi,
>
> $ uname
> Linux stage4.fedoraproject.org 4.16.0-rc2-00328-gebea62367bc4 #4 SMP Mon Feb 26 16:05:16 GMT 2018 riscv64 riscv64 riscv64 GNU/Linux
>
> This kernel either hangs or prints "BUG" messages when running a program that
> installs a SIGSEGV handler. That handler uses mprotect to change the access
> permissions of memory pages. It is known to work fine on all other Linux
> architectures that I tested.

The bug is caused by mishandling of PROT_NONE (failing to distinguish
between PROT_NONE and non-present pages), not by the segfault handler.
I sent a patch for this to Andrew and Richard a few weeks ago but
haven't had a chance to follow up.

-s
