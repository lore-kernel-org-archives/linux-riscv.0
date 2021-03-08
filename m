Return-Path: <SRS0=HQWJ=IG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26ABC433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 06:07:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F1AF651EE
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 06:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F1AF651EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=10a9gOcUGEEGhM6qVciwo+1y3zhgPm1xkPaGp/BnhQM=; b=CNdPl3FhzmDGq/n5Vn3PNf6o6T
	vHl41kQj/K9G1sBZRRQ1iUHCDwTmBk1bhhPF/vSM+MyjPojtAtPJozyYAM9k9t0lehSm9twnISwDN
	/sRbw/b3ifFlORwzq3ooAWrCkEGVrz1soKgX2u0MLVthpL+aSyMHxjHtBdG68XPmjdM7zd+w2W5Pz
	/2itV1wmgyrqXxehushPVHM66TAxUuCBs6d2lowxl4f9owY+x8zG3Ww/iPeurXz/X1UUP7ffhcWyN
	mAjNaWlMVKN9o7I0bssWj6ry9QXrKOL9BN4Xy5T7KJsvDuL1adRJn8zH661A9GDAl15luhGEhdPLt
	o+D/2XgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ938-00FPym-PY; Mon, 08 Mar 2021 06:07:26 +0000
Received: from atcsqr.andestech.com ([60.248.187.195])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ92y-00FPuh-69
 for linux-riscv@lists.infradead.org; Mon, 08 Mar 2021 06:07:20 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 12866qZj041532;
 Mon, 8 Mar 2021 14:06:52 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from APC301.andestech.com (10.0.12.128) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; Mon, 8 Mar 2021
 14:06:52 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <linux-fsdevel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <ruinland@andestech.com>, <alankao@andestech.com>
Subject: [PATCH 0/1] fs: binfmt_elf.c:elf_core_dump() link error on RV32
 platform without optimization
Date: Mon, 8 Mar 2021 14:03:55 +0800
Message-ID: <20210308060356.329-1-ruinland@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.0.12.128]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 12866qZj041532
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_060717_373483_17FADFA1 
X-CRM114-Status: UNSURE (   6.92  )
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

Hi all,

Just as the mail title, recently on RISC-V 32bit platform, I've been
encountering linking errors when building a certain part of Kernel,
`fs/ext4/extents.c`, without optimization (-O0) for debugging .

The error message GNU ld giving out indicates that it fails to resolve
undefined symbol "__divdi3", which is one of integer library routines
shipped by libgcc.

After conducting an autopsy, I can locate the root cause is that the
roundup() macro, which does division on 64bit data, is used inside
`fs/ext4/extends.c:elf_core_dump()`. Unfortunately, it's highly unlikely
to fit 64bit data into instruction encoding space on 32bit machines,
hence GCC will try to use its own software routines inside libgcc and
causing the linking error mentioned above.

Yet with default optimization level "-O2", the logic could be optimized
into bitwise instructions ("shift" and "and").Thus the linking error
won't occur.

Though I can kludge the build process by modifying
`scripts/link-vmlinux.sh:vmlinux_link()` to force it link kernel
against libgcc.a, still I'm wondering if it's desirable to work this
issue out by either :

(1) replacing `roundup()` with `round_up()` since `ELF_EXEC_PAGESIZE`
must be the power of 2. (The attached patch.)

or
 
(2) duplicate the logic from `roundup()` and use kernel-provided
`div_s64()` instead of plain division. The most recent relating patch I
saw is 013ad043, which takes this approach.

In my humble opinion, even it's understandable to expect a reasonable
level of optimization in the real world just as glibc expects at least "-Og"
is used, still, I feel absurd to depends on the optimization on
"replacing division with shift and and" to save the day.

Cordially yours,
Ruinland

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
