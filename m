Return-Path: <SRS0=E2Nt=XW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F0FC4360C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 00:09:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7E53207FF
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 00:09:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iyBt8mF+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="PQU2TQdD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7E53207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vsos4B+MkjB/76FIy3eHi5ZQ9oP8/PI1m/9V/jPQLtE=; b=iyBt8mF+b/rRFG
	okTwItaHmZ94DDvyVfkDt05dGBDCkbhOYA/1nZCvsq9XnpyoU6+U7weLhE6Q75f8zBi9Yu48epaUv
	eQLJNXw0G8Ln5HsE4hXHJ+izpxEOHJRu92b3Nt5qc5N+yeTLLEycSDd7X3AbtV6+UROlZrxpWgt0J
	8c83f2jtllukbpfVwyD9mIU34TsGfqe/5z3MjGo6R4F3qUhwQS+iW7FSgKJYyZ4FdMbmYYZXSLw2G
	u0Rt65Se0E48ULGK3NZiUjh+sWe/TExy/qykkwRjKmS28RcgCE5TSWYe4xiPHZ8WFDV4S9hju8kDi
	T5duc15x8FCEzfJDfeFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDdpE-0006j0-LJ; Fri, 27 Sep 2019 00:09:32 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDdpB-0006i5-Mh
 for linux-riscv@lists.infradead.org; Fri, 27 Sep 2019 00:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1569542992; x=1601078992;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s8wencevRmeMDEGXC4oPCf69aZsPiCihnU+edmEPkWw=;
 b=PQU2TQdDlcqfQRLHQvTH9i2e280WxVOoQns9Nb5hIw4npSXWumrI4Xdj
 KJ+kVY1p2N7+y9xnK+ouWtFEUn3NpmIOEKA0cJDskkoT9HNyRWbLiQyc8
 EZxIY5noE6e1I1OgYAYmm56Pp6J4bsVaUy0aKUug5fPlgBX8egzSEBKdP
 5EKVwM1emwK5T10FoH42fa1PRWAwc2H6jmBA+aFUDaPBuBAK8ffsbE0TV
 WDWSax4fFh53uag89SU/XrJ5hrb2ZriRHl5dzjp12Yx/UloTgMmAqypHR
 80I4r7upi4oi7hsIiJUEmthbeNp0lhK6eHVUwebFOx+X8OXSxYxOsMrhh w==;
IronPort-SDR: GoRe2bXwQq8wM6jeGhEY6IudAI24j44oOa/mKeB17mkugK1eUgfIyjYO3hRi28BzT6Sq+pTZ0J
 NVYfTMdevNaIpME/6TY/PMGsX+GsHg0IWhimQlWMtrpfU2ZuNNeve1JTH0Q3xFbs/OEXMaGsHn
 5g5Pl+j/2kohXuBuqCWNZl3g0fEjztB0ubr18IWvyuvHfdUD4fJUCRKZPlaCnhKAnBCcqM3IZ4
 KC554yH6rc6qsbUlTvpebEhmvIR7Tmh66D7mqGsJIh0unxGP+X9NaiPFVXplriJ/r8dSB2F9A5
 oKc=
X-IronPort-AV: E=Sophos;i="5.64,553,1559491200"; d="scan'208";a="220096734"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2019 08:09:45 +0800
IronPort-SDR: 1riwIaWlWQ5jA3ZncOTOQlKKm5VLBO+wC+RHbn4m5MACAHFEk7CLgPP6ZFVIRqMYfOGVdftfX0
 SPWiaXvGtfbjPm+JdxfU04HTAA7omr9yVgAQfODFSu+Jw87BKjugosjPBIj5yaTnvVfv19AzW9
 E3WqIIg3E2BEedrDDsJ9XWJcig8RMwAYPhGKT3Ly3/ZGmX9CGVTuzJ5n1STYFHwQcg06n4a/+w
 AgxLtgR0/p57orFjTR6h4uDRj/yFqVxzTBjBOxtVzJZ7FxqFadEPXUc/76Ej9fCjMhpk8viBhn
 WcERJbFLeMhV+jxyipfpGQuV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2019 17:05:45 -0700
IronPort-SDR: T01SUBszgnCFFTpYhAutlE/F0IhOeeTfpSKFyhZjg4LICu9Mvq8KbW/RSMGwTOz4weUwIa+U+2
 43KU9rdSbkurKSoj5OJZKqdeCoSNyVuew2CNR10B2W6uLePqS1TAOgAJpV+5/qU3VvsiwY3zm4
 BVB677+W3j0uE0iCNAZUiOKM///VB5QXiEwBT/MI3DhWhTOkjVpelMQbxgZgXvr60ToiHjuOUg
 WooKN/v+KeFPwlWv6CWkN4Btgt53KdeLVhRyk2wlt6UTdyehcKt8tpslx0z+oV5EN7JR+edF/f
 WzA=
WDCIronportException: Internal
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 26 Sep 2019 17:09:24 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add support for SBI v0.2 
Date: Thu, 26 Sep 2019 17:09:12 -0700
Message-Id: <20190927000915.31781-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_170929_819075_079A631F 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Atish Patra <atish.patra@wdc.com>, Gary Guo <gary@garyguo.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The Supervisor Binary Interface(SBI) specification[1] now defines a
base extension that provides extendability to add future extensions
while maintaining backward compatibility with previous versions.
The new version is defined as 0.2 and older version is marked as 0.1.

This series adds support v0.2 and a unified calling convention
implementation between 0.1 and 0.2. It also adds minimal SBI functions
from 0.2 as well to keep the series lean. 

[1] https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc

The SBI v0.2 support for OpenSBI is already available at

https://github.com/atishp04/opensbi/tree/sbi_v0.2_2
and in the OpenSBI mailing list.

Tested on both BBL, OpenSBI with/without the above patch series. 

Changes from v1->v2
1. Removed the legacy calling convention.
2. Moved all SBI related calls to sbi.c.
3. Moved all SBI related macros to uapi.

Atish Patra (3):
RISC-V: Mark existing SBI as 0.1 SBI.
RISC-V: Add basic support for SBI v0.2
RISC-V: Move SBI related macros under uapi.

arch/riscv/include/asm/sbi.h      | 109 +++++---------
arch/riscv/include/uapi/asm/sbi.h |  48 ++++++
arch/riscv/kernel/Makefile        |   1 +
arch/riscv/kernel/sbi.c           | 241 ++++++++++++++++++++++++++++++
arch/riscv/kernel/setup.c         |   2 +
5 files changed, 328 insertions(+), 73 deletions(-)
create mode 100644 arch/riscv/include/uapi/asm/sbi.h
create mode 100644 arch/riscv/kernel/sbi.c

--
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
