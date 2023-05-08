Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DE2C77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 18:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TWkzlddRWheFgnhIObKZ9XhT4kgjWlsKGifN6YdK7Ug=; b=2aZyCj9NVOo2xo
	BtrbwN8yWoaeLQxa5Reepa3v9fkEOzjBvPVkc9NxDW+khMc3NhdCnJFsonxTx7/6nmfKI/X1q5YQM
	CXG3u4iJ8GlT/eVlfE90l4iZj+vbF3Veyf/wEVf9u99EdiL/dSiMPmzCYFQC+p/6BtiafNlXgoJkB
	7gLmFKYGheMQFkZZnc9Hr+hNUhDyiirstqHeL/Mpgzfmkj4CsGLNJCcPzxzB/60tR0JrMbWDA16eG
	WCIFs8c8ZRHU5dmoNB1xUjVuqWpC6/vD9mKWS/wkiD1hDXNogOO470Dh+1h5pQJjt0lQMovc/W34u
	hKJN+YXnYxSkHDzsvvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw5Sl-00177h-2S;
	Mon, 08 May 2023 18:19:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw5Pw-0016c1-0z
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 18:19:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8816260F3C;
	Mon,  8 May 2023 18:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471E9C433EF;
	Mon,  8 May 2023 18:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683569816;
	bh=HQKjgEandZ7yrhoRvbhurPdTXLmyv0PoCHU9UNwCZAs=;
	h=From:To:Cc:Subject:Date:From;
	b=VcUx6irzE94UjDA0HBZQPWPxj4M09yMYvWyJPM3sNiakHG0KzoqJBHotGT0qZ9mUf
	 6eqtt5SQDlYEJwHlpSfXql20CCnthWwKeN98poxnsWh7fKIb7WK5ZwCE0LGx9Po/Fj
	 m0Uej7h8WJdFKwcg28Gwm/qZQeA/nddf1wWHkycUCZo5o13x4SNUd3REgiIifLD+PE
	 v99Dd6gSHPUazDbjRNHvWp32IEGrHzGJ9ETcZpZUZoTnel8PUjGF5sAKUCJTqELqOP
	 Aj6zkyI6+veDiU5YSpiQRm1vGtGmazYWOndmLOOyIMTxMYpM8fqDLFINF0cPZG6lTH
	 BnIWKgKcwa1zg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [RFC 0/6] Deprecate riscv,isa DT property?
Date: Mon,  8 May 2023 19:16:20 +0100
Message-Id: <20230508-hypnotic-phobia-99598439d828@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8202; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=jQeUcaUb20GXrwJoy3Hh5iov8esBjuipopu2ytSm8to=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmRNqW6TB6VTv3vyvYeq5iYsumq0Q+DN5XbDiz+eOxYy 8tILuutHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIrquMDP1eOyf5swrqPQxW PPk+Z43pyv0zOPZYdDmUmk+pX2Yk2c7w3/XiFZbMio81C25JHJwsWPEpz2jbL6eXNmxfJv4TWnT jPRMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_111951_827745_DB8B8C09 
X-CRM114-Status: GOOD (  42.53  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Yo,

So here's some bits that I have been poking at on top of the recent bits
of ISA string parser work:
https://lore.kernel.org/linux-riscv/20230504-divisive-unsavory-5a2ff0c3c2d1@spud/

TL;DR is that I do not trust the riscv,isa property to carry sufficient
information to not cause us problems in the future.

Note that this is a very very early RFC, and the implementation etc is
intended to be *demonstrative* rather than acceptable.

Problem
=======

I've been kinda triggered by the whole "Zicsr and Zifencei are not part
of i" thing, where the dt-binding was defined prior to that split and
thus `i` means `zicsr_zifencei` without a real way to differentiate
between the two. From a Linux kernel point of view, it's "fine" because
we require require Zicsr and Zifencei, so a system without them will not
get far enough along for this problem to even manifest - but that's just
the example that we already have in front of us & we don't know what
might be done in the future when it comes to backwards-compatilibty
issues.

Yes you might say, expand the dt-binding to allow the version numbers,
as the Linux kernel's parser already supports strings containing the
version number (although it just ignores them). But that may not be the
case for any other consumer of the riscv,isa property - and such an
expansion of the dt-binding may actually cause them problems. A valid
parser for the current dt-binding may very well fall over if it is
expanded to allow free-form numbering.

Secondly, it is not realistic to maintain a list of every possible
version that someone may insert for every extension to do an explicit
comparison, nor can we rely on RVI interpreting "backwards compatible"
in a way that means software intended for the older version will still
run. (Or for that matter, can we rely on vendors *at all*).
If we could rely on that, then we could at least read "x2p2" and realise
that we can fall back to "x2p0", but I don't think we have that luxury.

The other thought I had was that perhaps some software may choose not to
implement version x.y.0 of an extension and only support x.z.0, z > y
for some reason. We'd want to refuse that extension if the extension is
found, but the version is not listed as being something compatible with
x.z.0, and while the ISA spec does say that the default assumption is
2p0 for unversioned extensions in its current form, I struggle to
extrapolate that to extensions not currently part of the unpriv spec,
but rather defined on their own.

Proposal
========

Instead, I propose a per-extension key/value property, for example
riscv,isa-extension-v = "v1.0.0"
in the style of compatible strings - so the value is not what hardware
implements, but rather the minimum-known version for which the
programming model is compatible.
Until something comes along that is not compatible with v1.0.0 that we
want to support in the kernel, no new keys need to be added to the
kernel, just changes to the dt-binding.

The binding for it is currently set up so that either you need to
be compatible version with v1.0.0, or add a special case. Although
v1.0.0 in this case is just a placeholder number, it could be v2.0.0 or
any other number. It could even be "initial" to something like that, to
match against whatever the first released spec version is.

	As an aside, the dt-binding doesn't actually work properly for
	enforcement etc at present, but I wanted to get some feedback
	before going too far down the rabbit hole there.

This method gives us the implemented version -> compatible version "for
free", as it is done by the creator of the DT, rather than software
running on the platform.
We can hopefully be strict about what people are inserting version wise,
using dt-validate, rather than it being pot-luck as to what gets filled in,
if anything.
I'm very reluctant to add more complexity to the property, and therefore
parsers, when a key-value type interface is more easily used with
standard OF functions - of_property_present(), of_property_read_string()
etc to use the Linux kernel's examples.

Another benefit of this approach is that we, by way of the dt-binding,
control the meaning of the versions.
If a vendor decides to release something using Xfoo, but provides no
version information, we can then assign one ourselves in case Xfoo in
their next SoC is not quite the same. Something similar came up this
morning, talking with Heiko about the TH1520, and how to explain the
meaning of "_xfoo" properties in "riscv,isa". The ISA spec documentation
is pointed to by the binding for that, but vendor properties are
obviously not described there. At the expensive of bloating the binding
file, the proposed scheme would provide a way to stably document vendor
properties.

I guess I am trying to design in some flexibility rather than two years
down the line realise that the isa string is a source of problems, and
have to try and retrofit something in.

I would like to encourage people to populate their DT with every
extension under the sun that they support, even if software doesn't use
it right now (look at the starfive folk that didn't add the bitmanip
until told to) so that if/when it is used in the future these boards
will pick up the support automagically.

ACPI
====

This whole proposal is written for a pre-ACPI world, and I have yet to
give any thought to how such a key-value interface would work there.
I'm not really sure how to deal with that, given they have some ECR
process yada yada, but thoughts on that side of things would be very
much appreciated.

Why x.y.z rather than x.y per the ISA specs?
============================================

I said the same, Palmer wanted x.y.z. For example, the T-HEAD vector stuff
is 0.7.1 & he cited an example (that now eludes me) of a breaking change
in an extension between 1.0 and 1.0.1. God knows how vendors will choose
to version things, so having the extra level is likely advantageous.

Other stuff
===========

The code here is very much in an RFC state. I tested it on an Icicle kit
as a PoC - and it does work, but I have not even remotely tested it
sufficiently.

The dt-binding changes need to be worked on as they do not actually
enforce anything!

I've intentionally only send this to the linux lists, despite this
having wider impact, as it is in a very early state & there's no point
involving all & sundry if the idea is hated.
If it is not universally derided, I will send the binding patches to
various other lists also.

What do I hate about this?
==========================

I fear bloat in the dt-binding and devicetrees as properties are added
mostly. Depending on what I have to do to get enforcement with
dt-validate, a complicated binding is also a concern.

Suggestions etc very much welcome :)

Cheers,
Conor.

CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Sunil V L <sunilvl@ventanamicro.com>
CC: Yangyu Chen <cyy@cyyself.name>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org

Conor Dooley (6):
  dt-bindings: riscv: clarify what an unversioned extension means
  dt-bindings: riscv: add riscv,isa-extension-* property and
    incompatible example
  RISC-V: deprecate riscv,isa & replace it with per-extension properties
  RISC-V: add support for riscv,isa-base property
  RISC-V: drop a needless check in print_isa_ext()
  riscv: dts: microchip: use new riscv,isa-extension-* properties for
    mpfs

 .../devicetree/bindings/riscv/cpus.yaml       |  64 +++++-
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  42 +++-
 arch/riscv/include/asm/hwcap.h                |  29 ++-
 arch/riscv/kernel/cpu.c                       | 124 +++---------
 arch/riscv/kernel/cpufeature.c                | 188 +++++++++++++++---
 5 files changed, 316 insertions(+), 131 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
