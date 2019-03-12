Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BC7C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 17:33:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42AFA206DF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 17:33:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KgHF+tHt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRmqf3xU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42AFA206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=uYM9oFNQtduiSAkmsDpEV7LeD55nk3iCa6co5z7C6aA=; b=KgH
	F+tHtyPR5922eufxMehXEOBZSUGT6SzkYi5ncCN3mTjxheolQVhchp/C4vSVTMt6KftzA9yNtKJBc
	X8qePJYonZkuZ8Tx2WuKtr29UGKD7Uc3ECOp+pvntFHYHZ29U/SkMgtEtMc7S+Zd/x2krgIq4CRXf
	VdEVW4V/6mXgBshts3ou0QNa9cVKW9f2cv3tFZXz5eVD5Ev3o1HMpA3DpmsaGmZSvZEN3k9XH74cs
	IzvcmUE57DQcW2coxdZAZ/fnTJAn/1rQtVwL+y1pXElEd6Cw9hm4qunzRh9oab4Hm3mFFEiEnXCzh
	HCV9rhW+jWGGKCDMcw66AHMLK2tiZmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3lGw-00021s-4u; Tue, 12 Mar 2019 17:33:02 +0000
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3lGm-0001sz-Qa; Tue, 12 Mar 2019 17:32:54 +0000
Received: by mail-vk1-xa44.google.com with SMTP id v131so854723vkd.3;
 Tue, 12 Mar 2019 10:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/pPUMtfX/4zWH4Kp77wi1isN2gX7JePTBEKndEfTuR8=;
 b=kRmqf3xUTPhfN+Y4X2Oo5FK1/8m5JYYD50moV/bNApvEJCZ/sDUciH6CpD2l695ScV
 rZqgBlAsMPvz3J0GW80Z7PyAPLjbbrNDBPIwQcGIfy6G+MCBG/yqKbUvCQPUI8t4jIcP
 LVZomsvGm1yGU+4cK6WynWC7amQP7zr+Lyi473q7ui9lOh6Q323Vvc0H7RBb/i8Vulal
 J6HqT+o5jQ9jpfBamYTlqK2/fE9HCZkIPKdoT1asFw6SQsKTLwcGWNKTa4XuPsesREb2
 laJIjFtME90mHVD1+Z3XzZDN3vW4x/pLvyQZjBYZAqnYWIdkSmkcpQORIbZk5NEBHOyl
 O8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/pPUMtfX/4zWH4Kp77wi1isN2gX7JePTBEKndEfTuR8=;
 b=nbPcG3A9b4eQvvo8RERVPHnOtSEdz3BLEuqy+LQSP/sVyVSGCwkYKzVPtMCJeAkK1d
 TKOEFI+ZSXkF8mS2YiA3kYfVg82EVyzXM1TCOkSxiFA7U/DSwz8vktohjBdW8wYXeiKq
 GSBBM61U/5FGlqBuBavQ1vT32+ofX3UAlGUPMMn4+o6vME9qt99s/qJEsCJ+IPJK0eOb
 axXQmHjQIcb7tfKQeeB4KRMgf+tWznzn9tmTWbKRC/b2ds1+oPN+pA+gVbjZVgIMggpx
 v5HrecPa2mzBtopiNsSJnE7jojtjHVkndddH7DP7fkeoCRXg30+7K9f+tDg3IgcqxSWJ
 Ujfw==
X-Gm-Message-State: APjAAAVY6ttlJxZLKf+mGHaVr4NygzvfM5dCoGUHbfInKnBtkvMaJ3AG
 d2HZbR407dKgcHobWqkEk+0mT95FLM234WvViJc=
X-Google-Smtp-Source: APXvYqzCjYb85oLsfm4fj/JjPvMFJWKwvkla9EZq1v57VRJysd2CaaKRkc2bo1qFzuvZInX8hsLOChvrIkkC7XdqTxI=
X-Received: by 2002:a1f:2bd5:: with SMTP id r204mr20685415vkr.19.1552411971228; 
 Tue, 12 Mar 2019 10:32:51 -0700 (PDT)
MIME-Version: 1.0
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Tue, 12 Mar 2019 23:02:40 +0530
Message-ID: <CAOuPNLjtSgejRZtg7eRvsfjrkYfsgs-rJA-YnXBEnqDKRQUPrw@mail.gmail.com>
Subject: Building and cross-compiling kernel source on Mac OS
To: open list <linux-kernel@vger.kernel.org>, kernelnewbies@kernelnewbies.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_103252_863770_99834F93 
X-CRM114-Status: UNSURE (   7.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

I have a Mac Book Pro with macOS High Sierra 10.13.x installed (with
Mac OS Extended (Journaled, Encrypted)).
I also have the Xcode installed so I can compile a C program using gcc.

Now, I wanted to build linux kernel code (cross compile for arm or
risc-v) on Mac OS.
I know this is possible, but I am not familiar with the steps.
If somebody have the step by step guide, please share.

If this works, then I don't need to use Virtual Box inside MAC to
build the kernel code.


Thanks,
Pintu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
