Return-Path: <SRS0=wOAF=M2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B906C28CF8
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 14 Oct 2018 00:02:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 172D720835
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 14 Oct 2018 00:02:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JwW1gxRW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAhghVqn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 172D720835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVveNqwMlocRQ6Rg69AkOqp8zbkGtbu1F07ZyU3qjhE=; b=JwW1gxRWXZjVd0
	2OOy8QdwMFJJig7J4E7a7lWhKTbUtUOemdIE2PKUcwL7610EqCSoqi+jtf49yyt+T/Or/TToGmEKz
	8JRxHaP5RjJiAKwTEq1ZKDfDGsKEeBDnKWzgNbv1mSwDPeIVjrCzK50U+Nl15iKT+jlFyJ3+zsY2v
	vI4rC3RzDkHvseTWzBbYbI+NqxW/n74ejivSVvuLx865UEpkupbWfzOMk+7oU98BmRnlnqVkOnTRg
	d2k0rx7QtI3UmkdvzQ45RYKZJBQOBvL4SvZrec/n+ygml708WFvVYxCKh8OFU31CCqmUXtBSNRrPB
	ICI3PSNiobqi3emA/01w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gBTrS-00026d-Tm; Sun, 14 Oct 2018 00:02:22 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBTrP-00025m-Qu
 for linux-riscv@lists.infradead.org; Sun, 14 Oct 2018 00:02:21 +0000
Received: by mail-pg1-x542.google.com with SMTP id i4-v6so7461650pgq.9
 for <linux-riscv@lists.infradead.org>; Sat, 13 Oct 2018 17:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XQ9ooewDGpp08nPommmRaP2wvXxwlXLWiicntLKC0TQ=;
 b=gAhghVqnzOlTCprV1zPEvnoH29Kcel/Ki05fCuwl3eEvxzmFNsFgVMnGV9KwV6QhAb
 nZKCgvSpKy/taut7sws1ht1fy9kVARWmAGF0KP7oNgnc5FejkjiYZLPuG5Jru08KdN3a
 d9Jcg49hC7inQjADrd7RZJ+PjC33mugJ3DscdRnOe5NDcRNoAtzj2O6jJCa1KbKzJ/N7
 6KjOIDH/2hvEb3mkg0dK0cqHpwlujkvNv0o1BrCYGOTBHVBJLIf7lx19+/UB9IJyBjSB
 hnfACjM9u24CV0vxEqJUX0gl+TBmAVUY2ukWia5CGgBLa16HtqpQXfwuNMWgCIGnzRDm
 C3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=XQ9ooewDGpp08nPommmRaP2wvXxwlXLWiicntLKC0TQ=;
 b=YfMKOffKEOmZuJrUFrJ7o58dEzKJ69TTHvWLh2XYf6IOjo/Vs9ZSfc2kJhzh+trX+M
 lD/uiRG91DmRFXo/pEbc7lY/NgT3kSsKNcAbesb8JziUpMK9Zki9uUnsRGWucL8SSuZN
 B1hy6dcKb+clyHsMAAAwH1KBARWpc/ane5zPjLaQfrf4RO95tzIeTP6ztXcc00XCD4Sn
 AVGVGwkWKADXBUpJZFWCqcyzBq7LpGoCnfeEl0KjbAMUz8BkCta7JGA1MoiW6yJuFXWw
 TShHbTBED0a03WgdXF+Y05VgEbCabUQD3fLecJsCNuXyVHGA9nR3WXNaleKgtaxqF85H
 XvAg==
X-Gm-Message-State: ABuFfoiJcg/WqWQtEJjkJce0aPU6DejxZ0M8TwRXVgIXv1PjXrMXzrkX
 bOUw0Tz0KO2FMIQoRBfPqyM=
X-Google-Smtp-Source: ACcGV623aiWz7i0DLLQYHSPURubl8Ks+z+/nd1fzMq/VCvHfPUP5ZS83oDmkqhVd8S70+vDxEW4hzQ==
X-Received: by 2002:a62:35c2:: with SMTP id
 c185-v6mr11769226pfa.69.1539475328312; 
 Sat, 13 Oct 2018 17:02:08 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id t184-v6sm3587730pfd.14.2018.10.13.17.02.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Oct 2018 17:02:07 -0700 (PDT)
Date: Sat, 13 Oct 2018 17:02:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alan Kao <alankao@andestech.com>
Subject: Re: [PATCH v8 3/5] Cleanup ISA string setting
Message-ID: <20181014000205.GA22333@roeck-us.net>
References: <1539051514-3658-1-git-send-email-alankao@andestech.com>
 <1539051514-3658-4-git-send-email-alankao@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1539051514-3658-4-git-send-email-alankao@andestech.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181013_170219_905458_FB7D576E 
X-CRM114-Status: GOOD (  10.63  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong@andestech.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <greentime@andestech.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Vincent Chen <vincentc@andestech.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181014000205.vD6W7890zp95jhvpZ_XVda9_X6MsDdpnuuTRMmIf77Q@z>

Hi,

On Tue, Oct 09, 2018 at 10:18:32AM +0800, Alan Kao wrote:
> This patch cleanup the MARCH string passing to both compiler and
> assembler.  Note that the CFLAGS should not contain "fd" before we
> have mechnisms like kernel_fpu_begin/end in other architectures.
> 
> Signed-off-by: Alan Kao <alankao@andestech.com>
> Cc: Greentime Hu <greentime@andestech.com>
> Cc: Vincent Chen <vincentc@andestech.com>
> Cc: Zong Li <zong@andestech.com>
> Cc: Nick Hu <nickhu@andestech.com>
> ---

With this patch in -next applied, I get the following error
when building riscv:defconfig.

cc1: error: -march=c: ISA string must begin with rv32 or rv64
cc1: error: ABI requires -march=rv64
Kbuild:21: recipe for target 'kernel/bounds.s' failed

This is seen with both gcc 7.3.0 and gcc 8.2.0. Bisect log is attached.

What am I missing ? Does RISC-V now require a new non-upstream compiler ?
Or a special version of make ? I am currently using GNU Make 4.1.

Thanks,
Guenter

---
# bad: [774ea0551a2966c8fc29a6f675c3e28c5c6fa586] Add linux-next specific files for 20181012
# good: [0238df646e6224016a45505d2c111a24669ebe21] Linux 4.19-rc7
git bisect start 'HEAD' 'v4.19-rc7'
# bad: [dfbf78faefa3c26d94208398e62bf25ea798e7f2] Merge remote-tracking branch 'spi-nor/spi-nor/next'
git bisect bad dfbf78faefa3c26d94208398e62bf25ea798e7f2
# bad: [530d65b38df62760ce7f778907cc3fce6f5519b7] Merge remote-tracking branch 'hid/for-next'
git bisect bad 530d65b38df62760ce7f778907cc3fce6f5519b7
# good: [4967343a2e8ae0ee767471053f8b55e529b7be7e] Merge remote-tracking branch 'arm-soc/for-next'
git bisect good 4967343a2e8ae0ee767471053f8b55e529b7be7e
# bad: [e8af1ded2dc3e3cb4e8c414809b2303f5b91abe0] Merge remote-tracking branch 'befs/for-next'
git bisect bad e8af1ded2dc3e3cb4e8c414809b2303f5b91abe0
# good: [1ccf1a61dd05b37ddc41fb874109915efb56c53d] Merge remote-tracking branch 'clk-samsung/for-next'
git bisect good 1ccf1a61dd05b37ddc41fb874109915efb56c53d
# good: [43693e88f9764f7ff292e18cbb0d36ed9b26411e] Merge remote-tracking branch 'powerpc/next'
git bisect good 43693e88f9764f7ff292e18cbb0d36ed9b26411e
# good: [52a34b34d4ff9a61bc6da9740541d8f08a40438c] s390/crypto: Enhance paes cipher to accept variable length key material
git bisect good 52a34b34d4ff9a61bc6da9740541d8f08a40438c
# bad: [cc932c65d7892091735a553b89fdd21cc20cb85d] Merge remote-tracking branch 's390/features'
git bisect bad cc932c65d7892091735a553b89fdd21cc20cb85d
# bad: [bb0133e085b524a49829fd02be21f1edd3beaac1] automerging branch "kernel.org-palmer-linux/next-nofpu" into "for-next"
git bisect bad bb0133e085b524a49829fd02be21f1edd3beaac1
# good: [c720a7ff190fc2015ae1449bcbf31216c4a9e973] automerging branch "kernel.org-palmer-linux/next-hch" into "for-next"
git bisect good c720a7ff190fc2015ae1449bcbf31216c4a9e973
# bad: [27625655dbfd83205ba489183f45a87717cb867c] RISC-V: Auto-detect whether a FPU exists
git bisect bad 27625655dbfd83205ba489183f45a87717cb867c
# good: [5453696cb3f1e5b316511234e27570d2f7698b70] RISC-V: Refactor FPU code in signal setup/return procedures
git bisect good 5453696cb3f1e5b316511234e27570d2f7698b70
# bad: [919ecff9aac4e7c8dae05d924385fb05c7c63854] RISC-V: Allow to disable FPU support
git bisect bad 919ecff9aac4e7c8dae05d924385fb05c7c63854
# bad: [0a5bee05fc67ce2044b8d91a18abbf14042da531] RISC-V: Cleanup ISA string setting
git bisect bad 0a5bee05fc67ce2044b8d91a18abbf14042da531
# first bad commit: [0a5bee05fc67ce2044b8d91a18abbf14042da531] RISC-V: Cleanup ISA string setting

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
