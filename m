Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EBCC61CE7
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 19:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HUvXzl7X91TglKbqp9F4V2oZzs6S0u6zjm+Qas1xTQk=; b=KQJUPHQI8KOuk76iRKQ9C7849M
	oXYR/e+1Aln2rpJ6gjNXuz9RGia26/NmOdQAY8YwIrZHW5vcYf/g9zgDf5MPC9AZ0XxgPIq4aIp/S
	nViUNhJ8iR2bI21xIcC8/hXUX+KfPC5/iWEc8DnQU4TSTAKhsmffE886WMKMB8BkOGc/sa4tpPgaZ
	zfbJiNosVWSev0MLYHvjP0TgKoA1PUCl+ra0JTdMQxodA3x6pY0MolsNv8AzEGtijpDjgtWuynTEl
	OBgcfLxDE9lE9MYw9/NgZNavL/96ACJrrdnQZqhQk3hfJ4dgFBDd73vuHA+Ir2U0Ezn7CpHUx9hNl
	HRnwGWbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNcxs-00000000tfV-1nK2;
	Fri, 06 Jun 2025 19:42:56 +0000
Received: from mta-13-4.privateemail.com ([198.54.127.109])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNcxp-00000000teq-47oz
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 19:42:55 +0000
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
	by mta-13.privateemail.com (Postfix) with ESMTP id 4bDWtk1fWVz3hhhd;
	Fri,  6 Jun 2025 15:42:38 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mebeim.net; s=default;
	t=1749238958; bh=f/ZG7FzFsllKeCY4kWY41SHT1xEBrgdADFi7P3Tq+Y8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=B9TYwjG8CE3vwgX0/Lz90Hrtrhq9bCeXEavuCbkZ9jmcnkF9k9Y1am6Dir+rDCnUD
	 qxVkI9Fac5CpADN6kGrSxYdoU97UE2Ptx/8ubWWKj3ZdvBiDsQDQCNQw6xsAQDjUBD
	 tzuLmKwxVrZmvqyygCyvGAYRTzzVqJoiW5Af/VjmgewD8+PPpiHmpOyCZFFNL2SSrS
	 kl/LYS8qiOpixS+ScjVPIiL1H9cFl6VXa+w+X+ajJ71fthhOWcJh8KYRAGtD3XxNV/
	 7tStNop7MJQnxMg6qmRGpZl2GMqpqluKZOkJngalKlwcu35YmRt5LXa5Hdt41B98on
	 cLbzOrqlrwTSg==
Received: from APP-18 (unknown [10.50.14.242])
	by mta-13.privateemail.com (Postfix) with ESMTPA;
	Fri,  6 Jun 2025 15:42:27 -0400 (EDT)
Date: Fri, 6 Jun 2025 21:42:27 +0200 (CEST)
From: Marco Bonelli <marco@mebeim.net>
To: Alexandre Ghiti <alex@ghiti.fr>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "terrelln@fb.com" <terrelln@fb.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Message-ID: <191074362.1248877.1749238947947@privateemail.com>
In-Reply-To: <1338988468.1011577.1749045125350@privateemail.com>
References: <960240908.630790.1748641210849@privateemail.com>
 <1552795452.650306.1748692371190@privateemail.com>
 <c239ee1b-f201-4e7b-80f8-03a7fb02b666@ghiti.fr>
 <1338988468.1011577.1749045125350@privateemail.com>
Subject: Re: Broken 32-bit riscv debug build with ZSTD and FTRACE
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev75
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_124254_070609_FCE32B4F 
X-CRM114-Status: UNSURE (   4.80  )
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

I was able to also reproduce without ZSTD (i.e. both ZSTD_COMPRESS=n
and ZSTD_DECOMPRESS=n) like this:

	export ARCH=riscv CROSS_COMPILE=riscv32-linux-
	make distclean
	make defconfig
	make 32-bit.config
	./scripts/config \
		-e FTRACE \
		-e CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
		-d RD_ZSTD \
		-d SECURITY_APPARMOR_INTROSPECT_POLICY \
		-d BTRFS_FS
	make olddefconfig
	make -j vmlinux

Did another bisect run between v6.14 and v6.15 with the above commands
in a bash script and got:

	494e7fe591bf834d57c6607cdc26ab8873708aa7 Merge tag 'bpf_res_spin_lock' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next

This leaves me more puzzled than before honestly. Not sure whether it is
a real bug or a problem on my end at this point? The fact that I can repro
in a Docker makes me think of the former, but the fact that I was able to
bisect it down to two different commits depending on ZSTD vs no ZSTD is
weird.

Alex (or anyone else really): are you able to reproduce with my Dockerfile
or config I provided in my last mail by any chance?

--
Marco Bonelli

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
