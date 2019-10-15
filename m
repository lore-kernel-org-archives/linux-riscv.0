Return-Path: <SRS0=QQKM=YI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39EEECE587
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2019 07:47:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60D102089C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2019 07:47:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fPt7zFNa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60D102089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8pDARhr6DzCQL/EBopDnVcODg86dLRWEZN6KPcY6/0=; b=fPt7zFNapy57Os
	3UTI66Tr17WB4w+4O4KC29j2I+dv/bqoZUKEyIpvEpnVsHzX8TPbEq6q3JqhNLJjXoowO5G6uu+zl
	p6uOOGm3p6WPDpeCfaDPuf5ZbhIRTlc54q7aIDZWCWxaYDQwdrIE00BvJ3R0NVQRbtuS/Xfh34Z3i
	OYv+1nvOcCNXQRd0OeC9QNU1D5bmKt236sipE4yugsOGEMLNthZqwcf3xK3/24KbEHv0OtCSFakW1
	t3B3lIB/RkG7/sByNKU3y27+rIGyHZFLIlZ6TbmxnNoG/Kp3BhfeARmh5lgImCE2YWKZfjsuH8PL/
	pzHjIBzHMHbPuiLYhNRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKHYH-0004wx-8d; Tue, 15 Oct 2019 07:47:29 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iKHY5-0004l7-Il; Tue, 15 Oct 2019 07:47:17 +0000
Date: Tue, 15 Oct 2019 00:47:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] microblaze: Include generic support for MSI irqdomains
Message-ID: <20191015074717.GB8715@infradead.org>
References: <aa6dd855474451ff4f2e82691d1f590f3a85ba68.1570530881.git.michal.simek@xilinx.com>
 <20191008154604.GA7903@infradead.org>
 <c558db03-1199-275d-3e42-612c71cbf736@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c558db03-1199-275d-3e42-612c71cbf736@xilinx.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, monstr@monstr.eu,
 Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>, Kuldeep Dave <kuldeep.dave@xilinx.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Firoz Khan <firoz.khan@linaro.org>, git@xilinx.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 10, 2019 at 12:47:31PM +0200, Michal Simek wrote:
> On 08. 10. 19 17:46, Christoph Hellwig wrote:
> > On Tue, Oct 08, 2019 at 12:34:47PM +0200, Michal Simek wrote:
> >> index e5c9170a07fc..83417105c00a 100644
> >> --- a/arch/microblaze/include/asm/Kbuild
> >> +++ b/arch/microblaze/include/asm/Kbuild
> >> @@ -25,6 +25,7 @@ generic-y += local64.h
> >>  generic-y += mcs_spinlock.h
> >>  generic-y += mm-arch-hooks.h
> >>  generic-y += mmiowb.h
> >> +generic-y += msi.h
> > 
> > Please just mark it as mandatory-y in the asm-generic makefile
> > instead of requiring a sniplet for every architecture.
> > 
> 
> But is it really mandatory for all architectures?

What the mandatory-y keyword means is that every architecture that
doesn't provide its own header gets the default one, which seems
applicable here.  Maybe the keyword is a bit misnamed and should be
default-y or something like that..

But in this case I think we have a clear case of x86 vs the rest, which
is unlikely to change in a major way.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
