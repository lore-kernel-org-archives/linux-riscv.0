Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD20ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 00:57:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3582820664
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 00:57:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hcmkbu2N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3582820664
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgZwKUVfFUAGRD4lnY5pw9e1SDgH95iiZisILdjyXko=; b=hcmkbu2Nywprsc
	/GeEWfQfDuPgkQ1buByXMBJUVamzRbr4qlOONvr04ayN3iueNg2M1982M4QAW4kDriGLB17YhEY1J
	UdeBB1id9KWtgFEm+N8PrShsKrPmdyY1+zU4jxFtoIilSlBpb5j4qEbZhiiT7nnK/ZCb+to/UTH+H
	AZs8VGEiMDQ5xIZNd51mGbi+muvP5y7YKuuYtCiNDcRAb/MTeAkbnlwneavt/umi90QQD07CR9cga
	zHh0sb9sNWMhU5jSRcT7DC8Qyd9MRXJldHr8uq3W4W+ija2erWQSKYrthRg9K1vCerrQozDG3PDfM
	AX/LD4q3jcoaNjPVyRTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gI1ID-00012O-7U; Thu, 01 Nov 2018 00:57:01 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gI1IA-00011O-Os
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 00:57:00 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id wA10uZUK012526;
 Thu, 1 Nov 2018 08:56:35 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Thu, 1 Nov 2018
 08:55:41 +0800
Date: Thu, 1 Nov 2018 08:55:42 +0800
From: Alan Kao <alankao@andestech.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
Message-ID: <20181101005541.GA25604@andestech.com>
References: <1540982130-28248-1-git-send-email-vincentc@andestech.com>
 <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
 <20181031141745.GA5183@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181031141745.GA5183@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com wA10uZUK012526
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_175659_060363_88DB4BA4 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
Cc: vincentc@andestech.com, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, greentime@andestech.com,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Zong Li <zong@andestech.com>, linux-riscv@lists.infradead.org,
 deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101005542._2AXlHha-UQcm1cf5FDcIJ3nWpOQYdxHqGAi0C0Uu0c@z>

On Wed, Oct 31, 2018 at 07:17:45AM -0700, Christoph Hellwig wrote:
> On Wed, Oct 31, 2018 at 04:46:10PM +0530, Anup Patel wrote:
> > I agree that we need a place for vendor-specific ISA extensions and
> > having vendor-specific directories is also good.
> 
> The only sensible answer is that we should not allow vendor specific
> extensions in the kernel at all.  ...

How can this even be possible if a extension includes an extra register
set as some domain-specific context?  In such a case, kernel should
at least process the context during any context switch, just like how it
deals with the FP context.

> ... We need to standardize cache flushing 
> and we need to do it soon and not introduce horrible bandaids because
> the foundation did not do its work.
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
