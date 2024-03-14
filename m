Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C052C54E66
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 02:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FioAiGGIxixkkCqUqisoPSsFaBLIDXeEwEW7iZ1+Om8=; b=1U6wLeunHX8Lxa
	jMoB07Tzhk/qMFA86pEKvkCC58/9UD5AkCAYKSqhu8oglHiCgTP5vg1QRrL5t5n9H63mmiIor2Rwh
	ObmLtHADAlFs0rAnUREQm5VcS6U+LNf2omLENdIY7GtAH5Ym0ARajppQNwT3W9wD3wkBP6mfkRiSF
	fls/qft5FIsCWFn7hsD8B1t7sJeZ+HLtaKg6pOGnw7dzO5Y72SnMHuRu81cP944erdt5Y3ibReRjC
	JqQuTJbxPHkBNOtx2V6I+bcQRjARjlNJpISuRkuDzO1sItdeQ2xHNCDzZhXyFUilNWpbBXWt19IVs
	JjNROGGju53SvQTVTzjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkbC0-0000000CiJb-2Sq9;
	Thu, 14 Mar 2024 02:51:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkbBw-0000000CiIg-3WP5
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 02:51:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CD4B4CE1CEC;
	Thu, 14 Mar 2024 02:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD98CC433F1;
	Thu, 14 Mar 2024 02:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710384693;
	bh=4odLktmp/nCGkS6wqpUh5pVSGO+4MNahhOcH2uJT5hM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0HeexNDAgwbgoYMvpeTm+qMmCVWRL6Oe61CkNkbuyctGpXmd0P3bUZ4cy/0AEeZk
	 Q2OWaDxG32trUQETBlNaPyXZmMapYFIwuJ3zbEUMk9lUTT39J3j0a93GSp4eM1np2A
	 Y5vm+ElQFFqQSX7VLJ8Mhe5a/3dBAFf49UgZdMqwJTm6DOPCGNe8Wany3HfIEQMURy
	 reDE7HNN5TjKJdy01Izl182GcmEWNc0BCR6LtFwjpcqWkQM4eyTh2YXw5lajNP+Kdl
	 EQsFJWIJOObZo75cpLdgZb9rOR5sY1ZeQhytJXLDjssOF0TVtEmYhQy+d3mOiHZUQS
	 BMvwbGqMwmgCQ==
Date: Wed, 13 Mar 2024 20:51:29 -0600
From: Keith Busch <kbusch@kernel.org>
To: Kevin Xie <kevin.xie@starfivetech.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Conor Dooley <conor@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"daire.mcnamara@microchip.com" <daire.mcnamara@microchip.com>,
	"emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v15,RESEND 22/23] PCI: starfive: Offload the NVMe timeout
 workaround to host drivers.
Message-ID: <ZfJmMcs2UThVSC4v@kbusch-mbp>
References: <ZeCd+xqE6x2ZFtJN@lpieralisi>
 <mhng-87e7ef5a-d60b-4057-960d-41bc901b6c7f@palmer-ri-x1c9>
 <ZedAn8IC+Mpm4Sqz@lpieralisi>
 <ZQ0PR01MB0981BC562E837B232B419AC28229A@ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQ0PR01MB0981BC562E837B232B419AC28229A@ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_195137_282496_95E72B5A 
X-CRM114-Status: GOOD (  16.91  )
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

On Thu, Mar 14, 2024 at 02:18:38AM +0000, Kevin Xie wrote:
> > Re: [PATCH v15,RESEND 22/23] PCI: starfive: Offload the NVMe timeout
> > workaround to host drivers.
> > 
> > On Mon, Mar 04, 2024 at 10:08:06AM -0800, Palmer Dabbelt wrote:
> > > On Thu, 29 Feb 2024 07:08:43 PST (-0800), lpieralisi@kernel.org wrote:
> > > > On Tue, Feb 27, 2024 at 06:35:21PM +0800, Minda Chen wrote:
> > > > > From: Kevin Xie <kevin.xie@starfivetech.com>
> > > > >
> > > > > As the Starfive JH7110 hardware can't keep two inbound post write
> > > > > in order all the time, such as MSI messages and NVMe completions.
> > > > > If the NVMe completion update later than the MSI, an NVMe IRQ handle
> > will miss.
> > > >
> > > > Please explain what the problem is and what "NVMe completions" means
> > > > given that you are talking about posted writes.
> 
> Sorry, we made a casual conclusion here.
> Not any two of inbound post requests can`t be kept in order in JH7110 SoC, 
> the only one case we found is NVMe completions with MSI interrupts.
> To be more precise, they are the pending status in nvme_completion struct and
> nvme_irq handler in nvme/host/pci.c.
> 
> We have shown the original workaround patch before:
> https://lore.kernel.org/lkml/CAJM55Z9HtBSyCq7rDEDFdw644pOWCKJfPqhmi3SD1x6p3g2SLQ@mail.gmail.com/
> We put it in our github branch and works fine for a long time.
> Looking forward to better advices from someone familiar with NVMe drivers.

So this platform treats strictly ordered writes the same as if relaxed
ordering was enabled? I am not sure if we could reasonably work around
such behavior. An arbitrary delay is likely too long for most cases, and
too short for the worst case.

I suppose we could quirk a non-posted transaction in the interrupt
handler to force flush pending memory updates, but that will noticeably
harm your nvme performance. Maybe if you constrain such behavior to the
spurious IRQ_NONE condition, then it might be okay? I don't know.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
