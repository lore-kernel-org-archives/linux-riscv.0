Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A530C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 00:42:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 314112084A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 00:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dxWmLctv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 314112084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XH2xldYO2vZjbMrMGq0sI0VZaPFh0z/MTUjslxk1JJQ=; b=dxWmLctvq6qsJN
	VClAzfyUmzpUsc0hPvJ4COW88Y50xQbSV9eJg8B2RrusRnI69d5QTuzIdUJDIhvIHaCyku53a0dzK
	vDPRz0tPWy5C8r65GAwV8R4L2UomvLL0H5WW1CZW09r8OBrUpt6McC3dCG8QXA3Z42D7y6eYp8kVL
	z5EWliRd/k6BI0IL4ZWI8RXyBwgv8F0aG7vM7e2qUpcOkXSYUGumMFuzfBOE+puIsZ6ZMJT/T8iYE
	kb9aXjT0KEAmRu3v/SSCV83Tzk0ebAuK194yEPvKCWCSoBAPgmPrIILQWtwUNoL30VZc1FD4LL3Zs
	jlDw0Z10UsR2wFoTk02w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gINXe-0002GM-8j; Fri, 02 Nov 2018 00:42:26 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gINXY-00027G-Ob
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 00:42:24 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id wA20g6Nt003936;
 Fri, 2 Nov 2018 08:42:06 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Fri, 2 Nov 2018
 08:41:21 +0800
Date: Fri, 2 Nov 2018 08:41:22 +0800
From: Alan Kao <alankao@andestech.com>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
Message-ID: <20181102004122.GA22741@andestech.com>
References: <20181101005541.GA25604@andestech.com>
 <mhng-22ded2c8-7f87-4acc-b017-627e369cf874@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-22ded2c8-7f87-4acc-b017-627e369cf874@palmer-si-x1c4>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com wA20g6Nt003936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_174221_286733_1D7CD4E2 
X-CRM114-Status: GOOD (  16.35  )
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
Cc: zong@andestech.com, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 greentime@andestech.com, anup@brainfault.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, vincentc@andestech.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102004122.vGOBQZwqy2VhSw1CyuKRuIsvsH-F90CnsOT9r17fk9Y@z>

On Thu, Nov 01, 2018 at 10:50:04AM -0700, Palmer Dabbelt wrote:
> On Wed, 31 Oct 2018 17:55:42 PDT (-0700), alankao@andestech.com wrote:
> >On Wed, Oct 31, 2018 at 07:17:45AM -0700, Christoph Hellwig wrote:
> >>On Wed, Oct 31, 2018 at 04:46:10PM +0530, Anup Patel wrote:
> >>> I agree that we need a place for vendor-specific ISA extensions and
> >>> having vendor-specific directories is also good.
> >>
> >>The only sensible answer is that we should not allow vendor specific
> >>extensions in the kernel at all.  ...
> >
> >How can this even be possible if a extension includes an extra register
> >set as some domain-specific context?  In such a case, kernel should
> >at least process the context during any context switch, just like how it
> >deals with the FP context.
> 
> Ya, I think there are cases where vendor-specific extensions are going to be
> necessary to handle within the kernel.  Right now the only one I can think
> of is the performance counter stuff, where we explicitly allow
> vendor-specific counters as part of the ISA spec.
> 
> For stateful extensions, we currently have a standard mechanism where the XS
> bits get set in sstatus and the actual save/restore code is hidden behind an
> SBI call.  That call doesn't currently exist, but if we just go ahead and
> add one it should be easy to support this from within Linux.  We'll need to
> figure out how to enable these custom extensions from userspace, but that
> seems tractable as well.  We'll probably also want some fast-path for the V
> extension (and any other stateful standard extensions), but I think as long
> as the V extension adds a quick check for dirtiness then it's not a big
> deal.
> 
> Do you guys have stateful extensions?  We're trying really hard to avoid
> them at SiFive because they're a huge headache, so unless there's a
> compelling base of software using one I don't want to go add support if we
> can avoid it.

Currently no, but the future is hard to see.  As long as the extensible freedom
claimed by the RISC-V foundation remains true, such extensions may have their
role to play.  Don't worry now, I was just to give a example that in some 
possible vendor-specific cases the kernel cannot keep itself from involving.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
