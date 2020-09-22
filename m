Return-Path: <SRS0=X0/G=C7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4F0C4363D
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 04:38:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AF1D21548
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 04:38:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mG48UfRu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AF1D21548
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C6gIUyzH1BfmZYvxhVxfYzdu2H3hJWnkF1CY2YeXdng=; b=mG48UfRunIalVU30eBQSL9Zm/
	7N1bOFpuNuliRuSAC3PzZafWxzrQjqv2Zc+ilV7OfwSq0eMxELypRHY6H0m96/2j1GTWDP3U12Ay3
	UQmi4TJCvfzQAqbeGT9DLRvpu5kCpS07pswVALUtoq0sIKFJXayTaFZXopwsGXKdavNGA7fQfuv3m
	BCk8nWwzxO8Z9fHVRphtZ7dGoC1WwYuLWt9ZC/l8jNipAaZuwGCdajVfgUE+HnIOUtFML1xSkVGJH
	SdEjPrOnoOaMeRThNxIZCPmK4M/pKjTR+di8bfW1hTe9UvKxYF7MMVeXsDvqT1gh9DBdBXYDzqSwe
	FKetaT7QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKa3z-00045N-Ej; Tue, 22 Sep 2020 04:37:59 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKa3x-00044G-MO
 for linux-riscv@lists.infradead.org; Tue, 22 Sep 2020 04:37:58 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4D5D86736F; Tue, 22 Sep 2020 06:37:52 +0200 (CEST)
Date: Tue, 22 Sep 2020 06:37:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, viro@zeniv.linux.org.uk,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: remove set_fs for riscv v2
Message-ID: <20200922043752.GA29151@lst.de>
References: <20200907055825.1917151-1-hch@lst.de>
 <mhng-5fa86587-c404-420e-a4c0-43d197d1cd27@palmerdabbelt-glaptop1>
 <20200909065515.GA9618@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200909065515.GA9618@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_003757_856924_B32417D5 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Given tht we've not made much progress with the common branch,
are you fine just picking this up through the riscv tree for 5.10?

I'll defer other architectures that depend on the common changes to
5.11 then.

On Wed, Sep 09, 2020 at 08:55:15AM +0200, Christoph Hellwig wrote:
> now that we've sorted out a remaining issue base.set_fs should not
> be rebased any more, so you could pull it into the riscv tree or a topic
> branch.
> 
> The first four patch should go into base.set_fs, though.  Arnd, can you
> re-review the updated patches?
---end quoted text---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
