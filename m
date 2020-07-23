Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6F1C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 22:34:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E353920792
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 22:34:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0JZEUy+6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E353920792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ezS9thC9DctuRc6oLHocqSnacTjl0JTSX5XopQDVg8g=; b=0JZEUy+65bzyj9dM7cOVbwd/P
	G/FxYtmy5YmlRxeNXOBQSVOz+xG6TyisZoKNmIGKgv6wmobwt/JNTq9tF1LYxS3+e9sVGKiS+kEEy
	MtzfpLIlofmDvaUdqGh2xsv20iKCC005yQbt1bpKOvz5JCHDR6U1DqQqgOSlrT6QXL/j40Bi7/M6n
	okIMgr7VIAyGqibpBNo48IuGGof6y69eKBpB7yqygREepkJn0LafMaHlA2S6Kvr4WJr9vI+1Z9R98
	OTwUkNzaxVy+WaqF9xRgmj+8+rlkAFNDOmbjhHkbJmn21DXSx/AGV86FJ77Lhf/SjjB/D71Hf7Hko
	+4/GoQVdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyjmy-00042k-P1; Thu, 23 Jul 2020 22:34:08 +0000
Received: from kernel.crashing.org ([76.164.61.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyjmv-00041g-Nx
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 22:34:06 +0000
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 06NMXDcm005863
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 23 Jul 2020 17:33:16 -0500
Message-ID: <418d5f3d3f42bbc79c5cf30e18ec89edfe2dbd26.camel@kernel.crashing.org>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Alex Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>
Date: Fri, 24 Jul 2020 08:33:12 +1000
In-Reply-To: <cade70e2-0179-2650-41c5-036679aaf30c@ghiti.fr>
References: <mhng-831c4073-aefa-4aa0-a583-6a17f9aff9b7@palmerdabbelt-glaptop1>
 <d7e3cbb7-c12a-bce2-f1db-c336d15f74bd@ghiti.fr>
 <7cb2285e-68ba-6827-5e61-e33a4b65ac03@ghiti.fr>
 <54af168083aee9dbda1b531227521a26b77ba2c8.camel@kernel.crashing.org>
 <cade70e2-0179-2650-41c5-036679aaf30c@ghiti.fr>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_183405_909204_0BA52B4C 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: aou@eecs.berkeley.edu, linux-mm@kvack.org, mpe@ellerman.id.au,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, paulus@samba.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 2020-07-23 at 01:21 -0400, Alex Ghiti wrote:
> > works fine with huge pages, what is your problem there ? You rely on
> > punching small-page size holes in there ?
> > 
> 
> ARCH_HAS_STRICT_KERNEL_RWX prevents the use of a hugepage for the kernel 
> mapping in the direct mapping as it sets different permissions to 
> different part of the kernel (data, text..etc).

Ah ok, that can be solved in a couple of ways...

One is to use the linker script to ensure those sections are linked
HUGE_PAGE_SIZE appart and moved appropriately by early boot code. One
is to selectively degrade just those huge pages.

I'm not familiar with the RiscV MMU (I should probably go have a look)
but if it's a classic radix tree with huge pages at PUD/PMD level, then
you could just degrade the one(s) that cross those boundaries.

Cheers,
Ben.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
