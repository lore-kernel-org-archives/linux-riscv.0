From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 01 Oct 2018 09:42:39 -0700 (PDT)
Subject: [PATCH] RISC-V: Show CPU ID and Hart ID separately in
 /proc/cpuinfo
In-Reply-To: <CAAhSdy2gC15j9zW+_rjBQzofGyhBjcNVWSYCbBtrAmQtDogBqA@mail.gmail.com>
Message-ID: <mhng-d37b6a32-c6d3-4736-80f4-cb814dde9fed@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 28 Sep 2018 23:12:47 PDT (-0700), anup at brainfault.org wrote:
> On Sat, Sep 29, 2018 at 7:16 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 12 Sep 2018 07:38:22 PDT (-0700), anup at brainfault.org wrote:
>> > Currently, /proc/cpuinfo show logical CPU ID as Hart ID which
>> > is in-correct. This patch shows CPU ID and Hart ID separately
>> > in /proc/cpuinfo using cpuid_to_hardid_map().
>> >
>> > With this patch, contents of /proc/cpuinfo looks as follows:
>> > cpu   : 0
>> > hart  : 1
>> > isa   : rv64imafdcsu
>> > mmu   : sv48
>> >
>> > cpu   : 1
>> > hart  : 0
>> > isa   : rv64imafdcsu
>> > mmu   : sv48
>> >
>> > cpu   : 2
>> > hart  : 3
>> > isa   : rv64imafdcsu
>> > mmu   : sv48
>> >
>> > cpu   : 3
>> > hart  : 2
>> > isa   : rv64imafdcsu
>> > mmu   : sv48
>> >
>> > Signed-off-by: Anup Patel <anup@brainfault.org>
>> > ---
>> >  arch/riscv/kernel/cpu.c | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>> > index f0f0ec2737b7..7c1342e242e6 100644
>> > --- a/arch/riscv/kernel/cpu.c
>> > +++ b/arch/riscv/kernel/cpu.c
>> > @@ -87,7 +87,8 @@ static int c_show(struct seq_file *m, void *v)
>> >                                                  NULL);
>> >       const char *compat, *isa, *mmu;
>> >
>> > -     seq_printf(m, "hart\t: %lu\n", cpu_id);
>> > +     seq_printf(m, "cpu\t: %lu\n", cpu_id);
>> > +     seq_printf(m, "hart\t: %lu\n", cpuid_to_hardid_map(cpu_id));
>> >       if (!of_property_read_string(node, "riscv,isa", &isa)
>> >           && isa[0] == 'r'
>> >           && isa[1] == 'v')
>>
>> I like this, but it doesn't appear to apply.  Do you mind sending something
>> against Linus' master?  Then I should be able to sort it out.
>>
>
> This patch is requires cpuid_to_hardid_map() added by Atish's
> patchset so I have requested Atish to make this patch part of
> his v6 patchset.

Thanks!
