From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 08 Feb 2018 14:58:18 -0800 (PST)
Subject: [PATCH 07/20] riscv: Remove ARCH_WANT_OPTIONAL_GPIOLIB select
In-Reply-To: <CACRpkdaxyngsogjq7846FEd_zTgCOiv+pEbLXwY1Tj2nG+kmQQ@mail.gmail.com>
Message-ID: <mhng-ef2f8b19-2590-4427-a97c-f0c2c19cdd5c@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 06 Feb 2018 01:47:00 PST (-0800), linus.walleij at linaro.org wrote:
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
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> RISCV maintainers: please apply and carry this patch.

OK, I'll atke it into my tree.  Thanks!
