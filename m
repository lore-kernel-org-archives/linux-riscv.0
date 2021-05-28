Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D866EC4708C
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 08:53:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98CD2610A5
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 08:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98CD2610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAM9/KLbdVsUTZ3+TEFNunkuJ9l1Y2JjS03k2S8Z8JA=; b=qU0Vh7ww3d8gU+
	Wa0X0reC8A6HRu9/exKS/kB6K6TzYXzGFNnFR3BO7i4C4nIyNb34wMJrYdoQTzacsIazjK0g2wOOi
	AziMiJ5oprTSBU/QrRW3aa6frvvFRZ4NnxGfKFx4rOLWZFtZrlacPN1BNP+ZmWsYSK+EIxRxbzR5t
	i6PAGJY/MqbMljvgg7IQbpAxe1VfVPXi9opoEcG+t1y0FkSca+JkX7/KDqIRd1gbjCot+iXWevzk5
	l4XtwVLA00x59agZV+sILWr/KjdYyME8ysJLFGMijR09ZBZlTLzCAdcZp0FAr1hLsgdQ+TA+pdHsg
	V9pvew7KuPj+W5n99tFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmYF5-00DbO1-6U; Fri, 28 May 2021 08:53:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmYF0-00DbLh-N3
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 08:53:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0E70610A5;
 Fri, 28 May 2021 08:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622191993;
 bh=eUlHKOHfPfFJHSbME7WusP7JXDmJkqXgxa09Ahf/Gzg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1hR2sjTSE3+TvdVbCADch4CK1Rqjg2XnlCAjQgMtzbvimy2TFq96Z6uzB3PKXEGs5
 ylK9ZrNYIWBiBPVfPA0T72a7YtuPJubVFG7apMsIawoQFySJHm/JUpVtm94Pa4YM2n
 RzuKulCjZZK7CpMy2Xqoa8LQ8Sq05n0S/t4hZs+A=
Date: Fri, 28 May 2021 10:53:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: arch/riscv/staging
Message-ID: <YLCvdmwPrm/S/GKg@kroah.com>
References: <DM6PR04MB70811AC515371C5728DDE6A2E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <DM6PR04MB7081D11851CD0D3863C4ABA9E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <9eb59267-542b-8adc-07-d795f5a43098@sifive.com>
 <CAAhSdy3RFGEq0+ZWUjsVCsmR8EvQzs6JOQMRXt7+92wNnCE27w@mail.gmail.com>
 <53424413-4a31-7a12-759a-49e3f41f11a@sifive.com>
 <9f107eaf-cc6e-d554-c923-62fb317c4d4b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f107eaf-cc6e-d554-c923-62fb317c4d4b@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_015315_101424_10D48EAA 
X-CRM114-Status: GOOD (  13.33  )
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

On Fri, May 28, 2021 at 10:29:16AM +0200, Paolo Bonzini wrote:
> On 28/05/21 03:06, Paul Walmsley wrote:
> > OK, well, maybe you and Damien can get together and spell out what you all
> > are concerned about regarding forks.  Then we can see if there's anything
> > that should be done to address it.
> > 
> > Right now the only fork risk that I can see is related to the architecture
> > itself.
> 
> The risk is that improvements to KVM RISC-V are developed in forks rather
> than in a single git tree.

Eventually they need to come back into the mainline tree, so that should
not be that big of an issue.

If it is, again, get the spec finished, what is preventing that from
happening this week?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
