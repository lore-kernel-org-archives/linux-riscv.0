Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E897BC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 02:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GJLdAMtdRsq+n6x6Gp/GvbAqMouE6se8A+7LkL9PEdk=; b=kef8iJubs7BUvmOqT7d9vqQva5
	xQ5scnykCSr6r5AKx7J0Gb4Y+cWxZ0i+QHSpPhjfDdlvzZBxEDduqOxN/7smqA0OnXvR3GLY6VA86
	qtRjzym/x+hxHzXxNCvEFuJsk3WWwDEAsm5qvRjc6+8HrJ2cbvr/TNXC2F65qX8luNUQSCzRYzQIi
	aKlNAXXmcLcjNQihDQZsHG4w3jWBavA8O0NMNG/1JMaI7lIO6a3EUqqOAs6j9H1KR8RijQWUO1oB/
	oAGLudf+c2/tQXolXDkE5D9Gj0kYspoEyT3+TI6+XVo6iSej/D6LA0cLZpxMghldMVpjRfunuWW5U
	54pXA+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEiDZ-00Gj2G-Dq; Fri, 22 Jul 2022 02:16:41 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEiDW-00GioQ-Db
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 02:16:40 +0000
Received: by mail-pg1-x52b.google.com with SMTP id q16so3281738pgq.6
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 19:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=Xe422so7ud5t4YBuAP/W7X4X+zOAjoGHV1YSVXSBWHs=;
        b=UdnkYII0Mpk5gU0mPLoZ2kG0/OaBeGUAjgxOzrlE+RJPmHsy1ze+cw7/7CzyOwl/m6
         3c9ZWSWpY1zC3E2/C6du47ou8KFtaz5aSQViJNcTai3NYKQ3mQR7vQUSq6qmjMUbdoTU
         LeGWmh0TGSxm7RQ4m6tSe63+kOTqRZ40O9iY0vAzaVIjNYXk2vyfI/wvqF0gepZ3Dl1q
         uWDhenbsKj1wwazDWAXb5o+dRllBXJG6X5v0PgnXoeX4WJs5nLhsjbXQvePgdZ+AKw3O
         fAUyfQMuW11vXuLj9ebBhbjoXyUck8Xvi7WmYb+ZzcKxhX+6/ibjwqRxUzomAk2IDTkn
         iMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=Xe422so7ud5t4YBuAP/W7X4X+zOAjoGHV1YSVXSBWHs=;
        b=7wBwXgDn3IXKzRL5ktKveRnuTNJkK06TI1n4PFX6/lAeN5+wYPRQQCMDm7d91LGIsY
         Wp1o/SHYcl6QdZid2jftpMVj0DVL73pheyZQRvL5m+o6CnRkMXGfydLVjqaD4Hki4cqJ
         odNqaNOtdWHaHGfhfGbJGpFCdya70wDEj/NXvH98r4ZGbcxetQ5fjGa88FfXqFzrqGFB
         Eny+7qtxLpOeiIPI4biBnGpetpOXQUYI0DPe7HTddUiq8Z0I7/HYZX5sBBdMJ1iKYP5V
         3CuVaFVBwtKSptGyzVoIGvumJaIzu6nEJYUzx833Npk96D5Ph54eP80JTBtWM4Lp9/TV
         TGtA==
X-Gm-Message-State: AJIora8SvZxOiK6YJWcFEl28/BrmZtRY+mY51Bn8UxB2a0fpofZBrdgh
	OT49JVSAt6TtnEQzXLTvqXpRhA==
X-Google-Smtp-Source: AGRyM1uh0a9LLTCNKRh+u/DKFqJBSZpJ4ioHEmsFBqJSyNsfFlXf07R8aGw3AcdIjWwCL7tIyFH2WQ==
X-Received: by 2002:aa7:9afa:0:b0:528:bbf7:e444 with SMTP id y26-20020aa79afa000000b00528bbf7e444mr1127722pfp.71.1658456196235;
        Thu, 21 Jul 2022 19:16:36 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id f5-20020aa79d85000000b00525161431f5sm2448652pfq.36.2022.07.21.19.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 19:16:35 -0700 (PDT)
Date: Thu, 21 Jul 2022 19:16:35 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Jul 2022 18:56:05 PDT (-0700)
Subject: Re: [PATCH 0/2] riscv: Add macro for multiple nop instructions
In-Reply-To: <20220607143059.1054074-1-heiko@sntech.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org, mick@ics.forth.gr, samuel@sholland.org,
  cmuellner@linux.com, philipp.tomsich@vrull.eu, Christoph Hellwig <hch@lst.de>, heiko@sntech.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-24b00ffb-dcaa-40b3-8da3-2c2fe26ea3aa@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_191638_705541_31AB60DC 
X-CRM114-Status: GOOD (  14.90  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 07 Jun 2022 07:30:57 PDT (-0700), heiko@sntech.de wrote:
> Some cases need multiple nop instructions and arm64 already has a
> nice helper for not needing to write all of them out but instead
> use a helper to add n nops.
>
> So add a similar thing to riscv and convert the T-Head PMA
> alternative to use it.
>
>
> Heiko Stuebner (2):
>   riscv: introduce nops and __nops macros for NOP sequences
>   riscv: convert the t-head pbmt errata to use the __nops macro
>
>  arch/riscv/include/asm/asm.h         | 15 +++++++++++++++
>  arch/riscv/include/asm/barrier.h     |  2 ++
>  arch/riscv/include/asm/errata_list.h |  8 +-------
>  3 files changed, 18 insertions(+), 7 deletions(-)

Thanks, these are on for-next.  I had to fix up some minor conflicts, but
hopefuly nothing went wrong.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
