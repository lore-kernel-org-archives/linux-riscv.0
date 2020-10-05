Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67013C4363A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 06:40:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FBCC2068D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 06:40:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BbTpDvhc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="X//2WZiT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FBCC2068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chronox.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7byN3poKPU4newmvJc3sTgHFncqIF8NZS9az3hwE5oc=; b=BbTpDvhcVsg9YxhR7VgNuzCh9
	OV2u1SYEM/9qUeVH3wLr3jerIpxHE0fWJ8paOLRX+Z2+CH/nuHRLlqa+rQ97gOPQ6drT2m4hrOTet
	Oy2xze+mkSzBycQlVJ+sEe6YO9YZTnujdcOCsUH6wy5x0t3gHhPRZ0pgYSytKyKhgu1z+Twri5v6P
	s/CFHRou0Fhg3U9hVLXQ3xqAIJhj0aeU/4xBSuCQosv8vFvecUa6XLjKcIWoNICoKqqXNpNzDYWiM
	sLrKm3bScUtWDoUiIhrMkRbKqAOo8SXtm9XjgApOw4XBImyZ4kKyUYn1UxFzoGtMHpb9mcXUbaqLq
	xtfl1BNzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPKAt-0003Ep-0n; Mon, 05 Oct 2020 06:40:43 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPKAr-0003EA-3d
 for linux-riscv@lists.infradead.org; Mon, 05 Oct 2020 06:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1601880038;
 s=strato-dkim-0002; d=chronox.de;
 h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=BfPJTkHJ25aT4xHJTt8bqUqo6Mmt7owb63RplAlMbz0=;
 b=X//2WZiTr1ABVHm60SU+SkzIB07NCvrEIMm73MO7HzTDjuDULbsADNcuQEOG9r+qvi
 yqY3bYrxfhrBzzn1UdPhQ5EP82mdIAWqqlYyeoAfSGCabs8xM/N3Wdq29qxfP2X4rDPM
 0JqFNQ8ocnbvN9O07DjNw6+cg6B4AM3P1QG3uxEYHUUpcpuuMbctV9vsfArupro54IMS
 RyscBzkklaE/3pDFddPu8pMffAmiLKamswbS3UQMp5oin6PMGV220bjjLq2yiwdms5Vt
 gnhj4u81WMwjY+7MvyHhdWVohCUU64rLaWc+SdMIyTTSENuWlta2mh+4aa7PLYKh00Dd
 Rd/g==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9x2wdNs6neUFoh7cs3k0="
X-RZG-CLASS-ID: mo00
Received: from tauon.chronox.de by smtp.strato.de (RZmta 47.2.1 AUTH)
 with ESMTPSA id C0b627w956eQB0K
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Oct 2020 08:40:26 +0200 (CEST)
From: Stephan Mueller <smueller@chronox.de>
To: Christoph Hellwig <hch@infradead.org>, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] crypto: jitterentropy - bind statically into kernel
Date: Mon, 05 Oct 2020 08:40:25 +0200
Message-ID: <2588700.mWSkj6HvKX@tauon.chronox.de>
In-Reply-To: <CAMj1kXFC=6G1pqFAcjASrKJfzguO3k9Rv-7NsmTaX8qNre5TGw@mail.gmail.com>
References: <20200930065617.934638-1-palmerdabbelt@google.com>
 <20201005061918.GB1856@infradead.org>
 <CAMj1kXFC=6G1pqFAcjASrKJfzguO3k9Rv-7NsmTaX8qNre5TGw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_024041_350187_D7763561 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: kernel test robot <lkp@intel.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Montag, 5. Oktober 2020, 08:24:46 CEST schrieb Ard Biesheuvel:

Hi Ard,

> If jitterentropy is a special case, we could put a alternate
> non-'static inline' version of random_get_entropy() in the core
> kernel, and only export it if JITTER_ENTROPY is built as a module in
> the first place. But I'd prefer it if jitterentropy switches to an API
> that is suitable for driver consumption.

Which API do you have in mind? In user space, I use 
clock_gettime(CLOCK_REALTIME) which also considers the clock source.

Thanks
Stephan



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
