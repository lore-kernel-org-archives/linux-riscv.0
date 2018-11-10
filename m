From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Sat, 10 Nov 2018 06:36:53 +0100
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
Message-ID: <CAEn-LTo1gKtuDpH6iZVT_-ixaQHh79gJ6oDbEsP4yAawriXeEw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Nov 10, 2018 at 3:42 AM Atish Patra <atish.patra@wdc.com> wrote:
>
[..]

> 2. Every SBI function call may return the following structure
> ```
> struct valerr {
>    long value;
>    long error;
> };
> ```

[..]

> int sbi_hart_suspend(u32 state, unsigned long resume_entry, unsigned
> long priv)

A small nictpick, but could we have consistent typing/language in the document?
I see you use "long", and even mix "int" and "u32" in a single definition.

If I look into PSCI I see:
```
SMC32 uint32
SMC64 uint64
entry_point_address
```
which leaves less interpretation for my eyes. For example, "long" can be
32-bit or 64-bit long depending on a few things and thus easier to make
mistake interpreting the spec.

I would suggest to use (u)int32/(u)uint64/friends and something
similar to SMC{32,64}
if needed.

david
