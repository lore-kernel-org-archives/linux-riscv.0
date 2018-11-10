From: mick@ics.forth.gr (Nick Kossifidis)
Date: Sat, 10 Nov 2018 17:09:03 +0200
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <CA++6G0BTdybjhqaXm9EhAz0HsgpwfozK6OEL7DuzbS48RbEChA@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAEn-LTo1gKtuDpH6iZVT_-ixaQHh79gJ6oDbEsP4yAawriXeEw@mail.gmail.com>
 <CA++6G0BTdybjhqaXm9EhAz0HsgpwfozK6OEL7DuzbS48RbEChA@mail.gmail.com>
Message-ID: <c1e5487d6071af143bf9e829c3fd1aa8@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

???? 2018-11-10 07:47, Andrew Waterman ??????:
> On Fri, Nov 9, 2018 at 9:37 PM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
> 
>> On Sat, Nov 10, 2018 at 3:42 AM Atish Patra <atish.patra@wdc.com>
>> wrote:
>>> 
>> [..]
>> 
>>> 2. Every SBI function call may return the following structure
>>> ```
>>> struct valerr {
>>> long value;
>>> long error;
>>> };
>>> ```
>> 
>> [..]
>> 
>>> int sbi_hart_suspend(u32 state, unsigned long resume_entry,
>> unsigned
>>> long priv)
>> 
>> A small nictpick, but could we have consistent typing/language in
>> the document?
>> I see you use "long", and even mix "int" and "u32" in a single
>> definition.
>> 
>> If I look into PSCI I see:
>> ```
>> SMC32 uint32
>> SMC64 uint64
>> entry_point_address
>> ```
>> which leaves less interpretation for my eyes. For example, "long"
>> can be
>> 32-bit or 64-bit long depending on a few things and thus easier to
>> make
>> mistake interpreting the spec.
>> 
>> I would suggest to use (u)int32/(u)uint64/friends and something
>> similar to SMC{32,64}
>> if needed.
> 
> Note, however, that the same spec is meant to be used for both RV32
> and RV64 systems, so some degree of type parameterization is
> necessary.
> 
>> david

We should definitely use typed integers for clarity but there is no
issue on how the structs will be formatted since the current calling
convention provides a pointer to the struct (so it's type is void*)
and the numbers passed through the SBI are 32bit ints (u32) so they
fit on both 32, 64 and 128bit registers. As long as we stick with
this calling convention of passing pointers and 32bit ints, we
should be fine.
