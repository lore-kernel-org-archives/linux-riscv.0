Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AB4C48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:49:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 164176109E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 164176109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r0eFXjEYlW+bV2zhxHYaf7BbrEFV/63LJark43J52sY=; b=QJEOKSwx/ep8KD
	NREg116aNGsqQ7UZmKRdwmtictsnC9mWwHb7rcNXwFPKEdGUwEVv3o4UZnx8ZKF+n7dHP1wIa9ceG
	D5Wd/EVvZmSLslrtwTi6/ZSJZhCQWRXAcOkfmSUuMzVitThHmi6R5fBSmj6hs95/WYXk4vp1A2o9n
	yFfVAFlHp4tX6MwxbWw4reGgfMixxwRYrXa+NqJFHe3EokB3FJhvat4Nb4R28GqJdnU1gED5D04Z1
	r2AMLimm1Uo9UrZ6J0BX7X+7bLoU2MhYdi3+A0LOvE4XgXdSHIuWoGnm4UIl+eanq0WGTolmHTlhV
	C66gAu9wVd+KtsZDonUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGw8-003JPJ-Vc; Tue, 15 Jun 2021 21:49:32 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltDdD-0023Nr-87
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 18:17:51 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:bda0:7de0:767e:26f9])
 by michel.telenet-ops.be with bizsmtp
 id HWHe2500A4N5gS306WHefl; Tue, 15 Jun 2021 20:17:42 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ltDd4-00HYOO-4w; Tue, 15 Jun 2021 20:17:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ltDd3-005qAB-MU; Tue, 15 Jun 2021 20:17:37 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] Add generic-support for linux,elfcorehdr and fix riscv
Date: Tue, 15 Jun 2021 20:17:24 +0200
Message-Id: <cover.1623780059.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_111747_468525_6E796E5B 
X-CRM114-Status: GOOD (  19.88  )
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

	Hi all,

While working on v4 of "[PATCH v3] ARM: Parse kdump DT properties", I
noticed the recently (v5.13-rc1) introduced RISC-V crash kernel support
uses "linux,elfcorehdr" in a non-standard way.  Instead of relying on a
"linux,elfcorehdr" property under the "/chosen" node, RISC-V uses a
reserved memory node with the "linux,elfcorehdr" compatible value.

As we may want to fix riscv before the release of v5.13, I decided not
to wait until my full v4 is ready, but fast-track generic
"linux,elfcorehdr" handling instead.

This series consists of 3 patches:
  1. Generic handling of "linux,elfcorehdr", as requested by Rob in a
     review comment for [1],
  2. Drop the non-standard code from riscv.  It can just use the generic
     code instead (needs corresponding changes to WIP kexec-tools),
  3. Drop the now duplicate code from arm64.  This can be postponed, as
     it can co-exist safely with the generic code.

This has been tested on arm32 (with a WIP successor of [1]), and
compile-tested on riscv64 and arm64.

Thanks for your comments!

[1] "[PATCH v3] ARM: Parse kdump DT properties"
    https://lore.kernel.org/linux-devicetree/20210317113130.2554368-1-geert+renesas@glider.be/

Geert Uytterhoeven (3):
  of: fdt: Add generic support for parsing elf core header properties
  riscv: Remove non-standard linux,elfcorehdr handling
  arm64: kdump: Remove custom linux,elfcorehdr parsing

 Documentation/devicetree/bindings/chosen.txt |  6 ++--
 arch/arm64/mm/init.c                         | 21 -----------
 arch/riscv/mm/init.c                         | 20 -----------
 drivers/of/fdt.c                             | 37 ++++++++++++++++++--
 4 files changed, 37 insertions(+), 47 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
