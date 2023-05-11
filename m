Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4A4C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 14:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=veO0HYp3PhmCLEC2l+6IIKwU1/JIJ4d4W6K3S+MxOZQ=; b=4VoPdk9R5TJDTO
	ii85pjMKcLk9XerpfnHrq0O8CsX3KlyWEiz77UTKIB9bMYOLW+c6zgQXKbyxqLcafJHlHs9zv6+sQ
	uirHWuNWwkzEjAWtpcJ/Gs0a5atsMu/5q07CxkwOVf3nx085CLN+dM309vtfrXVtF+zF1O0qMWSTj
	fPiWCdy9pEC3ND6uTn82MRmv6DiotEdn7mhUWojTckT2zZsLavpaYHhQZpIRVvb6/N1I+0NhkvztA
	eYNcn8BLirbzoW0KspIiJhTJItXg2kmpIYa9wLT0kSW2hukm7Q+T7+5iDFNtXzi33Mdds2OaO/+/6
	RqYQCtAgGGcfEL5wmueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px7Su-0095Sq-2k;
	Thu, 11 May 2023 14:40:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px7St-0095QT-08
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 May 2023 14:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=lSAOMbeKXO5XEGF5ox8ve7P5ACgU+KonTkT5IMfpjyE=; b=HfS7XgFNWugOEa/+ma9c2IV6N0
	NfrX5Eq0z33iojIh6ahfskD2kkpPLMjCmYa+oKyIllemt+dmK93mVfTnpAKv3ajugLyr3zTlD377l
	iCqqrokoC2T/X5anvPG2zj/uKqRmy2OWog88sGrkmrAJwIKrpPl4cDlGSiZUr7LjX3KI7QDZfKpVv
	tj/4SfGIMdxw2+hVBNAFOqJrBY/aIWurfhwfhmGuxbb0hrVDY7CBYIUXf643IKr6BzlGAGQBvyRKU
	blaA3Zvt+lsCxdvTCjNNf4V90vFQu3iMqoqL3DClvfr8ynWxokux4j8jNnut1rWnlAzrgs40IP/CY
	dFMt/Zvw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px7CW-008GAG-02
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 14:23:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE1D6636FC;
	Thu, 11 May 2023 14:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE3FC4339B;
	Thu, 11 May 2023 14:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683814998;
	bh=ttH63jm3oRXZocNrzbxAhA7UBN+8YVEox9ekGGVcYR4=;
	h=From:To:Cc:Subject:Date:From;
	b=jcQ8/lb8jG/eXSbSQ+XOukeP6fiMjxMNAHRGswnfJWJSA8ZN9cYOCk8QF4TgIHCyK
	 CVaTJdz6iQhaAR8iGuUbjl9RB8PGFnAI2K/gHl1dpN8NzcGq/3Elxa5NKBdh0tvhlu
	 yHxluj4e9zLA5rMniU07TSvx8XWgFBdCzzIPzqX9w9U02uEyY0uZCHGK5G+I1chxw0
	 /UET0S2RPJisdLI94Q9oZFTkqO9dd6bCDMJqGhZHirBWBIrnQ/tqCW+XPfI1brvo2i
	 VyqAon31aX+YIDTDFwKxoffiHCWUPF82DmlXhbULi2SE2onh3N++hf6CCaGQ1Mc7yD
	 Yx+aWDbkTfHIw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Date: Thu, 11 May 2023 22:12:07 +0800
Message-Id: <20230511141211.2418-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_152324_294830_849B1AB2 
X-CRM114-Status: UNSURE (   9.46  )
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

When trying to run linux with various opensource riscv core on
resource limited FPGA platforms, for example, those FPGAs with less
than 16MB SDRAM, I want to save mem as much as possible. One of the
major technologies is kernel size optimizations, I found that riscv
does not currently support HAVE_LD_DEAD_CODE_DATA_ELIMINATION, which
passes -fdata-sections, -ffunction-sections to CFLAGS and passes the
--gc-sections flag to the linker.

This not only benefits my case on FPGA but also benefits defconfigs.
Here are some notable improvements from enabling this with defconfigs:

nommu_k210_defconfig:
   text    data     bss     dec     hex
1112009  410288   59837 1582134  182436     before
 962838  376656   51285 1390779  1538bb     after

rv32_defconfig:
   text    data     bss     dec     hex
8804455 2816544  290577 11911576 b5c198     before
8692295 2779872  288977 11761144 b375f8     after

defconfig:
   text    data     bss     dec     hex
9438267 3391332  485333 13314932 cb2b74     before
9285914 3350052  483349 13119315 c82f53     after

patch1 and patch2 are clean ups.
patch3 fixes a typo.
patch4 finally enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION for riscv.

Jisheng Zhang (4):
  riscv: vmlinux-xip.lds.S: remove .alternative section
  riscv: move HAVE_RETHOOK to keep entries sorted
  riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
  vmlinux.lds.h: use correct .init.data.* section name

 arch/riscv/Kconfig                  | 3 ++-
 arch/riscv/kernel/vmlinux-xip.lds.S | 6 ------
 arch/riscv/kernel/vmlinux.lds.S     | 6 +++---
 include/asm-generic/vmlinux.lds.h   | 2 +-
 4 files changed, 6 insertions(+), 11 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
