Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F07C8303E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 17:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnNHiWWT7BTIMQhkFZjgP7vF9F9oTvkqielWswhP0pM=; b=UaAFo/1eBoFydr
	YLLFTa0WWXIFzUT7IGMIvtftTJCjWuCQJwIWKUXqXmAwnYwzkrGmilmFfQPh4MsscgoMwudQI8BP1
	4vZuheA0SI5N5Wtp+XZmLP6aLtrRMrDvb+EMlmOGkRP6r/cIvoRo0joTCJlE++GP0td09BOQKK2id
	PgI8mxjGYkBHbZTkgUne52chXl7obQWawfJT2UfnLsKhj+IG3zqpN5hchtfrkt4aolWBN9KzeBnJf
	GkYUWcX+vH2+/T4uZMT8IViPCk63ln7ReIVavUb0byEE/KuG0s2b9YGA+FW+0dsZE6ln27Qlq1BcI
	wWEGuKOyg//hc1Z6wKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjiYb-00000002xTA-0AFa;
	Thu, 29 Aug 2024 17:03:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjiYX-00000002xRu-3QY7
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 17:03:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 42643AE0395;
	Thu, 29 Aug 2024 17:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1892C4CEC1;
	Thu, 29 Aug 2024 17:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724951011;
	bh=fF3MZfjWlsFpCSUK05YMBeA2C4rmrtnhmYrTtq1uU0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZhGXw6ZIpHaX7JtJXKxC+GfEC1uwdjGFdHd4u3KBEKsgNEMlsfLwY28AzyzstIyy2
	 wuRnpC5FDa2d7QrnJCgninVC5chkrb2PVaVhnfIvb3ITaIJEqj/nH41BFD3ZSz9VM/
	 SoSSYsOc81eMJWqMVcXpC1l24NfFd5ZNrHcib6NsTv+4+4ikTu7YF7mT4InIucpw0u
	 48htY7e+QOgDMhcG62bBjp321l+7fdxiYxcVWLFLbPPFchXxQ2qNUbwdxUQMFbggO5
	 I51KzR4bHsNR2nB0gU3r4wKJouSCitIS7TWi7J8KGrBLKvr2QwjU6oS0u0Dwx8KZ+u
	 T9Wera6VSKTkg==
Date: Thu, 29 Aug 2024 22:33:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 2/3] soc/sophgo: add top sysctrl layout file for
 CV18XX/SG200X
Message-ID: <ZtCp346ucJq/V1kP@vaman>
References: <IA1PR20MB495396729244074C36E51E11BB942@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953E0D56CE4010C470E4A71BB942@IA1PR20MB4953.namprd20.prod.outlook.com>
 <Zs9kUAeapWeN/4GS@vaman>
 <IA1PR20MB4953572077286AF23A747507BB962@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953572077286AF23A747507BB962@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_100334_013685_20A85B35 
X-CRM114-Status: GOOD (  21.06  )
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

On 29-08-24, 09:38, Inochi Amaoto wrote:
> On Wed, Aug 28, 2024 at 11:24:24PM GMT, Vinod Koul wrote:
> > On 27-08-24, 14:49, Inochi Amaoto wrote:
> > > The "top" system controller of CV18XX/SG200X exposes control
> > > register access for various devices. Add soc header file to
> > > describe it.
> > 
> > I dont think I am full onboard this idea, 
> 
> Feel free to share your idea. I just added this file for
> convenience to access the offset of the syscon device. 
> In fact, I am not sure whether it is better to use reg
> offset. Using reg adds some unncessary complexity, but
> can avoid use this offset file. If you prefer this way,
> it is OK for me to change.

I would just add the offsets that I need in local driver header and move
on...

> 
> > but still need someone to ack it
> 
> I am not sure there will be someone to ack it. If this patch
> is kept.
> 
> > > 
> > > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > > ---
> > >  include/soc/sophgo/cv1800-sysctl.h | 30 ++++++++++++++++++++++++++++++
> > 
> > is soc/sophgo/ right path? why not include/soc/sifive/... (sorry dont
> > know much about this here...)
> > 
> 
> CV1800 is a SoC from Sophgo, it is not from SiFive.

As I said I am not sure, someone who is from this world should ack this
header

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
