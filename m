From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Tue, 29 May 2018 15:14:20 +0900
Subject: [PATCH] riscv: pass machine size to sparse
In-Reply-To: <20180529061127.GA20005@infradead.org>
References: <20180528163505.15698-1-luc.vanoostenryck@gmail.com>
 <20180529061127.GA20005@infradead.org>
Message-ID: <CAK7LNAT_dnO9Enr+Dg11YTux8JAV3K=k4r_5VP3moUCG8s5XHg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

2018-05-29 15:11 GMT+09:00 Christoph Hellwig <hch@infradead.org>:
> On Mon, May 28, 2018 at 06:35:05PM +0200, Luc Van Oostenryck wrote:
>> By default, sparse assumes a 64bit machine when compiled on x86-64
>> and 32bit when compiled on anything else.
>>
>> This can of course create all sort of problems when this doesn't
>> correspond to the target's machine size, like issuing false
>> warnings like: 'shift too big (32) for type unsigned long' or
>> is 64bit while sparse was compiled on a 32bit machine, or worse,
>> to not emit legitimate warnings.
>>
>> Fix this by passing the appropriate -m32/-m64 flag to sparse.
>
> Can we please move this to the common Kbuild code using the
> CONFIG_64BIT syombol?  This really should not need boiler plate in
> every architecture.


I agree.

Luc did so for -mbig/little-endian:
https://patchwork.kernel.org/patch/10433957/

We should do likewise for -m32/64.



-- 
Best Regards
Masahiro Yamada
