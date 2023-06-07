Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3848C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 20:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NAB1wKjwy9xq1cj/ZKXreBEjbQLfwbOYAaLjCImhnmk=; b=ilue1CKwW3Rurs
	wKXaM5tCMbeldlN8MdqMYDtKvZ2a0BacKfYbOnWPQK0CuzBtL7XQoiBA16QZ0bo8G+eGlSS5fkgog
	Q0IiVPYMjmglNi7fF2hzcpDAx8THbhw1KBajWV5St4VYvYzhiHvZ0DDFD6tlgEk/8kNkIi+opAszt
	d/KW/NfH84zf1dKzeXYbSFqPd7SvjHkioeyXGo0hfa5p4/I0wdXDrPHIiGq2OAJhAJZmvYFQLddkD
	qBmHJMCbcZGrhV/wc8YpBQqyVcSEUnhF7MJ8zxWSqQ2zM0HPM9fIaJ/JO1x4DBmtXRqgu5v/OvMVN
	heReqTADbNqpAJ7GmNJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zlt-0077jw-2Y;
	Wed, 07 Jun 2023 20:28:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zlr-0077jM-1w
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 20:28:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 31BB5644B7;
	Wed,  7 Jun 2023 20:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6097CC433EF;
	Wed,  7 Jun 2023 20:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686169722;
	bh=waFK5kLMrmxdcf8BoXCLCDoZSqL5SAuwXp+FuPQpoZw=;
	h=From:To:Cc:Subject:Date:From;
	b=krbZ00djH859djBX5rI8lonTQ3WoLNyME7x6A34zwPaNuLHfDPLG1tDQxPsLMkRms
	 SLcaAW0BHyYcw2lwPvRVPSCQS6OO9eJCe4MImVkbDHZKENNpmuIAoJhrPQKRySqqSo
	 KZ+NDAW3wdB13VYvOQYGwLc4N+9XyQ5kxEfjWEz3M1sK1bMxkBEseUIPp5ruWzYuhb
	 OzGa2+ysaA30TS2+jUEfwEFzhe3/oTneMYrpLHb/+uHp0NR2pTLerxnw7kva5gl4Rs
	 JSleEzVBpSAL0/CWXK1KsNX5uYcFlG+MNcv3GCSk0vroXRjpRj+MeIwCfaWnIg4Kth
	 JhxvxzJpVoSyQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v3 0/7] ISA string parser cleanups
Date: Wed,  7 Jun 2023 21:28:24 +0100
Message-Id: <20230607-audacity-overhaul-82bb867a825f@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2999; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=yV+jz68736Xeb27tDH2mS7GBdaZ/fpg7kYJKNVjbQgA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkNLzLu3rg5RWOPFvPB+qPJVadzsmLMHP3P3o1y2d1y4 FZfh/qcjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEyE7QDDbxZ73hDeRW9ZYjT6 81onH5Zl97lhtK7+n/L+32sPntthcoLhf2ROeVbxcrELhy2iDAqqzrEE1pcu7qtYwn9DiufqmZw ZfAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_132843_717984_01F343CB 
X-CRM114-Status: GOOD (  16.79  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

With that out of the way, here are some cleanups for our riscv,isa
handling.

Here are some bits that were discussed with Drew on the "should we
allow caps" threads that I have now created patches for:
- splitting of riscv_of_processor_hartid() into two distinct functions,
  one for use purely during early boot, prior to the establishment of
  the possible-cpus mask & another to fit the other current use-cases
- that then allows us to then completely skip some validation of the
  hartid in the parser
- the biggest diff in the series is a rework of the comments in the
  parser, as I have mostly found the existing (sparse) ones to not be
  all that helpful whenever I have to go back and look at it
- from writing the comments, I found a conditional doing a bit of a
  dance that I found counter-intuitive, so I've had a go at making that
  match what I would expect a little better
- `i` implies 4 other extensions, so add them as extensions and set
  them for the craic. Sure why not like...

There's a trivial numbering conflict with Evan's Zb* additions.
The other thing to consider is whether some of the extensions I am
explicitly enabling make sense in the context of ACPI. I've made sure
not to enable them where I am not sure.

Cheers,
Conor.

Changes in v3:
- Rebase on top of ACPI support & drop a patch that landed in that
  series

Changes in v2:
- Pick up tags on most patches
- Drop some dt specifics from a parser comment
- Add Zicntr and Zihpm to the "always report" patch
- Note the Zicntr and Zihpm bits in the binding in a new patch.

CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Sunil V L <sunilvl@ventanamicro.com>
CC: Yangyu Chen <cyy@cyyself.name>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org

Conor Dooley (7):
  RISC-V: simplify register width check in ISA string parsing
  RISC-V: split early & late of_node to hartid mapping
  RISC-V: validate riscv,isa at boot, not during ISA string parsing
  RISC-V: rework comments in ISA string parser
  RISC-V: remove decrement/increment dance in ISA string parser
  dt-bindings: riscv: explicitly mention assumption of Zicntr & Zihpm
    support
  RISC-V: always report presence of extensions formerly part of the base
    ISA

 .../devicetree/bindings/riscv/cpus.yaml       |   4 +-
 arch/riscv/include/asm/hwcap.h                |   4 +
 arch/riscv/include/asm/processor.h            |   1 +
 arch/riscv/kernel/cpu.c                       |  34 +++++-
 arch/riscv/kernel/cpufeature.c                | 108 ++++++++++++++----
 arch/riscv/kernel/smpboot.c                   |   2 +-
 6 files changed, 123 insertions(+), 30 deletions(-)


base-commit: 748462b59f901557377b2c33ea9808ff2000e141
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
