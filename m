From: shea@shealevy.com (Shea Levy)
Date: Thu, 01 Mar 2018 06:44:20 -0500
Subject: RISC-V Seccomp Support?
In-Reply-To: <mhng-05569257-b64f-4bc4-b7ce-c86060a41e76@palmer-si-x1c4>
References: <mhng-05569257-b64f-4bc4-b7ce-c86060a41e76@palmer-si-x1c4>
Message-ID: <87d10o2f6z.fsf@xps13.shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

OK, thanks. I'll look into getting that working.

Palmer Dabbelt <palmer@sifive.com> writes:

> On Sun, 25 Feb 2018 20:06:52 PST (-0800), shea at shealevy.com wrote:
>> Is anyone actively working on CONFIG_HAVE_ARCH_SECCOMP_FILTER support
>> for RISC-V? If not, any pointers to getting started on that?
>
> IIRC, the filters for seccomp are based on some variant of BPF.  I bet the vast 
> majority of the work here will be bringing up the BPF infrastructure for 
> RISC-V.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180301/82271749/attachment.sig>
