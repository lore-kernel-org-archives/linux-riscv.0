From: schwab@suse.de (Andreas Schwab)
Date: Thu, 21 Jun 2018 12:21:19 +0200
Subject: [PATCH 5/5] RISC-V: Use fixed width integer types for 32-bit
 compatible
In-Reply-To: <20180621064322.GE19319@infradead.org> (Christoph Hellwig's
 message of "Wed, 20 Jun 2018 23:43:22 -0700")
References: <cover.1529506497.git.zong@andestech.com>
 <37a6523947397cd72320676030b96926e373d05a.1529506497.git.zong@andestech.com>
 <20180621064322.GE19319@infradead.org>
Message-ID: <mvmwousjv8g.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Jun 20 2018, Christoph Hellwig <hch@infradead.org> wrote:

>>  static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
>>  {
>>  	if (v != (u32)v) {
>> -		pr_err("%s: value %016llx out of range for 32-bit field\n",
>> +		pr_err("%s: value %016" PRIxX "out of range for 32-bit field\n",
>>  		       me->name, v);
>>  		return -EINVAL;
>
> But in general Linux uXX and sXX values are always the same underlying
> fundamental C type.  What is the mismatch here?

The mismatch is that v is Elf_Addr, not u32.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
