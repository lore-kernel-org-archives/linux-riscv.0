Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024B0C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:57:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A007960FEF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A007960FEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d8/HNR3VH+dspIEeJmedQadFh6FCWnCqhOTtliO3Nq8=; b=nRPuhhAJVzmq37AEF5zNZJpD6
	qqDaokeH/Dpc0iwZqYePEOnbKowbFJWxXvVF4Tey0Tfpc6y79jrRYdlUBiLHYV+DnHQdOscq+34UP
	D9SYhFF5TiOV7wySzQ1BfNP6jF91XxVdx6PXJ99oeGrJRoV+wNydR3jt33xdrqOtVDhkoBLo+VQMZ
	ZWi1yx+5UhpjeW9V22LKHjFUBgvPlkorfTctyUe2TpG+PvMTkUwrTwty10oQK3N1BmfhUvel3qk1Y
	HMN26lU5jfYO9ukkBiC9wwTGj2E4KC+G/uWc6/dqqPJ5cnBQHaT4gzuGVej3EqNYsmohNv8cysJxD
	7DNsjKVFA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljG8j-0034bc-C3; Wed, 19 May 2021 06:57:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljG8e-0034aZ-In
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 06:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yy/Vphg/FRHpkw1vHzTo9/BifPa4JoOfWnkBOtgrZzs=; b=3GPsArz6+e2uJ9BN2yjmVPMyl/
 JCXuPoe3E4z7pmD8FZfZN/vXq0SKz5mXpbdFwo/o4YyRQ7F3GsDl7qbQCypHmFydiihZf8RHEHZVw
 EZn6jvwf1soyPyzgK8lX+bOLfcATiwil5M0Xb6VDXyVddT8mkdrZN4Ui+PE6OSrTzllxr3V0WZuDk
 Vb1N+GpdLoOR4CHI3FhVsQ15G3um9mV2yEdm5VX2BQYnD2cTU2u1DLmDmIS64LHCnNGnwuEVZI87l
 jpZckfcSOHmy9w3AsJiqdWuy+MS7p8PujxoL6GF+3EhVHjnlBLXAn3iayAEdWn6lOS78aujT3/VeJ
 HxeyBeKQ==;
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljG8b-00FCPp-VR
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 06:57:03 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id ADB9468B05; Wed, 19 May 2021 08:56:58 +0200 (CEST)
Date: Wed, 19 May 2021 08:56:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Drew Fustini <drew@beagleboard.org>
Cc: Christoph Hellwig <hch@lst.de>, Guo Ren <guoren@kernel.org>,
 Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com,
 lazyparser@gmail.com, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>,
 paul.walmsley@sifive.com
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210519065658.GB31590@lst.de>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTR5838=Uwc5P6Xs=G7vk80k0yqWcSsNe0OFcwc9sDBBHg@mail.gmail.com>
 <20210519060617.GA28397@lst.de> <20210519065431.GB3076809@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519065431.GB3076809@x1>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_235702_180759_F93F16BB 
X-CRM114-Status: GOOD (  14.29  )
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

On Tue, May 18, 2021 at 11:54:31PM -0700, Drew Fustini wrote:
> Isn't it a good goal for Linux to support the capabilities present in
> the SoC that a currently being fab'd?
> 
> I believe the CMO group only started last year [1] so the RV64GC SoCs
> that are going into mass production this year would not have had the
> opporuntiy of utilizing any RISC-V ISA extension for handling cache
> management.

Then the vendors need to push harder.  This problem has been known
for years but ignored by the vendors.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
