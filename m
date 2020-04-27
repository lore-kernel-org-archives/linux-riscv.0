Return-Path: <SRS0=Khb+=6L=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5643C4CECC
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2020 19:44:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DE8D206B8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2020 19:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CB2QrL2+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BF4/l8Xr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DE8D206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/P6O1zMXHW2csPFed/+nhXIIfGsciBZGW+Q1/D/LRo=; b=CB2QrL2+hTYcmq
	ZkR4j79bT9fHtfi1bzgDcQNdmXmiHnqlUIN8+wER73dKDyEkcuRXXY44ijpAcRXRG2Fi/W7Ele1pJ
	TnVj92nQYz3jQH5+RXpF3DYUkdknjMLhpyp3SFfiSkGQy9Nuyg8DjyJd0l/VrAcGcVV3Qs3hnSUn8
	cJEqtBIhrlYJc9LKbWZWJpZt48DvZyBO+pFz8KUBx64a5SlQQ+t1MglfA4wJgGNL8KvXoUPgEHKao
	JJ/ereAGcl2szylhtQmkSe3ZV+tqSKllwmTJEL6AxUGghFzNRf/twz75SKLr2PruHcyH0Hjqo5RP+
	ajsuZxvYe7USbCzzOKpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9g6-0004bK-T7; Mon, 27 Apr 2020 19:44:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9eO-0002sM-HQ; Mon, 27 Apr 2020 19:42:46 +0000
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B71652078C;
 Mon, 27 Apr 2020 19:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588016562;
 bh=pHSFHwxnqBXxHCqPQAkxUYpCjZ/3lJQClrx+8qthDWQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BF4/l8XrQ02299gpcli0FvwYPMF2hN3ZsowBym+oFxLCbmSBv6c8XKoMoCpSUs1mZ
 vLIh3Da+bxY+s/o+fJHms7WltoegzNJwopJah4TrVT7ox2ZS8JuHiDXeMfsgI8/UYZ
 lVmACC6y+QfktaRHOt+ND6M6DoBoUgRMxPoCw4LQ=
Date: Mon, 27 Apr 2020 12:42:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 1/4] mm: add DEBUG_WX support
Message-Id: <20200427124241.28adefc19cfddcf83f75d03c@linux-foundation.org>
In-Reply-To: <CANXhq0rW5j+uAymXbfsND9AXHYvM+fPUX9YYYRVXY-Y1u6yo0Q@mail.gmail.com>
References: <cover.1587455584.git.zong.li@sifive.com>
 <23980cd0f0e5d79e24a92169116407c75bcc650d.1587455584.git.zong.li@sifive.com>
 <20200427074915.GA11787@willie-the-truck>
 <CANXhq0rW5j+uAymXbfsND9AXHYvM+fPUX9YYYRVXY-Y1u6yo0Q@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_124244_673425_985D1E23 
X-CRM114-Status: GOOD (  15.12  )
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
Cc: hpa@zytor.com, catalin.marinas@arm.com, x86@kernel.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, mingo@redhat.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, bp@alien8.de,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 tglx@linutronix.de, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 27 Apr 2020 16:47:47 +0800 Zong Li <zong.li@sifive.com> wrote:

> > > +       This is useful for discovering cases where the kernel is leaving
> > > +       W+X mappings after applying NX, as such mappings are a security risk.
> > > +       This check also includes UXN, which should be set on all kernel
> > > +       mappings.
> >
> > "UXN" is the name of a bit in the arm64 page-table descriptors, so this
> > should be reworded now that it's in generic help text.
> >
> 
> It's exactly. Sorry for missing the statement.
> 
> Hi Andrew,
> Shall I send a next version patch to fix it? It should be "This is
> useful for discovering cases where the kernel is leaving W+X mappings
> after applying NX, as such mappings are a security risk." here.

I'll add this:

--- a/mm/Kconfig.debug~mm-add-debug_wx-support-fix
+++ a/mm/Kconfig.debug
@@ -128,8 +128,8 @@ config DEBUG_WX
 	help
 	  Generate a warning if any W+X mappings are found at boot.
 
-	  This is useful for discovering cases where the kernel is leaving
-	  W+X mappings after applying NX, as such mappings are a security risk.
+	  This is useful for discovering cases where the kernel is leaving W+X
+	  mappings after applying NX, as such mappings are a security risk.
 	  This check also includes UXN, which should be set on all kernel
 	  mappings.
 
_


