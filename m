Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A25C433E2
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 02:22:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70A8020787
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 02:22:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IuXMLkFX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70A8020787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ko5BagqHpjiHCZQOO2msr30qAiTJzZierCWRkyuJ4gA=; b=IuXMLkFXMCf3rlvm1j55BGaQh
	7Btx/bhC6ffJxTc6BVSs+hV7b/HKKFj98enRacaLFbaX4XephZClSXZTAFYPB0l/nsdWVZoozV8ly
	XDbVgK+7H+/53SWRsdjFOjcpnzoNUMB6bS5ZawzpG9GQLptEf8yDNA9BD5k6bYR1IMX6EFZjzJZnX
	XDxVINxU5h3lM2kMGZNZNSLdIF/WmaJAmfQDi5Ocnuge+nEmGuCl+E3OzJeXoelbs2h6dW5VGxQoP
	jlqbonz7Nl5+dptxlVQ1vjp66ikb+8LWPxN0+02KXhVF8yHdVw/KsbjEc/pdx5x26RlY53uAhIEpg
	cRFah09RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4OP-0003Ru-GT; Wed, 22 Jul 2020 02:22:01 +0000
Received: from kernel.crashing.org ([76.164.61.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4ON-0003RF-Gx
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 02:22:00 +0000
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 06M2LIGX018560
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 21 Jul 2020 21:21:25 -0500
Message-ID: <bb461dde0df3eaf0bed949eebf0657b227431bb3.camel@kernel.crashing.org>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Date: Wed, 22 Jul 2020 12:21:16 +1000
In-Reply-To: <mhng-cd9a74ea-2edf-47e4-aade-b090f1a069f1@palmerdabbelt-glaptop1>
References: <mhng-cd9a74ea-2edf-47e4-aade-b090f1a069f1@palmerdabbelt-glaptop1>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222159_706769_2ED42B64 
X-CRM114-Status: GOOD (  10.48  )
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
Cc: aou@eecs.berkeley.edu, alex@ghiti.fr, linux-mm@kvack.org,
 mpe@ellerman.id.au, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 paulus@samba.org, zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 2020-07-21 at 16:48 -0700, Palmer Dabbelt wrote:
> > Why ? Branch distance limits ? You can't use trampolines ?
> 
> Nothing fundamental, it's just that we don't have a large code model in the C
> compiler.  As a result all the global symbols are resolved as 32-bit
> PC-relative accesses.  We could fix this with a fast large code model, but then
> the kernel would need to relax global symbol references in modules and we don't
> even do that for the simple code models we have now.  FWIW, some of the
> proposed large code models are essentially just split-PLT/GOT and therefor
> don't require relaxation, but at that point we're essentially PIC until we
> have more that 2GiB of kernel text -- and even then, we keep all the
> performance issues.

My memory might be out of date but I *think* we do it on powerpc
without going to a large code model, but just having the in-kernel
linker insert trampolines.

Cheers,
Ben.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
