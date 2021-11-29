Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CDFC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 12:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7O7/c2fYSVTHByLzZcFQ6+nslm1+UN1n5qFBWGP6B0=; b=1Cf3Oeva8j0A0Z
	THHV6yf/5AW6YcPljnsU2VzVkatH/DWU5MSHGZBrv13mdD4ariT3fyHL98GUf3S1IBJxSGn+7mcDr
	RUI0vKN7pgsg1bs4mAc8SebqdDFapBc3d+YxF5md25e6cFfQpmyjsLp5zJMXTEX/bKH09ATfgoMhi
	AfqeQiT59MoBfRDvqQM7L5hCSdnEgH5q8Wss6DgvtaG+nl8H4sNVKK6762D8GXP35kNh7Ber1F6FK
	zVKW5dd2r6LJYfJmeNKTD0hiT8LHqOiMVPB/UA+G/rrhidVoApV10Avq/mzG6DFY4hDyjXRE4Kmym
	K3xWHmxux5BZXOQflEsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrfcQ-000eud-1B; Mon, 29 Nov 2021 12:18:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrfcN-000etJ-AQ
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 12:18:48 +0000
Received: from ip5f5b2004.dynamic.kabel-deutschland.de ([95.91.32.4]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mrfcH-0006se-Me; Mon, 29 Nov 2021 13:18:41 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: panqinglin2020@iscas.ac.cn, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, Alexandre ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v1 1/2] riscv,
 mm: Add Sv57 support based on Sv48 implementation
Date: Mon, 29 Nov 2021 13:18:40 +0100
Message-ID: <8716160.szTZlG9eok@diego>
In-Reply-To: <cda194e5-297d-5eb2-2dc2-7ce5fdf2fd60@ghiti.fr>
References: <20211124112021.788242-1-panqinglin2020@iscas.ac.cn>
 <20211124112021.788242-2-panqinglin2020@iscas.ac.cn>
 <cda194e5-297d-5eb2-2dc2-7ce5fdf2fd60@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_041847_406797_E84A1561 
X-CRM114-Status: GOOD (  19.72  )
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

Am Montag, 29. November 2021, 12:20:20 CET schrieb Alexandre ghiti:
> Hi Qinglin,
> 
> On 11/24/21 12:20, panqinglin2020@iscas.ac.cn wrote:
> > From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> >
> > This patch adds Sv57 implementation on the top of Alex's Sv48 patchset.
> > The mmu configuration will be determined on runtime, according to both
> > mmu HW support and mmu-type field in the dtb. The kernel will try to
> > set satp mode one by one from the configuration item to Sv39 in 64bit.
> >
> > Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

> > @@ -658,18 +755,31 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
> >   				continue;
> >   
> >   			if (!strcmp(mmu_type, "riscv,sv39")) {
> > +				disable_pgtable_l5();
> >   				disable_pgtable_l4();
> >   				return;
> >   			}
> >   
> > +			if (!strcmp(mmu_type, "riscv,sv48")) {
> > +				check_l4 = true;
> > +			}
> > +
> 
> 
> If sv48 is set in the device tree, why would you test if it is supported 
> below? I would take it as is, just like for sv39, I'm not sure we want 
> to override this silently and make a wrong device tree work.

or alternatively the code could emit a big WARN that a mismatch was
corrected. Getting to a point where a developer can actually see their
mistake on a console might be helpful to people :-)



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
