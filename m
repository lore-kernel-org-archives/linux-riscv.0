Return-Path: <SRS0=3lGF=X3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559E9C352AA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2019 01:54:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2808420815
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2019 01:54:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jt5U4J/L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2808420815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fyWJcKf0sbxnXhYpo0LznmGj1j+D5j/5SnB6qQ3bBro=; b=jt5U4J/LRkDLtg
	UXabcCQI3jE/ZVlyJrILnPxr/DARUKOMdMjWrGRG3Z6u44NcNc0G32W1dVxbdb5C669dCRo6O1Y9m
	Z+fDZemYEuhuDU/uhZ+Iq+qjh//9KOTGKRvmB+sBlIFYYd9s8mbE8EjofqmoxNgGnjLGXjf0Cmfrs
	VHDcarRD2Gq6ljptwW/UPyyxTvOeWrMXFkUrsByHNtVIRMOa3SW93IrqUeDguAa9KaA0cOA/rikOD
	q2v03Bq3KcGtgq1jSpX6+ir8Rh6R7oo2T3TCYdpOBfJesE0St1ZqEpcgScVWdrB5P+sF1bwlvEt4y
	yCA3MtjCH0krkUlXJQMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFTqI-0005lX-BD; Wed, 02 Oct 2019 01:54:14 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFTqF-0005l1-Cc
 for linux-riscv@lists.infradead.org; Wed, 02 Oct 2019 01:54:13 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x921cDgV024925;
 Wed, 2 Oct 2019 09:38:13 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Wed, 2 Oct 2019
 09:53:39 +0800
Date: Wed, 2 Oct 2019 09:53:39 +0800
From: Alan Kao <alankao@andestech.com>
To: "hch@infradead.org" <hch@infradead.org>
Subject: Re: [v6 PATCH] RISC-V: Remove unsupported isa string info print
Message-ID: <20191002015338.GA28086@andestech.com>
References: <20191001002318.7515-1-atish.patra@wdc.com>
 <20191001070236.GA7622@infradead.org>
 <b0c39a9895698d74e2f44eb1f2faed46eee54bc3.camel@wdc.com>
 <20191001101016.GB23507@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191001101016.GB23507@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x921cDgV024925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_185411_687884_24FDAA46 
X-CRM114-Status: UNSURE (   6.04  )
X-CRM114-Notice: Please train this message.
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "palmer@sifive.com" <palmer@sifive.com>, "johan@kernel.org" <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 01, 2019 at 03:10:16AM -0700, hch@infradead.org wrote:
> On Tue, Oct 01, 2019 at 08:22:37AM +0000, Atish Patra wrote:
> > riscv_of_processor_hartid() or seems to be a better candidate. We
> > already check if "rv" is present in isa string or not. I will extend
> > that to check for rv64i or rv32i. Is that okay ?
> 
> I'd rather lift the checks out of that into a function that is called
> exactly once per hart on boot (and future cpu hotplug).

Sorry that I am a bit out of date on this.  Is there any related
discussion about such checks?  Just want to make sure if the check
stops here and will not go any further for extensions, Xs and Zs.

> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
