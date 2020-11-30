Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54AAAC64E8A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 15:37:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5619207F7
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 15:37:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KlPpX2iB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAX1dK/K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5619207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BMaxEj5tBSvLrvm3aqOrMX83iCNEAIWeRwEJUWNnfdg=; b=KlPpX2iB5d/fjlYfAGm2mre1SA
	o2NQnnhBWyxXkEVX91WPX/rauPtBK9sJSEiXzPrLGegiLBLq6p4TadGbkEEjLemgzbejvuPuBpRZt
	3sVj0UX/eb18Bq8K1TsDwopo8s6CHtqQhUJoGUciiw8zKbCtGGKiOgYewDwUCAbL3PgdDreqAL232
	MwmHhtdeaHIvTUEehjZeJ2JCeNuKHwCESUnBQLz4W84jlYgULwUgDNSk3k7iuw/Sz39BukxU9p3U/
	NzIgA4ClgIbWOuEVjvtTe4x/uDABqz9Mv6iRW53/8qevrB/w6IzQoE+A1w2bR1RJt5a5rDBLA5mRg
	x2FTlJFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjlEW-0000uw-59; Mon, 30 Nov 2020 15:36:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjlEM-0000qK-QB; Mon, 30 Nov 2020 15:36:48 +0000
Received: from mail.kernel.org (ip5f5ad5b3.dynamic.kabel-deutschland.de
 [95.90.213.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15E11208DB;
 Mon, 30 Nov 2020 15:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606750605;
 bh=Nq7nieU9NxFApiiKqP1AICqSGy1X7FthNYZ1ce3w7kc=;
 h=From:To:Cc:Subject:Date:From;
 b=uAX1dK/KSSKf4Arojv/EDH+dOAzk9oYTaBF/88x9pGVVKS4rmWxOABF74+EklXubT
 3+gsW9AXa1g6BYYtD5C2JQEufVOJpgzUdCkv/M3UdVc749uXzTGDSzsP8ZCOpFGEQ1
 WwhTpLqH+/ozooez/Vwhu2kwSmK5XfW3EFpaJgKI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kjlEI-00CjvH-B9; Mon, 30 Nov 2020 16:36:42 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 0/6] Add documentation for Documentation/features at the built
 docs
Date: Mon, 30 Nov 2020 16:36:29 +0100
Message-Id: <cover.1606748711.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_103647_026057_71FDBDA6 
X-CRM114-Status: GOOD (  20.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Jon,

This series got already submitted last year:

   https://lore.kernel.org/lkml/cover.1561222784.git.mchehab+samsung@kernel.org/

Yet, on that time, there were too many other patches related to ReST
conversion floating around. So, at the end, I guess this one got missed.

So, I did a rebase on the top of upstream, and added a few new changes.

Patch 1 contains the original implementation back then. It adds a
get_feat.pl script that parses the contents of Documentation/features.

Patch 2 is new: it re-implements the output of the full contents of the
features table as a set of per-subsystem tables. 

Patch 3 replaces the existing Documentation/features/list-arch.sh
by a call to the new script, in order to avoid having two scripts
doing the same thing.

Patch 4 is a sphinx extension to allow generating features output
via a meta-tag.

Patch 5 adds a complete feature list covering all archs at the
admin guide.

Patch 6 adds a per-arch feature list on each architecture book.

-

The scripts/get_feat.pl supports several types of output:

- $ scripts/get_feat.pl current

  Outputs the supported feadures by the architecture of the
  running Kernel, as an ASCII table;

- $  scripts/get_feat.pl list

  Outputs the supported features on an easy to be parsed
  format. By default, it uses the current architecture as well;

- $  scripts/get_feat.pl rest --feature jump-labels

  Output what architecture supports a given feature
  (on the above example, "jump-labels" feature)

- $ scripts/get_feat.pl rest --arch um

  Outputs the features support for an specific architecture
  (on the above example, for "um" architecture.

- $ scripts/get_feat.pl rest

  Outputs a text file with ASCII tables (ReST compatible)
  with all features, grouped per subsystem.

  E. g. something like:
	
        ===================================
        Feature status on all architectures
        ===================================
        
        Subsystem: core
        ===============
        
        +---------------------+---------------------------------+-------------------------------------------------------------------------+------------+------+
        |Feature              |Kconfig                          |Description                                                              |Architecture|Status|
        +=====================+=================================+=========================================================================+============+======+
        |cBPF-JIT             |HAVE_CBPF_JIT                    |arch supports cBPF JIT optimizations                                     |alpha       |TODO  |
        |                     |                                 |                                                                         +------------+------+
        |                     |                                 |                                                                         |arc         |TODO  |
        |                     |                                 |                                                                         +------------+------+
        |                     |                                 |                                                                         |arm         |TODO  |
        |                     |                                 |                                                                         +------------+------+
        |                     |                                 |                                                                         |arm64       |TODO  |
        |                     |                                 |                                                                         +------------+------+
        |                     |                                 |                                                                         |c6x         |TODO  |
        |                     |                                 |                                                                         +------------+------+
        |                     |                                 |                                                                         |csky        |TODO  |
        |                     |                                 |                                                                         +------------+------+
        |                     |                                 |                                                                         |h8300       |TODO  |
        |                     |                                 |                                                                         +------------+------+
        |                     |                                 |                                                                         |hexagon     |TODO  |
...

Adding those patchsets will basically place the contents of all
files under Documentation/features (currently, 45 files) at the
Kernel documentation, which is, IMO, a good thing to do.

Regards,
Mauro

Mauro Carvalho Chehab (6):
  scripts: get_feat.pl: add a script to handle Documentation/features
  scripts: get_feat.pl: improve matrix output
  scripts: get_feat.pl: use its implementation for list-arch.sh
  sphinx: kernel_feat.py: add a script to parse feature files
  docs: admin-guide: add a features list
  docs: archis: add a per-architecture features list

 Documentation/admin-guide/features.rst |   3 +
 Documentation/admin-guide/index.rst    |   1 +
 Documentation/arm/features.rst         |   3 +
 Documentation/arm/index.rst            |   2 +
 Documentation/arm64/features.rst       |   3 +
 Documentation/arm64/index.rst          |   2 +
 Documentation/conf.py                  |   2 +-
 Documentation/features/list-arch.sh    |  17 +-
 Documentation/ia64/features.rst        |   3 +
 Documentation/ia64/index.rst           |   2 +
 Documentation/index.rst                |   2 +-
 Documentation/m68k/features.rst        |   3 +
 Documentation/m68k/index.rst           |   2 +
 Documentation/mips/features.rst        |   3 +
 Documentation/mips/index.rst           |   2 +
 Documentation/nios2/index.rst          |  12 +
 Documentation/openrisc/features.rst    |   3 +
 Documentation/openrisc/index.rst       |   2 +
 Documentation/parisc/features.rst      |   3 +
 Documentation/parisc/index.rst         |   2 +
 Documentation/powerpc/features.rst     |   3 +
 Documentation/powerpc/index.rst        |   2 +
 Documentation/riscv/features.rst       |   3 +
 Documentation/riscv/index.rst          |   2 +
 Documentation/s390/features.rst        |   3 +
 Documentation/s390/index.rst           |   2 +
 Documentation/sh/features.rst          |   3 +
 Documentation/sh/index.rst             |   2 +
 Documentation/sparc/features.rst       |   3 +
 Documentation/sparc/index.rst          |   2 +
 Documentation/sphinx/kernel_feat.py    | 169 ++++++++
 Documentation/x86/features.rst         |   3 +
 Documentation/x86/index.rst            |   1 +
 Documentation/xtensa/features.rst      |   3 +
 Documentation/xtensa/index.rst         |   2 +
 scripts/get_feat.pl                    | 552 +++++++++++++++++++++++++
 36 files changed, 810 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/admin-guide/features.rst
 create mode 100644 Documentation/arm/features.rst
 create mode 100644 Documentation/arm64/features.rst
 create mode 100644 Documentation/ia64/features.rst
 create mode 100644 Documentation/m68k/features.rst
 create mode 100644 Documentation/mips/features.rst
 create mode 100644 Documentation/nios2/index.rst
 create mode 100644 Documentation/openrisc/features.rst
 create mode 100644 Documentation/parisc/features.rst
 create mode 100644 Documentation/powerpc/features.rst
 create mode 100644 Documentation/riscv/features.rst
 create mode 100644 Documentation/s390/features.rst
 create mode 100644 Documentation/sh/features.rst
 create mode 100644 Documentation/sparc/features.rst
 create mode 100644 Documentation/sphinx/kernel_feat.py
 create mode 100644 Documentation/x86/features.rst
 create mode 100644 Documentation/xtensa/features.rst
 create mode 100755 scripts/get_feat.pl

-- 
2.28.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
