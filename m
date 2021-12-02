Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F4EC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 01:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HCzcyd8JOzOTGkrSftOwD+Kd7Fo+uxoah1P4nnvOUAc=; b=EwpRDMFs/xeP0j
	J6dzUYN0O79Hru1FUU7M3EXTaHviAMD9fa6Cu+54/foDMyHNjtxP0ELH3PUH4XZe158ZdSYYGx/nV
	mk2tv5quqc54RTzaEEOSZKbfxfCv21WD+XkFPtjKfhJHU8NiFGHN01BVLgVuX9W5Ku7TaEnigKU0w
	4yVNjEZMnz7yJAJ6DQNYnfevgy8dQ9eB6Ss9c4sysLl+alw+iaq0znLO3PhUnYdKaIRaZozSsxKrL
	wpEJMF/52uut/Lyls4Xdg5Dh+zydqzSrXRCGM7dkXY399ArFfzSHPTs4ixy5DMqdh64oDvTkFRreJ
	VPR7mBaIANdDd+MWfy3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msb6D-00AYGT-GL; Thu, 02 Dec 2021 01:41:25 +0000
Received: from mail-sender-0.a4lg.com ([2401:2500:203:30b:4000:6bfe:4757:0])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msb67-00AYDf-C8
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 01:41:21 +0000
Received: by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 7BB34300089;
 Thu,  2 Dec 2021 01:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1638409277;
 bh=iqpwdhmnm8RIPQnjw+hC7A371C3NTwqi6JQWM0Gjl/w=;
 h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:
 Content-Transfer-Encoding;
 b=tJsY2awfsifRnOAzcPpZLUqQz6ZDLwdfIKf+ScjgKmdCTnGi4Y+G93ZipPdNq6VPZ
 OrGQuctAFfkOsmnkn7VJ+fcjerPgmhc+PIy1BSQX7jmViT7xrPjMz3iViBlsqO/d9E
 NE0NR5vQ8kHiNczg/2cLT5Tv2ZRNiit/9KsMUH4Y=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 0/4] riscv: cpufeature: Improvements for extended
 feature handling
Date: Thu,  2 Dec 2021 10:41:09 +0900
Message-Id: <cover.1638408984.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_174119_766227_B7C17100 
X-CRM114-Status: GOOD (  18.05  )
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

This is my v3 patchset about RISC-V device tree-based feature handling.

Background sections are mostly unmodified from RFC PATCH v1.  I repost
them so that this mail contains all important information and background.


Index
------

-   History
-   Background: New Extensions
-   Background: How Current ISA Handling is Broken?
-   Patches
-   Changes from RFC PATCH v2 -> v3


History
--------

RFC PATCH v1:
http://lists.infradead.org/pipermail/linux-riscv/2021-November/010252.html
RFC PATCH v2:
http://lists.infradead.org/pipermail/linux-riscv/2021-November/010350.html
RFC PATCH v3:
You are here.


Background: New Extensions
---------------------------

In this year, many of standard multi-letter extensions are being frozen,
reviewed and ratified.

They include:

-   Svpbmt (Page-Based Memory Types) 1.0
-   Zfinx / Zdinx / Zhinx (FP in Integer Registers) 1.0.0-rc
-   Zba / Zbb / Zbc / Zbs (Bit Manipulation) 1.0.0
-   Zkn / Zks / Zkr (Scalar Crypto) 1.0.0-rc6
-   Zve* / Zvl* (Vector Subextensions) 1.0

many of which introduce new instructions, new CSR (registers/bits)
and/or new features.

Also, it's highly plausible that distinguishing incompatible major versions
(version 2 and later) will be needed in the future.

In the device tree, we have "riscv,isa" string representing implemented ISA
and extensions supported by a hart.  Parsing this enables feature
detection. (Current kernel parses this string to detect presence of FPU.)

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

-   RISC-V, 32-bit
-   Base ISA "I" version 2.1

but current code parses this string (on 32-bit kernel) as:

-   RISC-V, 32-bit (which matches the kernel)
-   Base ISA "I"
-   Packed-SIMD extension "P"

This is clearly broken ...but it isn't very bad considering proposed "P"
draft is not yet frozen.  With non-versioned "rv64imazifencei_zdinx"
however (on 64-bit kernel), things can get really worse:

(intended meaning)
-   RISC-V, 64-bit
-   Base Instruction Set "I"
-   Single-letter Extensions "M", "A"
-   Multi-letter Extensions "Zifencei" and "Zdinx"

(parsed as)
-   RISC-V, 64-bit
-   Base Instruction **Sets** "I" and "E"
-   Extensions "M" and "A"
-   Compressed Instruction Extension "C"
-   Floating Point Extensions "F" and "D"
-   Reserved Extension "N" (removed user-level interrupts)
-   Supervisor Extension here? "S"

Incorrect detection of "F" and "D" is really bad ("C" is no good either).

Yes, I admit that "Zdinx" (double FP in GPR) is here to demonstrate the
worst kind of the problem intentionally.  But the problem stays.

Even if the extension does not need kernel support (e.g. extensions provide
new instructions but only general purpose registers are involved), wrong
host ISA detection can easily confuse the kernel and will cause problems
in the near future.  That's why I submit this series of patches now (not
during/after kernel support for multiple Extended Features is discussed).


Patches
--------

Patch 1/4: Change BITS_PER_LONG to number of alphabet letters
    Current ISA pretty-printing code assumes only bit 0-25 ('a'-'z') are
    used (it uses 'a' + BIT_OFFSET to print supported extensions).
    Although current parser does not set bit 26 and higher, it will be an
    annoying problem if we start to use those high feature bits.

Patch 2/4: Minimal "riscv,isa" Parser
    This patch implements minimal "riscv,isa" parser, which is designed to
    ignore multi-letter extensions and version numbers.  With this patch,
    you can safely ignore mutli-letter extensions and version numbers.

Patch 3/4: Full "riscv,isa" Parser (Part 1: Extension Names)
    This patch enables to extract multi-letter extension names. You can
    match any extension names to test some feature.
    Note that I implemented a backward parser to handle extension names
    with one or more digits such as "Zvl256b" (which is not valid per
    current ISA Manual not relaxing the rule is being discussed).
    cf. <https://github.com/riscv/riscv-isa-manual/pull/718>

Patch 4/4: Full "riscv,isa" Parser (Part 2: Version Numbers)
    In addition to Patch 3, this patch enables you to extract version
    information of an extension.  If version number handling is not needed,
    this patch may be omitted
    (I consider that Patch 1-3 satisfy most usecases).


Changes from RFC PATCH v2 -> v3
--------------------------------

-   'H'-extension is now parsed as a single-letter extension

    Because current RISC-V ISA Manual and software implementations seemed
    inconsistent, I decided to comply with the ISA Manual in
    RFC PATCH v1/v2 and reported an "issue" to riscv-isa-manual.
    cf. <https://github.com/riscv/riscv-isa-manual/issues/781>

    Greg Favor commented that 'H'-extension is in fact a single-letter
    extension and corresponding sections in the ISA Manual will be
    changed in a few month.

    Now, I'm confident enough to consider that 'H' is a single-letter
    extension and should not be handled as a prefix of multi-letter
    extensions "H*".  If ISA change didn't happen, we can discuss later.

    RISC-V KVM is now compatible with this patchset.

-   Changed parser error handling again

    It seemed that need to handling version numbers is rare and possible
    error number handling seemed a bit clumsy.  So, I simplified it
    (usually, we don't have to know *which* version number is invalid).
    Patch 4 is optional but I request to merge this too due to small
    overhead of version number handling and possible usecases involving
    custom and/or experimental extensions.

    `ext_err`:
        It indicates whether a valid extension token is parsed.
        If `false`, the extension token is valid.
    `ext_err_ver` (Patch 4 only):
        It indicates whether version number of the extension token is valid
        and correctly parsed by the implementation.
        If `false`, version number `ext_{major,minor}` are valid.
        Note that those version numbers have default values.
        `ext_major`:
            `UINT_MAX` means the token does not contain any version
            information.  Usually, implied major version is `1`
            (with some exceptions).
        `ext_minor`:
            `0` means either:
                (a) the token does not contain minor version number or
                (b) given minor version number is `0`.

-   `MATCH_EXT` macro is added

    I added `MATCH_EXT` macro to Patch 3.  This macro enables you to test
    whether certain extension name (in lowercase) is matched.

    For instance, `MATCH_EXT("zba")` will match extension "Zba".

    I didn't included an example for this but did in my GitHub branch
    (on the top of Patch 4).
    <https://github.com/a4lg/linux/tree/riscv-cpufeature.v3>

-   Added `unlikely` to error path




Tsukasa OI (4):
  riscv: cpufeature: Correctly print supported extensions
  riscv: cpufeature: Minimal parser for "riscv,isa" strings
  riscv: cpufeature: Extract extension names from "riscv,isa"
  riscv: cpufeature: Full parser for "riscv,isa" strings

 arch/riscv/kernel/cpufeature.c | 120 ++++++++++++++++++++++++++++-----
 1 file changed, 104 insertions(+), 16 deletions(-)


base-commit: 8bb7eca972ad531c9b149c0a51ab43a417385813
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
