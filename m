Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC2DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 10:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rtaLuWWrZb5G07rbUemKaR6r/iNPMhWyyGfT9OCPV3I=; b=WKhcfbhiMEuAHQ
	NlSzVG1uPNcq/l/E11PQ3UNaiWsmEAMMSqufjH0Gd6umQ0ZMIVAkNPPvQETCkiv0sIAYNi9iwKFAt
	801D/W8s6EGT0nnG+0tISZOSKmRbnhw4WKZGPXVtJiA3R75cuk5Dhj8G3CWyug2Jv2omAtqDi5fUd
	rZ3SGur7s8aQlXM5ET7bh0ckup1EZcAhJQAqG0W7ocTwKgNT0XZqli3D0ECDEimuJUP8iGSZf2zDD
	kGSUhTX7gQDVzTOJsWZ6ZPXReojk33JbT4nSLEfNaGtNJcYzUtMYi6G291+FGYQJHvFTCXNIH+RYi
	bf1ljLFwQS7iMR0zs7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqBid-0072L5-KM; Thu, 25 Nov 2021 10:11:07 +0000
Received: from mail-sender-0.a4lg.com ([2401:2500:203:30b:4000:6bfe:4757:0])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqBiR-0072E4-Oo
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 10:10:59 +0000
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Authentication-Results: mail-sender-0.a4lg.com;
 dkim=permerror (bad message/signature format)
To: Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 0/4] riscv: cpufeature: Improvements for extended
 feature handling
Date: Thu, 25 Nov 2021 19:02:51 +0900
Message-Id: <cover.1637834060.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_021056_078721_E3C904F3 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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

I think this patchset should be CCed to Mr. Patel.

RFC PATCH v1 (0/3 through 3/3):
http://lists.infradead.org/pipermail/linux-riscv/2021-November/010252.html
http://lists.infradead.org/pipermail/linux-riscv/2021-November/010249.html
http://lists.infradead.org/pipermail/linux-riscv/2021-November/010251.html
http://lists.infradead.org/pipermail/linux-riscv/2021-November/010250.html

See 0/3 (v1) for full background.

First of all, I must repeat that this patchset breaks RISC-V KVM.

Because single-letter extension "H" is not valid in the current ISA Manual
(see Volume 1, Chapter 27 "ISA Naming Conventions" for details), either ISA
Manual or RISC-V KVM (or both, most likely) must be changed to resolve
the conflict.

Current patchset is compliant to the ISA Manual and not compatible with
RISC-V KVM (that checks single-letter "H"-extension).  However, it is easy
to work around this issue.  By removing "case 'h':" line, this parser loses
compliance with the ISA Manual but gets compatibility with RISC-V KVM.

I created an Issue on GitHub so see the details here:
<https://github.com/riscv/riscv-isa-manual/issues/781>

I understand that this is the worst timing to report this kind of issue.
Still, situation is already a problem so I thought sooner is better.



Changed in v2: Patch 1 now uses a macro (NUM_ALPHA_EXTS), not magic number
    Thanks to Ben Dooks for valuable feedback!

Changed in v2: Patch 3 (v1) is split to 3, 4 (v2)
    It's possible that we only need extension names but not version
    numbers.  To separate ugly parts, I split original Patch 3 (v1) to two:
    1. Extract only extension names (Patch 3 (v2))
    2. Parse extension names / version numbers (Patch 4 (v2))

Changed in v2: `ext_err` has different meanings
    0: No error
    1: Invalid format (invalid character exists)
    2: Major version is out of range
    3: Minor version is out of range

New in v2: Backward parser for relaxed extension name rule
    Invalid vector subextension names (Zvl*, Zve*) are correctly parsed now
    (e.g. Zvl64b, Zve64d).  New backward parser finds version number from
    the end of an extension token (because multi-letter extension must be
    delimited by '_' if not end, we can search the delimiter first).
    Note that there's a proposal to relax requirements to extension names
    that would make Zvl* and Zve* valid:
    <https://github.com/riscv/riscv-isa-manual/pull/718>
    and RFC PATCH v2 is compatible with this propsed rule.
    Valid ISA string as per current ISA Manual is not affected by this
    (for "H"-extension, implementing such relaxed parser is impossible).

Fix in v2: Parser bug 1 in v1
    Following sequence is now parsed correctly
      (that bug occurred from the nature of greedy matching):
    1. Valid extension name
    2. Major version
    3. "P"-extension without any version number
    4. Next extension (or end of the string)

Fix in v2: Parser bug 2 in v1
    Full parser in v1 breaks too early when version number causes an
    arithmetic overflow or conflict with magic number (UINT_MAX, handled as
    unversioned), that would make the parser v1 misunderstand that non-
    existent "P" extension exists.
    That also caused full and minimal parsers don't produce the same
    tokenization result.

Those changes will change the parser behavior as follows:

Legend:
    [] : Valid token (either prefix or an extension + optional delimiter)
         note that "valid" does not necessarily mean "correct".
    <> : Invalid token (ext_err != 0)

"rv32imafzvl64b_zve64f" (backward parser [new in v2] involved)
    v1 : [rv32][i][m][a][f][zvl64][b_][zve64][f]
    v2 : [rv32][i][m][a][f][zvl64b_][zve64f] (intended)
"rv64b1pv" (parser bug 1 in v1 involved):
    v1 : [rv64]<b1p>[v]
    v2 : [rv64][b1][p][v] (correct)
"rv64i2p1" (parser bug 2 in v1 involved):
    v1 : [rv64][i2p1]
    v2 : [rv64][i2p1] (same; as long as no overflow in major version)
"rv64i4294967296p1" (now major version causes overflow):
    v1 : [rv64]<i4294967296>[p1]
    v2 : [rv64]<i4294967296p1> (correct)


Tsukasa OI (4):
  riscv: cpufeature: Correctly print supported extensions
  riscv: cpufeature: Minimal parser for "riscv,isa" strings
  riscv: cpufeature: Extract extension names from "riscv,isa"
  riscv: cpufeature: Full parser for "riscv,isa" strings

 arch/riscv/kernel/cpufeature.c | 119 +++++++++++++++++++++++++++++----
 1 file changed, 105 insertions(+), 14 deletions(-)

-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
