From: shea@shealevy.com (Shea Levy)
Date: Wed, 28 Mar 2018 16:53:39 -0400
Subject: [PATCH v4 14/16] powerpc: Use generic free_initrd_mem.
In-Reply-To: <1522269853.12357.135.camel@perches.com>
References: <20180328152714.6103-1-shea@shealevy.com>
 <20180328203659.18692-1-shea@shealevy.com>
 <20180328203659.18692-15-shea@shealevy.com>
 <1522269853.12357.135.camel@perches.com>
Message-ID: <874lkzudkc.fsf@xps13.shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Joe Perches <joe@perches.com> writes:

> On Wed, 2018-03-28 at 16:36 -0400, Shea Levy wrote:
>> Signed-off-by: Shea Levy <shea@shealevy.com>
>
> Most people seem to want some form of commit message
> and not just your sign-off.
>

Ah, if the subject is insufficient I can add some more detail.

>
> And btw:
>
> It seems you used get_maintainer to determine who to
> send these patches to.
>
> I suggest you add --nogit and --nogit-fallback to the
> get_maintainer command line you use to avoid sending
> these patches to people like me that have done drive-by
> cleanup work on these files.

Whoops, thanks for the tip and sorry for the noise!
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180328/7ee29660/attachment.sig>
