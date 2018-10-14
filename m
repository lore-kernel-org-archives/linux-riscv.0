Return-Path: <SRS0=wOAF=M2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC2EC7112A
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 14 Oct 2018 23:47:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A70EB20652
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 14 Oct 2018 23:47:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VVxgkAJ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A70EB20652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RzNyYtzKopfvT2le/yNrk25LJ5wjwGxeF+ZlHxXp3M=; b=VVxgkAJ7R91l6f
	LqewIZ56SKEW6AIU8k9EgDBzbPutyaOmakHo89b0hTaQgeWTx8DYph0Xk3ifU/qMOoPOCOjEnnmpc
	UMZLKMllZVKnL1l98wklEK65oq/1k2qWz6pCmkX8zJcCn94+ps5wnAKeojbqDd9SXOnacQFZIkWHZ
	6qm2R7auy23MFtRYQtBZakHIBs0glcDdFwvsT/TxSM7pZ/GAun1+/Gh82uwNoL3DF1f4WPxtwtuTI
	HGmlKu3XHl2yk+ToSILTaTcu3bmlx9yZnNejWCLZv6oBXckAURxEnrbBFemtexn2ifGvdndJoC4lL
	jvpZNxmikA5+jBkCfK4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gBq6N-0001g9-Uo; Sun, 14 Oct 2018 23:47:15 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBq6J-0001es-W8
 for linux-riscv@lists.infradead.org; Sun, 14 Oct 2018 23:47:13 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id w9ENmn0T059745;
 Mon, 15 Oct 2018 07:48:49 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Mon, 15 Oct 2018
 07:46:39 +0800
Date: Mon, 15 Oct 2018 07:46:40 +0800
From: Alan Kao <alankao@andestech.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v8 3/5] Cleanup ISA string setting
Message-ID: <20181014234639.GA14835@andestech.com>
References: <1539051514-3658-1-git-send-email-alankao@andestech.com>
 <1539051514-3658-4-git-send-email-alankao@andestech.com>
 <20181014000205.GA22333@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181014000205.GA22333@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com w9ENmn0T059745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181014_164712_290995_E4A400CE 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20181014234640.QGhQrrrvZy3132O_OfiJn55-K6d2zLigBlKWF25I6jU@z>

Hi Guenter,

On Sat, Oct 13, 2018 at 05:02:05PM -0700, Guenter Roeck wrote:
> Hi,
> 
> With this patch in -next applied, I get the following error
> when building riscv:defconfig.

I guess what you meant was this commit:
commit 0a5bee05fc67ce2044b8d91a18abbf14042da531

The modification in Makefile was

-endif
-
-KBUILD_AFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)fd$(KBUILD_ARCH_C)
+# ISA string setting
+riscv-march-$(CONFIG_ARCH_RV32I)       := rv32im
+riscv-march-$(CONFIG_ARCH_RV64I)       := rv64im
+riscv-march-$(CONFIG_RISCV_ISA_A)      := $(riscv-march-y)a
+riscv-march-y                          := fd
+riscv-march-$(CONFIG_RISCV_ISA_C)      := $(riscv-march-y)c

and the ":= fd" line was wrong.  It should have been 

+riscv-march-y                          := $(riscv-march-y)fd

> 
> 
> What am I missing ? Does RISC-V now require a new non-upstream compiler ?
> Or a special version of make ? I am currently using GNU Make 4.1.

So I sent the v8 to fix this problem.
Sorry for the inconvinience.

> 
> Thanks,
> Guenter
> 
> ---

And Palmer, it seems that the patch that causes this build error has been
pulled into linux-next.  Any idea how to fix that one?

Many thanks,
Alan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
