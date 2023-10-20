Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F796CDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 08:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8XTY5Qlkelvvf4RiZSh+GeEVjCj/I3J62QEA678ZK8=; b=xsn8qACvI5RfNV
	WG7gexESV2YaJ8Ygy/vKeUk5kXCn50gGwQCA0knLi/Q2xxQU56Lla97zNEx7XwBJy21eLQIm4tszR
	TSXkFnD2ngP5KMSHVmzpwvn7OcRmjVgEqHkbwAEnosulAh2jxbvCuiWHOFxG754ejMY8Ny4Xdy+7E
	zLaxzxOmxtf8XP0gqsU+DQdixMCqzmfpCgQeBWSEWQy6zy28cgy9WQ1q4Al9UsXMX3+//C5UuLUP7
	fYljfZRkTzu6AOR1u8jJlOJFzszf3I0dkI++l9NBWLlJsOG9ckqkWgZgt6CPrCE3xQmLb6ReoCB0L
	l5aQPnWHKWblhRgcuc9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkWX-001W5j-1T;
	Fri, 20 Oct 2023 08:06:25 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkWT-001W4n-29
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 08:06:24 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39K85otO098746;
	Fri, 20 Oct 2023 16:05:50 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Fri, 20 Oct 2023 16:05:49 +0800
Date: Fri, 20 Oct 2023 16:05:45 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <linux-riscv@lists.infradead.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <tim609@andestech.com>,
        <dylan@andestech.com>, <locus84@andestech.com>, <dminus@andestech.com>
Subject: Re: [PATCH v2 00/10] Support Andes PMU extension
Message-ID: <ZTI02VmswE5eR-_0@APC323>
References: <20231019135238.3654285-1-peterlin@andestech.com>
 <20231019-cargo-outright-1c0a34431626@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231019-cargo-outright-1c0a34431626@spud>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39K85otO098746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_010622_165291_234779AB 
X-CRM114-Status: GOOD (  13.02  )
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

On Thu, Oct 19, 2023 at 03:51:00PM +0100, Conor Dooley wrote:
> On Thu, Oct 19, 2023 at 09:52:38PM +0800, Yu Chien Peter Lin wrote:
> > Hi All,
> > 
> > This patch series introduces the Andes PMU extension, which serves
> > the same purpose as Sscofpmf. In this version we use FDT-based
> > probing and the CONFIG_ANDES_CUSTOM_PMU to enable perf sampling
> > and filtering support.
> > 
> > Its non-standard local interrupt is assigned to bit 18 in the
> > custom S-mode local interrupt pending CSR (slip), while the
> > interrupt cause is (256 + 18).
> 
> Chief, you gotta thread your patchsets. It seems like every mail in this
> series has been sent individually, which is going to break tools like
> b4 and the automated testing on patchwork.

Hi Conor,

Sure, thanks for taking care of this!

Regards,
Peter Lin

> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
