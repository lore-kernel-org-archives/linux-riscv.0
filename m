Return-Path: <SRS0=pIoZ=R2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D66C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2019 17:22:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F5D820879
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2019 17:22:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TQaxnukz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F5D820879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVb94UnP501WiHdlayGvPlMulJEt4J/MZokZfOSUt4Q=; b=TQaxnukzCwa7YH
	/JNiyguk5q7hvpmII/q5irq7FlA9+2X4/nSLoKhNV9FwC6Ky10sF5TeYz4mKwE0q9LFQmt8ToA1mO
	SNadnCXWKaIZOSZq6tAbuE0dMZjnGb5piZbEAcuMNbc+JgVi8YoALXgHZdtMj5eEKOhsaKCoCPLtu
	2BtQb1b1PeNqYIChrnJ6Pcbi4oXSRaySD//igPKRkRJxFHkNpq9szcOLUKZXfV2MXCmpWwFMzhdhl
	9BM+XS4NRK96pNw2M0EChtOKZwc20PyA2XhlclGJtXgO6J+xl1+/IPZJfxn0fHJ4PVGXUGpyRu4Xp
	maCsYK/MFbReKFUkpnNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7kLE-0003ct-Bt; Sat, 23 Mar 2019 17:21:56 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h7kLB-0003cb-Cn; Sat, 23 Mar 2019 17:21:53 +0000
Date: Sat, 23 Mar 2019 10:21:53 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
Message-ID: <20190323172153.GA9085@infradead.org>
References: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
 <20190322104209.GB24367@rapoport-lnx>
 <20190322132556.GB19263@infradead.org>
 <CAAhSdy1VS8-3npcZUzjicnKGsjHcc6WH3Co6Hx2=GvttoatWcA@mail.gmail.com>
 <20190322134043.GA18818@infradead.org>
 <CAAhSdy2qbU1uhnVQvh0C_FOoKDy-Y0ZTUryAKD97xAXXGQSdCA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2qbU1uhnVQvh0C_FOoKDy-Y0ZTUryAKD97xAXXGQSdCA@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 22, 2019 at 07:15:37PM +0530, Anup Patel wrote:
> >
> > I am not saying the revert is the final solution.  I'm just saying
> > that 5.1-rc is not the place we should be doing the major surgery.
> > Revert fox 5.1, fix for real for 5.2+.
> 
> If we revert for time being then even fixmap support has to be
> reverted.
> 
> The patch only updates access to kernel symbols via __load_pa()
> and __load_va(). There is no functional change as such. The patch
> is tested on QEMU/virt 64bit, QEMU/virt 32bit, and SiFive Unleashed.

Just curios - if you just move setup_vm and dependencies into a new
file that is compiled with -mcmodel=medany, just like setup.c,
what issues would we still have that require explicitly passing the
load address?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
