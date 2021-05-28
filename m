Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA36C4708C
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 09:25:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4DF66127A
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 09:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4DF66127A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ex9g9SEYT14g+UIfX5Vl55vu1BIV4CDscwkdQRmtcfc=; b=yUU0B+OlxPefY2
	x82N+//P4toAUFxPUFfjqmDoerhzdSh5Y9Zajs6R1SQ8Q2BSJN1UaxigaEYfUzWdYhbfDwYuZ4VGD
	mrRM4ot3R7wa0RnWt0xE04ofDStH5zhRFSH69wp3EHiVmb8nZfCB4EKzgDd5XoEKrM8NyAwRQ67lw
	5wiHnX/dcxQM/LHPGtRggsNqKaPfof83sLceO3SPhqq2MAhUMWz1C4SzGMsdGkaJY7ClLQPpa4DRi
	8Q05gmY7kBRlVqeGKy7Dn+byg1wsAgV2s0hXiqWEoeaxAbqdIf5CE46eIjzIp2g8Dq3ieVBl/m4a5
	+mpaQse13tYmC9KExrOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmYjV-00Dr08-Fe; Fri, 28 May 2021 09:24:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmYjS-00Dqxe-5s
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 09:24:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E9AE613B6;
 Fri, 28 May 2021 09:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622193881;
 bh=AHj1/wMLR3bdFFwIrJdl5j8VmhYtpWzie2noZ3Tqv5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rSHc9X2RTts7o+VULQImyXxPYPGwwU1r8WlRqpPIchmSPeXh0+td3IVtKl+fdUVHh
 RehMxXl7J4KXXibXxiy+ulVQh+hhbV90tOvVIOnLwljtmPLRuTLfYq2qINV4WHoIIk
 1y+r2rKYf8xfk10CyHjErTgDmCN7Cv9zYssJqGpM=
Date: Fri, 28 May 2021 11:24:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: arch/riscv/staging
Message-ID: <YLC211VUeTrUdo3v@kroah.com>
References: <DM6PR04MB70811AC515371C5728DDE6A2E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <DM6PR04MB7081D11851CD0D3863C4ABA9E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <9eb59267-542b-8adc-07-d795f5a43098@sifive.com>
 <CAAhSdy3RFGEq0+ZWUjsVCsmR8EvQzs6JOQMRXt7+92wNnCE27w@mail.gmail.com>
 <53424413-4a31-7a12-759a-49e3f41f11a@sifive.com>
 <9f107eaf-cc6e-d554-c923-62fb317c4d4b@redhat.com>
 <YLCvdmwPrm/S/GKg@kroah.com>
 <CH2PR04MB70782F16D88C700AB621D1B6E7229@CH2PR04MB7078.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR04MB70782F16D88C700AB621D1B6E7229@CH2PR04MB7078.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_022442_262518_6D607B8A 
X-CRM114-Status: GOOD (  20.65  )
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

On Fri, May 28, 2021 at 08:58:07AM +0000, Damien Le Moal wrote:
> On 2021/05/28 17:53, Greg Kroah-Hartman wrote:
> > On Fri, May 28, 2021 at 10:29:16AM +0200, Paolo Bonzini wrote:
> >> On 28/05/21 03:06, Paul Walmsley wrote:
> >>> OK, well, maybe you and Damien can get together and spell out what you all
> >>> are concerned about regarding forks.  Then we can see if there's anything
> >>> that should be done to address it.
> >>>
> >>> Right now the only fork risk that I can see is related to the architecture
> >>> itself.
> >>
> >> The risk is that improvements to KVM RISC-V are developed in forks rather
> >> than in a single git tree.
> > 
> > Eventually they need to come back into the mainline tree, so that should
> > not be that big of an issue.
> > 
> > If it is, again, get the spec finished, what is preventing that from
> > happening this week?
> 
> We (kernel & riscv software developers) do not get to decide alone. RISC-V
> International specification group decides. And our input does not seem to have
> much effect on the completion timing. See this thread:
> 
> https://lists.riscv.org/g/tech-privileged/topic/80346318#465

Ok, as it sounds like this isn't going anywhere until the spec group
gets their work done, you all should just wait as there's no real need
for any kernel code here either, given that there can't be any hardware
made until the spec is finished anyway.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
