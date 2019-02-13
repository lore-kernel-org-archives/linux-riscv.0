Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C76C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 10:04:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C950A2147C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 10:04:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oeEEfwRs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BCV7MCT3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C950A2147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=de62RStuu/UDX93CUJ68H6Jr5x7yxfjtWlDPOH9+1i8=; b=oeEEfwRsM0cPdHaUMDqwTyPhsJ
	nUd0lj3AawAisziXiVscDhViTaNNR1eLsHStI2GKA+T1Tw7fif4p+pV4CQk4Jb6Bta96zEgtcKB4L
	UtHxGZ9mkXlgoLrXphYkGYn21Bamc+AuB6FuGZ80i78O0IWghvKXW4/aPiiZuq0HuAtjXcWNdsXxg
	dxdteuy/jERCqt9YHWLaYqtPpHt2bgWEEPZb4qKiYn5ck1lLTLQ6oEA3iSS0Ts4eMCcbkUdWCkLpz
	pXZMjR1WUQE8qiHiHBiehNFQlJQ/nTQnRAmfrCepKCDOvBwpqIVXDGeEf+V3TLRiYSFxV7Q5uUdLO
	970nWB6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtrOa-0004Wi-Jp; Wed, 13 Feb 2019 10:04:00 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtrOX-0004WQ-3P
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 10:03:58 +0000
Received: by mail-pg1-x542.google.com with SMTP id g189so916620pgc.5
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 02:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y0l8dlu5M2CFg3T4VZlxh0QoHGEZIValjQhCXNSMlEE=;
 b=BCV7MCT3N5PHZ/UZmsRxZrAJpP1lWkp1hk4vxeWfNNMcsZahg8T4Kq2e8cqBfO/2p6
 /YufB0GeVwF+sqKXDQ1hmwUIVtifgiMouVVRlQzTM0pmoHi9boaCcHdHTPrNYQ66LHTb
 jV8/s0CycHnejKlE9evUjbFnAgakl5UySBXstlby4Qt2BkFw8CwcLoeGo1Gq9/li7YPl
 etTKUHmD+pDCIatsMVbczoAiQZfuXco0ozRBpdYpJ/svEGk8sWNifB+cAFQ+WwaRCROy
 2vnZooRKGO02e2Y2pXl3WmlDx9TVhwhylDwDRqV/YfPK1bWfvqv+o7466KgYfiRd/VFb
 G+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Y0l8dlu5M2CFg3T4VZlxh0QoHGEZIValjQhCXNSMlEE=;
 b=CtfxiWyvVoUM7CB7agpPiMwfn+1hK7UdZ9ghv6o4kMgR3cQWOFAZ1FSjMlzueETPkk
 ahWrJIyP9IqyR1gyjRB6L26RPDqbhN/qSkk45T9VGd8mUj4v4N48HFBu6aQdWGLlkh7C
 X2I+TI7WAFc9+OLIIn1A5Ou+7D5Daz69964ODyzIPdCWLhGtyxs2gHY84o7RnqA0LWCG
 x/Qq6K1QMhClfzJ/jrqG1Gkvx34p9+Wp07tYzbz/6z98e5Q2yUuXO+uUXvuv4YQuo07K
 qb9WvsfTOvSMugUw/snweK6owt3DC2GWmPa6qF1m/OIhk7YeeZ63IIxq+YnK4aegO5AA
 FvKQ==
X-Gm-Message-State: AHQUAubitfG28D9+iXamdfBHttcUcq6GQ1WJobiF4sjaTll9L6bHyk+A
 g+e0mZPfYruBXoJ0m6F8zyOkEmkDbQM=
X-Google-Smtp-Source: AHgI3IYeUYUZSRYBRAd3ngfNAAGPswIQ1WlPKFsoZCtV6YdzNNgT84iGr5ON1A4mM31iuYhMiuZ5zw==
X-Received: by 2002:aa7:8c1a:: with SMTP id c26mr6131178pfd.52.1550052234892; 
 Wed, 13 Feb 2019 02:03:54 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id e26sm7217777pfi.70.2019.02.13.02.03.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 13 Feb 2019 02:03:53 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: kernel@esmil.dk
Subject: Re: [RFC PATCH] spi: add driver for the SiFive SPI controller
Date: Wed, 13 Feb 2019 15:33:31 +0530
Message-Id: <1550052211-21030-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <20181112142736.15009-1-kernel@esmil.dk>
References: <20181112142736.15009-1-kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_020357_154873_D061E4C7 
X-CRM114-Status: UNSURE (   7.72  )
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
Cc: sachin.ghadi@sifive.com, linux-riscv@lists.infradead.org, palmer@sifive.com,
 Yash Shah <yash.shah@sifive.com>, paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Emil,

I am working full time on Linux device drivers for SiFive.
I have some bandwidth to work on this SPI driver.
Do you mind if I take over this SPI driver from here on?

Thanks,
Yash Shah

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
