Return-Path: <SRS0=4kCy=UQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7F2C31E57
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 10:58:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA2BB20861
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 10:58:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hG8NNwia";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="VfG+snT1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA2BB20861
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTPMy+OV2Gvh8ImnoMvJrGbjplIESlwAsz4WwMUGaAg=; b=hG8NNwiaJodNcc
	WRImkORIcfMRdPcnzd4iBBlLCAIC87kx40qO7dM1w8/7Oth8No5qKlaHzjlkfnj/oQfU/SdCYmXzW
	jCpjwlnQjA+VeaobeoGxwlWanxote6qpYrmZBhl8xf+yMrAm7D51TPApYiNH0swMuKEw96wfJ2YYe
	uz6u9Ez8QuUJ59x8Thcf4qKRwO7UJCmtBvsSoHBKqt24DUYivc5I24c1J3G4omxGf8ci27PEDFV05
	nab1iG4D13BaSCkgZoLSQWgQVOT+eGJkUmyOybZ4PWiGPKrnXr9fVr60BSLvaR5XBgxfjXOFqIix8
	2Od2GC2Qh9hbQVcIvwgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcpLi-0004oU-Gu; Mon, 17 Jun 2019 10:58:54 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcpLf-0004oA-ES
 for linux-riscv@lists.infradead.org; Mon, 17 Jun 2019 10:58:52 +0000
Received: by mail-ed1-x542.google.com with SMTP id z25so15516581edq.9
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2019 03:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Z7MgRrFrSEpyMxWt0fQ3pu3qfF3HuPeEE4InNFtouvA=;
 b=VfG+snT1PixmQQdonoqfLRz9z9W422EJAbcPYpAlwIa/KeYTfItj6MIsuMEPHbEwMJ
 iaFSFjnYQllOO5FLnM/gJyp+WemV1i91FaXdKqr/0HG29egz1vLya7JEcSlsupMYvf0z
 lNsr9iMo18ScTYX2gGroCUp1TNikFF7MUes4a0XM82CzhZjnDF2DvpdXk5cfeRp2iV9H
 BZK3ZptLDACpHQ2LWsb4AtQtEJyBDCtTJX8Obe2b90oVxt+sPanMoznrl8mxyzA8GAxO
 +2njgepz62hT9MLgqCH723jXHohkY/ImDuKRDw0f9xI9q3jfV/Z0/a8aKNQ1+AM4oc2k
 q8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Z7MgRrFrSEpyMxWt0fQ3pu3qfF3HuPeEE4InNFtouvA=;
 b=IqTCp8698VT1Gy7YbUWAamw7HLNbQTbGTREbHA0VsXPqa6rZ/Yy9J5EXwILXxdbAbg
 guS2Ot1Zbw+JrD3j+RvaTSc3oLwNtWtShagqY3C102t823WSGwwhz7b+t+al05Kv4mcw
 9aanmIkUosD1NhChLzsqyjnGGAo9CqJtQMWNWIi50W8hni02E6Ys7v3Kas/a2DROu/iu
 jYggTH8EgO0OM5lgrrjSH8Xddm9MgM3yk+Tzjaya31bT+vuBNscETxDCdxdYXzPHecie
 M3vemk+cWPb6sso24kjSTqCYVdYSM8O0w37btcyYgkd0iC1TWYqYO9QoXTTo1TAXbmCu
 +Iqg==
X-Gm-Message-State: APjAAAXzfldhEia/bhJ05+1y3vrR59cfPrQFAHoa4axkrVqMOyerSHNq
 JnIDmBJBTu2yasjFKmuk7MHGGVm9ADs=
X-Google-Smtp-Source: APXvYqxp8N7v3j12TD9bTvgcNBewY7iLjRBE17EhXbyMosUlATBSl9tg3jRVc6SbYAUzCaCp5w0q/w==
X-Received: by 2002:a17:906:6055:: with SMTP id
 p21mr20396660ejj.35.1560769129452; 
 Mon, 17 Jun 2019 03:58:49 -0700 (PDT)
Received: from localhost ([81.92.102.43])
 by smtp.gmail.com with ESMTPSA id d12sm3520198edp.16.2019.06.17.03.58.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 03:58:48 -0700 (PDT)
Date: Mon, 17 Jun 2019 03:58:46 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Andreas Schwab <schwab@suse.de>
Subject: Re: Working device tree for the HifiveU
In-Reply-To: <mvmlfy05xjm.fsf@suse.de>
Message-ID: <alpine.DEB.2.21.9999.1906170347460.19994@viisi.sifive.com>
References: <mvmlfy05xjm.fsf@suse.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_035851_495125_5A016CC8 
X-CRM114-Status: UNSURE (   7.53  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 17 Jun 2019, Andreas Schwab wrote:

> What is the correct device tree for the HifiveU that works both with
> 5.2+ and U-Boot?

U-Boot should follow the kernel's DT data:

http://git.denx.de/?p=u-boot.git;a=blob;f=doc/device-tree-bindings/README;h=2ea3439a170236bd912930991ad70ee7289dcd29;hb=HEAD

Thus the upstream-bound data is currently here:

https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=fixes

However, since some FU540 U-Boot drivers were upstreamed before the kernel 
DT data was posted and reviewed, it's necessary to patch upstream U-Boot 
to use the upstream-bound DT data format.  One of the patches required can 
be found here:

https://lists.denx.de/pipermail/u-boot/2019-May/370814.html


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
