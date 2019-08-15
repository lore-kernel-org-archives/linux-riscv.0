Return-Path: <SRS0=oAuQ=WL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA68C3A589
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2019 20:29:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89C0D2083B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2019 20:29:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ImGwSIEH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="TZBSwwEe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89C0D2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sRwSo3GclWly0U47TgIyo46/rEqkrC4ZzLC9FHWGB14=; b=ImGwSIEH6ztGf4
	c9ndDI94C/yciOl78RpulzVwn2tOSfKnG2Prev+27G1ikep6SqPJyjkTFGI8ZIBNYtjmurwicnNBm
	Ed8X0lj/FxbFRF8YiIamu+a5vUvc3CG6kakY+OKjPwMWaG6ukW1SyElK3dSlDEDnfAr4dmSc5P/xJ
	IiryYsRy+nl8YVm8XygR3M8m8Yf9lOV+7tlBFm7n4jUNERNnOcV4dOLJaKFCCtD33h8Kgbq4k5U8v
	D59Q4MClr+DONIadeZEzQSob7/+ypbtXsRgBd4+bTkFSrq+joj1NUUwgvbaXRSy533DBf4/3UN0Xi
	mNSC/9gWDdUC313Ib2lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyMND-00035B-Lb; Thu, 15 Aug 2019 20:29:27 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyMN9-000341-Gj
 for linux-riscv@lists.infradead.org; Thu, 15 Aug 2019 20:29:26 +0000
Received: by mail-io1-xd44.google.com with SMTP id x4so1799464iog.13
 for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2019 13:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=3zMGQrUE3EUacLldQeVzqh4LwSGfvpMr8mJRvzACSDc=;
 b=TZBSwwEezcawSVNZH+A75BHDYHt86Jp1ExhFT8vaEmeCOK7nQuGV9QJVPPazwk/Ku6
 G7uOzEdiWUPRJBvVSImVcHfmRHeEjWKF3+fPNsIjKMjC090ZeES3WGG91W+PlTkpl1Uh
 BSFxoOQGBx4Z/oJpHzZwV2sTbbXxw438FlpApwHNeYdijWj6kwo87ikWEYNaDOvUTg5q
 p2ajq2dV+MDAVl57UdoSW23sadBfejXtoomIIw3UFpjl0q7xrdzDiyLZFAH6InH8raNy
 F5Nnj5CYwT+7toN4+Ot/KPImSYK040afUlaSsBZPUfgqAaKarIaYbJQwhByjQ6fALu8I
 nPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=3zMGQrUE3EUacLldQeVzqh4LwSGfvpMr8mJRvzACSDc=;
 b=dt2hHsG5pziBFtJtzk3vnNN3qpAuf6CbxWq5JOY8zs/goMhPUxKa46Cl2890j9BVlI
 zRr4g6S9vt2k9U6Z1Cl7q4EtRCraTzjP0PmZ/wj95WRm2zQfVxcETf1HO5RFyMCLwwuU
 i1I1QrdKThKJ+qhMQJoHa+xdKvuhO392C2kM2tl7adFM5sC8XvZhIPJaaXUU5ClRs0fK
 vYUSD6ZBoIjm4uPN/Z7p5QB6LinvYp/3bf0pVGKSTmcQXj5fRuiaUz9tg1AHv47v3z/0
 ijbcWY0EpaywWqjkWbd6KcgS7RV4pL4256MVYj1PLrVyzfj4oOPBfpwrMf3KwZ376Gr9
 0y8w==
X-Gm-Message-State: APjAAAVpJCRY0mBGpWwt7gMDwpJ3YtV3J6LkDgZklpk7h3uHEh9eBUHq
 M0Q2cJXMR2Tr21ii+IzaVDEPEe8zmHg=
X-Google-Smtp-Source: APXvYqztay6Yb+QIZjMIXgP/NTKKBDSokMhhJhNQBbxSBqLRj/Kts7XEjjIqjt8CsBOxwxaGiowugA==
X-Received: by 2002:a02:2243:: with SMTP id o64mr4786098jao.100.1565900962576; 
 Thu, 15 Aug 2019 13:29:22 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 e22sm2717551iog.2.2019.08.15.13.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 13:29:22 -0700 (PDT)
Date: Thu, 15 Aug 2019 13:29:21 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Alistair Francis <Alistair.Francis@wdc.com>, 
 David Abdurachmanov <david.abdurachmanov@gmail.com>
Subject: Re: [PATCH v5 2/2] RISC-V: Setup initial page tables in two stages
In-Reply-To: <CAEn-LTpz_iL0Ts5GG9J6oESN76DcjBaNs-Oz-c9CcpbmRiN5Sw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1908151327490.18249@viisi.sifive.com>
References: <20190607060049.29257-1-anup.patel@wdc.com>
 <20190607060049.29257-3-anup.patel@wdc.com>
 <alpine.DEB.2.21.9999.1907101703150.3422@viisi.sifive.com>
 <847fb8c879bbd2c3fd41dc1e428b3217253acebb.camel@wdc.com>
 <CAEn-LTpz_iL0Ts5GG9J6oESN76DcjBaNs-Oz-c9CcpbmRiN5Sw@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_132923_620829_A34DA296 
X-CRM114-Status: UNSURE (   7.41  )
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
Cc: "palmer@sifive.com" <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "hch@infradead.org" <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 15 Aug 2019, David Abdurachmanov wrote:

> Yes, I do see those in Fedora/RISCV build farm every morning, but with
> riscv64 and 5.2.0-rc7 kernel.

[...]

> fedora-riscv-4 login: [178876.406122] Unable to handle kernel paging
> request at virtual address 0000000000012a28
> fedora-riscv-7 login: [17983.074847] Unable to handle kernel paging
> request at virtual address 0fffffdff5e14700

Alistair, you're seeing panics immediately after the userspace transition, 
right?  100% of the time?

If so, this is probably a different bug.  Most likely the TLB flushing 
issue.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
