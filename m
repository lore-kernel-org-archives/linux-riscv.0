Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4727CD493A
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 01:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwC4IJfXVs8kw/qWRtX5LNRVk/T28b+6sXtMSrCUsro=; b=29M4b3DSYNBAkm
	66s5ZDptnCQ4lPLx6jJGYtd4BzUTMt4BsE7wRGQR+4syEEnBqDgJT0TbuzGmWkxzfeoijnhZMzQoR
	OkO+U+s85Ops6ui8kTUUE8Y9yxCz/2HOlW3Rkks9UI0Ty+//QcXG4ouBugA4+zfAedqyJl2TEcE8h
	+Ai0yhtz253yGTQgW1g5a1hgBuZELjEj1rwAFrscmZJbsIcX8brp5sw69rc5HnOzUJN0JYCCZ/GdE
	yUqVHJk03oILled9V/WbQH9kNSm/C2nNSIGrd5gmdViavPMHJv2fsNdWtRZsR15jr4JL5lwnQwGHM
	uKZLReflsxKF/fLwIcEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj8gr-004ffI-2h;
	Thu, 21 Sep 2023 01:41:13 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj8go-004fdd-0I
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 01:41:12 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 38L1euGt010650;
	Thu, 21 Sep 2023 09:40:56 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Thu, 21 Sep 2023 09:40:54 +0800
Date: Thu, 21 Sep 2023 09:40:51 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Conor Dooley <conor.dooley@microchip.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <david@redhat.com>, <akpm@linux-foundation.org>,
        <alexghiti@rivosinc.com>, <bjorn@rivosinc.com>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] riscv: Improve PTDUMP to show RSW with non-zero
 value
Message-ID: <ZQufI18opHe8iYgi@APC323>
References: <20230920035522.3180558-1-peterlin@andestech.com>
 <20230920-pureblood-unwilling-f17aff1eef6a@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920-pureblood-unwilling-f17aff1eef6a@wendy>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 38L1euGt010650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_184110_567969_45A0FDCD 
X-CRM114-Status: GOOD (  15.28  )
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

Hi Conor,

On Wed, Sep 20, 2023 at 10:55:30AM +0100, Conor Dooley wrote:
> On Wed, Sep 20, 2023 at 11:55:20AM +0800, Yu Chien Peter Lin wrote:
> > RSW field can be used to encode 2 bits of software
> > defined information. Currently, PTDUMP only prints
> > "RSW" when its value is 1 or 3.
> > 
> > To fix this issue and improve the debugging experience
> > with PTDUMP, we redefine _PAGE_SPECIAL to its original
> > value and use _PAGE_SOFT as the RSW mask, allow it to
> > print the RSW with any non-zero value.
> > 
> > This patch also removes the val from the struct prot_bits
> > as it is no longer needed.
> > 
> 
> Could you please add cover letters to multi-patch patchsets?
> 
> Thanks,
> Conor.

Sure, will do.

Regards,
Peter Lin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
