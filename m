Return-Path: <SRS0=MOMo=CC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7219C433E1
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2020 22:05:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 756B02078A
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2020 22:05:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YE+G4NrT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 756B02078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U07omObc95kx/QvOmKLVMh3i4WgVgrBzeI6374IvaHU=; b=YE+G4NrTviK14vw/CGBxDPaD3
	gMCShY0SSrV6uZH+XsUe6dhe00opLOJqSs0fz0cXipKkXllIMZSA4ExMtaadxR6dCt04Zx3o35dNT
	eu4k6aC0LiEGyfuCgfzoElZOAq3KQ9B0oEUzh/KbZLkQvsbbD2FftQ32NoB3UFKE1tkKgbqoMjfoi
	cyzZQwY/JqwA3L1zRXKoHMu9lzIA54m0bdUwsZKsU1ZEWp7MMAXFg46jGm1CksEqUTLIu2fRBSgfg
	GwvmOFdLXwxJsNORMn4AHKUxmfATm66p36aEF7w+8BDZd8cgrie+5As5JxfBtmFo4pURjtnTlIFRn
	miB3/Xp6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAKat-0002YA-Dg; Mon, 24 Aug 2020 22:05:35 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAKar-0002Xh-6q
 for linux-riscv@lists.infradead.org; Mon, 24 Aug 2020 22:05:33 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 265302CB;
 Mon, 24 Aug 2020 22:05:32 +0000 (UTC)
Date: Mon, 24 Aug 2020 16:05:31 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] Documentation: add riscv entry in list of existing
 profiles
Message-ID: <20200824160531.0e0a349b@lwn.net>
In-Reply-To: <20200815115728.15128-1-lukas.bulwahn@gmail.com>
References: <20200815115728.15128-1-lukas.bulwahn@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_180533_346485_931AA08A 
X-CRM114-Status: GOOD (  10.14  )
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
Cc: linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 15 Aug 2020 13:57:28 +0200
Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> As long as there are only a few maintainer entry profiles, i.e., three
> in v5.8, continue to maintain a complete a list of entries in the
> maintainer handbook.
> 
> Complete the list by adding the RISC-V ARCHITECTURE maintainer entry
> profile found in MAINTAINERS.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied, thanks.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
