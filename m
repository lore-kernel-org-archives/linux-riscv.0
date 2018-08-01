From: andrew@sifive.com (Andrew Waterman)
Date: Wed, 1 Aug 2018 11:23:43 -0700
Subject: [PATCH v2] riscv: Add support to no-FPU systems
In-Reply-To: <mhng-47d9ea80-a0c6-4cde-be65-75046c5d49d2@palmer-si-x1c4>
References: <1530073346-5341-1-git-send-email-alankao@andestech.com>
 <mhng-47d9ea80-a0c6-4cde-be65-75046c5d49d2@palmer-si-x1c4>
Message-ID: <CA++6G0AMXC0ZeTZ+tkLh_5QGoPMR+3YD8Ed=DR8-G=6FL1yDSw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Aug 1, 2018 at 10:55 AM, Palmer Dabbelt <palmer@sifive.com> wrote:
> On Tue, 26 Jun 2018 21:22:26 PDT (-0700), alankao at andestech.com wrote:
>>
>> This patch adds an option, CONFIG_FPU, to enable/disable floating
>> procedures.  Also, some style issues are fixed.
>>
>> Signed-off-by: Alan Kao <alankao@andestech.com>
>> Cc: Greentime Hu <greentime@andestech.com>
>> Cc: Zong Li <zong@andestech.com>
>> ---
>>  arch/riscv/Kconfig                 |  9 ++++
>>  arch/riscv/Makefile                | 19 +++----
>>  arch/riscv/include/asm/switch_to.h |  6 +++
>>  arch/riscv/kernel/entry.S          |  3 +-
>>  arch/riscv/kernel/process.c        |  7 ++-
>>  arch/riscv/kernel/signal.c         | 82 +++++++++++++++++++++---------
>>  6 files changed, 90 insertions(+), 36 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 6debcc4afc72..6069597ba73f 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -232,6 +232,15 @@ config RISCV_BASE_PMU
>>
>>  endmenu
>>
>> +config FPU
>> +       bool "FPU support"
>> +       default y
>> +       help
>> +         Say N here if you want to disable all floating-point related
>> procedure
>> +         in the kernel.
>> +
>> +         If you don't know what to do here, say Y.
>> +
>>  endmenu
>
>
> Sorry for letting this slide for a bit.  While I'm not opposed to a solution
> that requires a FPU Kconfig option, it'd be a bit better if we could detect
> this at boot time.  I think this should be possible because at one point
> this actually worked and we could boot the same kernel on FPU and no-FPU
> systems.

I believe it would suffice to have start_thread set sstatus.FS to OFF
for no-FPU systems (vs. INITIAL for systems with FPU).   The ISA
string in the devicetree should indicate whether F/D extensions are
present.

That said, it makes sense to me to additionally provide the Kconfig
option.  This would elide the sstatus.SD check for no-FPU systems,
shaving a couple instructions off the context-switch path.  It would
also enable mimicking the behavior of a no-FPU system even when the
FPU is present.

>
> If that's not possible then we'll have to take something like this.  There
> were some comments on this v2 but I don't see a v3, did I miss one?
