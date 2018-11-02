Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3919CC32789
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 15:51:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E05422081F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 15:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R01jTyiE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E05422081F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNE4YmQRZx+fN1x61QExWciJ27eXOepYKbhPNd3CiGE=; b=R01jTyiEGCPfoM
	2Vl3PaYspQeAZGYaes+3rmYO7gnEKAb6Phz8he4SRemVp+YzdqNi1BBHd9ssfYvAcamCWBPKlH2pz
	DSe7wmrKLqzIW87/nk59eJwY7QW1eRQ5audISTvFKjA9k7czoMRIXxt7Wt4Dz3C6yFy0saRxOV9ht
	v/sd+uLTipPH7Cz3UHIbzhVdM3OoOP2ubrPSz7l/iJUICECaGCxE/TBS4MGTWoqs1Rb0yVGDVSejo
	3T8N5y62Q1k5eknlra7LE+0+wAAI0tcbbQH36syl9lMiRDv4qP4vInHdpS0PLbvxixXAhBo49mStK
	EXyNWm+FobOo1FeAodCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIbiy-0005pF-Nr; Fri, 02 Nov 2018 15:51:04 +0000
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIbiw-0005nq-3o
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 15:51:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E40131596;
 Fri,  2 Nov 2018 08:50:46 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72CDA3F718;
 Fri,  2 Nov 2018 08:50:44 -0700 (PDT)
Date: Fri, 2 Nov 2018 15:50:38 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
Message-ID: <20181102155038.GA21067@e107155-lin>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <1541113468-22097-2-git-send-email-atish.patra@wdc.com>
 <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
 <20181102133100.GA13130@e107155-lin>
 <CAL_JsqLO+cOcHkr41ebPtONwrzOWGhksH1ypph+tihsuOVDOug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLO+cOcHkr41ebPtONwrzOWGhksH1ypph+tihsuOVDOug@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_085102_164230_6924E442 
X-CRM114-Status: GOOD (  19.06  )
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
 Sudeep Holla <sudeep.holla@arm.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102155038.ly1eroI5mupGDdYZPMF-9vT1J6tw06b95E_ZRj46sJg@z>

On Fri, Nov 02, 2018 at 10:11:38AM -0500, Rob Herring wrote:
> On Fri, Nov 2, 2018 at 8:31 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > On Fri, Nov 02, 2018 at 08:09:39AM -0500, Rob Herring wrote:
> > > On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com> wrote:
> > > >
> > > > Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
> > > > But it doesn't need a separate thread node for defining SMT systems.
> > > > Multiple cpu phandle properties can be parsed to identify the sibling
> > > > hardware threads. Moreover, we do not have cluster concept in RISC-V.
> > > > So package is a better word choice than cluster for RISC-V.
> > >
> > > There was a proposal to add package info for ARM recently. Not sure
> > > what happened to that, but we don't need 2 different ways.
> > >
> >
> > We still need that, I can brush it up and post what Lorenzo had previously
> > proposed[1]. We want to keep both DT and ACPI CPU topology story aligned.
>
> Frankly, I don't care what the ACPI story is. I care whether each cpu

Sorry I meant feature parity with ACPI and didn't refer to the mechanics.

> arch does its own thing in DT or not. If a package prop works for
> RISC-V folks and that happens to align with ACPI, then okay. Though I
> tend to prefer a package represented as a node rather than a property
> as I think that's more consistent.
>

Sounds good. One of the reason for making it *optional* property is for
backward compatibility. But we should be able to deal with that even with
node.

> Any comments on the thread aspect (whether it has ever been used)?
> Though I think thread as a node level is more consistent with each
> topology level being a node (same with package).
>
Not 100% sure, the only multi threaded core in the market I know is
Cavium TX2 which is ACPI.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
