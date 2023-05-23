Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54F2C7EE2D
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 17:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J+z6fmEdOq6A2DGrnNtcSSRKixjRudc6qDpLTdC49fc=; b=jPQhc/x29xfqGw
	E+xLUILYe5/XWg+0+TpmkT+V+9KhUmmuIQ2b5BiCzQYBUnw/QZGZ3ReRXnTamflekV0Gr7ppfIObD
	ehy5FJVpMhNKEF7+AqEUfHVn1Zag1mwlbAFMZehStCtAXOd3Z7HP4J4nuTizMHib2VUVcQUsYLVAi
	7MJGWrYsikEQhpSWoS4pg6TmoktV37Z9gf2PlLYt87qrtMqh0xIIrMVU9dEkWgXwcxVzV0tPkqipi
	S9BV7CiBZCsByumX7bEj7HsDEOxbhJDZaE/IsDjfgJ2jbGRm5TCJoNugo5XV4xrM1PGN4jTOQ31js
	CfnBqzZU7QbGbMGnZ7pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VSm-00AtrN-0N;
	Tue, 23 May 2023 17:06:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VSj-00AtpS-1V
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 17:06:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A0816186E;
	Tue, 23 May 2023 17:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466B5C433D2;
	Tue, 23 May 2023 17:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684861573;
	bh=O4HzR93cVyWgDZI2VtGL8GGS2znNViXwdOo0oYNScmQ=;
	h=From:To:Cc:Subject:Date:From;
	b=S9susCoorlA+c7uqs58+sjbap9DCpSH16D6qnZjnn4qMOmF9hDSX7WFNdJoytkDy+
	 TJAOF76W5AoLfrS0i5hCoGI/Dd1rke+vhNX0Nk8gJIVY0WlzZMymoTxgUTZfJl85+R
	 KIyTvCf2J4alkJKeJs79j190Xw41NQJpUOQ0yA83g5p7kaFcPFUG4KbCXHat1zRwH5
	 nnh9lg91Ok6B44pGoWtSVRf2v4Qw4oA4czgifYOOZ6gzvb/r6dVwCe8j4qycsXvvj9
	 neJq4SboSHhxqkNBepoZNv0bgNBgHMVMkc5aFlw1OTddb4KX3ntcqTtic8rQ7HMZPr
	 Sip+jFo6uxigg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Date: Wed, 24 May 2023 00:54:58 +0800
Message-Id: <20230523165502.2592-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_100617_564778_2453A9C1 
X-CRM114-Status: GOOD (  11.50  )
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

NOTE: Zhangjin Wu firstly sent out a patch to enable dead code
elimination for riscv several months ago, I didn't notice it until
yesterday. Although it missed some preparations and some sections's
keeping, he is the first person to enable this feature for riscv. To
ease merging, this series take his patch into my entire series and
makes patch4 authored by him after getting his ack to reflect
the above fact.

Since v1:
  - collect Reviewed-by, Tested-by tag
  - Make patch4 authored by Zhangjin Wu, add my co-developed-by tag

Jisheng Zhang (3):
  riscv: move options to keep entries sorted
  riscv: vmlinux-xip.lds.S: remove .alternative section
  vmlinux.lds.h: use correct .init.data.* section name

Zhangjin Wu (1):
  riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION

 arch/riscv/Kconfig                  |  13 +-
 arch/riscv/kernel/vmlinux-xip.lds.S |   6 -
 arch/riscv/kernel/vmlinux.lds.S     |   6 +-
 include/asm-generic/vmlinux.lds.h   |   2 +-
 4 files changed, 11 insertions(+), 16 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
