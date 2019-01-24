Return-Path: <SRS0=k7m6=QA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0C5C282C0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Jan 2019 02:32:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91068218A1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Jan 2019 02:32:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F4LN1c+7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYldT0xR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91068218A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YhZT2O/KAQ0++tM3Tu6NyF34HbHgOjb3xIWFi68uG7c=; b=F4LN1c+7tdnNHp
	U1zj25Wp8Rx7yfZsLzU7ZM96gmhn46vJZWvDvCBNMOv0Hr/UfOshEMfeLLGFcLTlrAlgkr+KxXhl1
	cE9Cun+t3zz1kLkVuqPvgUxHZ0aKtqIUrmQ+F/JztVkwwlTt4YZpbsal2vAjnsY7ezXX0ue3bPnp1
	oRcFn9lwhgMmXxzm5+/i7bRtrsi5A54Ofqra9O6k49G4KnPR26CpgrkCXXW0ahBAdEluH1uXE7utP
	J49JP5cQv58RsJD5vAGRYPLpom4RFJ61S0XnX6GxyGg4foGgFRtMrjbCllOKAxHi3RKmpoWRSB5Wo
	DsgGHsvV0naMWRigGM4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmUog-0001qJ-1g; Thu, 24 Jan 2019 02:32:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmUod-0001pK-Um
 for linux-riscv@lists.infradead.org; Thu, 24 Jan 2019 02:32:29 +0000
Received: from guoren-Inspiron-7460 (23.83.240.247.16clouds.com
 [23.83.240.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C86A82184C;
 Thu, 24 Jan 2019 02:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548297145;
 bh=xMNcOlbl+2Kuj9GNXWp0XWbM0a57TgxgtsrzT66ucgA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YYldT0xRjEgfd7VNgxT/sLYQJpyP51FdK5D+0XHF71b/C8WBF4MbWIv7/ycoGW2nh
 8Sp8vsGNTclkpaqI/N8hWbG1et5ITbVdixdKPAnlqqskesgzQkuEqiOIB0VU+okWgy
 x8GM2ipLFj0f9ZrPa7uCgtUIEBs0nMXQTaVyO06k=
Date: Thu, 24 Jan 2019 10:31:57 +0800
From: Guo Ren <guoren@kernel.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] riscv: fixup max_low_pfn with PFN_DOWN.
Message-ID: <20190124023157.GA22934@guoren-Inspiron-7460>
References: <20190116010738.GA4817@guoren-Inspiron-7460>
 <mhng-7c486840-63d3-4645-84ff-8c89660fc552@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-7c486840-63d3-4645-84ff-8c89660fc552@palmer-si-x1c4>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_183228_010319_72228B46 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: linux-arch@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, mao_han@c-sky.com,
 Christoph Hellwig <hch@infradead.org>, ren_guo@c-sky.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 23, 2019 at 06:00:35PM -0800, Palmer Dabbelt wrote:
> On Tue, 15 Jan 2019 17:07:38 PST (-0800), guoren@kernel.org wrote:
> >Hi Christoph,
> >
> >I use PFN_DOWN() every where as possible and seems it's a habit
> >problem. So let risc-v maintainer to choose "PFN_DOW()" or
> >">> PAGE_SHIFT".
> >
> >Also the same with "end_of_DRAM & max_low_pfn".
> 
> PFN_DOWN makes sense to me, as that's what we're trying to do here (round a
> physical address down to page frame number).  Am a I misunderstanding
> something?
>
No, you got it :)

Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
