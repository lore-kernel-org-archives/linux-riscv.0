From: deepa.kernel@gmail.com (Deepa Dinamani)
Date: Fri, 6 Jul 2018 21:23:53 -0700
Subject: [PATCH v2 3/7] riscv: Include asm-generic/compat.h
In-Reply-To: <CAK8P3a2L9z+Ok1Wd0=5F=Xt7nvqL6be+AS++F3rZzByN+a+9QA@mail.gmail.com>
References: <20180705213604.18883-1-deepa.kernel@gmail.com>
 <20180705213604.18883-4-deepa.kernel@gmail.com>
 <20180705222110.GA5698@infradead.org>
 <CABeXuvoj_WwvnaqY1wao+axx1JLpPte-iXP=Ti7jsT+r6VrVUg@mail.gmail.com>
 <CAK8P3a2L9z+Ok1Wd0=5F=Xt7nvqL6be+AS++F3rZzByN+a+9QA@mail.gmail.com>
Message-ID: <CABeXuvr7LUk+eBWwv-sZOt6U+Rq7xRcer0gB+MRbgHjf=bt_pg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Jul 6, 2018 at 4:42 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Jul 6, 2018 at 1:56 AM, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>> On Thu, Jul 5, 2018 at 3:21 PM, Christoph Hellwig <hch@infradead.org> wrote:
>>> On Thu, Jul 05, 2018 at 02:36:00PM -0700, Deepa Dinamani wrote:
>>>> defconfig, allmodconfig and nomodconfig.
>>>> And hence does not inlude definitions for compat data types.
>>>>
>>>> Now that time syscalls are being reused in non CONFIG_COMPAT
>>>> modes, include asm-generic definitions for riscv.
>>>>
>>>> Alternative would be to make compat_time.h to be conditional on
>>>> CONFIG_COMPAT_32BIT_TIME. But, since riscv is already has an
>>>> asm/compat.h include the generic version instead.
>>>
>>> Two comments here:
>>>
>>> First I think the current riscv compat.h is completely bogus.
>>> As you mentioned riscv does not actually have a compat mode, so
>>> having a compat.h makes no sensse at all, and the COMPAT_UTS_MACHINE
>>> override which is the only thing implemented is included in that
>>> statement.
>>
>> I was leaving the decision on how to clean up compat mode to the
>> architecture maintainers.
>> I wasn't sure if they were still in the middle of implementing it.
>
> If we only need it for 32 bit time_t, we can probably just use the
> asm-generic/compat.h for now.

Ok. Will send out a v3 with asm/compat.h removed. Thanks.

-Deepa
