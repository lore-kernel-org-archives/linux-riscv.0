Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5669C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 08:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JV0OcZlpbbCDOSxhV6fOGqpBBJwSmKCQrs34ZAS+jc8=; b=RQwVnyF2XXm+CS
	GpbC132w1TfG9qcBbYo2DReu8v8cvjr4gYOetLo1+s64ef5b4UdLUyhJA3ItWx4RfLcoFSHVcDLf7
	sjJV8NsnbG/EEaphVY13oPHCk/5qKR7mw1DQbck+/07GxHXmy0R9IdzxjhL2p1gFwZ3wSvEPkK5A3
	9P5IHMWc6mnqFrkAs+AVOMQIP9V4uiCqWxm02mlP7ltK22nktxQuyXM7xakI4qwakRmO2Y5HyyF9k
	KShqwivTH6Hdz9kqRPerhY1nyE9DLH1R0RGhK3mYNA20Zrble7L2w6AKKtNIWFkIBFJkVV46cfoZU
	UXuCIcTcpuLeGjgk9Bcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moM8U-00CCyD-FF; Sat, 20 Nov 2021 08:54:14 +0000
Received: from mail-sender.a4lg.com ([153.120.152.154]
 helo=mail-sender-0.a4lg.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moM8N-00CCvd-V3
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 08:54:10 +0000
Message-ID: <0f568515-a05e-8204-aae3-035975af3ee8@irq.a4lg.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1637398425;
 bh=vLX0tNviqE7oCttbOB8c12CveAbV7w2UQsrZYgS6j4Y=;
 h=Date:Mime-Version:From:Subject:To:Cc:Content-Type:
 Content-Transfer-Encoding;
 b=ZwdaywjmUvmG20gPOV4sSJxzd76PF0wOucyhRUZLou+zl6ImT3Tx6MWfa32xu7WFt
 6oDwlByBpzRJ+PnpDaCnsnKY0sJtF4TWLDAyMIERioySexidmqvTjtuoq7AA7bixQj
 32FfMiniOhmj4i8+SQsMc3w3pccQJ6xx3+KXb89k=
Date: Sat, 20 Nov 2021 17:53:43 +0900
Mime-Version: 1.0
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: [RFC PATCH 0/3] riscv: Improvements for extended feature handling
Content-Language: en-US
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211120_005408_314933_9709BAC7 
X-CRM114-Status: GOOD (  23.67  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Paul, Palmer, Albert and everyone in the community,

I wrote my very first Linux kernel patch to support forthcoming multi-
letter extensions and version numbers in "riscv,isa" (a device tree entry
which represents ISA and extensions supported by a hart).

I found that the situation is complicated because there's massive violation
of extension naming (invalid extension names like "H", "Zve*" and "Zvl*")
and I think we are not yet ready to merge these patches.

Still, I would like to hear your thoughts.

Regards,
Tsukasa



Background: New Extensions
---------------------------

In this year, many of standard multi-letter extensions are being frozen,
reviewed and ratified.

They include:

- Svpbmt (Page-Based Memory Types) 1.0
- Zfinx / Zdinx / Zhinx (FP in Integer Registers) 1.0.0-rc
- Zba / Zbb / Zbc / Zbs (Bit Manipulation) 1.0.0
- Zkn / Zks / Zkr (Scalar Crypto) 1.0.0-rc6
- Zve* / Zvl* (Part of the Vector Extension) 1.0

many of which introduce new instructions, new CSR (registers/bits)
and/or new features.

Also, it's highly plausible that distinguishing incompatible major versions
(version 2 and later) will be needed in the future.
(possibly in several years?)

In the device tree, we have "riscv,isa" string representing implemented ISA
and extensions supported by a hart.  Parsing this enables feature
detection. (current kernel parses this string to detect presence of FPU.)

However, current ISA handling code does not allow handling those multi-
letter extensions and version numbers for multiple reasons.

(a) We haven't defined how do we encode those in ISA bitmap and
(b) current code simply does not support those

My series of patches are intended to resolve (b) and pave a path to easily
detect features noted by versioned and/or multi-letter extensions
(Extended Features) after (a) is resolved.



Background: How Current ISA Handling is Broken?
------------------------------------------------

Current arch/riscv/kernel/cpufeature.c (as of
commit 8bb7eca972ad ("Linux 5.15")) has two issues:

(a) It handles "riscv,isa" as prefix + array of single-letter extensions
(b) ignores every other characters (including version numbers)

For instance, ISA variant "rv32i2p1" means:

- RISC-V, 32-bit
- Base ISA "I" version 2.1

but current code parses this string (on 32-bit kernel) as:

- RISC-V, 32-bit (which matches the kernel)
- Base ISA "I"
- Packed-SIMD extension "P"

This is clearly broken ...but it isn't very bad considering proposed "P"
draft is not yet frozen.  With non-versioned "rv64imazifencei_zdinx"
however (on 64-bit kernel), things can get really worse:

(intended meaning)
- RISC-V, 64-bit
- Base Instruction Set "I"
- Single-letter Extensions "M", "A"
- Multi-letter Extensions "Zifencei" and "Zdinx"

(parsed as)
- RISC-V, 64-bit
- Base Instruction **Sets** "I" and "E"
- Extensions "M" and "A"
- Compressed Instruction Extension "C"
- Floating Point Extensions "F" and "D"
- Reserved Extension "N" (removed user-level interrupts)
- Supervisor Extension here? "S"

Incorrect detection of "F" and "D" is really bad ("C" is no good either).

Yes, I admit that "Zdinx" (double FP in GPR) is here to demonstrate the
worst kind of the problem intentionally.  But the problem stays.

Even if the extension does not need kernel support (e.g. extensions provide
new instructions but only general purpose registers are involved), wrong
host ISA detection can easily confuse the kernel and will cause problems
in the near future.  That's why I submit this series of patches now (not
during/after kernel support for multiple Extended Features is discussed).



Patch 1/3: Pretty-printing Fix
-------------------------------

This is **not** directly related to the main point but it changes how do we
pretty-print supported extensions.

Because current ISA printing code expects `elf_hwcap` and `riscv_isa[0]`
ONLY encode extensions 'a' through 'z', bit 26 and higher are not properly
handled.  Although `elf_hwcap` and `riscv_isa[0]` cannot have such high
bits set (so it cannot cause any problems in practice), printing wrong
extension name can be annoying in the future.

This commit intentionally disables handling of bits >= 26 when printing
supported ISA extensions.


Patch 2/3: Minimal Parser
--------------------------

This is a subset of full parser which does not "parse" multi-letter
extension names and version numbers but instead ignores those.

With this patch, we can safely ignore version numbers and multi-letter
extension names.  This will not allow kernel developers to detect Extended
Features but would allow userspace developers to do so using /proc/cpuinfo
and/or /sys/firmware/devicetree.

Note:
This patch matches each extension greedily using following
regular expression (and ignore invalid prefix):
    "([a-gi-rt-wy]|[hsxz][a-z]*)([0-9]+(p[0-9]+)?)?(_)?"
It is slightly more permissive than what RISC-V ISA Manual allows but at
least covers all valid patterns.

Variables:
- `ext`      : pointer to the first character of the extension name
- `ext_long` : whether the extension name {is,should be} long


Patch 3/3: Full Parser
-----------------------

This is the full featured parser for "riscv,isa" string.

I haven't changed current host ISA feature detection behavior yet (that
would be our future work) but now we have every information we need to
detect Extended Features.

- `ext`..`ext_end`: full extension name (**not** null terminated,
                    `ext_end-ext` is the length of the string)
- `ext_err`       : kind of error encountered while parsing
      0: OK
      1: major version overflow
      2: no valid minor version after "p"
      3: minor version overflow
- `ext_major`     : major version of the extension
                    (-1 [UINT_MAX] if the string has no version numbers)
- `ext_minor`     : minor version of the extension
                    (0 if the string has no version numbers)

Ugly:
I had to reimplement `strtoul`-like function as `_decimal_part_to_uint`
mainly because input string for `kstrtouint` function must be null-
terminated.  For this time, I thought not allocating any memory (but stack)
would be better.




REQUEST FOR COMMENTS: Is Patch 2 Okay?
---------------------------------------

KNOWN ISSUE 1: Patch 2 conflicts with hypervisor extension-related works.

This is because use of single-letter extension "H" is not valid in the
RISC-V ISA Manual (see volume 1, chapter 27) despite the fact that misa.H
corresponds to hypervisor extension enabled/disabled flag.

The first problem is, following works expect single-letter "H" extension.

- RISC-V KVM branch of the Linux kernel
- Spike
- QEMU

The second problem is, this extension is already frozen! I tentatively made
a decision to prefer the ISA Manual in this version of patches but I'm not
sure how to deal with it (in case you prefer single-letter "H", just remove
the line with "case 'h':").  This is clearly an inconsistency in the ISA
Manual so I posted this issue on GitHub:
<https://github.com/riscv/riscv-isa-manual/issues/781>
I hope someone will find the right location to discuss.


KNOWN ISSUE 2: Patch 2 does not parse vector sub-extension names correctly

Patch 2 fails to parse vector subextension names such as "zvl256b".

(intended)
- Vector Length Extension "Zvl256b"

(parsed as [after Patch 2])
- Vector something Extension "Zvl" version 256
- Bit Manipulation Extension "B"

This is another kind of violation of standard extension names.
Still (unlike "H"), this is relatively easy to fix. I was in a rush to
report KNOWN ISSUE 1 and I'm working on a fix for patch v2.

Note that this naming "violation" is already being discussed in:
<https://github.com/riscv/riscv-v-spec/issues/729>
<https://github.com/riscv/riscv-isa-manual/pull/718>




REQUEST FOR COMMENTS: Is Patch 3 Required?
-------------------------------------------

If Patch 2 is okay, how about Patch 3?  Is it too early to expect multi-
letter extensions to be fully parsed in-kernel?

... I think, it's not **too** early, considering current hypervisor
extension situation.

Nevertheless, I would like to hear about your thoughts.





Tsukasa OI (3):
  riscv: Correctly print supported extensions
  riscv: Minimal parser for "riscv,isa" strings
  riscv: Full parser for "riscv,isa" strings

 arch/riscv/kernel/cpufeature.c | 94 +++++++++++++++++++++++++++++-----
 1 file changed, 80 insertions(+), 14 deletions(-)


base-commit: 8bb7eca972ad531c9b149c0a51ab43a417385813
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
