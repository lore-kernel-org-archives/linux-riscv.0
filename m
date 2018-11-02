Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECA8C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 13:31:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 118FF2081B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 13:31:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GJ6Osomn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 118FF2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1em9uu9HuKBrgCUxpl90ziCDXZCDiHYTCuZYz40jLAM=; b=GJ6OsomnuiF+IH
	GUIxVAtf4WXa+RBWhPFjbQGRIworkKerpbpSD202XEsUe6kAJT68vDzgD98s9kfbFj86gE7botLIF
	vXN15z8E0ZpIYn5iQcZpH9QDKCC3gfi2X9X4PSR2dGv74wW0TDrlhUS34jfZjtFx6Rol8Y27DCLQB
	KV09aTvLlfHLdrrSKYItrudtGht9rbY1QoVP8xqZMY8A7/pEqFlp1bBQfL18ruU5bMu336LSddWpH
	P6ptssRoFboSPVCxRv0RjU3tLyX2Oe+ml8CLkTnsKZd/xrtQEUPW2uAjZhr4NcNj/VBva2B0NNJZM
	gFUfoX22+Bn6nn71tcqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIZXn-0004hI-Qx; Fri, 02 Nov 2018 13:31:23 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIZXk-0004g3-Ju
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 13:31:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AEDCA78;
 Fri,  2 Nov 2018 06:31:09 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E8743F71D;
 Fri,  2 Nov 2018 06:31:07 -0700 (PDT)
Date: Fri, 2 Nov 2018 13:31:00 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
Message-ID: <20181102133100.GA13130@e107155-lin>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <1541113468-22097-2-git-send-email-atish.patra@wdc.com>
 <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_063120_658707_6E3B6F32 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Damien.LeMoal@wdc.com, alankao@andestech.com, Zong Li <zong@andestech.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102133100.RNMHx_fhfGJTnoSoQgWw4i67eLa30JrZH6tEDpkzggk@z>

On Fri, Nov 02, 2018 at 08:09:39AM -0500, Rob Herring wrote:
> On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
> > But it doesn't need a separate thread node for defining SMT systems.
> > Multiple cpu phandle properties can be parsed to identify the sibling
> > hardware threads. Moreover, we do not have cluster concept in RISC-V.
> > So package is a better word choice than cluster for RISC-V.
>
> There was a proposal to add package info for ARM recently. Not sure
> what happened to that, but we don't need 2 different ways.
>

We still need that, I can brush it up and post what Lorenzo had previously
proposed[1]. We want to keep both DT and ACPI CPU topology story aligned.

--
Regards,
Sudeep

[1] https://marc.info/?l=devicetree&m=151817774202854&w=2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
