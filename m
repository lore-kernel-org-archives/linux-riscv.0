From: ulfalizer@gmail.com (Ulf Magnusson)
Date: Tue, 6 Feb 2018 00:38:51 +0100
Subject: [PATCH 07/20] riscv: Remove ARCH_WANT_OPTIONAL_GPIOLIB select
In-Reply-To: <CACRpkdY-3ab=o0TpURqa-MyTMJOd86SWqBaD4n7+KGYhgbYjzg@mail.gmail.com>
References: <20180205012146.23981-1-ulfalizer@gmail.com>
 <20180205012146.23981-8-ulfalizer@gmail.com>
 <CACRpkdY-3ab=o0TpURqa-MyTMJOd86SWqBaD4n7+KGYhgbYjzg@mail.gmail.com>
Message-ID: <CAFkk2KQzCE5KrUvyvL0Va+KT0O4BvT3PQAT2ZP4u3SGYUWcp2g@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Feb 6, 2018 at 12:25 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Feb 5, 2018 at 2:21 AM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
>
>> The ARCH_WANT_OPTIONAL_GPIOLIB symbol was removed in commit 65053e1a7743
>> ("gpio: delete ARCH_[WANTS_OPTIONAL|REQUIRE]_GPIOLIB"). GPIOLIB should
>> just be selected explicitly if needed.
>>
>> Remove the ARCH_WANT_OPTIONAL_GPIOLIB select from RISCV.
>>
>> See commit 0145071b3314 ("x86: Do away with
>> ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB") and commit da9a1c6767 ("arm64: do
>> away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB") as well.
>>
>> Discovered with the
>> https://github.com/ulfalizer/Kconfiglib/blob/master/examples/list_undefined.py
>> script.
>>
>> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
>
> This should probaly be replaced with
> select GPIOLIB
>
> Yours,
> Linus Walleij

That'd make more sense if GPIOLIB is actually used. The select has
been a no-op since mid-2016 at least, but maybe something else selects
GPIOLIB.

Cheers,
Ulf
