From: shea@shealevy.com (Shea Levy)
Date: Sun, 01 Apr 2018 11:01:36 -0400
Subject: [PATCH v4 14/16] powerpc: Use generic free_initrd_mem.
In-Reply-To: <87a7ur10k3.fsf@concordia.ellerman.id.au>
References: <20180328152714.6103-1-shea@shealevy.com>
 <20180328203659.18692-1-shea@shealevy.com>
 <20180328203659.18692-15-shea@shealevy.com>
 <1522269853.12357.135.camel@perches.com> <874lkzudkc.fsf@xps13.shealevy.com>
 <87a7ur10k3.fsf@concordia.ellerman.id.au>
Message-ID: <87efjzrmwf.fsf@xps13.shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Michael,

Michael Ellerman <mpe@ellerman.id.au> writes:

> Shea Levy <shea@shealevy.com> writes:
>
>> Joe Perches <joe@perches.com> writes:
>>
>>> On Wed, 2018-03-28 at 16:36 -0400, Shea Levy wrote:
>>>> Signed-off-by: Shea Levy <shea@shealevy.com>
>>>
>>> Most people seem to want some form of commit message
>>> and not just your sign-off.
>>>
>>
>> Ah, if the subject is insufficient I can add some more detail.
>
> Yeah please do.
>
> Seeing this patch in isolation, with no change log, I might think it's
> safe for me to just apply it.
>
> But that would break the build because I don't have patch 1.
>
> So for starters you need to explain that part, eg something like:
>
>   A previous patch in the series added a weak definition of
>   free_initrd_mem() in init/initramfs.c.
>
>   The powerpc implementation is identical, so it can be removed allowing
>   the generic version to be used.
>
>
> Then you could also tell me if you did/didn't build/boot test it.

Thanks for the feedback, can you let me know if the recently posted v6
fits the bill?

>
> cheers

Thanks,
Shea
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180401/26d89962/attachment.sig>
