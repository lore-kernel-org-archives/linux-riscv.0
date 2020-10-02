Return-Path: <SRS0=HnHo=DJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3B5C4363D
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2020 06:55:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AD9A206DD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2020 06:55:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="06kXRD1n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="N+fIHrAj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AD9A206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chronox.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=exroKWQ8IRL0Hx8ZKK6rNxk7ADws7Lm2J3MupJGM/X8=; b=06kXRD1nqV+fgGaL5GTuyORWG
	pVdcxw+hi85P+xoaQTgogP/QNe3cMIJUkZT6P2N4nBfWaBO71mgLbm0/vCm6tZVqFrZoSz73y1syQ
	aDzkvwMzMyWNOo6qfEYI2IZdsuldghqpCLJdySbjAjvkobQ2R8/XK8RPTOIQRZfwBhxyQ/pvMYP7J
	OoRYF4VYvpqw7phmWM+yGYIPk+eIW5sdn/qnn4PhIBV6lB/wKJdXpK+m7HiuPDSjgnccFsqC6XlAX
	HAwhIu/UDxfMIaJLcPFSM2k2Pktdi4F1L9U/scXXaM69/J/D5YCkQHXr48nZacQhNUyCXKU2d5i3Q
	fbftc7FpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOEyT-00058f-Qt; Fri, 02 Oct 2020 06:55:25 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOEyR-000582-MJ
 for linux-riscv@lists.infradead.org; Fri, 02 Oct 2020 06:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1601621719;
 s=strato-dkim-0002; d=chronox.de;
 h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=dG3VsnJVeZhSi88eTw1lFhyXDWSG0bJwarleuLQpKFA=;
 b=N+fIHrAjB29rTogy4B8oxfg3Xd2AZ8pajjVOJCDy7wgqRMyM1rcFiO1htYcvgmKgaV
 uZDCt4BJCaelXxU09xTFG0K1UHhPTDMud2UVekmjZJ7EF7ICQLrrUaGEIV+uetAz1T25
 8fuGrhHkuSb7HUHe14yYFspJjtPVtQ946KkA9EIXEG+6Exke6fovWd2utUSy/ph7Vqkl
 zrZg81qVMenHjZQ4PLN16HCApSs0tH21QZaoTsLE1wpPOocOmVNPUEhaCPOejsA/Q1mc
 0CLO3QB2vIDBk+TQF3ybhDh33Kyu97BCKS9aqTy5/aGE5k1y+IKsKgatdkniGHnoeE2+
 PPag==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9x2wdNs6neUFoh7cs3k0="
X-RZG-CLASS-ID: mo00
Received: from tauon.chronox.de by smtp.strato.de (RZmta 47.1.9 AUTH)
 with ESMTPSA id 602bfdw926t79aM
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 2 Oct 2020 08:55:07 +0200 (CEST)
From: Stephan Mueller <smueller@chronox.de>
To: Palmer Dabbelt <palmerdabbelt@google.com>,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: get_cycles from modular code in jitterentropy,
 was Re: [PATCH] clocksource: clint: Export clint_time_val for modules
Date: Fri, 02 Oct 2020 08:55:04 +0200
Message-ID: <3059805.eeVPZ7aKPO@tauon.chronox.de>
In-Reply-To: <20201002064905.GA27115@infradead.org>
References: <20200930065617.934638-1-palmerdabbelt@google.com>
 <20201002064905.GA27115@infradead.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_025523_832739_17845893 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel-team@android.com, kernel test robot <lkp@intel.com>,
 linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Freitag, 2. Oktober 2020, 08:49:05 CEST schrieb Christoph Hellwig:

Hi Christoph,

> On Tue, Sep 29, 2020 at 11:56:18PM -0700, Palmer Dabbelt wrote:
> > clint_time_val will soon be used by the RISC-V implementation of
> > random_get_entropy(), which is a static inline function that may be used
> > by
> > modules (at least CRYPTO_JITTERENTROPY=m).
> 
> At very least this needs to be an EXPORT_SYMBOL_GPL.  But I really don't
> think modules have any business using get_cycles, so I'd much rather
> fix CRYPTO_JITTERENTROPY to be required to be build in.

Changing CRYPTO_JITTERENTROPY from tistate to bool should be no problem.

I will provide a patch.

Ciao
Stephan



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
