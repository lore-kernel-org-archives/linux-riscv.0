Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B4AC4363A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 07:46:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30A942075A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 07:46:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aNy6J/zt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="tHnKXDny"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30A942075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chronox.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=skWyUXTID9fX+OBcahlBKgKPiu0IsNPqiuym/UE47Uw=; b=aNy6J/ztqEKq1IBATeMTFCN06
	Deg2d7MNH+76OHActmH2RFg4QsURVfaX8YMUWTpZdoKyfZnyFykzbx/LOKzZPFe5yBo01B2vpV+vI
	cKZf5UkKHMM33mMijUVjVsuLDsY/6yay2Z/agCWBdwQ+NhRuUhntXMQ7OxaNaVEPpcineL+Yc6VcK
	VZN3gUTHqaaO+y7IctYTb/UyGGk3Zmb0gxsChD4vTNdBv0didQDoLmtXLNOjJNVowAjraVIwxInj9
	63BQhFMpPt9PKoejRFHcJVoU9VqDkd1RCYPtpiU3FhToGGM+pcOEDJV/RnE+MxwC0rvgX/NjFR1Hu
	HbEJn6/TA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPLBt-0001Nw-9R; Mon, 05 Oct 2020 07:45:49 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPLBq-0001N8-6F
 for linux-riscv@lists.infradead.org; Mon, 05 Oct 2020 07:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1601883944;
 s=strato-dkim-0002; d=chronox.de;
 h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=JI6A9PpIQFNnYPSlFbk1aFwk9N6qbShlSuz0WnZt37Q=;
 b=tHnKXDnyBLXHWrlsnvySCrNUafGN0/G9TFs4volRbBoZ9WoB1KvX5/9b28t+x7cOJU
 Kc5JqxP9v36FEwMpXvArDiWvgrgKW08hB3FL7YItrQ7reJCwm67ccZQs3LuD/k/Z3tCa
 Ks8M0bqBEO1NLLahsZ3kxa5hy88bVvtV6g9tixwUgQt0nwWgKXHSkYJxLu8qf902mKkG
 Y1Gl3Ipo4wUY8cPEQUx4U1J4KH96GckjAgMeHNPhng9v5pEl3vwpHM9JzR7ImNKovCPl
 URs4Nxpmt3dBLMr4Geaz2ycOOvcFesXIJ+JR2ZATzlxQxIWqwuh/DaHbXLnyQxY0h9FC
 daDg==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXPZJfSYkOI="
X-RZG-CLASS-ID: mo00
Received: from tauon.chronox.de by smtp.strato.de (RZmta 47.2.1 DYNA|AUTH)
 with ESMTPSA id C0b627w957jYBRk
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Oct 2020 09:45:34 +0200 (CEST)
From: Stephan Mueller <smueller@chronox.de>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] crypto: jitterentropy - bind statically into kernel
Date: Mon, 05 Oct 2020 09:45:33 +0200
Message-ID: <2961600.L5xXbe6F5v@tauon.chronox.de>
In-Reply-To: <CAMj1kXFL4gfrK1+zRG9sajTk62yRh3WzBG46KfKD=iM=VQMTAQ@mail.gmail.com>
References: <20200930065617.934638-1-palmerdabbelt@google.com>
 <2588700.mWSkj6HvKX@tauon.chronox.de>
 <CAMj1kXFL4gfrK1+zRG9sajTk62yRh3WzBG46KfKD=iM=VQMTAQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_034546_359234_ACF0391F 
X-CRM114-Status: GOOD (  17.16  )
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
 Christoph Hellwig <hch@infradead.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Montag, 5. Oktober 2020, 08:44:39 CEST schrieb Ard Biesheuvel:

Hi Ard,

> On Mon, 5 Oct 2020 at 08:40, Stephan Mueller <smueller@chronox.de> wrote:
> > Am Montag, 5. Oktober 2020, 08:24:46 CEST schrieb Ard Biesheuvel:
> > 
> > Hi Ard,
> > 
> > > If jitterentropy is a special case, we could put a alternate
> > > non-'static inline' version of random_get_entropy() in the core
> > > kernel, and only export it if JITTER_ENTROPY is built as a module in
> > > the first place. But I'd prefer it if jitterentropy switches to an API
> > > that is suitable for driver consumption.
> > 
> > Which API do you have in mind? In user space, I use
> > clock_gettime(CLOCK_REALTIME) which also considers the clock source.
> 
> AFAICT, that call is backed by ktime_get_real_ts64(), which is already
> being exported to modules.
> 
> Could you please check whether that works for your driver?

Yes, will do. Thanks.

Ciao
Stephan



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
