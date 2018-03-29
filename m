From: mpe@ellerman.id.au (Michael Ellerman)
Date: Fri, 30 Mar 2018 00:19:40 +1100
Subject: [PATCH v4 14/16] powerpc: Use generic free_initrd_mem.
In-Reply-To: <874lkzudkc.fsf@xps13.shealevy.com>
References: <20180328152714.6103-1-shea@shealevy.com>
 <20180328203659.18692-1-shea@shealevy.com>
 <20180328203659.18692-15-shea@shealevy.com>
 <1522269853.12357.135.camel@perches.com> <874lkzudkc.fsf@xps13.shealevy.com>
Message-ID: <87a7ur10k3.fsf@concordia.ellerman.id.au>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Shea Levy <shea@shealevy.com> writes:

> Joe Perches <joe@perches.com> writes:
>
>> On Wed, 2018-03-28 at 16:36 -0400, Shea Levy wrote:
>>> Signed-off-by: Shea Levy <shea@shealevy.com>
>>
>> Most people seem to want some form of commit message
>> and not just your sign-off.
>>
>
> Ah, if the subject is insufficient I can add some more detail.

Yeah please do.

Seeing this patch in isolation, with no change log, I might think it's
safe for me to just apply it.

But that would break the build because I don't have patch 1.

So for starters you need to explain that part, eg something like:

  A previous patch in the series added a weak definition of
  free_initrd_mem() in init/initramfs.c.

  The powerpc implementation is identical, so it can be removed allowing
  the generic version to be used.


Then you could also tell me if you did/didn't build/boot test it.

cheers
